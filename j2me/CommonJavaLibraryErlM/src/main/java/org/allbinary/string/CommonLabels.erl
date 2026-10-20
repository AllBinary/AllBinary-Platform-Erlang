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
% package org.allbinary.string
% import jsinterop.annotations.JsType
% import jsinterop.annotations.JsMethod
% import jsinterop.annotations.JsProperty

-module('CommonLabels').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'CommonLabels':new()),
    ok.

init_fields(This) ->
    put({This, 'WIDTH_LABEL'}, " Width: "),
    put({This, 'HEIGHT_LABEL'}, " Height: "),
    put({This, 'END_LABEL'}, "End: "),
    put({This, 'TOTAL_LABEL'}, "Total: "),
    put({This, 'INDEX_LABEL'}, "index: "),
    put({This, 'START_LABEL'}, "Start: "),
    put({This, 'COMMAND_LABEL'}, "Command: "),
    put({This, 'NAME_LABEL'}, "Name: "),
    put({This, 'START'}, get({This, 'START_LABEL'})),
    put({This, 'ELAPSED'}, " Elapsed: "),
    put({This, 'CURRENT'}, " Current: "),
    put({This, 'NEXT'}, "Next"),
    put({This, 'ITEM_LABEL'}, "Item: "),
    put({This, 'RESULT_'}, "Result: "),
    put({This, 'COLON_SEP'}, ": "),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'CommonLabels', instance}).

