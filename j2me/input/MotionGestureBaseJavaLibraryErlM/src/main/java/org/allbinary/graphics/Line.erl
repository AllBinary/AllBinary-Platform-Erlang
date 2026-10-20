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
% package org.allbinary.graphics

-module('Line').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, p1}, undefined),
    put({This, p2}, undefined),
    put({This, deltaX}, 0.0),
    put({This, deltaY}, 0.0),
    ok.


new(P1, P2) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, P1, P2),
    This.

'$init'(This, P1, P2) ->
    init_fields(This),
        put({This, p1}, get({'PointFactory':getInstance(), 'ZERO_ZERO'})),
        put({This, p2}, get({This, p1})),
        (get({This, '$class'})):setP1(This, P1),
        (get({This, '$class'})):setP2(This, P2).

getGradient(This) ->
        ((get({This, '$class'})):getDeltaY(This) / (get({This, '$class'})):getDeltaX(This)).

update(This) ->
        put({This, deltaX}, (float((fun(Target_N65976) -> (get({Target_N65976, '$class'})):getX(Target_N65976) end)((get({This, '$class'})):getP1(This))) - (fun(Target_N66000) -> (get({Target_N66000, '$class'})):getX(Target_N66000) end)((get({This, '$class'})):getP2(This)))),
        put({This, deltaY}, (float((fun(Target_N66047) -> (get({Target_N66047, '$class'})):getY(Target_N66047) end)((get({This, '$class'})):getP1(This))) - (fun(Target_N66071) -> (get({Target_N66071, '$class'})):getY(Target_N66071) end)((get({This, '$class'})):getP2(This)))).

getDeltaX(This) ->
        get({This, deltaX}).

getDeltaY(This) ->
        get({This, deltaY}).

getP1(This) ->
        get({This, p1}).

getP2(This) ->
        get({This, p2}).

setP1(This, P1) ->
        put({This, p1}, P1),
        (get({This, '$class'})):update(This).

setP2(This, P2) ->
        put({This, p2}, P2),
        (get({This, '$class'})):update(This).

