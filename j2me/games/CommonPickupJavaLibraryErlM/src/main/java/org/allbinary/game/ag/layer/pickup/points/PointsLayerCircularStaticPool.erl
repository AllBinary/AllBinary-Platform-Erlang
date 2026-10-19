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
% package org.allbinary.game.ag.layer.pickup.points
% import org.allbinary.game.score.ScoreableInterface
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.layer.AllBinaryLayerCircularPool
% import org.allbinary.layer.AllBinaryLayerFactoryInterface

-module('PointsLayerCircularStaticPool').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('AllBinaryLayerCircularPool', Function, Arguments).

init_fields(This) ->
    ok.


new(AllbinaryLayerFactoryInterface, Total) when is_integer(Total) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, AllbinaryLayerFactoryInterface, Total),
    This.

init(This, AllbinaryLayerFactoryInterface, Total) when is_integer(Total) ->
    'AllBinaryLayerCircularPool':init(This),
    init_fields(This),
        'AllBinaryLayerCircularPool':initAllBinaryLayerCircularPool(This, AllbinaryLayerFactoryInterface, Total).

% throws Exception
visit(This, SourceLayerInterface) ->
        PointsLayer = (get({This, '$class'})):getNextInstance(This),
        ScoreableInterface = SourceLayerInterface,
        (get({PointsLayer, '$class'})):visit(PointsLayer, ScoreableInterface).

