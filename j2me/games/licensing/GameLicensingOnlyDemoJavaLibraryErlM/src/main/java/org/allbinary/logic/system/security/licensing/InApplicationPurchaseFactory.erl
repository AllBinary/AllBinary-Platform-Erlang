% 
% To change this license header, choose License Headers in Project Properties. 
% To change this template file, choose Tools | Templates 
% and open the template in the editor.  
% Generated Code Do Not Modify
% package org.allbinary.logic.system.security.licensing
% import org.allbinary.logic.string.StringUtil

-module('InApplicationPurchaseFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'InApplicationPurchaseFactory':new()),
    ok.

init_fields(This) ->
    ok.


getInstance() ->
        get({'InApplicationPurchaseFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

init(This, AnyType, StateObject) ->
        ok.

onCreate(This, AnyType, StateObject) ->
        ok.

onStart(This) ->
        ok.

onResult(This, RequestCode, ResultCode, Data) when is_integer(RequestCode), is_integer(ResultCode) ->
        ok.

onSaveState(This, AnyType) ->
        ok.

onStop(This) ->
        ok.

onDestroy(This) ->
        ok.

purchase(This, LockableFeature) ->
        ok.

isPurchased(This, LockableFeature) ->
        false.

add(This, LockableFeature) ->
        ok.

getUserName(This) ->
        get({'StringUtil':getInstance(), 'EMPTY_STRING'}).

isEnabled(This) ->
        false.

