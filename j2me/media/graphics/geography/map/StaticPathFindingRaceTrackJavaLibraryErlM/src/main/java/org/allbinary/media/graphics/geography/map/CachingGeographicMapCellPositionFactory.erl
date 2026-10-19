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
% import org.allbinary.util.ABHashtable

-module('CachingGeographicMapCellPositionFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicGeographicMapCellPositionFactory', Function, Arguments).

init_fields(This) ->
    ok.


new(GeographicMapInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, GeographicMapInterface),
    This.

init(This, GeographicMapInterface) ->
        'BasicGeographicMapCellPositionFactory':init(This, GeographicMapInterface).

% throws Exception
createInstance(This, I_column, I_row, Width, Height) when is_integer(I_column), is_integer(I_row), is_integer(Width), is_integer(Height) ->
        Hashtable = 'GeographicMapCellPositionFactory':getHashtable(),
        CellPositionKey = 'CellPosition':toStringColRow(I_column, I_row),
        put({local, cellPositionCanBeNull}, (get({Hashtable, '$class'})):get(Hashtable, CellPositionKey)),
        case (get({local, cellPositionCanBeNull}) =:= undefined) of
            true ->
            put({local, cellPositionCanBeNull}, (get({get({This, geographicMapCellPositionFactoryInterface}), '$class'})):getInstance(get({This, geographicMapCellPositionFactoryInterface}), get({This, geographicMapInterface}), I_column, I_row, (get({This, '$class'})):getColumns(This), (get({This, '$class'})):getRows(This), Width, Height)),
            put({This, geographicMapCellPositionArray}, array:set(I_row, array:set(I_column, get({local, cellPositionCanBeNull}), array:get(I_row, get({This, geographicMapCellPositionArray}))), get({This, geographicMapCellPositionArray}))),
            (get({Hashtable, '$class'})):put(Hashtable, CellPositionKey, get({local, cellPositionCanBeNull}));
            false -> ok
        end,
        get({local, cellPositionCanBeNull}).

