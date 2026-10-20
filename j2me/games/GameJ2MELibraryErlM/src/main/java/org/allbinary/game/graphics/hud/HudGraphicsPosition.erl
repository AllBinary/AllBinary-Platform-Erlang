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
% package org.allbinary.game.graphics.hud
% import org.allbinary.graphics.GPoint
% import org.allbinary.graphics.PointFactory

-module('HudGraphicsPosition').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'NULL_HUD_GRAPHICS_POSITION'}, 'HudGraphicsPosition':new(get({'PointFactory':getInstance(), 'ZERO_ZERO'}), 9)),
    ok.

init_fields(This) ->
    put({This, anchor}, 0),
    put({This, point}, get({'PointFactory':getInstance(), 'ZERO_ZERO'})),
    ok.


new(Point, Anchor) when is_integer(Anchor) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Point, Anchor),
    This.

'$init'(This, Point, Anchor) when is_integer(Anchor) ->
    init_fields(This),
        (get({This, '$class'})):setAnchor(This, Anchor),
        (get({This, '$class'})):setPoint(This, Point).

getAnchor(This) ->
        get({This, anchor}).

setAnchor(This, Anchor) when is_integer(Anchor) ->
        put({This, anchor}, Anchor).

getPoint(This) ->
        get({This, point}).

setPoint(This, Point) ->
        put({This, point}, Point).

