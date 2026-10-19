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
% package org.allbinary.graphics.form
% import javax.microedition.lcdui.Command
% import javax.microedition.lcdui.Graphics
% import org.allbinary.J2MEUtil
% import org.allbinary.animation.Animation
% import org.allbinary.animation.NullAnimationFactory
% import org.allbinary.animation.vector.RectangleAdjustedAnimation
% import org.allbinary.animation.vector.RectangleFilledAdjustedAnimation
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.graphics.font.UpdateMyFontInterface
% import org.allbinary.graphics.form.item.CommandTextItem
% import org.allbinary.graphics.form.item.ABCustomItem

-module('CommandCurrentSelectionForm').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements UpdateMyFontInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('ScrollCurrentSelectionForm', Function, Arguments).

init_fields(This) ->
    put({This, selectedAnimationArray}, array:new(16, {default, undefined})),
    put({This, unSelectedAnimationArray}, array:new(16, {default, undefined})),
    ok.


new(Title, Items, Border, MoveForSmallScreen, BackgroundBasicColor, ForegroundBasicColor) when (is_list(Title) orelse Title =:= undefined), (is_tuple(Items) orelse Items =:= undefined), is_integer(Border), is_boolean(MoveForSmallScreen) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Title, Items, Border, MoveForSmallScreen, BackgroundBasicColor, ForegroundBasicColor),
    This.

init(This, Title, Items, Border, MoveForSmallScreen, BackgroundBasicColor, ForegroundBasicColor) when (is_list(Title) orelse Title =:= undefined), (is_tuple(Items) orelse Items =:= undefined), is_integer(Border), is_boolean(MoveForSmallScreen) ->
        'ScrollCurrentSelectionForm':init(This, Title, Items, 'ItemPaintableFactory':getInstance(), Border, (-3), MoveForSmallScreen, BackgroundBasicColor, ForegroundBasicColor),
        init_fields(This),
        (get({This, '$class'})):initAnimations(This),
        (get({This, '$class'})):addAll(This, Items).

updateMeasurement(This, Graphics) ->
        (get({This, '$class'})):updateAll(This, Graphics, (get({This, '$class'})):getAllitems(This)),
        'ScrollCurrentSelectionForm':updateMeasurement(This, Graphics).

initAnimations(This) ->
        NullAnimation = (fun(Target_N66520) -> (get({Target_N66520, '$class'})):getInstance(Target_N66520, 0) end)('NullAnimationFactory':getFactoryInstance()),
        put({local, index}, array:size(get({This, selectedAnimationArray}))),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            put({This, selectedAnimationArray}, array:set(get({local, index}), NullAnimation, get({This, selectedAnimationArray}))),
            Loop();
        false -> ok end end)(),
        put({local, index}, array:size(get({This, unSelectedAnimationArray}))),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            put({This, unSelectedAnimationArray}, array:set(get({local, index}), NullAnimation, get({This, unSelectedAnimationArray}))),
            Loop();
        false -> ok end end)().

addAll(This, Items) when (is_tuple(Items) orelse Items =:= undefined) ->
        put({local, index}, array:size(Items)),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            (get({This, '$class'})):addAt(This, get({local, index}), array:get(get({local, index}), Items)),
            Loop();
        false -> ok end end)().

