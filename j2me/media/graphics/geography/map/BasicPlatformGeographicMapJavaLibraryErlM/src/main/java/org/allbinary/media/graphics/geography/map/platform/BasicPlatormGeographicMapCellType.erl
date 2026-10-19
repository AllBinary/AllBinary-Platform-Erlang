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
% package org.allbinary.media.graphics.geography.map.platform
% import org.allbinary.logic.math.SmallIntegerSingletonFactory
% import org.allbinary.media.graphics.geography.map.GeographicMapCellType
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListS

-module('BasicPlatormGeographicMapCellType').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, types}, undefined),
    ok.


createType(Type) when is_integer(Type) ->
        Types = 'BasicArrayListS':new(1),
        (get({Types, '$class'})):add(Types, (fun(Target_N65843) -> (get({Target_N65843, '$class'})):getAt(Target_N65843, Type) end)('SmallIntegerSingletonFactory':getInstance())),
        BasicPlatormGeographicMapCellType = 'BasicPlatormGeographicMapCellType':new(Types),
        BasicPlatormGeographicMapCellType.

new(Types) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Types),
    This.

init(This, Types) ->
    init_fields(This),
        Size = (get({Types, '$class'})):size(Types),
        TypeArray = array:new(Size, {default, 0}),
        put({local, typeAsInteger}, undefined),
        put({local, type}, 0),
        lists:foreach(fun(Index) ->
            put({local, typeAsInteger}, ((get({Types, '$class'})):get(Types, Index))),
            put({local, type}, (get({get({local, typeAsInteger}), '$class'})):intValue(get({local, typeAsInteger}))),
            'GeographicMapCellType':new(get({local, type}), 0),
            array:set(Index, get({local, type}), TypeArray)
        end, lists:seq(0, Size - 1)),
        put({This, types}, TypeArray).

isType(This, Type) ->
        (get({This, '$class'})):hasType(This, (get({Type, '$class'})):getType(Type)).

hasType(This, Type) when is_integer(Type) ->
        try
        Size = array:size(get({This, types})),
        lists:foreach(fun(Index) ->
            case (array:get(Index, get({This, types})) =:= Type) of
                true ->
                throw({'$return', true});
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

