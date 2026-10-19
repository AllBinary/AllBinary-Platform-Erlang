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
% package org.allbinary.game.input
% import org.allbinary.game.input.form.AssignWaypointsUtil
% import org.allbinary.game.layer.AdvancedRTSGameLayer
% import org.allbinary.game.layer.RTSLayer
% import org.allbinary.game.layer.building.BuildingLayer
% import org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer
% import org.allbinary.game.layer.unit.UnitLayer
% import org.allbinary.logic.NullUtil
% import org.allbinary.util.BasicArrayList
% import org.allbinary.logic.util.visitor.Visitor

-module('SelectAdvancedRTSLayerVisitor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('Visitor', Function, Arguments).

init_fields(This) ->
    put({This, selectedRTSLayersPlayerGameInput}, undefined),
    ok.


new(SelectedRTSLayersPlayerGameInput) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, SelectedRTSLayersPlayerGameInput),
    This.

init(This, SelectedRTSLayersPlayerGameInput) ->
    'Visitor':init(This),
    init_fields(This),
        put({This, selectedRTSLayersPlayerGameInput}, SelectedRTSLayersPlayerGameInput).

visit(This, AnyType) ->
        SelectedLayer = AnyType,
        case ((SelectedLayer =/= 'CollidableDestroyableDamageableLayer':getNullInstance()) andalso ((get({SelectedLayer, '$class'})):getType(SelectedLayer) =:= 'BuildingLayer':getStaticType())) of
            true ->
            RtsGameLayer = SelectedLayer,
            AssignWaypointsUtil = 'AssignWaypointsUtil':getInstance(),
            List = (get({get({This, selectedRTSLayersPlayerGameInput}), '$class'})):getSelectedBasicArrayList(get({This, selectedRTSLayersPlayerGameInput})),
            put({local, currentRTSLayer}, undefined),
            put({local, unitLayer}, undefined),
            lists:foreach(fun(Index) ->
                put({local, currentRTSLayer}, (get({List, '$class'})):get(List, Index)),
                case ((get({get({local, currentRTSLayer}), '$class'})):getType(get({local, currentRTSLayer})) =:= 'UnitLayer':getStaticType()) of
                    true ->
                    put({local, unitLayer}, get({local, currentRTSLayer})),
                    (get({get({local, unitLayer}), '$class'})):setParentLayer(get({local, unitLayer}), RtsGameLayer),
                    (get({AssignWaypointsUtil, '$class'})):set(AssignWaypointsUtil, get({local, unitLayer}), RtsGameLayer);
                    false -> ok
                end
            end, lists:seq(((get({List, '$class'})):size(List) - 1), 0, -1));
            false -> ok
        end,
        get({'NullUtil':getInstance(), 'NULL_OBJECT'}).

