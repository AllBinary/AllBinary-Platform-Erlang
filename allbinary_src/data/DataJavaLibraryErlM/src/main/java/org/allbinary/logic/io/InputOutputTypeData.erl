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
% package org.allbinary.logic.io

-module('InputOutputTypeData').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'InputOutputTypeData':new()),
    ok.

init_fields(This) ->
    put({This, 'NAME'}, "INPUT_OUTPUT_TYPE_NAME"),
    put({This, 'FILE'}, "INPUT_OUTPUT_TYPE_FILE"),
    put({This, 'RESPONSE'}, "INPUT_OUTPUT_TYPE_RESPONSE"),
    put({This, 'DB'}, "INPUT_OUTPUT_TYPE_DB"),
    put({This, 'JSP'}, "jsp"),
    put({This, 'JSP_FRAGMENT'}, "jspf"),
    put({This, 'PHP'}, "php"),
    put({This, 'ASP'}, "asp"),
    put({This, 'PL'}, "pl"),
    put({This, 'DEFAULT'}, get({This, 'JSP'})),
    put({This, 'DEFAULT_FRAGMENT'}, get({This, 'JSP_FRAGMENT'})),
    ok.


getInstance() ->
        get({'InputOutputTypeData', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

