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
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonStrings

-module('CellPositionFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'SINGLETON'}, 'CellPositionFactory':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, 'NONE'}, 'CellPosition':new((-1), (-1), (-1), (-1))),
    put({This, cellPositionArray}, array:new(0, {default, array:new(0, {default, undefined})})),
    put({This, columns}, 0),
    put({This, rows}, 0),
    ok.


getInstance() ->
        get({'CellPositionFactory', 'SINGLETON'}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

init(This, Columns, Rows) when is_integer(Columns), is_integer(Rows) ->
        CommonStrings = 'CommonStrings':getInstance(),
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "Init: columns: "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, Columns),
        (get({StringBuffer, '$class'})):append(StringBuffer, " rows: "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, Rows),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, get({CommonStrings, 'INIT'})),
        put({This, cellPositionArray}, array:new(Columns, {default, array:new(Rows, {default, undefined})})),
        put({This, columns}, Columns),
        put({This, rows}, Rows),
        lists:foreach(fun(Column) ->
            lists:foreach(fun(Row) ->
                (get({This, '$class'})):createInstance(This, Column, Row)
            end, lists:seq(0, Rows - 1))
        end, lists:seq(0, Columns - 1)).

getInstanceColRow(This, I_column, I_row) when is_integer(I_column), is_integer(I_row) ->
        try
            array:get(I_row, array:get(I_column, get({This, cellPositionArray})))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), (fun(Target_N66816) -> (get({Target_N66816, '$class'})):toString(Target_N66816) end)((fun(Target_N66823) -> (get({Target_N66823, '$class'})):appendint(Target_N66823, I_row) end)((fun(Target_N66830) -> (get({Target_N66830, '$class'})):append(Target_N66830, " row: ") end)((fun(Target_N66837) -> (get({Target_N66837, '$class'})):appendint(Target_N66837, I_column) end)((fun(Target_N66844) -> (get({Target_N66844, '$class'})):append(Target_N66844, " col: ") end)((fun(Target_N66851) -> (get({Target_N66851, '$class'})):appendint(Target_N66851, (get({This, '$class'})):getRows(This)) end)((fun(Target_N66858) -> (get({Target_N66858, '$class'})):append(Target_N66858, " rows: ") end)((fun(Target_N66865) -> (get({Target_N66865, '$class'})):appendint(Target_N66865, (get({This, '$class'})):getColumns(This)) end)((fun(Target_N66872) -> (get({Target_N66872, '$class'})):append(Target_N66872, "columns: ") end)('StringMaker':new()))))))))), This, get({CommonStrings, 'GET_INSTANCE'}), E),
            get({This, 'NONE'})
        end.

createInstance(This, I_column, I_row) when is_integer(I_column), is_integer(I_row) ->
        put({local, cellPositionCanBeNull}, array:get(I_row, array:get(I_column, get({This, cellPositionArray})))),
        case (get({local, cellPositionCanBeNull}) =:= undefined) of
            true ->
            put({local, cellPositionCanBeNull}, 'CellPosition':new(I_column, I_row, get({This, columns}), get({This, rows}))),
            put({This, cellPositionArray}, array:set(I_column, array:set(I_row, get({local, cellPositionCanBeNull}), array:get(I_column, get({This, cellPositionArray}))), get({This, cellPositionArray})));
            false -> ok
        end,
        get({local, cellPositionCanBeNull}).

getColumns(This) ->
        get({This, columns}).

getRows(This) ->
        get({This, rows}).

