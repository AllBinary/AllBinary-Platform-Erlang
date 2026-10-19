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
% import org.allbinary.math.NoDecimalTrigTable

-module('AxisMathVectorUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'AxisMathVectorUtil':new()),
    ok.

init_fields(This) ->
    put({This, noDecimalTrigTable}, 'NoDecimalTrigTable':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'AxisMathVectorUtil', instance}).

calculateX(This, Magnitude, Angle) when is_integer(Magnitude), is_integer(Angle) ->
        ((Magnitude * (get({get({This, noDecimalTrigTable}), '$class'})):cos(get({This, noDecimalTrigTable}), Angle)) / 10).

calculateY(This, Magnitude, Angle) when is_integer(Magnitude), is_integer(Angle) ->
        ((Magnitude * (get({get({This, noDecimalTrigTable}), '$class'})):sin(get({This, noDecimalTrigTable}), Angle)) / 10).

calculateZ(This, Magnitude, OtherAngle) when is_integer(Magnitude), is_integer(OtherAngle) ->
        ((Magnitude * (get({get({This, noDecimalTrigTable}), '$class'})):sin(get({This, noDecimalTrigTable}), OtherAngle)) / 10).

