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
% package org.allbinary.logic.util.event

-module('EventStrings').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'EventStrings':new()),
    ok.

init_fields(This) ->
    put({This, 'PERFORMANCE_MESSAGE'}, "Use Custom onEvent Methods for needed optimization"),
    put({This, 'TOTAL_LISTENERS'}, "Total Listeners: "),
    put({This, 'LISTENER_LABEL'}, " Listener: "),
    put({This, 'FIRE_EVENT'}, "fireEvent"),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'EventStrings', instance}).

