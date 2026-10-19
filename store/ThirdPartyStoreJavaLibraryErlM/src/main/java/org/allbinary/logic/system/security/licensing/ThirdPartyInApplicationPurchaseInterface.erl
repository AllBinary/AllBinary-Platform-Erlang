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

-module('ThirdPartyInApplicationPurchaseInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface


isPurchased(This, LockableFeature) ->
    erlang:error({abstract_method, isPurchased}).

onCreate(This, AnyType, StateObject) ->
    erlang:error({abstract_method, onCreate}).

onDestroy(This) ->
    erlang:error({abstract_method, onDestroy}).

onStart(This) ->
    erlang:error({abstract_method, onStart}).

onActivityResult(This, RequestCode, ResultCode, DataObject) when is_integer(RequestCode), is_integer(ResultCode) ->
    erlang:error({abstract_method, onActivityResult}).

onSaveInstanceState(This, AnyType) ->
    erlang:error({abstract_method, onSaveInstanceState}).

onStop(This) ->
    erlang:error({abstract_method, onStop}).

requestPurchase(This, LockableFeature) ->
    erlang:error({abstract_method, requestPurchase}).

requestReceipts(This) ->
    erlang:error({abstract_method, requestReceipts}).

add(This, LockableFeature) ->
    erlang:error({abstract_method, add}).

getUserName(This) ->
    erlang:error({abstract_method, getUserName}).

isEnabled(This) ->
    erlang:error({abstract_method, isEnabled}).

