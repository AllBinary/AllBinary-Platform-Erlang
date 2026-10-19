%
% AllBinary Open License Version 1
% Copyright (c) 2011 AllBinary
% 
% By agreeing to this license you and any business entity you represent are
% legally bound to the AllBinary Open License Version 1 legal agreement.
% 
% You may obtain the AllBinary Open License Version 1 legal agreement from
% AllBinary or the root directory of AllBinary's AllBinary Platform repository.
% 
% Created By: Travis Berthelot
%  
% Generated Code Do Not Modify
% package org.allbinary.media.audio
% import java.io.IOException
% import java.io.InputStream
% import javax.microedition.media.MediaException
% import javax.microedition.media.Player
% import org.allbinary.TsUtil
% import org.allbinary.game.configuration.feature.Features
% import org.allbinary.game.configuration.feature.GameFeatureFactory
% import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory
% import org.allbinary.logic.ABSystemWrapper
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonLabels
% import org.allbinary.string.CommonStrings

-module('AllBinaryMediaManager').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'THIS'}, "AllBinaryMediaManagerAndroid"),
    put({?MODULE, mostUsedTotal}, 0),
    ok.

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

isMuted() ->
        false.

setMuted(AMuted) when is_boolean(AMuted) ->
        ok.

update() ->
        true.

% throws Exception
init(SoundsFactoryInterface) ->
        LogUtil = 'LogUtil':getInstance(),
        CommonString = 'CommonStrings':getInstance(),
        (get({LogUtil, '$class'})):putF(LogUtil, get({CommonString, 'START'}), get({'AllBinaryMediaManager', 'THIS'}), get({CommonString, 'INIT'})),
        'AllBinaryMediaManager':shutdown(SoundsFactoryInterface),
        (fun(Target_N66353) -> (get({Target_N66353, '$class'})):addNormalPortion(Target_N66353, 50, "Media Manager") end)('ProgressCanvasFactory':getInstance()),
        (fun(Target_N66392) -> (get({Target_N66392, '$class'})):gc(Target_N66392) end)('TsUtil':getInstance()),
        (fun(Target_N66420) -> (get({Target_N66420, '$class'})):init(Target_N66420) end)('Sounds':new(SoundsFactoryInterface)),
        (get({LogUtil, '$class'})):putF(LogUtil, get({CommonString, 'END'}), get({'AllBinaryMediaManager', 'THIS'}), get({CommonString, 'INIT'})).

% throws Exception
shutdown(SoundsFactoryInterface) ->
        LogUtil = 'LogUtil':getInstance(),
        CommonString = 'CommonStrings':getInstance(),
        (get({LogUtil, '$class'})):putF(LogUtil, get({CommonString, 'START'}), get({'AllBinaryMediaManager', 'THIS'}), "shutdown"),
        case (get({SoundsFactoryInterface, '$class'})):isInitialized(SoundsFactoryInterface) of
            true ->
            (fun(Target_N66776) -> (get({Target_N66776, '$class'})):stopAll(Target_N66776) end)('Sounds':new(SoundsFactoryInterface)),
            SoundInterfaceArray = (get({SoundsFactoryInterface, '$class'})):getSoundInterfaceArray(SoundsFactoryInterface),
            put({local, player}, undefined),
            put({local, player2}, undefined),
            put({local, androidMediaPlayerWrapper}, undefined),
            lists:foreach(fun(I) ->
                case (array:get(I, SoundInterfaceArray) =/= undefined) of
                    true ->
                    put({local, player}, (fun(Target_N66996) -> (get({Target_N66996, '$class'})):getPlayerP(Target_N66996) end)(array:get(I, SoundInterfaceArray))),
                    case (get({local, player}) =/= undefined) of
                        true ->
                        put({local, player2}, (get({(get({local, player})), '$class'})):getPlayerP((get({local, player})))),
                        case allbinary_java:instance_of(get({local, player2}), 'AndroidMediaPlayerWrapper') of
                            true ->
                            put({local, androidMediaPlayerWrapper}, get({local, player2})),
                            (fun(Target_N67230) -> (get({Target_N67230, '$class'})):waitForMediaPlayer(Target_N67230, (get({get({local, androidMediaPlayerWrapper}), '$class'})):getMediaPlayer(get({local, androidMediaPlayerWrapper}))) end)('MediaPlayerUtil':getInstance());
                            false ->
                            erlang:error({'Exception', lists:concat(["Unknown Property Player: ", atom_to_list(get({get({local, player}), '$class'}))])})
                        end;
                        false -> ok
                    end;
                    false -> ok
                end
            end, lists:seq(0, array:size(SoundInterfaceArray) - 1)),
            (fun(Target_N67360) -> (get({Target_N67360, '$class'})):closeAll(Target_N67360) end)('Sounds':new(SoundsFactoryInterface)),
            (fun(Target_N67395) -> (get({Target_N67395, '$class'})):gc(Target_N67395) end)('TsUtil':getInstance()),
            (get({SoundsFactoryInterface, '$class'})):setInitialized(SoundsFactoryInterface, false),
            put({'AllBinaryMediaManager', mostUsedTotal}, 0);
            false -> ok
        end,
        (get({LogUtil, '$class'})):putF(LogUtil, get({CommonString, 'START'}), get({'AllBinaryMediaManager', 'THIS'}), "shutdown").

% throws Exception
createPlayer(Resource) when (is_list(Resource) orelse Resource =:= undefined) ->
        try
        put({'AllBinaryMediaManager', mostUsedTotal}, get({'AllBinaryMediaManager', mostUsedTotal}) + 1),
        LogUtil = 'LogUtil':getInstance(),
        case (fun(Target_N67679) -> (get({Target_N67679, '$class'})):isFeature(Target_N67679, get({'GameFeatureFactory':getInstance(), 'SOUND'})) end)('Features':getInstance()) of
            true ->
            try
                throw({'$return', 'AndroidMediaPlayerWrapper':new(Resource)})
            catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
                (get({LogUtil, '$class'})):put(LogUtil, lists:concat([lists:concat(["Could not create AndroidMediaPlayerWrapper using NoPlayer at ", get({'CommonLabels':getInstance(), 'TOTAL_LABEL'})]), get({'AllBinaryMediaManager', mostUsedTotal})]), get({'AllBinaryMediaManager', 'THIS'}), "createPlayer", E),
                throw({'$return', get({'NoPlayer', 'NO_PLAYER'})})
            end;
            false ->
            throw({'$return', get({'NoPlayer', 'NO_PLAYER'})})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws IOException, MediaException
createPlayerFromInputStream(Stream, Type) when (is_list(Type) orelse Type =:= undefined) ->
        erlang:error({'MediaException', "No Input Stream Player"}).

% throws MediaException
playTone(Frequency, Time, Volume) when is_integer(Frequency), is_integer(Time), is_integer(Volume) ->
        erlang:error({'MediaException', "No Tone Player"}).

isInitialized() ->
        true.

