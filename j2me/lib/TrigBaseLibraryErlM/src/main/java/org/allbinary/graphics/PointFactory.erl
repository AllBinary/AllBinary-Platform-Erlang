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
% import jsinterop.annotations.JsType
% import jsinterop.annotations.JsMethod
% import jsinterop.annotations.JsConstructor
% import jsinterop.annotations.JsProperty

-module('PointFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'PointFactory':new()),
    ok.

init_fields(This) ->
    put({This, 'ZERO_ZERO'}, (get({This, '$class'})):createXYZ(This, 0, 0, 0)),
    ok.


getInstance() ->
        get({'PointFactory', instance}).

init(This) ->
        ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

createXY(This, X, Y) when is_integer(X), is_integer(Y) ->
        'GPoint':new(X, Y, 0).

createXYZ(This, X, Y, Z) when is_integer(X), is_integer(Y), is_integer(Z) ->
        'GPoint':new(X, Y, Z).

