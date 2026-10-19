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

-module('YAxisMathVector').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('MathVector', Function, Arguments).

init_fields(This) ->
    ok.


new(MagnitudeBasicDecimal, Direction) when is_integer(Direction) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, MagnitudeBasicDecimal, Direction),
    This.

init(This, MagnitudeBasicDecimal, Direction) when is_integer(Direction) ->
        'MathVector':init(This, MagnitudeBasicDecimal, Direction),
        (get({This, '$class'})):calculate(This).

getResult(This) ->
        get({This, resultBasicDecimal}).

calculate(This) ->
        Result = 'YAxisMathVectorUtil':calculate((fun(Target_N65801) -> (get({Target_N65801, '$class'})):getUnscaled(Target_N65801) end)((get({This, '$class'})):getMagnitude(This)), (get({This, '$class'})):getDirection(This)),
        put({This, resultBasicDecimal}, 'BasicDecimal':new(Result)).

