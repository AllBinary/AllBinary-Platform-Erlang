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
% package org.allbinary.media.graphics.geography.map.topview
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.media.graphics.geography.map.GeographicMapCellType
% import org.allbinary.media.graphics.geography.map.GeographicMapCellTypeFactory
% import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMapCellType
% import org.allbinary.string.CommonSeps
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListS

-module('BasicTopViewGeographicMapCellType').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, name}, undefined),
    put({This, cost}, 0),
    put({This, types}, undefined),
    ok.


createType(Name, Type, Cost) when (is_list(Name) orelse Name =:= undefined), is_integer(Type), is_integer(Cost) ->
        Types = 'BasicArrayListS':new(1),
        (get({Types, '$class'})):add(Types, Type),
        'BasicTopViewGeographicMapCellType':new(Name, Types, Cost).

new(Name, Types, Cost) when (is_list(Name) orelse Name =:= undefined), is_integer(Cost) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Name, Types, Cost),
    This.

init(This, Name, Types, Cost) when (is_list(Name) orelse Name =:= undefined), is_integer(Cost) ->
    init_fields(This),
        Size = (get({Types, '$class'})):size(Types),
        TypeArray = array:new(Size, {default, 0}),
        put({local, typeAsInteger}, undefined),
        put({local, type}, 0),
        lists:foreach(fun(Index) ->
            put({local, typeAsInteger}, ((get({Types, '$class'})):get(Types, Index))),
            put({local, type}, (get({get({local, typeAsInteger}), '$class'})):intValue(get({local, typeAsInteger}))),
            case (array:get(get({local, type}), (fun(Target_N66538) -> (get({Target_N66538, '$class'})):getGeographicMapCellTypeArray(Target_N66538) end)('GeographicMapCellTypeFactory':getInstance())) =:= undefined) of
                true ->
                'RaceTrackGeographicMapCellType':new(Name, get({local, type}), Cost, 0);
                false ->
                ok
            end,
            array:set(Index, get({local, type}), TypeArray)
        end, lists:seq(0, Size - 1)),
        put({This, name}, Name),
        put({This, cost}, Cost),
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

getTypes(This) ->
        get({This, types}).

toString(This) ->
        StringMaker = 'StringMaker':new(),
        Size = array:size(get({This, types})),
        lists:foreach(fun(Index) ->
            (fun(Target_N67383) -> (get({Target_N67383, '$class'})):append(Target_N67383, get({'CommonSeps':getInstance(), 'COMMA'})) end)((get({StringMaker, '$class'})):appendint(StringMaker, array:get(Index, get({This, types}))))
        end, lists:seq(0, Size - 1)),
        (get({StringMaker, '$class'})):toString(StringMaker).

