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
% package org.allbinary.graphics.form.item
% import javax.microedition.lcdui.Command
% import javax.microedition.lcdui.ImageItem
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.displayable.DisplayInfoSingleton
% import org.allbinary.graphics.form.ScreenInfo
% import org.allbinary.logic.VectorUtil
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.util.visitor.Visitor
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('CommandTextItemArrayFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, list}, 'BasicArrayListD':new()),
    put({This, visitorInterface}, undefined),
    ok.


new(VisitorInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, VisitorInterface),
    This.

'$init'(This, VisitorInterface) ->
    init_fields(This),
        put({This, visitorInterface}, VisitorInterface).

getInstance(This, Vector, BackgroundBasicColor, ForegroundBasicColor) ->
        VectorUtil = 'VectorUtil':getInstance(),
        Size = (get({VectorUtil, '$class'})):getSize(VectorUtil, Vector),
        (get({get({This, list}), '$class'})):clear(get({This, list})),
        put({local, textItem}, undefined),
        put({local, priorityLimit}, 7),
        DisplayInfo = 'DisplayInfoSingleton':getInstance(),
        IsLargeEnoughDisplayForBigMenu = ((((get({DisplayInfo, '$class'})):isPortrait(DisplayInfo) andalso ((get({DisplayInfo, '$class'})):getLastHeight(DisplayInfo) >= get({'ScreenInfo':getInstance(), 'MEDIUM_WIDTH'})))) orelse (((not (get({DisplayInfo, '$class'})):isPortrait(DisplayInfo)) andalso ((get({DisplayInfo, '$class'})):getLastWidth(DisplayInfo) >= get({'ScreenInfo':getInstance(), 'MEDIUM_WIDTH'}))))),
        case ((not IsLargeEnoughDisplayForBigMenu) andalso (Size > 3)) of
            true ->
            put({local, priorityLimit}, 3);
            false -> ok
        end,
        put({local, command}, undefined),
        lists:foreach(fun(Index) ->
            put({local, command}, (get({VectorUtil, '$class'})):elementAt(VectorUtil, Vector, Index)),
            case ((get({get({local, command}), '$class'})):getPriority(get({local, command})) < get({local, priorityLimit})) of
                true ->
                ABoolean = (get({get({This, visitorInterface}), '$class'})):visit(get({This, visitorInterface}), get({local, command})),
                case (get({ABoolean, '$class'})):booleanValue(ABoolean) of
                    true ->
                    put({local, textItem}, 'CommandTextItem':new(get({local, command}), get({'ImageItem', 'LAYOUT_DEFAULT'}), get({'StringUtil':getInstance(), 'EMPTY_STRING'}), BackgroundBasicColor, ForegroundBasicColor)),
                    (get({get({This, list}), '$class'})):add(get({This, list}), get({local, textItem}));
                    false -> ok
                end;
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        TextItemArray = array:new((get({get({This, list}), '$class'})):size(get({This, list})), {default, undefined}),
        Size2 = array:size(TextItemArray),
        lists:foreach(fun(Index) ->
            array:set(Index, array:get(Index, get({get({This, list}), objectArray})), TextItemArray)
        end, lists:seq(0, Size2 - 1)),
        TextItemArray.

