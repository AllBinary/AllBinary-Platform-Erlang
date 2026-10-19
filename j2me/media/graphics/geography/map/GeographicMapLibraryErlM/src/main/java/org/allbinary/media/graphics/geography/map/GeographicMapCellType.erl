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
% package org.allbinary.media.graphics.geography.map
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.math.SmallIntegerSingletonFactory

-module('GeographicMapCellType').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'NULL_GEOGRAPHIC_MAP_CELL_TYPE_ARRAY'}, array:new(0, {default, undefined})),
    put({?MODULE, 'NULL_GEOGRAPHIC_MAP_CELL_TYPE'}, 'GeographicMapCellType':new(get({'Integer', 'MIN_VALUE'}), 0)),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, type}, 0),
    ok.


new(Type, Reset) when is_integer(Type), is_integer(Reset) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Type, Reset),
    This.

init(This, Type, Reset) when is_integer(Type), is_integer(Reset) ->
    init_fields(This),
        put({This, type}, Type),
        case (Type =/= get({'Integer', 'MIN_VALUE'})) of
            true ->
            GeographicMapCellTypeFactory = 'GeographicMapCellTypeFactory':getInstance(),
            GeographicMapCellTypeArray = (get({GeographicMapCellTypeFactory, '$class'})):getGeographicMapCellTypeArray(GeographicMapCellTypeFactory),
            case ((array:get(Type, GeographicMapCellTypeArray) =:= undefined) orelse (Reset =:= 1)) of
                true ->
                array:set(Type, This, GeographicMapCellTypeArray);
                false ->
                case (Reset =/= (-1)) of
                    true ->
                    erlang:error({'RuntimeException'});
                    false -> ok
                end
            end;
            false -> ok
        end.

getType(This) ->
        get({This, type}).

toString(This) ->
        (fun(Target_N66328) -> (get({Target_N66328, '$class'})):toString(Target_N66328) end)((fun(Target_N66335) -> (get({Target_N66335, '$class'})):getAt(Target_N66335, get({This, type})) end)('SmallIntegerSingletonFactory':getInstance())).

