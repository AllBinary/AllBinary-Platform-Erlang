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
% package org.allbinary.game.ag.ai.scroller
% import javax.microedition.lcdui.Canvas
% import org.allbinary.game.ai.BasicAI
% import org.allbinary.game.identification.BasicGroupFactory
% import org.allbinary.game.input.GameInput
% import org.allbinary.game.layer.identification.GroupLayerManagerListener
% import org.allbinary.game.layer.weapon.WeaponLayer
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.layer.AllBinaryLayerManager
% import org.allbinary.logic.math.MathUtil
% import org.allbinary.util.ABHashtable
% import org.allbinary.util.BasicArrayList

-module('FlockingAI').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicAI', Function, Arguments).

init_fields(This) ->
    put({This, allowedDistance}, 0),
    ok.


new(Hashtable, OwnerLayerInterface, GameInput) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Hashtable, OwnerLayerInterface, GameInput),
    This.

'$init'(This, Hashtable, OwnerLayerInterface, GameInput) ->
        'BasicAI':'$init'(This, OwnerLayerInterface, GameInput),
        init_fields(This),
        AllowedDistance = (get({Hashtable, '$class'})):get(Hashtable, get({'BasePatrolAI', 'MAX_DISTANCE'})),
        put({This, allowedDistance}, (get({AllowedDistance, '$class'})):intValue(AllowedDistance)).

% throws Exception
processAI(This, AllBinaryLayerManager) ->
        put({local, maxDistance}, 0),
        put({local, farAllbinaryLayer}, get({'AllBinaryLayer', 'NULL_ALLBINARY_LAYER'})),
        GroupLayerManagerListener = 'GroupLayerManagerListener':getInstance(),
        List = (get({GroupLayerManagerListener, '$class'})):getList(GroupLayerManagerListener, get({'BasicGroupFactory':getInstance(), 'ENEMY'})),
        Size = (get({List, '$class'})):size(List),
        put({local, allBinaryLayer}, undefined),
        put({local, ownerLayerInterface}, undefined),
        lists:foreach(fun(Index) ->
            put({local, allBinaryLayer}, (get({List, '$class'})):get(List, Index)),
            case ((get({get({local, allBinaryLayer}), '$class'})):getType(get({local, allBinaryLayer})) =/= 'WeaponLayer':getStaticType()) of
                true ->
                Distance = (get({This, '$class'})):getXYDistance(This, get({local, allBinaryLayer})),
                case (Distance > get({local, maxDistance})) of
                    true ->
                    put({local, maxDistance}, Distance),
                    put({local, farAllbinaryLayer}, get({local, allBinaryLayer})),
                    case (Distance > get({This, allowedDistance})) of
                        true ->
                        throw('$break');
                        false -> ok
                    end;
                    false -> ok
                end;
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        case (get({local, maxDistance}) > get({This, allowedDistance})) of
            true ->
            case (get({local, farAllbinaryLayer}) =/= get({'AllBinaryLayer', 'NULL_ALLBINARY_LAYER'})) of
                true ->
                put({local, ownerLayerInterface}, (get({This, '$class'})):getOwnerLayerInterface(This)),
                case ((get({get({local, farAllbinaryLayer}), '$class'})):getXP(get({local, farAllbinaryLayer})) < (get({get({local, ownerLayerInterface}), '$class'})):getXP(get({local, ownerLayerInterface}))) of
                    true ->
                    (get({This, '$class'})):processKeyAI(This, get({'Canvas', 'LEFT'}));
                    false ->
                    case ((get({get({local, farAllbinaryLayer}), '$class'})):getXP(get({local, farAllbinaryLayer})) > (get({get({local, ownerLayerInterface}), '$class'})):getXP(get({local, ownerLayerInterface}))) of
                    true ->
                    (get({This, '$class'})):processKeyAI(This, get({'Canvas', 'RIGHT'}));
                    false ->
                    case ((get({get({local, farAllbinaryLayer}), '$class'})):getYP(get({local, farAllbinaryLayer})) > (get({get({local, ownerLayerInterface}), '$class'})):getYP(get({local, ownerLayerInterface}))) of
                    true ->
                    (get({This, '$class'})):processKeyAI(This, get({'Canvas', 'UP'}));
                    false ->
                    case ((get({get({local, farAllbinaryLayer}), '$class'})):getYP(get({local, farAllbinaryLayer})) < (get({get({local, ownerLayerInterface}), '$class'})):getYP(get({local, ownerLayerInterface}))) of
                    true ->
                    (get({This, '$class'})):processKeyAI(This, get({'Canvas', 'DOWN'}));
                    false -> ok
                end
                end
                end
                end;
                false -> ok
            end;
            false -> ok
        end.

getXYDistance(This, AllBinaryLayer) ->
        OwnerLayerInterface = (get({This, '$class'})):getOwnerLayerInterface(This),
        XTotalDistance = ((((get({AllBinaryLayer, '$class'})):getXP(AllBinaryLayer) + (get({AllBinaryLayer, '$class'})):getHalfWidth(AllBinaryLayer))) - (((get({OwnerLayerInterface, '$class'})):getXP(OwnerLayerInterface) + (get({OwnerLayerInterface, '$class'})):getHalfWidth(OwnerLayerInterface)))),
        YTotalDistance = ((((get({AllBinaryLayer, '$class'})):getYP(AllBinaryLayer) + (get({AllBinaryLayer, '$class'})):getHalfHeight(AllBinaryLayer))) - (((get({OwnerLayerInterface, '$class'})):getYP(OwnerLayerInterface) + (get({OwnerLayerInterface, '$class'})):getHalfHeight(OwnerLayerInterface)))),
        MathUtil = 'MathUtil':getInstance(),
        TotalDistance = ((get({MathUtil, '$class'})):abs(MathUtil, XTotalDistance) + (get({MathUtil, '$class'})):abs(MathUtil, YTotalDistance)),
        TotalDistance.