addAt(This, Index, Item) when is_integer(Index) ->
        BasicColorFactory = 'BasicColorFactory':getInstance(),
        ButtonColor = get({BasicColorFactory, 'TRANSPARENT_GREY'}),
        SelectedButtonColor = get({BasicColorFactory, 'TRANSPARENT_RED'}),
        Width = (get({Item, '$class'})):getMinimumWidth(Item),
        Height = (get({Item, '$class'})):getMinimumHeight(Item),
        put({local, adjustedBorder}, 3),
        Offset = (-((get({This, halfBorder}) + get({local, adjustedBorder})))),
        RectWidth = ((Width + get({This, border})) - get({local, adjustedBorder})),
        RectHeight = ((Height + get({This, border})) - get({local, adjustedBorder})),
        case ('J2MEUtil':isJ2ME() orelse 'J2MEUtil':isHTML()) of
            true ->
            put({This, selectedAnimationArray}, array:set(Index, 'RectangleAdjustedAnimation':new(RectWidth, RectHeight, Offset, Offset, SelectedButtonColor), get({This, selectedAnimationArray})));
            false ->
            put({This, selectedAnimationArray}, array:set(Index, 'RectangleFilledAdjustedAnimation':new(RectWidth, RectHeight, Offset, Offset, SelectedButtonColor), get({This, selectedAnimationArray})))
        end,
        put({local, adjustedBorder}, 4),
        case ('J2MEUtil':isJ2ME() orelse 'J2MEUtil':isHTML()) of
            true ->
            put({This, unSelectedAnimationArray}, array:set(Index, 'RectangleAdjustedAnimation':new(RectWidth, RectHeight, Offset, Offset, ButtonColor), get({This, unSelectedAnimationArray})));
            false ->
            put({This, unSelectedAnimationArray}, array:set(Index, 'RectangleFilledAdjustedAnimation':new(RectWidth, RectHeight, Offset, Offset, ButtonColor), get({This, unSelectedAnimationArray})))
        end.

updateAll(This, Graphics, Items) when (is_tuple(Items) orelse Items =:= undefined) ->
        put({local, index}, array:size(Items)),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            (fun(Target_N68016) -> (get({Target_N68016, '$class'})):preMeasurement(Target_N68016, Graphics) end)(array:get(get({local, index}), Items)),
            (get({This, '$class'})):updateAt(This, get({local, index}), array:get(get({local, index}), Items)),
            Loop();
        false -> ok end end)().

updateAt(This, Index, Item) when is_integer(Index) ->
        BasicColorFactory = 'BasicColorFactory':getInstance(),
        ButtonColor = get({BasicColorFactory, 'TRANSPARENT_GREY'}),
        SelectedButtonColor = get({BasicColorFactory, 'TRANSPARENT_RED'}),
        Width = (get({Item, '$class'})):getMinimumWidth(Item),
        Height = (get({Item, '$class'})):getMinimumHeight(Item),
        put({local, adjustedBorder}, 3),
        Offset = (-((get({This, halfBorder}) + get({local, adjustedBorder})))),
        RectWidth = ((Width + get({This, border})) - get({local, adjustedBorder})),
        RectHeight = ((Height + get({This, border})) - get({local, adjustedBorder})),
        case ('J2MEUtil':isJ2ME() orelse 'J2MEUtil':isHTML()) of
            true ->
            put({local, rectangleAdjustedAnimation}, array:get(Index, get({This, selectedAnimationArray}))),
            (get({get({local, rectangleAdjustedAnimation}), '$class'})):setWidth(get({local, rectangleAdjustedAnimation}), RectWidth),
            (get({get({local, rectangleAdjustedAnimation}), '$class'})):setHeight(get({local, rectangleAdjustedAnimation}), RectHeight),
            (get({get({local, rectangleAdjustedAnimation}), '$class'})):setOffsetX(get({local, rectangleAdjustedAnimation}), Offset),
            (get({get({local, rectangleAdjustedAnimation}), '$class'})):setOffsetY(get({local, rectangleAdjustedAnimation}), Offset),
            (get({get({local, rectangleAdjustedAnimation}), '$class'})):setBasicColorP(get({local, rectangleAdjustedAnimation}), SelectedButtonColor);
            false ->
            put({local, rectangleAdjustedAnimation}, array:get(Index, get({This, selectedAnimationArray}))),
            (get({get({local, rectangleAdjustedAnimation}), '$class'})):setWidth(get({local, rectangleAdjustedAnimation}), RectWidth),
            (get({get({local, rectangleAdjustedAnimation}), '$class'})):setHeight(get({local, rectangleAdjustedAnimation}), RectHeight),
            (get({get({local, rectangleAdjustedAnimation}), '$class'})):setOffsetX(get({local, rectangleAdjustedAnimation}), Offset),
            (get({get({local, rectangleAdjustedAnimation}), '$class'})):setOffsetY(get({local, rectangleAdjustedAnimation}), Offset),
            (get({get({local, rectangleAdjustedAnimation}), '$class'})):setBasicColorP(get({local, rectangleAdjustedAnimation}), SelectedButtonColor)
        end,
        put({local, adjustedBorder}, 4),
        case ('J2MEUtil':isJ2ME() orelse 'J2MEUtil':isHTML()) of
            true ->
            put({local, rectangleAdjustedAnimation}, array:get(Index, get({This, unSelectedAnimationArray}))),
            (get({get({local, rectangleAdjustedAnimation}), '$class'})):setWidth(get({local, rectangleAdjustedAnimation}), RectWidth),
            (get({get({local, rectangleAdjustedAnimation}), '$class'})):setHeight(get({local, rectangleAdjustedAnimation}), RectHeight),
            (get({get({local, rectangleAdjustedAnimation}), '$class'})):setOffsetX(get({local, rectangleAdjustedAnimation}), Offset),
            (get({get({local, rectangleAdjustedAnimation}), '$class'})):setOffsetY(get({local, rectangleAdjustedAnimation}), Offset),
            (get({get({local, rectangleAdjustedAnimation}), '$class'})):setBasicColorP(get({local, rectangleAdjustedAnimation}), ButtonColor);
            false ->
            put({local, rectangleAdjustedAnimation}, array:get(Index, get({This, unSelectedAnimationArray}))),
            (get({get({local, rectangleAdjustedAnimation}), '$class'})):setWidth(get({local, rectangleAdjustedAnimation}), RectWidth),
            (get({get({local, rectangleAdjustedAnimation}), '$class'})):setHeight(get({local, rectangleAdjustedAnimation}), RectHeight),
            (get({get({local, rectangleAdjustedAnimation}), '$class'})):setOffsetX(get({local, rectangleAdjustedAnimation}), Offset),
            (get({get({local, rectangleAdjustedAnimation}), '$class'})):setOffsetY(get({local, rectangleAdjustedAnimation}), Offset),
            (get({get({local, rectangleAdjustedAnimation}), '$class'})):setBasicColorP(get({local, rectangleAdjustedAnimation}), ButtonColor)
        end.

