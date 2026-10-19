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

-module('CustomGPoint').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('GPoint', Function, Arguments).

static_init() ->
    put({?MODULE, 'NULL_CUSTOM_POINT'}, 'CustomGPoint':new(0, 0, 0)),
    ok.

init_fields(This) ->
    put({This, cx}, 0),
    put({This, cy}, 0),
    put({This, cz}, 0),
    ok.


getInstance(Point) ->
        'CustomGPoint':new((get({Point, '$class'})):getX(Point), (get({Point, '$class'})):getY(Point), (get({Point, '$class'})):getZ(Point)).

getInstance3(X, Y) when is_integer(X), is_integer(Y) ->
        'CustomGPoint':new(X, Y, 3).

new(X, Y, Z) when is_integer(X), is_integer(Y), is_integer(Z) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, X, Y, Z),
    This.

init(This, X, Y, Z) when is_integer(X), is_integer(Y), is_integer(Z) ->
        'GPoint':init(This, X, Y, Z),
        init_fields(This).

setX(This, X) when is_integer(X) ->
        put({This, cx}, X).

getX(This) ->
        get({This, cx}).

setY(This, Y) when is_integer(Y) ->
        put({This, cy}, Y).

getY(This) ->
        get({This, cy}).

setZ(This, Z) when is_integer(Z) ->
        put({This, cz}, Z).

getZ(This) ->
        get({This, cz}).

