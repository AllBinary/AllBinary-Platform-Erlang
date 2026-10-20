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
% package org.allbinary.business.user.commerce.inventory.basket
% import java.io.Serializable
% import java.util.HashMap
% import java.util.Set
% import org.allbinary.business.user.commerce.inventory.item.ItemInterface
% import org.allbinary.business.user.commerce.money.Money
% import org.allbinary.business.user.commerce.money.MoneyException
% import org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntity
% import org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntityFactory
% import org.allbinary.logic.StdUtil

-module('Basket').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements BasketInterface
% implements Serializable

init_fields(This) ->
    put({This, items}, (fun(Target_N65942) -> (get({Target_N65942, '$class'})):createHashMap(Target_N65942) end)('StdUtil':getInstance())),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

addItem(This, Id, Num) when (is_list(Id) orelse Id =:= undefined), (is_list(Num) orelse Num =:= undefined) ->
        case (get({get({This, items}), '$class'})):containsKey(get({This, items}), Id) of
            true ->
            OldNumStr = allbinary_java:to_string((get({get({This, items}), '$class'})):get(get({This, items}), Id)),
            OldNumInt = allbinary_java:to_string(OldNumStr),
            NumInt = allbinary_java:to_string(Num),
            NewNumInt = ((get({OldNumInt, '$class'})):intValue(OldNumInt) + (get({NumInt, '$class'})):intValue(NumInt)),
            (get({get({This, items}), '$class'})):put(get({This, items}), Id, (get({NewNumInt, '$class'})):toString(NewNumInt));
            false ->
            (get({get({This, items}), '$class'})):put(get({This, items}), Id, Num)
        end.

removeItem(This, Id) when (is_list(Id) orelse Id =:= undefined) ->
        (get({get({This, items}), '$class'})):remove(get({This, items}), Id).

adjustItem(This, Id, Num) when (is_list(Id) orelse Id =:= undefined), (is_list(Num) orelse Num =:= undefined) ->
        case ((fun(Target_N66566) -> (get({Target_N66566, '$class'})):intValue(Target_N66566) end)(allbinary_java:to_string(Num)) > 0) of
            true ->
            (get({get({This, items}), '$class'})):put(get({This, items}), Id, Num);
            false ->
            (get({get({This, items}), '$class'})):remove(get({This, items}), Id)
        end.

getTotalWeight(This) ->
        ItemsAndNumberInBasket = (get({This, '$class'})):getItems(This),
        TotalWeight = 'Money':new(),
        case ((get({ItemsAndNumberInBasket, '$class'})):size(ItemsAndNumberInBasket) > 0) of
            true ->
            Items = (get({ItemsAndNumberInBasket, '$class'})):keySet(ItemsAndNumberInBasket),
            put({local, product}, undefined),
            put({local, weightFloat}, undefined),
            ItemArray = (get({Items, '$class'})):toArray(Items),
            Size = array:size(ItemArray),
            lists:foreach(fun(Index) ->
                put({local, product}, allbinary_java:to_string(array:get(Index, ItemArray))),
                put({local, weightFloat}, (fun(Target_N67188) -> (get({Target_N67188, '$class'})):getWeight(Target_N67188, get({local, product})) end)('InventoryEntity':new())),
                put({local, weightFloat}, ((fun(Target_N67255) -> (get({Target_N67255, '$class'})):floatValue(Target_N67255) end)((get({This, '$class'})):getNumberOf(This, get({local, product}))) * (get({get({local, weightFloat}), '$class'})):floatValue(get({local, weightFloat})))),
                (get({TotalWeight, '$class'})):add(TotalWeight, (get({get({local, weightFloat}), '$class'})):toString(get({local, weightFloat})))
            end, lists:seq(0, Size - 1));
            false -> ok
        end,
        (get({TotalWeight, '$class'})):toString(TotalWeight).

getNumberOfItems(This) ->
        (get({get({This, items}), '$class'})):size(get({This, items})).

getIds(This) ->
        Set = (get({get({This, items}), '$class'})):keySet(get({This, items})),
        Set.

getItems(This) ->
        get({This, items}).

getNumberOf(This, Product) when (is_list(Product) orelse Product =:= undefined) ->
        NumStr = (get({get({This, items}), '$class'})):get(get({This, items}), Product),
        allbinary_java:to_string(NumStr).

% throws MoneyException
getSubTotal(This) ->
        ItemsAndNumberInBasket = (get({This, '$class'})):getItems(This),
        SubTotal = 'Money':new(),
        case ((get({ItemsAndNumberInBasket, '$class'})):size(ItemsAndNumberInBasket) > 0) of
            true ->
            Items = (get({ItemsAndNumberInBasket, '$class'})):keySet(ItemsAndNumberInBasket),
            InventoryEntityFactory = 'InventoryEntityFactory':getInstance(),
            InventoryEntity = (get({InventoryEntityFactory, '$class'})):getInventoryEntityInstance(InventoryEntityFactory),
            ItemArray = (get({Items, '$class'})):toArray(Items),
            Size = array:size(ItemArray),
            lists:foreach(fun(Index) ->
                Product = allbinary_java:to_string(array:get(Index, ItemArray)),
                ItemInterface = (get({InventoryEntity, '$class'})):getItem(InventoryEntity, Product),
                ProductTotal = (get({ItemInterface, '$class'})):getPrice(ItemInterface),
                (get({ProductTotal, '$class'})):multiply(ProductTotal, (fun(Target_N68363) -> (get({Target_N68363, '$class'})):intValue(Target_N68363) end)((get({This, '$class'})):getNumberOf(This, Product))),
                (get({SubTotal, '$class'})):add(SubTotal, (get({ProductTotal, '$class'})):toString(ProductTotal))
            end, lists:seq(0, Size - 1));
            false -> ok
        end,
        SubTotal.

