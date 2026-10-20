% 
% AllBinary Open License Version 1 
% Copyright (c) 2006 AllBinary 
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
% import org.allbinary.game.layer.RTSPlayerLayerInterface
% import org.allbinary.graphics.form.item.ABCustomItem
% import org.allbinary.string.CommonStrings
% import org.allbinary.game.identification.Group
% import org.allbinary.game.layer.AllBinaryGameLayerManager
% import org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer
% import org.allbinary.graphics.GPoint
% import org.allbinary.graphics.form.ScrollSelectionForm
% import org.allbinary.layer.AllBinaryLayerManager
% import org.allbinary.media.graphics.geography.map.BasicGeographicMap
% import org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface
% import org.allbinary.string.CommonLabels

-module('CompositeRTSFormInput').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('RTSFormInput', Function, Arguments).

init_fields(This) ->
    put({This, rtsFormInputArray}, undefined),
    put({This, itemIndex}, undefined),
    put({This, isPrimaryWaypointCreator}, false),
    ok.


new(GroupInterface, IsPrimaryWaypointCreator, ItemIndex) when (is_tuple(GroupInterface) orelse GroupInterface =:= undefined), is_boolean(IsPrimaryWaypointCreator), (is_tuple(ItemIndex) orelse ItemIndex =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, GroupInterface, IsPrimaryWaypointCreator, ItemIndex),
    This.

'$init'(This, GroupInterface, IsPrimaryWaypointCreator, ItemIndex) when (is_tuple(GroupInterface) orelse GroupInterface =:= undefined), is_boolean(IsPrimaryWaypointCreator), (is_tuple(ItemIndex) orelse ItemIndex =:= undefined) ->
        'RTSFormInput':'$init'(This, GroupInterface),
        init_fields(This),
        put({This, itemIndex}, ItemIndex),
        put({This, isPrimaryWaypointCreator}, IsPrimaryWaypointCreator),
        put({This, rtsFormInputArray}, array:new(2, {default, undefined})),
        put({This, rtsFormInputArray}, array:set(0, 'WaypointRTSFormInput':new(get({This, groupInterfaceArray}), IsPrimaryWaypointCreator), get({This, rtsFormInputArray}))),
        put({This, rtsFormInputArray}, array:set(1, 'UnitRTSFormInput':new(get({This, groupInterfaceArray})), get({This, rtsFormInputArray}))).

% throws Exception
setAllBinaryGameLayerManager(This, AllBinaryGameLayerManager) ->
        'RTSFormInput':setAllBinaryGameLayerManager(This, AllBinaryGameLayerManager),
        GeographicMapCompositeInterface = AllBinaryGameLayerManager,
        GeographicMapInterface = array:get(0, (get({GeographicMapCompositeInterface, '$class'})):getGeographicMapInterface(GeographicMapCompositeInterface)),
        Size = array:size(get({This, rtsFormInputArray})),
        lists:foreach(fun(Index) ->
            (fun(Target_N66613) -> (get({Target_N66613, '$class'})):setAllBinaryGameLayerManager(Target_N66613, AllBinaryGameLayerManager) end)(array:get(Index, get({This, rtsFormInputArray})))
        end, lists:seq(0, Size - 1)).

% throws Exception
processAtPoint(This, AssociatedRtsLayer, RtsPlayerLayerInterface, LayerManager, Point) ->
        ScrollSelectionForm = (get({RtsPlayerLayerInterface, '$class'})):getCurrentScrollSelectionForm(RtsPlayerLayerInterface),
        Index = (get({ScrollSelectionForm, '$class'})):getSelectedIndexForPoint(ScrollSelectionForm, Point),
        case ((get({This, '$class'})):isStickyItemSelected(This) andalso (AssociatedRtsLayer =:= 'CollidableDestroyableDamageableLayer':getNullInstance())) of
            true ->
            case ((get({This, '$class'})):getSelectedStickyItemIndex(This) =< array:get(0, get({This, itemIndex}))) of
                true ->
                (fun(Target_N67097) -> (get({Target_N67097, '$class'})):processAtPoint(Target_N67097, AssociatedRtsLayer, RtsPlayerLayerInterface, LayerManager, Point) end)(array:get(0, get({This, rtsFormInputArray})));
                false -> ok
            end;
            false ->
            case (Index > array:get(0, get({This, itemIndex}))) of
            true ->
            (fun(Target_N66980) -> (get({Target_N66980, '$class'})):processAtPoint(Target_N66980, AssociatedRtsLayer, RtsPlayerLayerInterface, LayerManager, Point) end)(array:get(1, get({This, rtsFormInputArray})));
            false -> ok
        end
        end.

