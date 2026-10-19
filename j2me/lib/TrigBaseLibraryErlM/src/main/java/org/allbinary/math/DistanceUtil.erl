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
% import org.allbinary.logic.math.MathUtil

-module('DistanceUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'DistanceUtil':new()),
    ok.

init_fields(This) ->
    put({This, mathUtil}, 'MathUtil':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'DistanceUtil', instance}).

getDistance(This, X1, Y1, X2, Y2) when is_integer(X1), is_integer(Y1), is_integer(X2), is_integer(Y2) ->
        Dx = (X1 - X2),
        Dy = (Y1 - Y2),
        trunc((get({get({This, mathUtil}), '$class'})):sqrt(get({This, mathUtil}), (((Dx * Dx)) + ((Dy * Dy))))).

