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
% package org.allbinary.game.health
% import javax.microedition.khronos.opengles.GL10
% import javax.microedition.lcdui.Graphics
% import min3d.core.ColorBufferList
% import min3d.core.Number3dBufferList
% import min3d.objectPrimitives.Rectangle
% import min3d.vos.Number3d
% import org.allbinary.device.OpenGLESGraphics
% import org.allbinary.graphics.threed.min3d.renderer.Object3dProcessor
% import org.allbinary.graphics.threed.min3d.renderer.Object3dProcessorUtil
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.view.ViewPositionBase

-module('HealthBarThreedAnimation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('HealthBarAnimation', Function, Arguments).

init_fields(This) ->
    put({This, rectangle}, undefined),
    put({This, basicColorFactory}, 'BasicColorFactory':getInstance()),
    put({This, object3dProcessor}, (fun(Target_N67382) -> (get({Target_N67382, '$class'})):getInstanceObject3dProcessor(Target_N67382) end)('Object3dProcessorUtil':getInstance())),
    ok.


new(LayerInterface, Location) when is_integer(Location) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, LayerInterface, Location),
    This.

'$init'(This, LayerInterface, Location) when is_integer(Location) ->
        'HealthBarAnimation':'$init'(This, LayerInterface, Location),
        init_fields(This),
        put({This, basicColor}, get({get({This, basicColorFactory}), 'GREEN'})),
        put({This, colorP}, (get({get({This, basicColor}), '$class'})):intValue(get({This, basicColor}))),
        put({This, rectangle}, 'Rectangle':new(0, 0, 1, 1, get({This, basicColor}))),
        (get({get({This, rectangle}), '$class'})):setDoubleSidedEnabled(get({This, rectangle}), true),
        (get({get({This, rectangle}), '$class'})):setNormalsEnabled(get({This, rectangle}), false),
        (get({get({This, rectangle}), '$class'})):setTexturesEnabled(get({This, rectangle}), false).

updateColor(This) ->
        ColorBufferList = (fun(Target_N66337) -> (get({Target_N66337, '$class'})):getColor4BufferList(Target_N66337) end)((get({get({This, rectangle}), '$class'})):getVertices(get({This, rectangle}))),
        Size = (get({ColorBufferList, '$class'})):size(ColorBufferList),
        put({local, index}, Size),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            (get({ColorBufferList, '$class'})):set(ColorBufferList, get({local, index}), get({This, basicColor})),
            Loop();
        false -> ok end end)().

updateSize(This) ->
        Number3dBufferList = (fun(Target_N66567) -> (get({Target_N66567, '$class'})):getPointsOnFacesNumber3dBufferList(Target_N66567) end)((get({get({This, rectangle}), '$class'})):getVertices(get({This, rectangle}))),
        Width = get({This, x2}),
        Height = (get({This, thickness}) * 2),
        SegsH = 1,
        SegsW = 1,
        put({local, row}, 0),
        put({local, col}, 0),
        W = float((Width div SegsW)),
        H = float((Height div SegsH)),
        Width5 = (float(Width) / 2.0),
        Height5 = (float(Height) / 2.0),
        put({local, index}, 0),
        lists:foreach(fun(Row) ->
            lists:foreach(fun(Col) ->
                (get({Number3dBufferList, '$class'})):set(Number3dBufferList, allbinary_java:first(get({local, index}), put({local, index}, get({local, index}) + 1)), ((float(get({local, col})) * W) - Width5), ((float(get({local, row})) * H) - Height5), 0.0)
            end, lists:seq(0, SegsW))
        end, lists:seq(0, SegsH)).

onHealthChange(This, NewX2) when is_integer(NewX2) ->
        'HealthBarAnimation':onHealthChange(This, NewX2),
        (get({This, '$class'})):updateColor(This),
        (get({This, '$class'})):updateSize(This).

paintThreedXYZ(This, Graphics, X, Y, Z) when is_integer(X), is_integer(Y), is_integer(Z) ->
        OpenGLESGraphics = Graphics,
        Gl = (get({OpenGLESGraphics, '$class'})):getGl10(OpenGLESGraphics),
        ViewPosition = (get({get({This, allbinaryLayer}), '$class'})):getViewPosition(get({This, allbinaryLayer})),
        PositionNumber3d = (get({get({This, rectangle}), '$class'})):getPosition(get({This, rectangle})),
        put({PositionNumber3d, x}, (-(float((get({ViewPosition, '$class'})):getX(ViewPosition))))),
        put({PositionNumber3d, z}, (-(float((get({ViewPosition, '$class'})):getY(ViewPosition))))),
        put({PositionNumber3d, y}, ((get({ViewPosition, '$class'})):getZ(ViewPosition) + (get({get({This, allbinaryLayer}), '$class'})):getHeight(get({This, allbinaryLayer})))),
        (get({get({This, object3dProcessor}), '$class'})):drawObject(get({This, object3dProcessor}), Gl, get({This, rectangle})).

