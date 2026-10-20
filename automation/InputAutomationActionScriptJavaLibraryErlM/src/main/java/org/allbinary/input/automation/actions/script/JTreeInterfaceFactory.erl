% 
% To change this license header, choose License Headers in Project Properties. 
% To change this template file, choose Tools | Templates 
% and open the template in the editor.  
% Generated Code Do Not Modify
% package org.allbinary.input.automation.actions.script

-module('JTreeInterfaceFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'JTreeInterfaceFactory':new()),
    ok.

init_fields(This) ->
    put({This, jTreeInterface}, undefined),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'JTreeInterfaceFactory', instance}).

set(This, JTreeInterface) ->
        put({This, jTreeInterface}, JTreeInterface).

getJTreeInterface(This) ->
        get({This, jTreeInterface}).

