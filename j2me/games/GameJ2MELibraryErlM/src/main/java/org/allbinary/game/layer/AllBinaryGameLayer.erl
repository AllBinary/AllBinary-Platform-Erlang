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
% package org.allbinary.game.layer
% import javax.microedition.khronos.opengles.GL
% import javax.microedition.lcdui.Graphics
% import org.allbinary.graphics.Rectangle
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.graphics.color.BasicColorSetUtil
% import org.allbinary.graphics.paint.NullPaintable
% import org.allbinary.graphics.paint.Paintable
% import org.allbinary.image.opengles.OpenGLSurfaceChangedInterface
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.layer.AllBinaryLayerManager
% import org.allbinary.logic.communication.log.ForcedLogUtil
% import org.allbinary.logic.util.event.AllBinaryEventObject
% import org.allbinary.logic.util.event.EventStrings
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.view.ViewPositionBase
% import org.allbinary.view.event.ViewPositionEvent
% import org.allbinary.view.event.ViewPositionEventListenerInterface

-module('AllBinaryGameLayer').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ViewPositionEventListenerInterface
% implements OpenGLSurfaceChangedInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('AllBinaryLayer', Function, Arguments).

init_fields(This) ->
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, basicSetColorUtil}, 'BasicColorSetUtil':getInstance()),
    put({This, 'RED'}, get({'BasicColorFactory':getInstance(), 'RED'})),
    put({This, paintable}, case get({'SWTUtil', isSWT}) of true -> 'Paintable':new() % Java anonymous class body: implement it as a module
%         put({This, basicSetColorUtil}, 'BasicColorSetUtil':getInstance())
%         put({This, 'BLACK'}, get({'BasicColorFactory':getInstance(), 'BLACK'}))
%         ok % paint
; false -> 'NullPaintable':getInstance() end),
    put({This, gameKeyEventList}, 'BasicArrayListD':new()),
    ok.


new(Name, LayerInfo, ViewPosition) when (is_list(Name) orelse Name =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Name, LayerInfo, ViewPosition),
    This.

'$init'(This, Name, LayerInfo, ViewPosition) when (is_list(Name) orelse Name =:= undefined) ->
        'AllBinaryLayer':'$init'(This, Name, LayerInfo, ViewPosition),
        init_fields(This).

% throws Exception
set(This, Gl) ->
        erlang:error({'Exception', get({get({This, commonStrings}), 'NOT_IMPLEMENTED'})}).

move(This) ->
        ok.

getGameKeyEventList(This) ->
        get({This, gameKeyEventList}).

% throws Exception
processInput(This, AllBinaryLayerManager) ->
        erlang:error({'Exception', get({get({This, commonStrings}), 'NOT_IMPLEMENTED'})}).

% throws Exception
processTick(This, AllBinaryLayerManager) ->
        erlang:error({'Exception', get({get({This, commonStrings}), 'NOT_IMPLEMENTED'})}).

onEvent(This, EventObject) ->
        'ForcedLogUtil':log(get({'EventStrings':getInstance(), 'PERFORMANCE_MESSAGE'}), This).

% throws Exception
onViewPositionChangeEvent(This) ->
        (get({This, '$class'})):onChangeEvent(This, get({This, viewPositionEvent})).

% throws Exception
onChangeEvent(This, LayerManagerEvent) ->
        case 'GameLayerUtil':isOnScreen(This) of
            true ->
            (get({This, '$class'})):setVisible(This, true);
            false ->
            (get({This, '$class'})):setVisible(This, false)
        end.

paintFirst(This, Graphics) ->
        (get({get({This, paintable}), '$class'})):paint(get({This, paintable}), Graphics).

paintDebug(This, Graphics) ->
        ViewPosition = (get({This, '$class'})):getViewPosition(This),
        ViewX = (get({ViewPosition, '$class'})):getX(ViewPosition),
        ViewY = (get({ViewPosition, '$class'})):getY(ViewPosition),
        (get({get({This, basicSetColorUtil}), '$class'})):setBasicColorP(get({This, basicSetColorUtil}), Graphics, get({This, 'RED'})),
        (get({Graphics, '$class'})):drawRect(Graphics, ViewX, ViewY, (get({This, '$class'})):getWidth(This), (get({This, '$class'})):getHeight(This)).

setWidth(This, Width) when is_integer(Width) ->
        'AllBinaryLayer':setLayerWidth(This, Width),
        (get({This, '$class'})):setHalfWidth(This, (Width bsr 1)).

setHeight(This, Height) when is_integer(Height) ->
        'AllBinaryLayer':setLayerHeight(This, Height),
        (get({This, '$class'})):setHalfHeight(This, (Height bsr 1)).

