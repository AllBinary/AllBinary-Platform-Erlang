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
% package org.allbinary.input.automation
% import java.awt

-module('PointFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, pointArray}, array:new(3000, {default, array:new(3000, {default, undefined})})),
    ok.

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

getInstance(X, Y) when is_integer(X), is_integer(Y) ->
        put({local, point}, array:get(Y, array:get(X, get({'PointFactory', pointArray})))),
        case (get({local, point}) =:= undefined) of
            true ->
            put({'PointFactory', pointArray}, array:set(X, array:set(Y, 'Point':new(X, Y), array:get(X, get({'PointFactory', pointArray}))), get({'PointFactory', pointArray}))),
            put({local, point}, array:get(Y, array:get(X, get({'PointFactory', pointArray}))));
            false -> ok
        end,
        get({local, point}).

