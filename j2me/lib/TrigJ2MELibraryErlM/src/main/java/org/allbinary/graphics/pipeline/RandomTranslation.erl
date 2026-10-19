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
% import org.allbinary.util.BasicArrayList

-module('RandomTranslation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


% throws Exception
getInstance(Vector, HowMuch) when is_integer(HowMuch) ->
        MyRandomFactory = 'MyRandomFactory':getInstance(),
        X = (-(get({MyRandomFactory, '$class'})):getNextInt(MyRandomFactory, HowMuch)),
        Y = (get({MyRandomFactory, '$class'})):getNextInt(MyRandomFactory, HowMuch),
        GraphicsPipe = 'BasicGraphicsPipeline':new(Vector),
        (get({GraphicsPipe, '$class'})):createMatrix(GraphicsPipe),
        (get({GraphicsPipe, '$class'})):translate(GraphicsPipe, X, Y),
        (get({GraphicsPipe, '$class'})):getMatrix(GraphicsPipe).

