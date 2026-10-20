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
% import javax.microedition.media.Player
% import org.allbinary.TsUtil
% import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.string.CommonStrings

-module('AllBinaryMediaManager').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'THIS'}, "AllBinaryMediaManagerNoMediaMIDP1"),
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
        (fun(Target_N66153) -> (get({Target_N66153, '$class'})):addNormalPortion(Target_N66153, 50, "Media Manager") end)('ProgressCanvasFactory':getInstance()),
        (fun(Target_N66192) -> (get({Target_N66192, '$class'})):init(Target_N66192) end)('Sounds':new(SoundsFactoryInterface)).

% throws Exception
shutdown(SoundsFactoryInterface) ->
        (fun(Target_N66287) -> (get({Target_N66287, '$class'})):stopAll(Target_N66287) end)('Sounds':new(SoundsFactoryInterface)),
        (fun(Target_N66322) -> (get({Target_N66322, '$class'})):closeAll(Target_N66322) end)('Sounds':new(SoundsFactoryInterface)),
        (fun(Target_N66357) -> (get({Target_N66357, '$class'})):gc(Target_N66357) end)('TsUtil':getInstance()).

createPlayerFromInputStream(Stream, Type) when (is_list(Type) orelse Type =:= undefined) ->
        LogUtil = 'LogUtil':getInstance(),
        CommonString = 'CommonStrings':getInstance(),
        (get({LogUtil, '$class'})):putF(LogUtil, get({CommonString, 'START'}), get({'AllBinaryMediaManager', 'THIS'}), "creatPlayer(InputStream)"),
        get({'NoPlayer', 'NO_PLAYER'}).

createPlayer(Locator) when (is_list(Locator) orelse Locator =:= undefined) ->
        LogUtil = 'LogUtil':getInstance(),
        CommonString = 'CommonStrings':getInstance(),
        (get({LogUtil, '$class'})):putF(LogUtil, get({CommonString, 'START'}), get({'AllBinaryMediaManager', 'THIS'}), "creatPlayer(locator)"),
        get({'NoPlayer', 'NO_PLAYER'}).

playTone(Frequency, Time, Volume) when is_integer(Frequency), is_integer(Time), is_integer(Volume) ->
        ok.

getSupportedContentTypes(Protocol) when (is_list(Protocol) orelse Protocol =:= undefined) ->
        (fun(Target_N67023) -> (get({Target_N67023, '$class'})):getArrayInstance(Target_N67023) end)('StringUtil':getInstance()).

getSupportedProtocols(Content_type) when (is_list(Content_type) orelse Content_type =:= undefined) ->
        (fun(Target_N67110) -> (get({Target_N67110, '$class'})):getArrayInstance(Target_N67110) end)('StringUtil':getInstance()).

