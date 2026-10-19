% 
% AllBinary Open License Version 1 
% Copyright (c) 2022 AllBinary 
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
% package org.allbinary.game.displayable.canvas
% import org.allbinary.graphics.displayable.event.DisplayChangeEvent
% import org.allbinary.graphics.paint.NullPaintable

-module('BaseMenuBehavior').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'BaseMenuBehavior':new()),
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


getInstance() ->
        get({'BaseMenuBehavior', instance}).

% throws Exception
onDisplayChangeEvent(This, AllBinaryGameCanvas, DisplayChangeEvent) ->
        ok.

initSpecialPaint(This, AllBinaryGameCanvas) ->
        (get({AllBinaryGameCanvas, '$class'})):setNonBotPaintableP(AllBinaryGameCanvas, 'NullPaintable':getInstance()).

% throws Exception
initMenu(This, AllBinaryGameCanvas) ->
        ok.

% throws Exception
updateMenu(This, AllBinaryGameCanvas) ->
        ok.

% throws Exception
popupMenu(This, AllBinaryGameCanvas) ->
        ok.

closeMenu(This, AllBinaryGameCanvas) ->
        ok.

