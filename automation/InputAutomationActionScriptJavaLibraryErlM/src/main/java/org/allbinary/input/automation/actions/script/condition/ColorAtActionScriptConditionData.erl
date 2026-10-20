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
% package org.allbinary.input.automation.actions.script.condition

-module('ColorAtActionScriptConditionData').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'NAME'}, "COLOR_AT_ACTION_CONDITION_NAME"),
    put({?MODULE, 'LOCATION_X'}, "COLOR_AT_ACTION_CONDITION_LOCATION_X"),
    put({?MODULE, 'LOCATION_Y'}, "COLOR_AT_ACTION_CONDITION_LOCATION_Y"),
    put({?MODULE, 'MIN_RED'}, "COLOR_AT_ACTION_CONDITION_MIN_RED"),
    put({?MODULE, 'MAX_RED'}, "COLOR_AT_ACTION_CONDITION_MAX_RED"),
    put({?MODULE, 'MIN_GREEN'}, "COLOR_AT_ACTION_CONDITION_MIN_GREEN"),
    put({?MODULE, 'MAX_GREEN'}, "COLOR_AT_ACTION_CONDITION_MAX_GREEN"),
    put({?MODULE, 'MIN_BLUE'}, "COLOR_AT_ACTION_CONDITION_MIN_BLUE"),
    put({?MODULE, 'MAX_BLUE'}, "COLOR_AT_ACTION_CONDITION_MAX_BLUE"),
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

