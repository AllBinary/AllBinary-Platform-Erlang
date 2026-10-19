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
% package org.allbinary.data.tables.user.quoterequest
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.user.quoterequest.QuoteRequest
% import org.allbinary.data.tables.BasicDataTableInterface

-module('QuoteRequestEntityInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicDataTableInterface', Function, Arguments).


% throws Exception
get(This, UserName, Id) when (is_list(UserName) orelse UserName =:= undefined), is_integer(Id) ->
    erlang:error({abstract_method, get}).

getIds(This, UserName) when (is_list(UserName) orelse UserName =:= undefined) ->
    erlang:error({abstract_method, getIds}).

deleteWhere(This, Key, Value) when (is_list(Key) orelse Key =:= undefined), (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, deleteWhere}).

insert(This, Values) ->
    erlang:error({abstract_method, insert}).

update(This, UserName, UpdatedValues) when (is_list(UserName) orelse UserName =:= undefined) ->
    erlang:error({abstract_method, update}).

