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
% package org.allbinary.data.tables.user.address.shipping
% import org.allbinary.data.tables.user.address.StreetAddressesEntity

-module('ShippingAddressesEntity').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('StreetAddressesEntity', Function, Arguments).

init_fields(This) ->
    put({This, 'TABLENAME'}, "shipping"),
    ok.


new(UserName) when (is_list(UserName) orelse UserName =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, UserName),
    This.

'$init'(This, UserName) when (is_list(UserName) orelse UserName =:= undefined) ->
        'StreetAddressesEntity':'$init'(This, UserName),
        init_fields(This),
        (get({This, '$class'})):setTableName(This, get({This, 'TABLENAME'})).

