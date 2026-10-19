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
% import javax.microedition.lcdui.Font
% import javax.microedition.lcdui.Graphics
% import org.allbinary.game.configuration.feature.Features
% import org.allbinary.graphics.PointFactory
% import org.allbinary.graphics.Rectangle
% import org.allbinary.graphics.RectangleFactory
% import org.allbinary.graphics.displayable.DisplayInfoSingleton
% import org.allbinary.graphics.font.MyFontProcessor
% import org.allbinary.graphics.opengles.OpenGLFeatureFactory
% import org.allbinary.graphics.threed.SWTJOGLProcessor
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings

-module('MyFormUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'MyFormUtil':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, popupMenuRectangle}, get({'RectangleFactory', 'SINGLETON'})),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'MyFormUtil', instance}).

updateMeasurement(This, Graphics) ->
        Font = (get({Graphics, '$class'})):getFont(Graphics),
        DisplayInfo = 'DisplayInfoSingleton':getInstance(),
        Features = 'Features':getInstance(),
        IsOpenGL = (get({Features, '$class'})):isDefault(Features, get({'OpenGLFeatureFactory':getInstance(), 'OPENGL'})),
        TOTAL_CHAR_WIDTH = case ((fun(Target_N66438) -> (get({Target_N66438, '$class'})):isJOGL(Target_N66438) end)('SWTJOGLProcessor':getInstance()) andalso IsOpenGL) of true -> 2; false -> 3 end,
        Width = 'MyFontProcessor':defaultStringWidth(Font, TOTAL_CHAR_WIDTH),
        PointFactory = 'PointFactory':getInstance(),
        case ((get({DisplayInfo, '$class'})):getLastHeight(DisplayInfo) < 320) of
            true ->
            put({This, popupMenuRectangle}, 'Rectangle':new((get({PointFactory, '$class'})):createXY(PointFactory, 0, 25), Width, ((((get({Font, '$class'})):getHeight(Font) * 4)) + 2)));
            false ->
            put({This, popupMenuRectangle}, 'Rectangle':new((get({PointFactory, '$class'})):createXY(PointFactory, 0, ((get({DisplayInfo, '$class'})):getLastHalfHeight(DisplayInfo) - 70)), Width, (((get({Font, '$class'})):getHeight(Font) * 5))))
        end.

getPopupMenuRectangle(This) ->
        get({This, popupMenuRectangle}).

