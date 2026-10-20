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
% package org.allbinary.view

-module('StaticViewPosition').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ViewPosition', Function, Arguments).

init_fields(This) ->
    ok.


new(X, Y, Z) when is_integer(X), is_integer(Y), is_integer(Z) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, X, Y, Z),
    This.

'$init'(This, X, Y, Z) when is_integer(X), is_integer(Y), is_integer(Z) ->
        'ViewPosition':'$init'(This, X, Y, Z).

getX(This) ->
        (get({This, '$class'})):getRawX(This).

getY(This) ->
        (get({This, '$class'})):getRawY(This).

getZ(This) ->
        (get({This, '$class'})):getRawZ(This).

