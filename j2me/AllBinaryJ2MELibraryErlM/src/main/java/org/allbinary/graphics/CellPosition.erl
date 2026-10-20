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
% import org.allbinary.graph.V
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonSeps

-module('CellPosition').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('V', Function, Arguments).

init_fields(This) ->
    put({This, id}, 0),
    put({This, column}, 0),
    put({This, row}, 0),
    ok.


new(Column, Row, Columns, Rows) when is_integer(Column), is_integer(Row), is_integer(Columns), is_integer(Rows) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Column, Row, Columns, Rows),
    This.

'$init'(This, Column, Row, Columns, Rows) when is_integer(Column), is_integer(Row), is_integer(Columns), is_integer(Rows) ->
    'V':'$init'(This),
    init_fields(This),
        put({This, column}, Column),
        put({This, row}, Row),
        put({This, id}, (((Row * Columns)) + Column)).

getColumn(This) ->
        get({This, column}).

getRow(This) ->
        get({This, row}).

toString(This) ->
        'CellPosition':toStringColRow((get({This, '$class'})):getColumn(This), (get({This, '$class'})):getRow(This)).

toStringCellPosition(BasicGeographicMapCellPosition) ->
        'CellPosition':toStringColRow((get({BasicGeographicMapCellPosition, '$class'})):getColumn(BasicGeographicMapCellPosition), (get({BasicGeographicMapCellPosition, '$class'})):getRow(BasicGeographicMapCellPosition)).

toStringColRow(I_column, I_row) when is_integer(I_column), is_integer(I_row) ->
        StringBuffer = 'StringMaker':new(),
        CommonSeps = 'CommonSeps':getInstance(),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'PARENTHESIS_OPEN'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, I_column),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'COMMA'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, I_row),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'PARENTHESIS_CLOSE'})),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

getId(This) ->
        get({This, id}).

