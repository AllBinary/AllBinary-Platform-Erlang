% 
% AllBinary Open License Version 1 
% Copyright (c) 2003 AllBinary 
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
% package org.allbinary.game.input.form
% import org.allbinary.game.identification.GroupCommonFactory
% import org.allbinary.game.layer.RTSLayer
% import org.allbinary.game.layer.RTSPlayerLayerInterface
% import org.allbinary.game.layer.item.LayerInterfaceFactoryImageItem
% import org.allbinary.graphics.form.item.ABCustomItem
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.direction.DirectionFactory
% import org.allbinary.game.identification.Group
% import org.allbinary.game.layer.AllBinaryGameLayerManager
% import org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer
% import org.allbinary.graphics.GPoint
% import org.allbinary.graphics.form.ScrollSelectionForm
% import org.allbinary.layer.AllBinaryLayerManager
% import org.allbinary.layer.LayerInterfaceFactoryInterface
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition
% import org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory
% import org.allbinary.util.ABHashtable

-module('RTSFormInput').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, groupCommonFactory}, 'GroupCommonFactory':getInstance()),
    put({This, hashtable}, (fun(Target_N66321) -> (get({Target_N66321, '$class'})):createHashtable(Target_N66321) end)('StdUtil':getInstance())),
    put({This, newUnconstructedRTSLayerInterfaceArray}, array:new(7, {default, undefined})),
    put({This, groupInterfaceArray}, undefined),
    put({This, selectedGeographicCellPosition}, get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'})),
    put({This, stickyItemSelected}, false),
    put({This, selectedStickyItemIndex}, 0),
    put({This, selectedStickyItem}, 'ABCustomItem':getNullInstance()),
    ok.


new(GroupInterfaceArray) when (is_tuple(GroupInterfaceArray) orelse GroupInterfaceArray =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, GroupInterfaceArray),
    This.

'$init'(This, GroupInterfaceArray) when (is_tuple(GroupInterfaceArray) orelse GroupInterfaceArray =:= undefined) ->
    init_fields(This),
        Size = array:size(get({This, newUnconstructedRTSLayerInterfaceArray})),
        lists:foreach(fun(Index) ->
            put({This, newUnconstructedRTSLayerInterfaceArray}, array:set(Index, 'CollidableDestroyableDamageableLayer':getNullInstance(), get({This, newUnconstructedRTSLayerInterfaceArray})))
        end, lists:seq(0, Size - 1)),
        put({This, groupInterfaceArray}, GroupInterfaceArray),
        (get({get({This, hashtable}), '$class'})):put(get({This, hashtable}), get({'DirectionFactory':getInstance(), 'NAME'}), get({'DirectionFactory':getInstance(), 'DOWN'})),
        case (GroupInterfaceArray =/= undefined) of
            true ->
            (get({get({This, hashtable}), '$class'})):put(get({This, hashtable}), get({get({This, groupCommonFactory}), 'ID'}), GroupInterfaceArray);
            false -> ok
        end.

% throws Exception
setAllBinaryGameLayerManager(This, AllBinaryGameLayerManager) ->
        ok.

% throws Exception
processAtPoint(This, AssociatedRtsLayer, RtsPlayerLayerInterface, LayerManager, Point) ->
        try
        Index = (get({This, '$class'})):getIndexAt(This, RtsPlayerLayerInterface, Point),
        case (Index < 0) of
            true ->
            throw({'$return', ok});
            false -> ok
        end,
        ScrollSelectionForm = (get({RtsPlayerLayerInterface, '$class'})):getCurrentScrollSelectionForm(RtsPlayerLayerInterface),
        Item = (get({ScrollSelectionForm, '$class'})):get(ScrollSelectionForm, Index),
        case (Item =:= undefined) of
            true ->
            throw({'$return', ok});
            false -> ok
        end,
        (get({This, '$class'})):processGameSpecific(This, AssociatedRtsLayer, RtsPlayerLayerInterface, LayerManager, Item, Index)
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
process(This, LayerManager) ->
        (get({This, '$class'})):setAllBinaryGameLayerManager(This, LayerManager).

% throws Exception
processGameSpecific(This, AssociatedRtsLayer, RtsPlayerLayerInterface, LayerManager, Item, Index) when is_integer(Index) ->
        ok.

% throws Exception
processSticky(This, AssociatedRtsLayer, RtsPlayerLayerInterface, LayerManager, Point) ->
        try
        Index = (get({This, '$class'})):getIndexAt(This, RtsPlayerLayerInterface, Point),
        case (Index < 0) of
            true ->
            throw({'$return', false});
            false -> ok
        end,
        ScrollSelectionForm = (get({RtsPlayerLayerInterface, '$class'})):getCurrentScrollSelectionForm(RtsPlayerLayerInterface),
        Item = (get({ScrollSelectionForm, '$class'})):get(ScrollSelectionForm, Index),
        case (Item =:= undefined) of
            true ->
            throw({'$return', false});
            false -> ok
        end,
        (get({This, '$class'})):processStickyGameSpecific(This, AssociatedRtsLayer, RtsPlayerLayerInterface, LayerManager, Item, Index),
        true
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
processStickyGameSpecific(This, AssociatedRtsLayer, RtsPlayerLayerInterface, LayerManager, Item, Index) when is_integer(Index) ->
        ok.

% throws Exception
getItemAt(This, RtsPlayerLayerInterface, Point) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N68367) -> (get({Target_N68367, '$class'})):toString(Target_N68367) end)((fun(Target_N68374) -> (get({Target_N68374, '$class'})):append(Target_N68374, (fun(Target_N68410) -> (get({Target_N68410, '$class'})):toString(Target_N68410, Point) end)('StringUtil':getInstance())) end)((fun(Target_N68381) -> (get({Target_N68381, '$class'})):append(Target_N68381, "Point: ") end)('StringMaker':new()))), This, "getItemAt"),
        ScrollSelectionForm = (get({RtsPlayerLayerInterface, '$class'})):getCurrentScrollSelectionForm(RtsPlayerLayerInterface),
        (get({ScrollSelectionForm, '$class'})):getSelectedItem(ScrollSelectionForm, Point).