% throws Exception
processGameSpecific(This, AssociatedRtsLayer, RtsPlayerLayerInterface, LayerManager, Item, Index) when is_integer(Index) ->
        CommonStrings = 'CommonStrings':getInstance(),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([lists:concat([(get({'CommonLabels':getInstance(), 'INDEX_LABEL'}) + Index), " > "]), array:get(0, get({This, itemIndex}))]), This, get({CommonStrings, 'PROCESS'})),
        case ((get({This, '$class'})):isStickyItemSelected(This) andalso (AssociatedRtsLayer =:= 'CollidableDestroyableDamageableLayer':getNullInstance())) of
            true ->
            case ((get({This, '$class'})):getSelectedStickyItemIndex(This) =< array:get(0, get({This, itemIndex}))) of
                true ->
                (fun(Target_N67680) -> (get({Target_N67680, '$class'})):processGameSpecific(Target_N67680, AssociatedRtsLayer, RtsPlayerLayerInterface, LayerManager, Item, Index) end)(array:get(0, get({This, rtsFormInputArray})));
                false -> ok
            end;
            false ->
            case (Index > array:get(0, get({This, itemIndex}))) of
            true ->
            (fun(Target_N67555) -> (get({Target_N67555, '$class'})):processGameSpecific(Target_N67555, AssociatedRtsLayer, RtsPlayerLayerInterface, LayerManager, Item, Index) end)(array:get(1, get({This, rtsFormInputArray})));
            false -> ok
        end
        end.

% throws Exception
processSticky(This, AssociatedRtsLayer, RtsPlayerLayerInterface, LayerManager, Point) ->
        (fun(Target_N67902) -> (get({Target_N67902, '$class'})):processSticky(Target_N67902, AssociatedRtsLayer, RtsPlayerLayerInterface, LayerManager, Point) end)(array:get(0, get({This, rtsFormInputArray}))).

% throws Exception
processStickyGameSpecific(This, AssociatedRtsLayer, RtsPlayerLayerInterface, LayerManager, Item, Index) when is_integer(Index) ->
        (fun(Target_N68094) -> (get({Target_N68094, '$class'})):processStickyGameSpecific(Target_N68094, AssociatedRtsLayer, RtsPlayerLayerInterface, LayerManager, Item, Index) end)(array:get(0, get({This, rtsFormInputArray}))).

getSelectedStickyItemIndex(This) ->
        (fun(Target_N68306) -> (get({Target_N68306, '$class'})):getSelectedStickyItemIndex(Target_N68306) end)(array:get(0, get({This, rtsFormInputArray}))).

isStickyItemSelected(This) ->
        (fun(Target_N68374) -> (get({Target_N68374, '$class'})):isStickyItemSelected(Target_N68374) end)(array:get(0, get({This, rtsFormInputArray}))).

setStickyItemSelected(This, StickyItemSelected) when is_boolean(StickyItemSelected) ->
        (fun(Target_N68446) -> (get({Target_N68446, '$class'})):setStickyItemSelected(Target_N68446, StickyItemSelected) end)(array:get(0, get({This, rtsFormInputArray}))).

getSelectedStickyItem(This) ->
        (fun(Target_N68544) -> (get({Target_N68544, '$class'})):getSelectedStickyItem(Target_N68544) end)(array:get(0, get({This, rtsFormInputArray}))).

setSelectedStickyItem(This, SelectedStickyItem) ->
        (fun(Target_N68620) -> (get({Target_N68620, '$class'})):setSelectedStickyItem(Target_N68620, SelectedStickyItem) end)(array:get(0, get({This, rtsFormInputArray}))).

