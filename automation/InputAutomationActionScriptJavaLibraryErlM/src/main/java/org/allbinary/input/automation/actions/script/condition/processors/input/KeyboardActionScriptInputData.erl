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
% package org.allbinary.input.automation.actions.script.condition.processors.input

-module('KeyboardActionScriptInputData').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'NAME'}, "KEY_ACTION_INPUT_NAME"),
    put({?MODULE, 'KEY'}, "KEY_ACTION_INPUT_KEY"),
    put({?MODULE, 'DELAY_BETWEEN_KEYS'}, "KEY_ACTION_INPUT_DELAY_BETWEEN_KEYS"),
    put({?MODULE, 'PRESS'}, "KEY_ACTION_INPUT_PRESS"),
    put({?MODULE, 'RELEASE'}, "KEY_ACTION_INPUT_RELEASE"),
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

