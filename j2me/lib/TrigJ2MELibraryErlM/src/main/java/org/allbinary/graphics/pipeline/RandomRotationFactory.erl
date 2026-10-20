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
% import org.allbinary.game.rand.MyRandomFactory
% import org.allbinary.math.AngleFactory
% import org.allbinary.util.BasicArrayList

-module('RandomRotationFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'RandomRotationFactory':new()),
    ok.

init_fields(This) ->
    put({This, myRandomFactory}, 'MyRandomFactory':getInstance()),
    put({This, angleFactory}, 'AngleFactory':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'RandomRotationFactory', instance}).

% throws Exception
getInstanceList(This, Vector, HowMuch) when is_integer(HowMuch) ->
        GraphicsPipe = 'BasicGraphicsPipeline':new(Vector),
        (get({GraphicsPipe, '$class'})):createMatrix(GraphicsPipe),
        (get({GraphicsPipe, '$class'})):rotateToAngle(GraphicsPipe, (get({get({This, angleFactory}), '$class'})):getAt(get({This, angleFactory}), (get({This, '$class'})):getNextRandomAngle(This, HowMuch))),
        (get({GraphicsPipe, '$class'})):getMatrix(GraphicsPipe).

getNextRandomAngle(This, HowMuch) when is_integer(HowMuch) ->
        (get({get({This, myRandomFactory}), '$class'})):getNextInt(get({This, myRandomFactory}), (HowMuch * 10)).

