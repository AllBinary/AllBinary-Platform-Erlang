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
% import org.allbinary.game.displayable.canvas.AllBinaryGameCanvas
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.color.BasicColorFactory

-module('ColorFromEventUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ColorFromEventUtil':new()),
    ok.

init_fields(This) ->
    put({This, 'YELLOW'}, get({'BasicColorFactory':getInstance(), 'YELLOW'})),
    put({This, 'COLOR_INT'}, (get({get({This, 'YELLOW'}), '$class'})):intValue(get({This, 'YELLOW'}))),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'ColorFromEventUtil', instance}).

getForegroundColor(This, GameCanvasInterface) ->
        put({local, color}, get({This, 'YELLOW'})),
        GeographicMapCompositeInterface = (get({GameCanvasInterface, '$class'})):getLayerManager(GameCanvasInterface),
        GeographicMapInterface = array:get(0, (get({GeographicMapCompositeInterface, '$class'})):getGeographicMapInterface(GeographicMapCompositeInterface)),
        case (GeographicMapInterface =/= undefined) of
            true ->
            ForegroundBasicColor = (get({GeographicMapInterface, '$class'})):getForegroundBasicColor(GeographicMapInterface),
            put({local, color}, ForegroundBasicColor);
            false -> ok
        end,
        get({local, color}).

