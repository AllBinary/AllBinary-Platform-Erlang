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

