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
% package org.allbinary.thirdparty.store
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface

-module('ThirdPartyStore').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, authorized}, false),
    put({This, name}, undefined),
    ok.


new(Name) when (is_list(Name) orelse Name =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Name),
    This.

init(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
    init_fields(This),
        put({This, name}, Name).

authorize(This, ClientInformationInterface) ->
        ok.

isAuthorized(This) ->
        get({This, authorized}).

setAuthorized(This, Authorized) when is_boolean(Authorized) ->
        put({This, authorized}, Authorized).

getName(This) ->
        get({This, name}).