% throws Exception
getIndexAt(This, RtsPlayerLayerInterface, Point) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N68654) -> (get({Target_N68654, '$class'})):toString(Target_N68654) end)((fun(Target_N68661) -> (get({Target_N68661, '$class'})):append(Target_N68661, (fun(Target_N68697) -> (get({Target_N68697, '$class'})):toString(Target_N68697, Point) end)('StringUtil':getInstance())) end)((fun(Target_N68668) -> (get({Target_N68668, '$class'})):append(Target_N68668, "Point: ") end)('StringMaker':new()))), This, "getItemAt"),
        ScrollSelectionForm = (get({RtsPlayerLayerInterface, '$class'})):getCurrentScrollSelectionForm(RtsPlayerLayerInterface),
        (get({ScrollSelectionForm, '$class'})):getSelectedIndexForPoint(ScrollSelectionForm, Point).

% throws Exception
getInstance(This, LayerManager, AItem, GeographicMapCellPosition) ->
        try
        Item = AItem,
        LayerInterfaceFactoryInterface = (get({Item, '$class'})):getLayerInterfaceFactoryInterface(Item),
        CellPoint = (get({GeographicMapCellPosition, '$class'})):getPoint(GeographicMapCellPosition),
        case (LayerInterfaceFactoryInterface =/= undefined) of
            true ->
            (get({get({This, hashtable}), '$class'})):put(get({This, hashtable}), get({'AllBinaryGameLayerManager', 'ID'}), LayerManager),
            throw({'$return', (get({LayerInterfaceFactoryInterface, '$class'})):getNextInstance(LayerInterfaceFactoryInterface, (get({This, '$class'})):getHashtable(This), (get({CellPoint, '$class'})):getX(CellPoint), (get({CellPoint, '$class'})):getY(CellPoint), (get({CellPoint, '$class'})):getZ(CellPoint))});
            false -> ok
        end,
        'CollidableDestroyableDamageableLayer':getNullInstance()
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getSelectedGeographicCellPosition(This) ->
        get({This, selectedGeographicCellPosition}).

setSelectedGeographicCellPosition(This, SelectedGeographicCellPosition) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N69451) -> (get({Target_N69451, '$class'})):toString(Target_N69451) end)((fun(Target_N69458) -> (get({Target_N69458, '$class'})):append(Target_N69458, (get({SelectedGeographicCellPosition, '$class'})):toString(SelectedGeographicCellPosition)) end)((fun(Target_N69465) -> (get({Target_N69465, '$class'})):append(Target_N69465, "Selected GeographicMapCellPosition: ") end)('StringMaker':new()))), This, "setSelectedGeographicCellPosition"),
        put({This, selectedGeographicCellPosition}, SelectedGeographicCellPosition).

isStickyItemSelected(This) ->
        get({This, stickyItemSelected}).

setStickyItemSelected(This, StickyItemSelected) when is_boolean(StickyItemSelected) ->
        put({This, stickyItemSelected}, StickyItemSelected).

getSelectedStickyItem(This) ->
        get({This, selectedStickyItem}).

setSelectedStickyItem(This, SelectedStickyItem) ->
        put({This, selectedStickyItem}, SelectedStickyItem).

getSelectedStickyItemIndex(This) ->
        get({This, selectedStickyItemIndex}).

setSelectedStickyItemIndex(This, SelectedStickyItemIndex) when is_integer(SelectedStickyItemIndex) ->
        put({This, selectedStickyItemIndex}, SelectedStickyItemIndex).

getHashtable(This) ->
        get({This, hashtable}).

