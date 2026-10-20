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
% import java.io.BufferedInputStream
% import java.io.ByteArrayInputStream
% import java.io.IOException
% import java.io.InputStream
% import javax.microedition.media.Manager
% import javax.microedition.media.MediaException
% import javax.microedition.media.Player
% import org.allbinary.TsUtil
% import org.allbinary.audio.AudioContentTypeDataFactory
% import org.allbinary.data.resource.ResourceUtil
% import org.allbinary.game.configuration.feature.Features
% import org.allbinary.game.configuration.feature.GameFeatureFactory
% import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings

-module('AllBinaryMediaManager').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'THIS'}, "AllBinaryMediaManagerPC"),
    put({?MODULE, 'CREATE_PLAYER'}, "createPlayer"),
    ok.

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
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
        (fun(Target_N66390) -> (get({Target_N66390, '$class'})):addNormalPortion(Target_N66390, 50, "Media Manager") end)('ProgressCanvasFactory':getInstance()),
        (fun(Target_N66429) -> (get({Target_N66429, '$class'})):init(Target_N66429) end)('Sounds':new(SoundsFactoryInterface)).

% throws Exception
shutdown(SoundsFactoryInterface) ->
        (fun(Target_N66531) -> (get({Target_N66531, '$class'})):stopAll(Target_N66531) end)('Sounds':new(SoundsFactoryInterface)),
        (fun(Target_N66566) -> (get({Target_N66566, '$class'})):closeAll(Target_N66566) end)('Sounds':new(SoundsFactoryInterface)),
        (fun(Target_N66601) -> (get({Target_N66601, '$class'})):gc(Target_N66601) end)('TsUtil':getInstance()).

% throws Exception
createPlayer(Resource) when (is_list(Resource) orelse Resource =:= undefined) ->
        try
        case lists:prefix(get({'Manager', 'TONE_DEVICE_LOCATOR'}), Resource) of
            true ->
            throw({'$return', 'AllBinaryMediaManager':createPlayerFromInputStream('ByteArrayInputStream':new(get({'NullUtil':getInstance(), 'NULL_BYTE_ARRAY'})), (fun(Target_N67316) -> (get({Target_N67316, '$class'})):getName(Target_N67316) end)(get({'AudioContentTypeDataFactory':getInstance(), 'MIME_AUDIO_TONE'})))});
            false ->
            case (fun(Target_N66776) -> (get({Target_N66776, '$class'})):isFeature(Target_N66776, get({'GameFeatureFactory':getInstance(), 'SOUND'})) end)('Features':getInstance()) of
            true ->
            try
                InputStream = (fun(Target_N66885) -> (get({Target_N66885, '$class'})):getResourceAsStream(Target_N66885, Resource) end)('ResourceUtil':getInstance()),
                BufferedInputStream = 'BufferedInputStream':new(InputStream),
                throw({'$return', 'PCClipWavPlayer':new(BufferedInputStream)})
            catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
                LogUtil = 'LogUtil':getInstance(),
                CommonString = 'CommonStrings':getInstance(),
                (get({LogUtil, '$class'})):put(LogUtil, get({CommonString, 'EXCEPTION'}), get({'AllBinaryMediaManager', 'THIS'}), get({'AllBinaryMediaManager', 'CREATE_PLAYER'}), E),
                throw({'$return', get({'NoPlayer', 'NO_PLAYER'})})
            end;
            false ->
            throw({'$return', get({'NoPlayer', 'NO_PLAYER'})})
        end
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws IOException, MediaException
createPlayerFromInputStream(Stream, Type) when (is_list(Type) orelse Type =:= undefined) ->
        erlang:error({'MediaException', "No Impl"}).

% throws MediaException
playTone(Frequency, Time, Volume) when is_integer(Frequency), is_integer(Time), is_integer(Volume) ->
        erlang:error({'MediaException', "No Impl"}).

isInitialized() ->
        true.

