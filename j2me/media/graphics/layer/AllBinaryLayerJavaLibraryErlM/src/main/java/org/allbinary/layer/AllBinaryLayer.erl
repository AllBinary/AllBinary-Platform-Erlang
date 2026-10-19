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
% package org.allbinary.layer
% import javax.microedition.lcdui.Graphics
% import org.allbinary.game.identification.BasicGroupFactory
% import org.allbinary.game.identification.Group
% import org.allbinary.graphics.GPoint
% import org.allbinary.graphics.Rectangle
% import org.allbinary.graphics.RectangleFactory
% import org.allbinary.graphics.opengles.OpenGLFeatureUtil
% import org.allbinary.TsUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.math.PositionStrings
% import org.allbinary.string.CommonLabels
% import org.allbinary.string.CommonSeps
% import org.allbinary.view.ViewPositionBase
% import org.allbinary.view.event.ViewPositionEvent

-module('AllBinaryLayer').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements LayerInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('Layer', Function, Arguments).

static_init() ->
    put({?MODULE, 'NULL_ALLBINARY_LAYER'}, 'AllBinaryLayer':new(get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({'RectangleFactory', 'SINGLETON'}), get({'ViewPositionBase', 'NULL_VIEW_POSITION'}))),
    put({?MODULE, 'TYPE'}, "Type: "),
    ok.

init_fields(This) ->
    put({This, viewPositionEvent}, 'ViewPositionEvent':new(This)),
    put({This, halfWidth}, 0),
    put({This, halfHeight}, 0),
    put({This, name}, undefined),
    put({This, viewPosition}, get({'ViewPositionBase', 'NULL_VIEW_POSITION'})),
    ok.


new(Name, Rectangle, ViewPosition) when (is_list(Name) orelse Name =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Name, Rectangle, ViewPosition),
    This.

init(This, Name, Rectangle, ViewPosition) when (is_list(Name) orelse Name =:= undefined) ->
        'Layer':init(This, (get({Rectangle, '$class'})):getWidth(Rectangle), (get({Rectangle, '$class'})):getHeight(Rectangle)),
        init_fields(This),
        put({local, localName}, undefined),
        case (Name =:= undefined) of
            true ->
            put({local, localName}, atom_to_list(get({This, '$class'})));
            false ->
            put({local, localName}, (fun(Target_N66414) -> (get({Target_N66414, '$class'})):toString(Target_N66414) end)((fun(Target_N66421) -> (get({Target_N66421, '$class'})):append(Target_N66421, integer_to_list((fun(Target_N66513) -> (get({Target_N66513, '$class'})):hashCode(Target_N66513, This) end)('TsUtil':getInstance()), 16)) end)((fun(Target_N66428) -> (get({Target_N66428, '$class'})):append(Target_N66428, get({'CommonSeps':getInstance(), 'COLON'})) end)((fun(Target_N66435) -> (get({Target_N66435, '$class'})):append(Target_N66435, Name) end)('StringMaker':new())))))
        end,
        put({This, name}, get({local, localName})),
        Point = (get({Rectangle, '$class'})):getPoint(Rectangle),
        (get({This, '$class'})):setPosition(This, (get({Point, '$class'})):getX(Point), (get({Point, '$class'})):getY(Point), (get({Point, '$class'})):getZ(Point)),
        (get({This, '$class'})):setHalfWidth(This, (((get({This, '$class'})):getWidth(This) bsr 1))),
        (get({This, '$class'})):setHalfHeight(This, (((get({This, '$class'})):getHeight(This) bsr 1))),
        put({This, viewPosition}, ViewPosition),
        (get({get({This, viewPosition}), '$class'})):setAllbinaryLayer(get({This, viewPosition}), This).

% throws Exception
onChangeEvent(This, LayerManagerEvent) ->
        ok.

paintThreed(This, Graphics) ->
        ok.

getX2(This) ->
        ((get({This, '$class'})):getXP(This) + (get({This, '$class'})):getWidth(This)).

getY2(This) ->
        ((get({This, '$class'})):getYP(This) + (get({This, '$class'})):getHeight(This)).

getZ2(This) ->
        trunc((((get({This, '$class'})):getZP(This) + (get({This, '$class'})):getDepth(This)))).

getName(This) ->
        get({This, name}).

setHalfWidth(This, HalfWidth) when is_integer(HalfWidth) ->
        put({This, halfWidth}, HalfWidth).

getHalfWidth(This) ->
        get({This, halfWidth}).

setHalfHeight(This, HalfHeight) when is_integer(HalfHeight) ->
        put({This, halfHeight}, HalfHeight).

getHalfHeight(This) ->
        get({This, halfHeight}).

getHalfDepth(This) ->
        (trunc((get({This, '$class'})):getDepth(This)) div 2).

getViewPosition(This) ->
        get({This, viewPosition}).

setViewPosition(This, ViewPosition) ->
        put({This, viewPosition}, ViewPosition).

getGroupInterface(This) ->
        get({'BasicGroupFactory':getInstance(), 'NONE_ARRAY'}).

implmentsTickableInterface(This) ->
        false.

implmentsGameInputInterface(This) ->
        false.

implmentsArtificialIntelligenceCompositeInterface(This) ->
        false.

implmentsCollidableInterface(This) ->
        false.

implementsThreedInterface(This) ->
        (fun(Target_N68064) -> (get({Target_N68064, '$class'})):isAnyThreed(Target_N68064) end)('OpenGLFeatureUtil':getInstance()).

getType(This) ->
        (-1).

getMultiPlayerType(This) ->
        (-1).

toStringAppend(This, StringBuffer) ->
        CommonSeps = 'CommonSeps':getInstance(),
        PositionStrings = 'PositionStrings':getInstance(),
        CommonLabels = 'CommonLabels':getInstance(),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getName(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'COLON'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'AllBinaryLayer', 'TYPE'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, (get({This, '$class'})):getType(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'SPACE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({PositionStrings, 'X_LABEL'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc((get({This, '$class'})):getXP(This))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'SPACE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({PositionStrings, 'Y_LABEL'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc((get({This, '$class'})):getYP(This))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'SPACE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({PositionStrings, 'Z_LABEL'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc((get({This, '$class'})):getZP(This))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'SPACE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonLabels, 'WIDTH_LABEL'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc((get({This, '$class'})):getWidth(This))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'SPACE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonLabels, 'HEIGHT_LABEL'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc((get({This, '$class'})):getHeight(This))).

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({This, '$class'})):toStringAppend(This, StringBuffer),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

