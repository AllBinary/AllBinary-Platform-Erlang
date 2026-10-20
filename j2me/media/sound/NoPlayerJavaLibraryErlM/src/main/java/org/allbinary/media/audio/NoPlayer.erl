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
% import javax.microedition.media.Control
% import org.allbinary.logic.string.StringUtil

-module('NoPlayer').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicPlayer', Function, Arguments).

static_init() ->
    put({?MODULE, 'NO_PLAYER'}, 'NoPlayer':new()),
    ok.

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'BasicPlayer':'$init'(This),
    init_fields(This),
        ok.

close(This) ->
        ok.

getContentType(This) ->
        get({'StringUtil':getInstance(), 'NULL_STRING'}).

getControl(This, ControlType) when (is_list(ControlType) orelse ControlType =:= undefined) ->
        'NullControl':new().

getControls(This) ->
        array:new(0, {default, undefined}).

