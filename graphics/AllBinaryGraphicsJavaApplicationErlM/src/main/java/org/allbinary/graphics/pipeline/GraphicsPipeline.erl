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
% package org.allbinary.graphics.pipeline
% import org.allbinary.graphics.GPoint
% import org.allbinary.graphics.PointFactory
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('GraphicsPipeline').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicGraphicsPipeline', Function, Arguments).

init_fields(This) ->
    ok.


new(Points) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Points),
    This.

init(This, Points) ->
        'BasicGraphicsPipeline':init(This, Points).

% throws Exception
rotateTheta(This, ATheta) when is_number(ATheta) ->
        NewVector = 'BasicArrayListD':new(),
        Size = (get({get({This, pointBasicArrayList}), '$class'})):size(get({This, pointBasicArrayList})),
        lists:foreach(fun(Index) ->
            SecondPoint = (get({get({This, pointBasicArrayList}), '$class'})):get(get({This, pointBasicArrayList}), Index),
            SecondX = ((((get({SecondPoint, '$class'})):getX(SecondPoint) * math:cos(ATheta))) - (((get({SecondPoint, '$class'})):getY(SecondPoint) * math:sin(ATheta)))),
            SecondY = ((((get({SecondPoint, '$class'})):getX(SecondPoint) * math:sin(ATheta))) + (((get({SecondPoint, '$class'})):getY(SecondPoint) * math:cos(ATheta)))),
            Point = (fun(Target_N66194) -> (get({Target_N66194, '$class'})):createXY(Target_N66194, (trunc(SecondX)), (trunc(SecondY))) end)('PointFactory':getInstance()),
            (get({NewVector, '$class'})):add(NewVector, Point)
        end, lists:seq(0, Size - 1)),
        put({This, pointBasicArrayList}, NewVector).

