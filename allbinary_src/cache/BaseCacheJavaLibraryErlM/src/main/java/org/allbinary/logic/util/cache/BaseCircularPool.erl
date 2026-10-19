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
% package org.allbinary.logic.util.cache
% import jsinterop.annotations.JsType
% import org.allbinary.logic.NullUtil
% import org.allbinary.util.CircularIndexUtil
% import jsinterop.annotations.JsMethod
% import jsinterop.annotations.JsProperty

-module('BaseCircularPool').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, circularIndexUtil}, get({'CircularIndexUtil', 'NULL_CIRCULAR_INDEX_UTIL'})),
    put({This, 'OBJECT_ARRAY'}, get({'NullUtil':getInstance(), 'NULL_OBJECT_ARRAY'})),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


% throws Exception
getNextInstance(This) ->
        AnyType = array:get((get({get({This, circularIndexUtil}), '$class'})):getIndex(get({This, circularIndexUtil})), get({This, 'OBJECT_ARRAY'})),
        (get({get({This, circularIndexUtil}), '$class'})):next(get({This, circularIndexUtil})),
        AnyType.

init(This, AllBinaryObjectFactoryInterface) ->
        (get({get({This, circularIndexUtil}), '$class'})):setIndex(get({This, circularIndexUtil}), 0),
        Size = (get({get({This, circularIndexUtil}), '$class'})):getSize(get({This, circularIndexUtil})),
        lists:foreach(fun(Index) ->
            put({This, 'OBJECT_ARRAY'}, array:set(Index, (get({AllBinaryObjectFactoryInterface, '$class'})):getInstance(AllBinaryObjectFactoryInterface), get({This, 'OBJECT_ARRAY'})))
        end, lists:seq(0, Size - 1)).

% throws Exception
getInstance(This, Index) when is_integer(Index) ->
        array:get(Index, get({This, 'OBJECT_ARRAY'})).

