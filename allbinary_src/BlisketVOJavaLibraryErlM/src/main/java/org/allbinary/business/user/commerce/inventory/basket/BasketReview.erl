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
% import java.util.HashSet
% import java.util.Set
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.user.commerce.inventory.item.Item
% import org.allbinary.business.user.commerce.inventory.item.ItemView
% import org.allbinary.logic.StdUtil
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('BasketReview').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, items}, 'BasicArrayListD':new()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

isValid(This) ->
        true.

addItem(This, Item) ->
        (get({get({This, items}), '$class'})):add(get({This, items}), Item).

getItems(This) ->
        get({This, items}).

removeItem(This, Id) when (is_list(Id) orelse Id =:= undefined) ->
        ItemArray = (get({get({This, items}), '$class'})):toArray(get({This, items})),
        Size = array:size(ItemArray),
        lists:foreach(fun(Index) ->
            Item = array:get(Index, ItemArray),
            case ((fun(Target_N66270) -> (get({Target_N66270, '$class'})):compareTo(Target_N66270, Id) end)((get({Item, '$class'})):getId(Item)) =:= 0) of
                true ->
                (get({get({This, items}), '$class'})):remove(get({This, items}), Item);
                false -> ok
            end
        end, lists:seq(0, Size - 1)).

adjustItem(This, Id, Num) when (is_list(Id) orelse Id =:= undefined), (is_list(Num) orelse Num =:= undefined) ->
        ItemArray = (get({get({This, items}), '$class'})):toArray(get({This, items})),
        Size = array:size(ItemArray),
        lists:foreach(fun(Index) ->
            Item = array:get(Index, ItemArray),
            case ((fun(Target_N66641) -> (get({Target_N66641, '$class'})):compareTo(Target_N66641, Id) end)((get({Item, '$class'})):getId(Item)) =:= 0) of
                true ->
                (get({Item, '$class'})):setNumber(Item, Num);
                false -> ok
            end
        end, lists:seq(0, Size - 1)).

getTotalWeight(This) ->
        put({local, weightFloat}, 0.0),
        ItemArray = (get({get({This, items}), '$class'})):toArray(get({This, items})),
        Size = array:size(ItemArray),
        lists:foreach(fun(Index) ->
            Item = array:get(Index, ItemArray),
            put({local, weightFloat}, (get({local, weightFloat}) + (fun(Target_N67061) -> (get({Target_N67061, '$class'})):floatValue(Target_N67061) end)((get({Item, '$class'})):getWeight(Item))))
        end, lists:seq(0, Size - 1)),
        (get({get({local, weightFloat}), '$class'})):toString(get({local, weightFloat})).

getNumberOfItems(This) ->
        (get({get({This, items}), '$class'})):size(get({This, items})).

getIds(This) ->
        IdSet = 'HashSet':new(),
        ItemArray = (get({get({This, items}), '$class'})):toArray(get({This, items})),
        Size = array:size(ItemArray),
        lists:foreach(fun(Index) ->
            Item = array:get(Index, ItemArray),
            (get({IdSet, '$class'})):add(IdSet, (get({Item, '$class'})):getId(Item))
        end, lists:seq(0, Size - 1)),
        IdSet.

getNumberOf(This, Id) when (is_list(Id) orelse Id =:= undefined) ->
        try
        ItemArray = (get({get({This, items}), '$class'})):toArray(get({This, items})),
        Size = array:size(ItemArray),
        lists:foreach(fun(Index) ->
            Item = array:get(Index, ItemArray),
            case ((fun(Target_N67848) -> (get({Target_N67848, '$class'})):compareTo(Target_N67848, Id) end)((get({Item, '$class'})):getId(Item)) =:= 0) of
                true ->
                throw({'$return', (get({Item, '$class'})):getNumber(Item)});
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        0
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
toXmlNode(This, Document) ->
        Node = (get({Document, '$class'})):createElement(Document, get({'BasketData', 'BASKET'})),
        ItemArray = (get({get({This, items}), '$class'})):toArray(get({This, items})),
        Size = array:size(ItemArray),
        lists:foreach(fun(Index) ->
            Item = array:get(Index, ItemArray),
            (get({Node, '$class'})):appendChild(Node, (fun(Target_N68323) -> (get({Target_N68323, '$class'})):toXmlNode(Target_N68323, Document) end)('ItemView':new(Item, 'BasicArrayListD':new())))
        end, lists:seq(0, Size - 1)),
        Node.

