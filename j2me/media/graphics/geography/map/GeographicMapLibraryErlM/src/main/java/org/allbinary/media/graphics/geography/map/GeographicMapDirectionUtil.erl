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
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.direction.Direction
% import org.allbinary.direction.DirectionFactory
% import org.allbinary.graphics.CellPosition

-module('GeographicMapDirectionUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'GeographicMapDirectionUtil':new()),
    ok.

init_fields(This) ->
    put({This, 'MESSAGE'}, "Cell Position should have been cached!!!"),
    put({This, 'ERROR'}, "Error: "),
    put({This, 'EQUAL'}, " == "),
    ok.


getInstance() ->
        get({'GeographicMapDirectionUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

% throws Exception
getDirectionFromCellPositionToAdjacentCellPosition(This, FromGeographicMapCellPosition, ToGeographicMapCellPosition) ->
        try
        FromColumn = (get({FromGeographicMapCellPosition, '$class'})):getColumn(FromGeographicMapCellPosition),
        FromRow = (get({FromGeographicMapCellPosition, '$class'})):getRow(FromGeographicMapCellPosition),
        GoColumn = (get({ToGeographicMapCellPosition, '$class'})):getColumn(ToGeographicMapCellPosition),
        GoRow = (get({ToGeographicMapCellPosition, '$class'})):getRow(ToGeographicMapCellPosition),
        DirectionFactory = 'DirectionFactory':getInstance(),
        case ((FromColumn - 1) =:= GoColumn) of
            true ->
            throw({'$return', get({DirectionFactory, 'LEFT'})});
            false ->
            case ((FromColumn + 1) =:= GoColumn) of
            true ->
            throw({'$return', get({DirectionFactory, 'RIGHT'})});
            false ->
            case ((FromRow - 1) =:= GoRow) of
            true ->
            throw({'$return', get({DirectionFactory, 'UP'})});
            false ->
            case ((FromRow + 1) =:= GoRow) of
            true ->
            throw({'$return', get({DirectionFactory, 'DOWN'})});
            false ->
            case (FromGeographicMapCellPosition =:= ToGeographicMapCellPosition) of
            true ->
            throw({'$return', get({DirectionFactory, 'NO_DIRECTION'})});
            false ->
            case ((FromRow =:= GoRow) andalso (FromColumn =:= GoColumn)) of
            true ->
            erlang:error({'Exception', get({This, 'MESSAGE'})});
            false -> ok
        end
        end
        end
        end
        end
        end,
        get({DirectionFactory, 'NOT_BORDERED_WITH'})
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
getEightDirectionFromCellPositionToAdjacentCellPosition(This, FromGeographicMapCellPosition, ToGeographicMapCellPosition) ->
        try
        FromColumn = (get({FromGeographicMapCellPosition, '$class'})):getColumn(FromGeographicMapCellPosition),
        FromRow = (get({FromGeographicMapCellPosition, '$class'})):getRow(FromGeographicMapCellPosition),
        GoColumn = (get({ToGeographicMapCellPosition, '$class'})):getColumn(ToGeographicMapCellPosition),
        GoRow = (get({ToGeographicMapCellPosition, '$class'})):getRow(ToGeographicMapCellPosition),
        DirectionFactory = 'DirectionFactory':getInstance(),
        case (FromRow =:= GoRow) of
            true ->
            case ((FromColumn - 1) =:= GoColumn) of
                true ->
                throw({'$return', get({DirectionFactory, 'LEFT'})});
                false ->
                case ((FromColumn + 1) =:= GoColumn) of
                true ->
                throw({'$return', get({DirectionFactory, 'RIGHT'})});
                false -> ok
            end
            end;
            false ->
            case ((FromRow - 1) =:= GoRow) of
            true ->
            case (FromColumn =:= GoColumn) of
                true ->
                throw({'$return', get({DirectionFactory, 'UP'})});
                false -> ok
            end,
            case ((FromColumn - 1) =:= GoColumn) of
                true ->
                throw({'$return', get({DirectionFactory, 'UP_LEFT'})});
                false ->
                case ((FromColumn + 1) =:= GoColumn) of
                true ->
                throw({'$return', get({DirectionFactory, 'UP_RIGHT'})});
                false -> ok
            end
            end;
            false ->
            case ((FromRow + 1) =:= GoRow) of
            true ->
            case (FromColumn =:= GoColumn) of
                true ->
                throw({'$return', get({DirectionFactory, 'DOWN'})});
                false -> ok
            end,
            case ((FromColumn - 1) =:= GoColumn) of
                true ->
                throw({'$return', get({DirectionFactory, 'DOWN_LEFT'})});
                false ->
                case ((FromColumn + 1) =:= GoColumn) of
                true ->
                throw({'$return', get({DirectionFactory, 'DOWN_RIGHT'})});
                false -> ok
            end
            end;
            false ->
            case (FromGeographicMapCellPosition =:= ToGeographicMapCellPosition) of
            true ->
            throw({'$return', get({DirectionFactory, 'NO_DIRECTION'})});
            false ->
            case ((FromRow =:= GoRow) andalso (FromColumn =:= GoColumn)) of
            true ->
            erlang:error({'Exception', get({This, 'MESSAGE'})});
            false -> ok
        end
        end
        end
        end
        end,
        get({DirectionFactory, 'NOT_BORDERED_WITH'})
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
getDirectionFromCellPositionToCellPosition(This, FromGeographicMapCellPosition, ToGeographicMapCellPosition) ->
        try
        FromColumn = (get({FromGeographicMapCellPosition, '$class'})):getColumn(FromGeographicMapCellPosition),
        FromRow = (get({FromGeographicMapCellPosition, '$class'})):getRow(FromGeographicMapCellPosition),
        GoColumn = (get({ToGeographicMapCellPosition, '$class'})):getColumn(ToGeographicMapCellPosition),
        GoRow = (get({ToGeographicMapCellPosition, '$class'})):getRow(ToGeographicMapCellPosition),
        DirectionFactory = 'DirectionFactory':getInstance(),
        case (FromColumn > GoColumn) of
            true ->
            throw({'$return', get({DirectionFactory, 'LEFT'})});
            false ->
            case (FromColumn < GoColumn) of
            true ->
            throw({'$return', get({DirectionFactory, 'RIGHT'})});
            false ->
            case (FromRow > GoRow) of
            true ->
            throw({'$return', get({DirectionFactory, 'UP'})});
            false ->
            case (FromRow < GoRow) of
            true ->
            throw({'$return', get({DirectionFactory, 'DOWN'})});
            false -> ok
        end
        end
        end
        end,
        StringMaker = 'StringMaker':new(),
        String = (fun(Target_N68055) -> (get({Target_N68055, '$class'})):toString(Target_N68055) end)((fun(Target_N68062) -> (get({Target_N68062, '$class'})):append(Target_N68062, 'CellPosition':toStringCellPosition(ToGeographicMapCellPosition)) end)((fun(Target_N68069) -> (get({Target_N68069, '$class'})):append(Target_N68069, " == ") end)((get({StringMaker, '$class'})):append(StringMaker, 'CellPosition':toStringCellPosition(FromGeographicMapCellPosition))))),
        (get({StringMaker, '$class'})):delete(StringMaker, 0, (get({StringMaker, '$class'})):length(StringMaker)),
        erlang:error({'Exception', (fun(Target_N68237) -> (get({Target_N68237, '$class'})):toString(Target_N68237) end)((fun(Target_N68244) -> (get({Target_N68244, '$class'})):append(Target_N68244, String) end)((get({StringMaker, '$class'})):append(StringMaker, "Error: ")))})
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
getEightDirectionFromCellPositionToCellPosition(This, FromGeographicMapCellPosition, ToGeographicMapCellPosition) ->
        try
        FromColumn = (get({FromGeographicMapCellPosition, '$class'})):getColumn(FromGeographicMapCellPosition),
        FromRow = (get({FromGeographicMapCellPosition, '$class'})):getRow(FromGeographicMapCellPosition),
        GoColumn = (get({ToGeographicMapCellPosition, '$class'})):getColumn(ToGeographicMapCellPosition),
        GoRow = (get({ToGeographicMapCellPosition, '$class'})):getRow(ToGeographicMapCellPosition),
        DirectionFactory = 'DirectionFactory':getInstance(),
        case (FromGeographicMapCellPosition =:= ToGeographicMapCellPosition) of
            true ->
            throw({'$return', get({DirectionFactory, 'NO_DIRECTION'})});
            false ->
            case (FromRow =:= GoRow) of
            true ->
            case (FromColumn > GoColumn) of
                true ->
                throw({'$return', get({DirectionFactory, 'LEFT'})});
                false ->
                case (FromColumn < GoColumn) of
                true ->
                throw({'$return', get({DirectionFactory, 'RIGHT'})});
                false -> ok
            end
            end;
            false ->
            case (FromRow > GoRow) of
            true ->
            case (FromColumn > GoColumn) of
                true ->
                throw({'$return', get({DirectionFactory, 'UP_LEFT'})});
                false ->
                case (FromColumn < GoColumn) of
                true ->
                throw({'$return', get({DirectionFactory, 'UP_RIGHT'})});
                false ->
                case (FromColumn =:= GoColumn) of
                true ->
                throw({'$return', get({DirectionFactory, 'UP'})});
                false -> ok
            end
            end
            end;
            false ->
            case (FromRow < GoRow) of
            true ->
            case (FromColumn > GoColumn) of
                true ->
                throw({'$return', get({DirectionFactory, 'DOWN_LEFT'})});
                false ->
                case (FromColumn < GoColumn) of
                true ->
                throw({'$return', get({DirectionFactory, 'DOWN_RIGHT'})});
                false ->
                case (FromColumn =:= GoColumn) of
                true ->
                throw({'$return', get({DirectionFactory, 'DOWN'})});
                false -> ok
            end
            end
            end;
            false -> ok
        end
        end
        end
        end,
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'ERROR'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, 'CellPosition':toStringCellPosition(FromGeographicMapCellPosition)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'EQUAL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, 'CellPosition':toStringCellPosition(ToGeographicMapCellPosition)),
        erlang:error({'Exception', (get({StringBuffer, '$class'})):toString(StringBuffer)})
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

