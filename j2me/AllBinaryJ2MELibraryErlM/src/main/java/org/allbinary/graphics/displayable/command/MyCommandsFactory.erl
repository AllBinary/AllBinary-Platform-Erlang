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
% package org.allbinary.graphics.displayable.command
% import javax.microedition.lcdui.Command
% import org.allbinary.logic.string.StringUtil

-module('MyCommandsFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'MyCommandsFactory':new()),
    ok.

init_fields(This) ->
    put({This, 'NO_COMMAND'}, 'Command':new(get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({'StringUtil':getInstance(), 'EMPTY_STRING'}), (-1), (-1))),
    put({This, 'GAUGE_CHANGE'}, 'Command':new("GAUGE_CHANGE", get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({'Command', 'ITEM'}), 1)),
    put({This, 'SET_DISPLAYABLE'}, 'Command':new("Display", get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({'Command', 'SCREEN'}), 2)),
    put({This, 'PAUSE_COMMAND'}, 'Command':new("Pause", get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({'Command', 'SCREEN'}), 0)),
    put({This, 'RESUME_COMMAND'}, 'Command':new("Resume", get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({'Command', 'SCREEN'}), 0)),
    ok.


getInstance() ->
        get({'MyCommandsFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

