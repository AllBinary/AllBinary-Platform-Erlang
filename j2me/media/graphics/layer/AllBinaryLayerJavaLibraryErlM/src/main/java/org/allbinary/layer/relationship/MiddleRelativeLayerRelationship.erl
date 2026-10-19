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
% import org.allbinary.graphics.PointFactory
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.util.BasicArrayListUtil

-module('MiddleRelativeLayerRelationship').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('RelativeLayerRelationship', Function, Arguments).

init_fields(This) ->
    ok.


new(Layer) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Layer),
    This.

init(This, Layer) ->
        'RelativeLayerRelationship':init(This, Layer, (fun(Target_N65691) -> (get({Target_N65691, '$class'})):createXY(Target_N65691, (get({Layer, '$class'})):getHalfWidth(Layer), (get({Layer, '$class'})):getHalfHeight(Layer)) end)('PointFactory':getInstance()), (fun(Target_N65750) -> (get({Target_N65750, '$class'})):getImmutableInstance(Target_N65750) end)('BasicArrayListUtil':getInstance())).

