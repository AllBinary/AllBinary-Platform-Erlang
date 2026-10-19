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
% package org.allbinary.business.user.commerce.inventory.item
% import org.allbinary.business.user.commerce.money.Money
% import org.allbinary.data.tables.TableMappingInterface

-module('ItemInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface

'$handle_undefined_function'(Function, Arguments) ->
    apply('TableMappingInterface', Function, Arguments).


setId(This, ItemId) when (is_list(ItemId) orelse ItemId =:= undefined) ->
    erlang:error({abstract_method, setId}).

setNumber(This, Number) when (is_list(Number) orelse Number =:= undefined) ->
    erlang:error({abstract_method, setNumber}).

setInBaskets(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setInBaskets}).

setWeight(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setWeight}).

setEnabled(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setEnabled}).

setNewOrUsed(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setNewOrUsed}).

setSummary(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setSummary}).

setDistributor(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setDistributor}).

setIdUsedByDistributor(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setIdUsedByDistributor}).

setProducedBy(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setProducedBy}).

setProductionDate(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setProductionDate}).

setStartProductionDate(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setStartProductionDate}).

setDescription(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setDescription}).

setKeywords(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setKeywords}).

setCategory(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setCategory}).

setType(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setType}).

setSmallImage(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setSmallImage}).

setMediumImage(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setMediumImage}).

setLargeImage(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setLargeImage}).

setTimeEntered(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setTimeEntered}).

setLastModified(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setLastModified}).

setPrice(This, Value) ->
    erlang:error({abstract_method, setPrice}).

setComment(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setComment}).

setCustoms(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setCustoms}).

setDownloads(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setDownloads}).

setGroups(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setGroups}).

setOptions(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setOptions}).

setPermissions(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setPermissions}).

setSpecials(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setSpecials}).

getId(This) ->
    erlang:error({abstract_method, getId}).

getNumber(This) ->
    erlang:error({abstract_method, getNumber}).

getInBaskets(This) ->
    erlang:error({abstract_method, getInBaskets}).

getWeight(This) ->
    erlang:error({abstract_method, getWeight}).

getEnabled(This) ->
    erlang:error({abstract_method, getEnabled}).

getNewOrUsed(This) ->
    erlang:error({abstract_method, getNewOrUsed}).

getSummary(This) ->
    erlang:error({abstract_method, getSummary}).

getDistributor(This) ->
    erlang:error({abstract_method, getDistributor}).

getIdUsedByDistributor(This) ->
    erlang:error({abstract_method, getIdUsedByDistributor}).

getProducedBy(This) ->
    erlang:error({abstract_method, getProducedBy}).

getProductionDate(This) ->
    erlang:error({abstract_method, getProductionDate}).

getStartProductionDate(This) ->
    erlang:error({abstract_method, getStartProductionDate}).

getDescription(This) ->
    erlang:error({abstract_method, getDescription}).

getKeywords(This) ->
    erlang:error({abstract_method, getKeywords}).

getCategory(This) ->
    erlang:error({abstract_method, getCategory}).

getType(This) ->
    erlang:error({abstract_method, getType}).

getSmallImage(This) ->
    erlang:error({abstract_method, getSmallImage}).

getMediumImage(This) ->
    erlang:error({abstract_method, getMediumImage}).

getLargeImage(This) ->
    erlang:error({abstract_method, getLargeImage}).

getTimeEntered(This) ->
    erlang:error({abstract_method, getTimeEntered}).

getLastModified(This) ->
    erlang:error({abstract_method, getLastModified}).

getPrice(This) ->
    erlang:error({abstract_method, getPrice}).

getComment(This) ->
    erlang:error({abstract_method, getComment}).

getCustoms(This) ->
    erlang:error({abstract_method, getCustoms}).

getDownloads(This) ->
    erlang:error({abstract_method, getDownloads}).

getGroups(This) ->
    erlang:error({abstract_method, getGroups}).

getOptions(This) ->
    erlang:error({abstract_method, getOptions}).

getPermissions(This) ->
    erlang:error({abstract_method, getPermissions}).

getSpecials(This) ->
    erlang:error({abstract_method, getSpecials}).

getTotal(This) ->
    erlang:error({abstract_method, getTotal}).

