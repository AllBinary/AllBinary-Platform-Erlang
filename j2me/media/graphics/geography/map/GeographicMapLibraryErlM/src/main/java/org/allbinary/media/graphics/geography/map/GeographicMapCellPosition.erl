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
% import org.allbinary.graphics.CellPosition
% import org.allbinary.graphics.GPoint
% import org.allbinary.graphics.PointFactory

-module('GeographicMapCellPosition').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('CellPosition', Function, Arguments).

init_fields(This) ->
    put({This, point}, undefined),
    put({This, midPoint}, undefined),
    ok.


new(Column, Row, Columns, Rows, Width, Height) when is_integer(Column), is_integer(Row), is_integer(Columns), is_integer(Rows), is_integer(Width), is_integer(Height) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Column, Row, Columns, Rows, Width, Height),
    This.

'$init'(This, Column, Row, Columns, Rows, Width, Height) when is_integer(Column), is_integer(Row), is_integer(Columns), is_integer(Rows), is_integer(Width), is_integer(Height) ->
        'CellPosition':'$init'(This, Column, Row, Columns, Rows),
        init_fields(This),
        X = ((get({This, '$class'})):getColumn(This) * Width),
        Y = ((get({This, '$class'})):getRow(This) * Height),
        PointFactory = 'PointFactory':getInstance(),
        put({This, point}, (get({PointFactory, '$class'})):createXY(PointFactory, X, Y)),
        put({This, midPoint}, (get({PointFactory, '$class'})):createXY(PointFactory, (X + ((Width bsr 1))), (Y + ((Height bsr 1))))).

getPoint(This) ->
        get({This, point}).

getMidPoint(This) ->
        get({This, midPoint}).

setMidPoint(This, MidPoint) ->
        put({This, midPoint}, MidPoint).

