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

-module('SimpleGeographicMapCellPositionFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements GeographicMapCellPositionFactoryInterface

static_init() ->
    put({?MODULE, 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'}, 'GeographicMapCellPosition':new((-1), (-1), (-1), (-1), (-1), (-1))),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance(This, GeographicMapInterface, I_column, I_row, Columns, Rows, Width, Height) when is_integer(I_column), is_integer(I_row), is_integer(Columns), is_integer(Rows), is_integer(Width), is_integer(Height) ->
        'GeographicMapCellPosition':new(I_column, I_row, Columns, Rows, Width, Height).

