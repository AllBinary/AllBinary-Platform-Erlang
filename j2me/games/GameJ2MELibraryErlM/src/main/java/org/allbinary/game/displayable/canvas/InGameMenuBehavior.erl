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

-module('InGameMenuBehavior').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BaseMenuBehavior', Function, Arguments).

static_init() ->
    put({?MODULE, instanceC}, 'InGameMenuBehavior':new()),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'BaseMenuBehavior':init(This),
    init_fields(This).


getInstance() ->
        get({'InGameMenuBehavior', instanceC}).

% throws Exception
onDisplayChangeEvent(This, AllBinaryGameCanvas, DisplayChangeEvent) ->
        (get({AllBinaryGameCanvas, '$class'})):updateMenuFromEvent(AllBinaryGameCanvas, DisplayChangeEvent).

initSpecialPaint(This, AllBinaryGameCanvas) ->
        (get({AllBinaryGameCanvas, '$class'})):setNonBotPaintableP(AllBinaryGameCanvas, 'GameCanvasNonBotPaintable':new(AllBinaryGameCanvas)).

% throws Exception
initMenu(This, AllBinaryGameCanvas) ->
        (get({AllBinaryGameCanvas, '$class'})):initMenu2(AllBinaryGameCanvas).

% throws Exception
updateMenu(This, AllBinaryGameCanvas) ->
        (get({AllBinaryGameCanvas, '$class'})):initMenu2(AllBinaryGameCanvas).

% throws Exception
popupMenu(This, AllBinaryGameCanvas) ->
        (get({AllBinaryGameCanvas, '$class'})):popupMenu2(AllBinaryGameCanvas).

closeMenu(This, AllBinaryGameCanvas) ->
        (get({AllBinaryGameCanvas, '$class'})):closeMenu2(AllBinaryGameCanvas).

