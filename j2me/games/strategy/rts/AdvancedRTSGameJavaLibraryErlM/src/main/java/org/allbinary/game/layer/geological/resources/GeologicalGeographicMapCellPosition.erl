% 
% AllBinary Open License Version 1 
% Copyright (c) 2006 AllBinary 
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
% package org.allbinary.game.layer.geological.resources
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition

-module('GeologicalGeographicMapCellPosition').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('GeographicMapCellPosition', Function, Arguments).

init_fields(This) ->
    put({This, geologicalResource}, undefined),
    ok.


new(Column, Row, Columns, Rows, Width, Height, GeologicalResource) when is_integer(Column), is_integer(Row), is_integer(Columns), is_integer(Rows), is_integer(Width), is_integer(Height) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Column, Row, Columns, Rows, Width, Height, GeologicalResource),
    This.

'$init'(This, Column, Row, Columns, Rows, Width, Height, GeologicalResource) when is_integer(Column), is_integer(Row), is_integer(Columns), is_integer(Rows), is_integer(Width), is_integer(Height) ->
        'GeographicMapCellPosition':'$init'(This, Column, Row, Columns, Rows, Width, Height),
        init_fields(This),
        put({This, geologicalResource}, GeologicalResource).

getGeologicalResource(This) ->
        get({This, geologicalResource}).

