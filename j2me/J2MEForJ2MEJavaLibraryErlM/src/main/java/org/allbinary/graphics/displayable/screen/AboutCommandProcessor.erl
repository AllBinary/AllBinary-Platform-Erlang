%
% AllBinary Open License Version 1
% Copyright (c) 2022 AllBinary
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
% package org.allbinary.graphics.displayable.screen
% import javax.microedition.lcdui.Canvas
% import javax.microedition.lcdui.Command
% import javax.microedition.lcdui.CommandListener

-module('AboutCommandProcessor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'AboutCommandProcessor':new()),
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


getInstance() ->
        get({'AboutCommandProcessor', instance}).

process(This, MidletCommandListener, Command, Canvas) ->
        (get({MidletCommandListener, '$class'})):commandAction(MidletCommandListener, Command, Canvas).

