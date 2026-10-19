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
% package org.allbinary.game.physics.acceleration

-module('BasicAccelerationProperties').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, forward}, 0),
    put({This, reverse}, 0),
    ok.


new(Forward, Reverse) when is_integer(Forward), is_integer(Reverse) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Forward, Reverse),
    This.

init(This, Forward, Reverse) when is_integer(Forward), is_integer(Reverse) ->
    init_fields(This),
        (get({This, '$class'})):setForward(This, Forward),
        (get({This, '$class'})):setReverse(This, Reverse).

setReverse(This, Reverse) when is_integer(Reverse) ->
        put({This, reverse}, Reverse).

getReverse(This) ->
        get({This, reverse}).

setForward(This, Forward) when is_integer(Forward) ->
        put({This, forward}, Forward).

getForward(This) ->
        get({This, forward}).

