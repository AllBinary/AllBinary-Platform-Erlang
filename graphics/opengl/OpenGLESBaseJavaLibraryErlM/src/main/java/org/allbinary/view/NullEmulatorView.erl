% 
% AllBinary Open License Version 1 
% Copyright (c) 2025 AllBinary 
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
% package org.allbinary.view
% import javax.microedition.lcdui.Displayable
% import javax.microedition.midlet.MIDlet

-module('NullEmulatorView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements EmulatorViewInterface

static_init() ->
    put({?MODULE, 'NULL_EMULATOR_VIEW'}, 'NullEmulatorView':new()),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


setMidlet(This, Midlet) ->
        ok.

onEmulatorInitComplete(This, MidletActivity) ->
        ok.

onSetDisplayable(This, Displayable) ->
        ok.

