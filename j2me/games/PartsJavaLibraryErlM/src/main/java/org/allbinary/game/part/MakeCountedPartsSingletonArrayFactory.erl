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
% package org.allbinary.game.part
% import org.allbinary.game.layer.pickup.CountedPickedUpLayerInterfaceFactory
% import org.allbinary.game.layer.pickup.CountedPickedUpLayerInterfaceFactoryPool
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.util.BasicArrayListUtil

-module('MakeCountedPartsSingletonArrayFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'MakeCountedPartsSingletonArrayFactory':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, list}, (fun(Target_N65987) -> (get({Target_N65987, '$class'})):getImmutableInstance(Target_N65987) end)('BasicArrayListUtil':getInstance())),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'MakeCountedPartsSingletonArrayFactory', instance}).

% throws Exception
getUpdated(This, PartInterfaceArray) when (is_tuple(PartInterfaceArray) orelse PartInterfaceArray =:= undefined) ->
        put({This, list}, 'BasicArrayListD':new()),
        lists:foreach(fun(Index) ->
            (get({get({This, list}), '$class'})):add(get({This, list}), array:get(Index, PartInterfaceArray))
        end, lists:seq(0, array:size(PartInterfaceArray) - 1)),
        CountedBasicArrayList = (fun(Target_N66212) -> (get({Target_N66212, '$class'})):getList(Target_N66212) end)('CountedPickedUpLayerInterfaceFactoryPool':getInstance()),
        put({local, layerInterfaceFactoryInterface}, undefined),
        Size = (get({CountedBasicArrayList, '$class'})):size(CountedBasicArrayList),
        lists:foreach(fun(Index) ->
            put({local, layerInterfaceFactoryInterface}, array:get(Index, get({CountedBasicArrayList, objectArray}))),
            (get({get({This, list}), '$class'})):add(get({This, list}), 'CountedLayerInterfaceFactoryPart':new(0, get({local, layerInterfaceFactoryInterface})))
        end, lists:seq(0, Size - 1)),
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "Total Parts: "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, (get({get({This, list}), '$class'})):size(get({This, list}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Counted: "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, (get({CountedBasicArrayList, '$class'})):size(CountedBasicArrayList)),
        CommonStrings = 'CommonStrings':getInstance(),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, get({CommonStrings, 'GET_INSTANCE'})),
        NewPartInterfaceArray = array:new((get({get({This, list}), '$class'})):size(get({This, list})), {default, undefined}),
        NewSize = array:size(NewPartInterfaceArray),
        lists:foreach(fun(Index) ->
            array:set(Index, (get({get({This, list}), '$class'})):get(get({This, list}), Index), NewPartInterfaceArray)
        end, lists:seq(0, NewSize - 1)),
        NewPartInterfaceArray.

