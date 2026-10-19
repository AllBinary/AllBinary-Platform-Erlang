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
% package org.allbinary.graphics.j2me.workarea.tools
% import java.awt
% import javax.swing.tree.MutableTreeNode
% import org.allbinary.graphics.GPoint
% import org.allbinary.graphics.j2me.workarea.canvas.CanvasDom
% import org.allbinary.graphics.j2me.workarea.canvas.IntegerDimension
% import org.w3c.dom.Node

-module('GraphicItemInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface


getName(This) ->
    erlang:error({abstract_method, getName}).

setColor(This, Color) ->
    erlang:error({abstract_method, setColor}).

getTreeNode(This) ->
    erlang:error({abstract_method, getTreeNode}).

getPointsInterface(This) ->
    erlang:error({abstract_method, getPointsInterface}).

setPointsInterface(This, Points) ->
    erlang:error({abstract_method, setPointsInterface}).

isValid(This) ->
    erlang:error({abstract_method, isValid}).

isActive(This) ->
    erlang:error({abstract_method, isActive}).

deactivate(This) ->
    erlang:error({abstract_method, deactivate}).

activate(This) ->
    erlang:error({abstract_method, activate}).

setFulcrumPoint(This, Point) ->
    erlang:error({abstract_method, setFulcrumPoint}).

% throws Exception
translate(This, X, Y) when is_integer(X), is_integer(Y) ->
    erlang:error({abstract_method, translate}).

setRotate(This, Theta) when is_number(Theta) ->
    erlang:error({abstract_method, setRotate}).

addRotate(This, Theta) when is_number(Theta) ->
    erlang:error({abstract_method, addRotate}).

setAngle(This, Angle) when is_number(Angle) ->
    erlang:error({abstract_method, setAngle}).

addAngle(This, Angle) when is_number(Angle) ->
    erlang:error({abstract_method, addAngle}).

getAngle(This) ->
    erlang:error({abstract_method, getAngle}).

paint(This, G, CanvasAngle, Dimension, X, Y) when is_integer(X), is_integer(Y) ->
    erlang:error({abstract_method, paint}).

% throws Exception
toDom(This, CanvasDom) ->
    erlang:error({abstract_method, toDom}).

removePoint(This) ->
    erlang:error({abstract_method, removePoint}).

addPoint(This, Point) ->
    erlang:error({abstract_method, addPoint}).

mouseClicked(This, MouseEvent, XPixelsPerCell, YPixelsPerCell) when is_integer(XPixelsPerCell), is_integer(YPixelsPerCell) ->
    erlang:error({abstract_method, mouseClicked}).

mouseEntered(This, MouseEvent) ->
    erlang:error({abstract_method, mouseEntered}).

mouseExited(This, MouseEvent) ->
    erlang:error({abstract_method, mouseExited}).

mousePressed(This, MouseEvent, XPixelsPerCell, YPixelsPerCell) when is_integer(XPixelsPerCell), is_integer(YPixelsPerCell) ->
    erlang:error({abstract_method, mousePressed}).

mouseReleased(This, MouseEvent, XPixelsPerCell, YPixelsPerCell) when is_integer(XPixelsPerCell), is_integer(YPixelsPerCell) ->
    erlang:error({abstract_method, mouseReleased}).

mouseDragged(This, MouseEvent, XPixelsPerCell, YPixelsPerCell) when is_integer(XPixelsPerCell), is_integer(YPixelsPerCell) ->
    erlang:error({abstract_method, mouseDragged}).

mouseMoved(This, MouseEvent, XPixelsPerCell, YPixelsPerCell) when is_integer(XPixelsPerCell), is_integer(YPixelsPerCell) ->
    erlang:error({abstract_method, mouseMoved}).

keyPressed(This, KeyEvent) ->
    erlang:error({abstract_method, keyPressed}).

keyReleased(This, KeyEvent) ->
    erlang:error({abstract_method, keyReleased}).

keyTyped(This, KeyEvent) ->
    erlang:error({abstract_method, keyTyped}).

% throws Exception
duplicate(This) ->
    erlang:error({abstract_method, duplicate}).

