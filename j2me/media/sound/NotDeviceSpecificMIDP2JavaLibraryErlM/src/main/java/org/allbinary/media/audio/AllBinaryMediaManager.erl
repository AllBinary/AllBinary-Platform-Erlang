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
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings

-module('AllBinaryMediaManager').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'THIS'}, "AllBinaryMediaManagerNoMIPD2"),
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
        (fun(Target_N66298) -> (get({Target_N66298, '$class'})):addNormalPortion(Target_N66298, 50, "Media Manager") end)('ProgressCanvasFactory':getInstance()),
        (fun(Target_N66337) -> (get({Target_N66337, '$class'})):init(Target_N66337) end)('Sounds':new(SoundsFactoryInterface)).

% throws Exception
shutdown(SoundsFactoryInterface) ->
        (fun(Target_N66432) -> (get({Target_N66432, '$class'})):stopAll(Target_N66432) end)('Sounds':new(SoundsFactoryInterface)),
        (fun(Target_N66467) -> (get({Target_N66467, '$class'})):closeAll(Target_N66467) end)('Sounds':new(SoundsFactoryInterface)),
        (fun(Target_N66502) -> (get({Target_N66502, '$class'})):gc(Target_N66502) end)('TsUtil':getInstance()).

% throws Exception
createPlayer(Resource) when (is_list(Resource) orelse Resource =:= undefined) ->
        try
        case (fun(Target_N66590) -> (get({Target_N66590, '$class'})):isFeature(Target_N66590, get({'GameFeatureFactory':getInstance(), 'SOUND'})) end)('Features':getInstance()) of
            true ->
            case ((fun(Target_N66680) -> (get({Target_N66680, '$class'})):compareTo(Target_N66680, Resource, get({'Manager', 'TONE_DEVICE_LOCATOR'})) end)('TsUtil':getInstance()) =:= 0) of
                true ->
                throw({'$return', 'Manager':createPlayer(Resource)});
                false ->
                InputStream = (fun(Target_N66752) -> (get({Target_N66752, '$class'})):getResourceAsStream(Target_N66752, Resource) end)('ResourceUtil':getInstance()),
                throw({'$return', 'Manager':createPlayer(InputStream, (fun(Target_N66831) -> (get({Target_N66831, '$class'})):getName(Target_N66831) end)(get({'AudioContentTypeDataFactory':getInstance(), 'MIME_AUDIO_WAV'})))})
            end;
            false ->
            throw({'$return', get({'NoPlayer', 'NO_PLAYER'})})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws MediaException
playTone(Frequency, Time, Volume) when is_integer(Frequency), is_integer(Time), is_integer(Volume) ->
        case (fun(Target_N66978) -> (get({Target_N66978, '$class'})):isFeature(Target_N66978, get({'GameFeatureFactory':getInstance(), 'SOUND'})) end)('Features':getInstance()) of
            true ->
            'Manager':playTone(Frequency, Time, Volume);
            false -> ok
        end.

