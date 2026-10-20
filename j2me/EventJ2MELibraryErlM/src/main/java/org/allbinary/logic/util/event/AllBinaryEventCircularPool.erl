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
% package org.allbinary.logic.util.event
% import org.allbinary.logic.util.cache.BaseCircularPool
% import org.allbinary.util.CircularIndexUtil

-module('AllBinaryEventCircularPool').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BaseCircularPool', Function, Arguments).

init_fields(This) ->
    ok.


new(Max) when is_integer(Max) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Max),
    This.

'$init'(This, Max) when is_integer(Max) ->
    'BaseCircularPool':'$init'(This),
    init_fields(This),
        put({This, 'OBJECT_ARRAY'}, array:new(Max, {default, undefined})),
        put({This, circularIndexUtil}, 'CircularIndexUtil':createInstance(Max)).

initAllBinaryEventCircularPool(This, AllBinaryEventObjectFactoryInterface) ->
        (get({get({This, circularIndexUtil}), '$class'})):setIndex(get({This, circularIndexUtil}), 0),
        Size = (get({get({This, circularIndexUtil}), '$class'})):getSize(get({This, circularIndexUtil})),
        lists:foreach(fun(Index) ->
            put({This, 'OBJECT_ARRAY'}, array:set(Index, (get({AllBinaryEventObjectFactoryInterface, '$class'})):getInstance(AllBinaryEventObjectFactoryInterface), get({This, 'OBJECT_ARRAY'})))
        end, lists:seq(0, Size - 1)).

