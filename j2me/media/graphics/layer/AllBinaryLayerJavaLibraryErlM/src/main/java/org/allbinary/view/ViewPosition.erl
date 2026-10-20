% 
% AllBinary Open License Version 1 
% Copyright (c) 2025 AllBinary 
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
% package org.allbinary.view
% import org.allbinary.layer.AllBinaryLayer

-module('ViewPosition').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ViewPositionBase', Function, Arguments).

init_fields(This) ->
    put({This, allbinaryLayer}, get({'AllBinaryLayer', 'NULL_ALLBINARY_LAYER'})),
    ok.


getInstanceD() ->
        'ViewPosition':new(0, 0, 0).

new(X, Y, Z) when is_integer(X), is_integer(Y), is_integer(Z) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, X, Y, Z),
    This.

'$init'(This, X, Y, Z) when is_integer(X), is_integer(Y), is_integer(Z) ->
        'ViewPositionBase':'$init'(This, X, Y, Z),
        init_fields(This).

getX(This) ->
        (get({get({This, allbinaryLayer}), '$class'})):getXP(get({This, allbinaryLayer})).

getY(This) ->
        (get({get({This, allbinaryLayer}), '$class'})):getYP(get({This, allbinaryLayer})).

getZ(This) ->
        (get({get({This, allbinaryLayer}), '$class'})):getZP(get({This, allbinaryLayer})).

getX2(This) ->
        ((get({This, '$class'})):getX(This) + (get({get({This, allbinaryLayer}), '$class'})):getWidth(get({This, allbinaryLayer}))).

getY2(This) ->
        ((get({This, '$class'})):getY(This) + (get({get({This, allbinaryLayer}), '$class'})):getHeight(get({This, allbinaryLayer}))).

getZ2(This) ->
        trunc((((get({This, '$class'})):getZ(This) + (get({get({This, allbinaryLayer}), '$class'})):getDepth(get({This, allbinaryLayer}))))).

setAllbinaryLayer(This, AllbinaryLayer) ->
        put({This, allbinaryLayer}, AllbinaryLayer).

