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

-module('ThirdPartyInApplicationPurchase').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ThirdPartyInApplicationPurchaseInterface

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


isPurchased(This, LockableFeature) ->
        false.

onCreate(This, AnyType, StateObject) ->
        ok.

onDestroy(This) ->
        ok.

onStart(This) ->
        ok.

onActivityResult(This, RequestCode, ResultCode, DataObject) when is_integer(RequestCode), is_integer(ResultCode) ->
        ok.

onSaveInstanceState(This, AnyType) ->
        ok.

onStop(This) ->
        ok.

requestPurchase(This, LockableFeature) ->
        ok.

requestReceipts(This) ->
        ok.

add(This, LockableFeature) ->
        ok.

getUserName(This) ->
        get({'StringUtil':getInstance(), 'EMPTY_STRING'}).

isEnabled(This) ->
        false.

requestProducts(This) ->
        ok.

