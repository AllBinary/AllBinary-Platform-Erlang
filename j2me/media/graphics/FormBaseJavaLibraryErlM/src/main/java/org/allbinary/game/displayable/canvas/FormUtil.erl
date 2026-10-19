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
% package org.allbinary.game.displayable.canvas
% import org.allbinary.graphics.PointFactory
% import org.allbinary.graphics.Rectangle
% import org.allbinary.graphics.displayable.DisplayInfoSingleton
% import org.allbinary.logic.communication.log.LogUtil

-module('FormUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'FormUtil':new()),
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
        get({'FormUtil', instance}).

createFormRectangle(This) ->
        DisplayInfo = 'DisplayInfoSingleton':getInstance(),
        PointFactory = 'PointFactory':getInstance(),
        Rectangle = 'Rectangle':new((get({PointFactory, '$class'})):createXY(PointFactory, 30, 10), ((get({DisplayInfo, '$class'})):getLastWidth(DisplayInfo) - 30), ((get({DisplayInfo, '$class'})):getLastHeight(DisplayInfo) - 35)),
        Rectangle.

