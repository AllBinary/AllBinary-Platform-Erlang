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
% package org.allbinary.graphics.j2me.workarea.canvas
% import org.allbinary.graphics.GPoint

-module('Grid').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, grid}, undefined),
    put({This, isGridOn}, true),
    put({This, isGridPossible}, false),
    put({This, zoom}, 3),
    put({This, isChanged}, true),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

new(Grid) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Grid),
    This.

init(This, Grid) ->
    init_fields(This),
        put({This, grid}, get({Grid, grid})),
        (get({This, '$class'})):showGrid(This, get({Grid, isGridOn})),
        put({This, isGridPossible}, get({Grid, isGridPossible})),
        (get({This, '$class'})):setZoom(This, (get({Grid, '$class'})):getZoom(Grid)).

isGridOn(This) ->
        get({This, isGridOn}).

isGridPossible(This) ->
        get({This, isGridPossible}).

getGrid(This) ->
        get({This, grid}).

getZoom(This) ->
        get({This, zoom}).

showGrid(This, Value) when is_boolean(Value) ->
        put({This, isGridOn}, Value).

setZoom(This, Zoom) when is_integer(Zoom) ->
        put({local, zoom}, Zoom),
        put({This, zoom}, get({local, zoom})),
        case (get({This, zoom}) < 1) of
            true ->
            put({local, zoom}, 1);
            false -> ok
        end,
        put({This, isChanged}, true).

