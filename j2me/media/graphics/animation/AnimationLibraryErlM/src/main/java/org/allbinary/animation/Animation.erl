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
% package org.allbinary.animation
% import javax.microedition.khronos.opengles.GL
% import javax.microedition.lcdui.Graphics
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.graphics.color.BasicColorSetUtil
% import org.allbinary.image.opengles.OpenGLSurfaceChangedInterface

-module('Animation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements AnimationInterface
% implements OpenGLSurfaceChangedInterface

init_fields(This) ->
    put({This, basicSetColorUtil}, 'BasicColorSetUtil':getInstance()),
    put({This, basicColor}, get({'BasicColorFactory':getInstance(), 'WHITE'})),
    put({This, colorP}, 0),
    put({This, changeBasicColorP}, get({'BasicColorFactory':getInstance(), 'NULL_COLOR'})),
    put({This, changeColorP}, 0),
    put({This, alphaP}, 0),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

setAlpha(This, Alpha) when is_integer(Alpha) ->
        put({This, alphaP}, Alpha).

% throws Exception
nextFrame(This) ->
        ok.

paintXY(This, Graphics, X, Y) when is_integer(X), is_integer(Y) ->
        (get({get({This, basicSetColorUtil}), '$class'})):setBasicColorP3(get({This, basicSetColorUtil}), Graphics, (get({This, '$class'})):getBasicColorP(This), (get({This, '$class'})):getColor(This)).

paintThreedXYZ(This, Graphics, X, Y, Z) when is_integer(X), is_integer(Y), is_integer(Z) ->
        ok.

isThreed(This) ->
        false.

getBasicColorP(This) ->
        get({This, basicColor}).

setBasicColorP(This, BasicColor) ->
        put({This, basicColor}, BasicColor),
        put({This, colorP}, (get({get({This, basicColor}), '$class'})):intValue(get({This, basicColor}))).

setBackgroundBasicColorP(This, BasicColor) ->
        ok.

getChangeBasicColor(This) ->
        get({This, changeBasicColorP}).

changeBasicColor(This, BasicColor) ->
        put({This, changeBasicColorP}, BasicColor),
        put({This, changeColorP}, (get({get({This, changeBasicColorP}), '$class'})):intValue(get({This, changeBasicColorP}))).

getChangeColor(This) ->
        get({This, changeColorP}).

getColor(This) ->
        get({This, colorP}).

setScale(This, ScaleX, ScaleY) when is_number(ScaleX), is_number(ScaleY) ->
        ok.

setMaxScale(This, MaxScaleX, MaxScaleY) when is_number(MaxScaleX), is_number(MaxScaleY) ->
        ok.

% throws Exception
set(This, Gl) ->
        ok.

setDx(This, Dx) when is_integer(Dx) ->
        ok.

getDx(This) ->
        0.

setDy(This, Dy) when is_integer(Dy) ->
        ok.

getDy(This) ->
        0.

