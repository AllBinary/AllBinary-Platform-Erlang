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
% package org.allbinary.business.user
% import java.util.HashMap
% import org.allbinary.business.user.modules.configuration.UserConfigurationInterface
% import org.allbinary.business.user.role.UserRole
% import org.allbinary.data.tables.TableMappingInterface
% import org.allbinary.logic.communication.http.request.session.WeblisketSessionInterface
% import org.allbinary.logic.control.validate.ValidationInterface

-module('UserInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface

'$handle_undefined_function'(Function, Arguments) ->
    apply('TableMappingInterface', Function, Arguments).


setUserName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setUserName}).

setPrefixName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setPrefixName}).

setFirstName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setFirstName}).

setLastName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setLastName}).

setMiddleName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setMiddleName}).

setSuffixName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setSuffixName}).

setCompany(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setCompany}).

setPositionAtCompany(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setPositionAtCompany}).

setMainEmail(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setMainEmail}).

setSecondaryEmail(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setSecondaryEmail}).

setHomePhone(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setHomePhone}).

setCellPhone(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setCellPhone}).

setWorkPhone(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setWorkPhone}).

setOtherContact(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setOtherContact}).

setElectronicContact(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setElectronicContact}).

setFax(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setFax}).

setRole(This, ARole) ->
    erlang:error({abstract_method, setRole}).

setEncryption(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setEncryption}).

setSecret(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setSecret}).

setPassword(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setPassword}).

setPermissions(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setPermissions}).

enable(This) ->
    erlang:error({abstract_method, enable}).

setEnable(This, Enable) when (is_list(Enable) orelse Enable =:= undefined) ->
    erlang:error({abstract_method, setEnable}).

getUserName(This) ->
    erlang:error({abstract_method, getUserName}).

getPrefixName(This) ->
    erlang:error({abstract_method, getPrefixName}).

getFirstName(This) ->
    erlang:error({abstract_method, getFirstName}).

getLastName(This) ->
    erlang:error({abstract_method, getLastName}).

getMiddleName(This) ->
    erlang:error({abstract_method, getMiddleName}).

getSuffixName(This) ->
    erlang:error({abstract_method, getSuffixName}).

getCompany(This) ->
    erlang:error({abstract_method, getCompany}).

getPositionAtCompany(This) ->
    erlang:error({abstract_method, getPositionAtCompany}).

getMainEmail(This) ->
    erlang:error({abstract_method, getMainEmail}).

getSecondaryEmail(This) ->
    erlang:error({abstract_method, getSecondaryEmail}).

getHomePhone(This) ->
    erlang:error({abstract_method, getHomePhone}).

getCellPhone(This) ->
    erlang:error({abstract_method, getCellPhone}).

getWorkPhone(This) ->
    erlang:error({abstract_method, getWorkPhone}).

getOtherContact(This) ->
    erlang:error({abstract_method, getOtherContact}).

getElectronicContact(This) ->
    erlang:error({abstract_method, getElectronicContact}).

getFax(This) ->
    erlang:error({abstract_method, getFax}).

getRole(This) ->
    erlang:error({abstract_method, getRole}).

getEncryption(This) ->
    erlang:error({abstract_method, getEncryption}).

getSecret(This) ->
    erlang:error({abstract_method, getSecret}).

getPassword(This) ->
    erlang:error({abstract_method, getPassword}).

getPermissions(This) ->
    erlang:error({abstract_method, getPermissions}).

getUserConfigurationInterface(This) ->
    erlang:error({abstract_method, getUserConfigurationInterface}).

setUserConfigurationInterface(This, UserConfigurationInterface) ->
    erlang:error({abstract_method, setUserConfigurationInterface}).

toPasswordHashMap(This) ->
    erlang:error({abstract_method, toPasswordHashMap}).

validateSession(This, WeblisketSession) ->
    erlang:error({abstract_method, validateSession}).

updateSession(This, WeblisketSession) ->
    erlang:error({abstract_method, updateSession}).

isSessionValid(This) ->
    erlang:error({abstract_method, isSessionValid}).

