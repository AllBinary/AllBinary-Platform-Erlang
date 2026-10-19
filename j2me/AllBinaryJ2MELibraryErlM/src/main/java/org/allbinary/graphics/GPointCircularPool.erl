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
% import org.allbinary.logic.util.cache.BaseCircularPool
% import org.allbinary.util.CircularIndexUtil

-module('GPointCircularPool').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BaseCircularPool', Function, Arguments).

init_fields(This) ->
    ok.


new(Size) when is_integer(Size) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Size),
    This.

init(This, Size) when is_integer(Size) ->
    'BaseCircularPool':init(This),
    init_fields(This),
        put({This, circularIndexUtil}, 'CircularIndexUtil':createInstance(Size)),
        put({This, 'OBJECT_ARRAY'}, array:new(Size, {default, undefined})),
        lists:foreach(fun(Index) ->
            put({This, 'OBJECT_ARRAY'}, array:set(Index, 'CustomGPoint':getInstance3(0, 0), get({This, 'OBJECT_ARRAY'})))
        end, lists:seq((Size - 1), 0, -1)).

