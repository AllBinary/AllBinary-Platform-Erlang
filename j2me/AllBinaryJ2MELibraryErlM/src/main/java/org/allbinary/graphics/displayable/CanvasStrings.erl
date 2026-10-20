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
% package org.allbinary.graphics.displayable
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListUtil

-module('CanvasStrings').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'CanvasStrings':new()),
    ok.

init_fields(This) ->
    put({This, 'CONSTRUCTOR'}, "MyCanvas::MyCanvas"),
    put({This, 'PAUSE'}, "MyCanvas::pause"),
    put({This, 'UN_PAUSE'}, "MyCanvas::unPause"),
    put({This, 'SET_FULL_SCREEN_MODE'}, "setFullScreenMode"),
    put({This, 'SIZE_CHANGED'}, "sizeChanged"),
    put({This, 'SCALED_IMAGES'}, "scaledImages"),
    put({This, 'PAINT'}, "paint"),
    put({This, 'ON_DISPLAY_CHANGE_EVENT'}, "onDisplayChangeEvent"),
    put({This, 'UPDATE_MEASUREMENT'}, "updateMeasurement"),
    put({This, 'FD_WIDTH'}, " font/display width: "),
    put({This, 'FD_HEIGHT'}, " font/display height: "),
    put({This, 'EMPTY_CHILD_NAME_LIST'}, (fun(Target_N66182) -> (get({Target_N66182, '$class'})):getImmutableInstance(Target_N66182) end)('BasicArrayListUtil':getInstance())),
    put({This, 'ABOUT'}, "About"),
    put({This, 'OPTIONS'}, "Options"),
    put({This, 'FONT_ATLAS'}, "/font.png"),
    put({This, 'OBJ_MODEL'}, "_obj"),
    put({This, 'MD2_MODEL'}, "_md2"),
    put({This, '_PNG'}, ".png"),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'CanvasStrings', instance}).

