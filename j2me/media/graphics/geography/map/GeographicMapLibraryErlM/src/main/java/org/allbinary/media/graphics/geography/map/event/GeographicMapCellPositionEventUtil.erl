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
% package org.allbinary.media.graphics.geography.map.event
% import org.allbinary.graphics.CellPositionFactory
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPositionTracking

-module('GeographicMapCellPositionEventUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, geographicMapCellPositionEvent}, undefined),
    put({This, geographicMapCellPositionEventHandler}, 'GeographicMapCellPositionEventHandler':getInstance()),
    ok.


new(AnyType) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, AnyType),
    This.

'$init'(This, AnyType) ->
    init_fields(This),
        put({This, geographicMapCellPositionEvent}, 'GeographicMapCellPositionEvent':new(AnyType, get({'CellPositionFactory':getInstance(), 'NONE'}))).

% throws Exception
update(This, GeographicMapCellPositionTracking) ->
        (get({get({This, geographicMapCellPositionEvent}), '$class'})):setGeographicMapCellPosition(get({This, geographicMapCellPositionEvent}), (get({GeographicMapCellPositionTracking, '$class'})):getCurrentGeographicMapCellPosition(GeographicMapCellPositionTracking)),
        (get({get({This, geographicMapCellPositionEventHandler}), '$class'})):fireEvent(get({This, geographicMapCellPositionEventHandler}), get({This, geographicMapCellPositionEvent})).

% throws Exception
remove(This, GeographicMapCellPositionTracking) ->
        (get({get({This, geographicMapCellPositionEvent}), '$class'})):setGeographicMapCellPosition(get({This, geographicMapCellPositionEvent}), (get({GeographicMapCellPositionTracking, '$class'})):getCurrentGeographicMapCellPosition(GeographicMapCellPositionTracking)),
        (get({get({This, geographicMapCellPositionEventHandler}), '$class'})):fireRemoveEvent(get({This, geographicMapCellPositionEventHandler}), get({This, geographicMapCellPositionEvent})).