getSelectedCommand(This) ->
        Index = 'ScrollCurrentSelectionForm':getSelectedIndex(This),
        CommandTextItem = (get({This, '$class'})):get(This, Index),
        (get({CommandTextItem, '$class'})):getCommand(CommandTextItem).

append(This, Item) ->
        Result = 'ScrollCurrentSelectionForm':append(This, Item),
        (get({This, '$class'})):addAt(This, Result, Item),
        Result.

delete(This, ItemNum) when is_integer(ItemNum) ->
        'ScrollCurrentSelectionForm':delete(This, ItemNum).

deleteAll(This) ->
        (get({This, '$class'})):initAnimations(This),
        'ScrollCurrentSelectionForm':deleteAll(This).

insert(This, ItemNum, Item) when is_integer(ItemNum) ->
        'ScrollCurrentSelectionForm':insert(This, ItemNum, Item).

set(This, ItemNum, Item) when is_integer(ItemNum) ->
        'ScrollCurrentSelectionForm':set(This, ItemNum, Item).

paint(This, Graphics) ->
        (get({get({This, myFontProcessor}), '$class'})):process(get({This, myFontProcessor}), Graphics),
        'ScrollCurrentSelectionForm':paint(This, Graphics).

% throws Exception
paintItem(This, Graphics, Index, Item, X, Y) when is_integer(Index), is_integer(X), is_integer(Y) ->
        (fun(Target_N70648) -> (get({Target_N70648, '$class'})):paintXY(Target_N70648, Graphics, X, Y) end)(array:get(Index, get({This, selectedAnimationArray}))),
        'ScrollCurrentSelectionForm':paintItem(This, Graphics, Index, Item, X, Y).

% throws Exception
paintUnselectedItem(This, Graphics, Index, Item, X, Y) when is_integer(Index), is_integer(X), is_integer(Y) ->
        (fun(Target_N70927) -> (get({Target_N70927, '$class'})):paintXY(Target_N70927, Graphics, X, Y) end)(array:get(Index, get({This, unSelectedAnimationArray}))),
        'ScrollCurrentSelectionForm':paintUnselectedItem(This, Graphics, Index, Item, X, Y).

