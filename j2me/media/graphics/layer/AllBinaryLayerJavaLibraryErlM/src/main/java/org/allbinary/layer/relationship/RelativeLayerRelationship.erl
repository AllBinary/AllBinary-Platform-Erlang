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
% package org.allbinary.layer.relationship
% import org.allbinary.graphics.GPoint
% import org.allbinary.graphics.RelativeRelationship
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.util.BasicArrayList

-module('RelativeLayerRelationship').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('RelativeRelationship', Function, Arguments).

init_fields(This) ->
    put({This, layer}, get({'AllBinaryLayer', 'NULL_ALLBINARY_LAYER'})),
    ok.


new(Layer, Point, TypesAllowedList) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Layer, Point, TypesAllowedList),
    This.

init(This, Layer, Point, TypesAllowedList) ->
        'RelativeRelationship':init(This, Point, TypesAllowedList),
        init_fields(This),
        put({This, layer}, Layer).

getX(This) ->
        ((get({get({This, layer}), '$class'})):getXP(get({This, layer})) + 'RelativeRelationship':getX(This)).

getY(This) ->
        ((get({get({This, layer}), '$class'})):getYP(get({This, layer})) + 'RelativeRelationship':getY(This)).

getZ(This) ->
        ((get({get({This, layer}), '$class'})):getZP(get({This, layer})) + 'RelativeRelationship':getZ(This)).

