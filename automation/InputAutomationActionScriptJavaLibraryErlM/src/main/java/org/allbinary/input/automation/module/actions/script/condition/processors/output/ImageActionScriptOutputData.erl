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
% package org.allbinary.input.automation.module.actions.script.condition.processors.output

-module('ImageActionScriptOutputData').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'NAME'}, "IMAGE_ACTION_OUTPUT_NAME"),
    put({?MODULE, 'SAVE'}, "SAVE_IMAGE_ACTION_OUTPUT_NAME"),
    put({?MODULE, 'DISPLAY'}, "DISPLAY_IMAGE_ACTION_OUTPUT_NAME"),
    put({?MODULE, 'TYPE'}, "TYPE_IMAGE_ACTION_OUTPUT_NAME"),
    put({?MODULE, 'TYPES'}, "TYPES_IMAGE_ACTION_OUTPUT_NAME"),
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

