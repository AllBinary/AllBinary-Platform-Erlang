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
% package org.allbinary.logic.math.vector
% import org.allbinary.logic.math.BasicDecimal

-module('MathVector').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements MathVectorInterface

init_fields(This) ->
    put({This, magnitudeBasicDecimal}, undefined),
    put({This, direction}, 0),
    put({This, resultBasicDecimal}, undefined),
    ok.


new(MagnitudeBasicDecimal, Direction) when is_integer(Direction) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, MagnitudeBasicDecimal, Direction),
    This.

init(This, MagnitudeBasicDecimal, Direction) when is_integer(Direction) ->
    init_fields(This),
        put({This, magnitudeBasicDecimal}, MagnitudeBasicDecimal),
        put({This, direction}, Direction).

getMagnitude(This) ->
        get({This, magnitudeBasicDecimal}).

getDirection(This) ->
        get({This, direction}).

getResult(This) ->
        get({This, resultBasicDecimal}).

