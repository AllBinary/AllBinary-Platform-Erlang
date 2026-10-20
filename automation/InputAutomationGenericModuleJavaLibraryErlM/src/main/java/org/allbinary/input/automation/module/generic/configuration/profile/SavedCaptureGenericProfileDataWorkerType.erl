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
% package org.allbinary.input.automation.module.generic.configuration.profile
% import org.allbinary.input.media.image.InputImageType

-module('SavedCaptureGenericProfileDataWorkerType').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('GenericProfileDataWorkerType', Function, Arguments).

static_init() ->
    put({?MODULE, 'SAVED_CAPTURE'}, 'SavedCaptureGenericProfileDataWorkerType':new(lists:concat(["Saved ", (get({get({'InputImageType', 'CAPTURE'}), '$class'})):getName(get({'InputImageType', 'CAPTURE'}))]), "c:\\share\\captures\\2\\", 100)),
    ok.

init_fields(This) ->
    put({This, path}, undefined),
    put({This, lastFrame}, 0),
    ok.


new(Name, Path, LastFrame) when (is_list(Name) orelse Name =:= undefined), (is_list(Path) orelse Path =:= undefined), is_integer(LastFrame) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Name, Path, LastFrame),
    This.

'$init'(This, Name, Path, LastFrame) when (is_list(Name) orelse Name =:= undefined), (is_list(Path) orelse Path =:= undefined), is_integer(LastFrame) ->
        'GenericProfileDataWorkerType':'$init'(This, Name),
        init_fields(This),
        (get({This, '$class'})):setPath(This, Path),
        (get({This, '$class'})):setLastFrame(This, LastFrame).

getPath(This) ->
        get({This, path}).

setPath(This, Path) when (is_list(Path) orelse Path =:= undefined) ->
        put({This, path}, Path).

getLastFrame(This) ->
        get({This, lastFrame}).

setLastFrame(This, LastFrame) when is_integer(LastFrame) ->
        put({This, lastFrame}, LastFrame).

