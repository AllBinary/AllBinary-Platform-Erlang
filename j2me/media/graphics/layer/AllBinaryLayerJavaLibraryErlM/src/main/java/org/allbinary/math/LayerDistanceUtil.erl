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
% package org.allbinary.math
% import org.allbinary.graphics.GPoint
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.logic.math.MathUtil

-module('LayerDistanceUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'LayerDistanceUtil':new()),
    ok.

init_fields(This) ->
    put({This, mathUtil}, 'MathUtil':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'LayerDistanceUtil', instance}).

getDistance(This, LayerInterface, LayerInterface2) ->
        Dx = ((((get({LayerInterface, '$class'})):getXP(LayerInterface) + (get({LayerInterface, '$class'})):getHalfWidth(LayerInterface))) - (((get({LayerInterface2, '$class'})):getXP(LayerInterface2) + (get({LayerInterface2, '$class'})):getHalfWidth(LayerInterface2)))),
        Dy = ((((get({LayerInterface, '$class'})):getYP(LayerInterface) + (get({LayerInterface, '$class'})):getHalfHeight(LayerInterface))) - (((get({LayerInterface2, '$class'})):getYP(LayerInterface2) + (get({LayerInterface2, '$class'})):getHalfHeight(LayerInterface2)))),
        trunc((get({get({This, mathUtil}), '$class'})):sqrt(get({This, mathUtil}), (((Dx * Dx)) + ((Dy * Dy))))).

getDistance3D(This, LayerInterface, LayerInterface2) ->
        Dx = ((((get({LayerInterface, '$class'})):getXP(LayerInterface) + (get({LayerInterface, '$class'})):getHalfWidth(LayerInterface))) - (((get({LayerInterface2, '$class'})):getXP(LayerInterface2) + (get({LayerInterface2, '$class'})):getHalfWidth(LayerInterface2)))),
        Dy = ((((get({LayerInterface, '$class'})):getYP(LayerInterface) + (get({LayerInterface, '$class'})):getHalfHeight(LayerInterface))) - (((get({LayerInterface2, '$class'})):getYP(LayerInterface2) + (get({LayerInterface2, '$class'})):getHalfHeight(LayerInterface2)))),
        Dz = ((((get({LayerInterface, '$class'})):getZP(LayerInterface) + (get({LayerInterface, '$class'})):getHalfDepth(LayerInterface))) - (((get({LayerInterface2, '$class'})):getZP(LayerInterface2) + (get({LayerInterface2, '$class'})):getHalfDepth(LayerInterface2)))),
        trunc((get({get({This, mathUtil}), '$class'})):sqrt(get({This, mathUtil}), ((((Dx * Dx)) + ((Dy * Dy))) + ((Dz * Dz))))).

getDistanceAt(This, LayerInterface, Point) ->
        Dx = ((get({LayerInterface, '$class'})):getXP(LayerInterface) - (get({Point, '$class'})):getX(Point)),
        Dy = ((get({LayerInterface, '$class'})):getYP(LayerInterface) - (get({Point, '$class'})):getY(Point)),
        trunc((get({get({This, mathUtil}), '$class'})):sqrt(get({This, mathUtil}), (((Dx * Dx)) + ((Dy * Dy))))).

