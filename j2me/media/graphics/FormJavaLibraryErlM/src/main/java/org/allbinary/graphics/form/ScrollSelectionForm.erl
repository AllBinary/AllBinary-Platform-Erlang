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
% import javax.microedition.lcdui.Canvas
% import javax.microedition.lcdui.Graphics
% import org.allbinary.graphics.GPoint
% import org.allbinary.graphics.Rectangle
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.graphics.form.item.ABCustomItem
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.math.RectangleCollisionUtil
% import org.allbinary.string.CommonLabels
% import org.allbinary.string.CommonSeps
% import org.allbinary.string.CommonStrings

-module('ScrollSelectionForm').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('PaintableForm', Function, Arguments).

static_init() ->
    put({?MODULE, 'NULL_SCROLL_SELECTION_FORM'}, get({'NullUtil':getInstance(), 'NULL_OBJECT'})),
    put({?MODULE, 'NULL_SCROLL_SELECTION_HORIZONTAL_FORM'}, get({'NullUtil':getInstance(), 'NULL_OBJECT'})),
    put({?MODULE, 'INSIDE_FORM'}, " inside form"),
    put({?MODULE, 'IS_IN_FORM'}, "isInForm"),
    put({?MODULE, 'GET_SELECTED_INDEX'}, "getSelectedIndexForPoint"),
    ok.

init_fields(This) ->
    put({This, rectangleCollisionUtil}, 'RectangleCollisionUtil':getInstance()),
    put({This, border}, 0),
    put({This, halfBorder}, 0),
    put({This, buttonBasicColor}, undefined),
    put({This, scrollSelectionFormFormTypeItemIndexPaintable}, 'ItemIndexPaintable':getInstance()),
    put({This, formTypeItemIndexDx}, 'ItemIndexDx':getInstance()),
    put({This, paintable}, 'ItemPaintableFactory':getInstance()),
    put({This, adjustedExtraBorder}, 0),
    ok.


createForm(Title, Items, FormPaintableFactory, Border, BackgroundBasicColor, ForegroundBasicColor) when (is_list(Title) orelse Title =:= undefined), (is_tuple(Items) orelse Items =:= undefined), is_integer(Border) ->
        try
        try
            case (FormPaintableFactory =:= 'ItemPaintableFactory':getInstance()) of
                true ->
                throw({'$return', 'ScrollSelectionForm':new(Title, Items, FormPaintableFactory, Border, (-3), BackgroundBasicColor, ForegroundBasicColor)});
                false ->
                put({local, commonStrings}, 'CommonStrings':getInstance()),
                put({local, logUtil}, 'LogUtil':getInstance()),
                (get({get({local, logUtil}), '$class'})):putF(get({local, logUtil}), get({get({local, commonStrings}), 'EXCEPTION'}), get({local, logUtil}), get({get({local, commonStrings}), 'EXCEPTION'})),
                throw({'$return', 'PaintableForm':getNullPaintableForm()})
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            put({local, commonStrings}, 'CommonStrings':getInstance()),
            put({local, logUtil}, 'LogUtil':getInstance()),
            (get({get({local, logUtil}), '$class'})):put(get({local, logUtil}), get({get({local, commonStrings}), 'EXCEPTION'}), get({local, logUtil}), get({get({local, commonStrings}), 'EXCEPTION'}), E),
            'PaintableForm':getNullPaintableForm()
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getNullScrollSelectionForm() ->
        case (get({'ScrollSelectionForm', 'NULL_SCROLL_SELECTION_FORM'}) =:= get({'NullUtil':getInstance(), 'NULL_OBJECT'})) of
            true ->
            put({'ScrollSelectionForm', 'NULL_SCROLL_SELECTION_FORM'}, 'ScrollSelectionForm':createForm(get({'StringUtil':getInstance(), 'EMPTY_STRING'}), array:new(0, {default, undefined}), 'ItemPaintableFactory':getInstance(), 0, get({'BasicColorFactory':getInstance(), 'BLACK'}), get({'BasicColorFactory':getInstance(), 'WHITE'})));
            false -> ok
        end,
        get({'ScrollSelectionForm', 'NULL_SCROLL_SELECTION_FORM'}).

getNullScrollSelectionFormHorizontal() ->
        case (get({'ScrollSelectionForm', 'NULL_SCROLL_SELECTION_HORIZONTAL_FORM'}) =:= get({'NullUtil':getInstance(), 'NULL_OBJECT'})) of
            true ->
            put({'ScrollSelectionForm', 'NULL_SCROLL_SELECTION_HORIZONTAL_FORM'}, 'ScrollSelectionForm':createForm(get({'StringUtil':getInstance(), 'EMPTY_STRING'}), array:new(0, {default, undefined}), 'ItemPaintableFactory':getInstance(), 0, get({'BasicColorFactory':getInstance(), 'BLACK'}), get({'BasicColorFactory':getInstance(), 'WHITE'})));
            false -> ok
        end,
        get({'ScrollSelectionForm', 'NULL_SCROLL_SELECTION_HORIZONTAL_FORM'}).

new(Title, Items, FormPaintableFactory, Border, AdjustedExtraBorder, BackgroundBasicColor, ForegroundBasicColor) when (is_list(Title) orelse Title =:= undefined), (is_tuple(Items) orelse Items =:= undefined), is_integer(Border), is_integer(AdjustedExtraBorder) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Title, Items, FormPaintableFactory, Border, AdjustedExtraBorder, BackgroundBasicColor, ForegroundBasicColor),
    This.

'$init'(This, Title, Items, FormPaintableFactory, Border, AdjustedExtraBorder, BackgroundBasicColor, ForegroundBasicColor) when (is_list(Title) orelse Title =:= undefined), (is_tuple(Items) orelse Items =:= undefined), is_integer(Border), is_integer(AdjustedExtraBorder) ->
        'PaintableForm':'$init'(This, Title, Items, BackgroundBasicColor, ForegroundBasicColor),
        init_fields(This),
        put({This, adjustedExtraBorder}, AdjustedExtraBorder),
        put({This, buttonBasicColor}, ForegroundBasicColor),
        put({This, border}, Border),
        put({This, halfBorder}, ((Border bsr 1))),
        put({This, paintable}, (get({FormPaintableFactory, '$class'})):getInstanceItemPaintable(FormPaintableFactory, This)).

% throws Exception
init(This, Rectangle, FormType) ->
        'PaintableForm':init(This, Rectangle, FormType),
        FormTypeFactory = 'FormTypeFactory':getInstance(),
        case (FormType =:= get({FormTypeFactory, 'HORIZONTAL_FORM'})) of
            true ->
            put({This, scrollSelectionFormFormTypeItemIndexPaintable}, 'ScrollSelectionFormHorizontalPaintable':new(This)),
            put({This, formTypeItemIndexDx}, 'ScrollSelectionFormHorizontalDx':new(This));
            false ->
            case (FormType =:= get({FormTypeFactory, 'VERTICAL_CENTER_FORM'})) of
            true ->
            put({This, scrollSelectionFormFormTypeItemIndexPaintable}, 'ScrollSelectionFormVerticalPaintable':new(This)),
            put({This, formTypeItemIndexDx}, 'ScrollSelectionFormVericalDx':new(This));
            false ->
            case (FormType =:= get({FormTypeFactory, 'TEMP_HORIZONTAL_FORM'})) of
            true ->
            put({This, scrollSelectionFormFormTypeItemIndexPaintable}, 'ScrollSelectionFormTempHorizontalPaintable':new(This)),
            put({This, formTypeItemIndexDx}, 'ScrollSelectionFormTempHorizontalDx':new(This));
            false ->
            case (FormType =:= get({FormTypeFactory, 'NULL_FORM_TYPE'})) of
            true ->
            ok;
            false ->
            erlang:error({'Exception', get({FormTypeFactory, 'UNK'})})
        end
        end
        end
        end.

paintItemHorizontal(This, Graphics, Index, Item, X, Y) when is_integer(Index), is_integer(X), is_integer(Y) ->
        Width = (get({Item, '$class'})):getMinimumWidth(Item),
        ((X + Width) + get({This, border})).

paintItemVertical(This, Graphics, Index, Item, X, Y) when is_integer(Index), is_integer(X), is_integer(Y) ->
        Height = (get({Item, '$class'})):getMinimumHeight(Item),
        ((Y + Height) + get({This, border})).

paintItemTempHorizontal(This, Graphics, Index, Item, X, Y) when is_integer(Index), is_integer(X), is_integer(Y) ->
        0.

getSelectedIndexForPointHorizontalDx(This, Index, Item, Dx, Dy) when is_integer(Index), is_integer(Dx), is_integer(Dy) ->
        (Dx - get({This, halfBorder})).

getSelectedIndexForPointVerticalDx(This, Index, Item, Dx, Dy) when is_integer(Index), is_integer(Dx), is_integer(Dy) ->
        (Dx + (get({This, '$class'})):getDiffX(This, Item)).

getSelectedIndexForPointTempHorizontalDx(This, Index, Item, Dx, Dy) when is_integer(Index), is_integer(Dx), is_integer(Dy) ->
        (Dx + (get({This, '$class'})):getDiffX(This, Item)).

append(This, Item) ->
        'PaintableForm':append(This, Item).

% throws Exception
getSelectedItem(This, Point) ->
        try
        Index = (get({This, '$class'})):getSelectedIndexForPoint(This, Point),
        case (Index =/= (-1)) of
            true ->
            throw({'$return', (get({This, '$class'})):get(This, Index)});
            false ->
            throw({'$return', 'ABCustomItem':getNullInstance()})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
getItemIndex(This, Item) ->
        try
        put({local, nextItem}, undefined),
        Size = (get({This, '$class'})):size(This),
        lists:foreach(fun(Index) ->
            put({local, nextItem}, (get({This, '$class'})):get(This, Index)),
            case (get({local, nextItem}) =:= Item) of
                true ->
                throw({'$return', Index});
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        (-1)
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getStartIndex(This) ->
        0.

% throws Exception
getSelectedIndexForPoint(This, Point) ->
        try
        Start = (get({This, '$class'})):getStartIndex(This),
        Size = (get({This, '$class'})):size(This),
        put({local, dx}, (get({This, '$class'})):getDx(This)),
        put({local, dy}, (get({This, '$class'})):getDy(This)),
        FormTypeFactory = 'FormTypeFactory':getInstance(),
        CommonLabels = 'CommonLabels':getInstance(),
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonLabels, 'START_LABEL'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, Start),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'CommonSeps':getInstance(), 'SPACE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonLabels, 'TOTAL_LABEL'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, Size),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, get({'ScrollSelectionForm', 'GET_SELECTED_INDEX'})),
        put({local, item}, undefined),
        put({local, width}, 0),
        put({local, height}, 0),
        put({local, diffX}, 0),
        lists:foreach(fun(Index) ->
            put({local, item}, (get({This, '$class'})):get(This, Index)),
            put({local, width}, (get({get({local, item}), '$class'})):getMinimumWidth(get({local, item}))),
            put({local, height}, (get({get({local, item}), '$class'})):getMinimumHeight(get({local, item}))),
            put({local, diffX}, (get({get({This, formTypeItemIndexDx}), '$class'})):getDx(get({This, formTypeItemIndexDx}), Index, get({local, item}), get({local, dx}), get({local, dy}))),
            case (get({get({This, rectangleCollisionUtil}), '$class'})):isInside(get({This, rectangleCollisionUtil}), get({local, diffX}), (get({local, dy}) - get({This, halfBorder})), ((get({local, diffX}) + get({local, width})) + get({This, border})), (((get({local, dy}) + get({local, height})) + get({This, halfBorder})) + 1), (get({Point, '$class'})):getX(Point), (get({Point, '$class'})):getY(Point)) of
                true ->
                (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonLabels, 'ITEM_LABEL'})),
                (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({local, item}), '$class'})):getLabel(get({local, item}))),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({'CommonSeps':getInstance(), 'SPACE'})),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonLabels, 'INDEX_LABEL'})),
                (get({StringBuffer, '$class'})):appendint(StringBuffer, Index),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, get({'ScrollSelectionForm', 'GET_SELECTED_INDEX'})),
                throw({'$return', Index});
                false -> ok
            end,
            case (get({This, formType}) =:= get({FormTypeFactory, 'HORIZONTAL_FORM'})) of
                true ->
                put({local, dx}, ((get({local, dx}) + get({local, width})) + get({This, border}))),
                case (get({local, dx}) > (get({get({This, rectangle}), '$class'})):getMaxX(get({This, rectangle}))) of
                    true ->
                    throw('$break');
                    false -> ok
                end;
                false ->
                case (get({This, formType}) =:= get({FormTypeFactory, 'VERTICAL_CENTER_FORM'})) of
                true ->
                put({local, dy}, ((get({local, dy}) + get({local, height})) + get({This, border}))),
                case (get({local, dy}) > (get({get({This, rectangle}), '$class'})):getMaxY(get({This, rectangle}))) of
                    true ->
                    throw('$break');
                    false -> ok
                end;
                false ->
                case (get({This, formType}) =:= get({FormTypeFactory, 'NULL_FORM_TYPE'})) of
                true ->
                ok;
                false ->
                erlang:error({'Exception', get({FormTypeFactory, 'UNK'})})
            end
            end
            end
        end, lists:seq(Start, Size - 1)),
        (-1)
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
processInputKey(This, GameKeyCode) when is_integer(GameKeyCode) ->
        try
        FormTypeFactory = 'FormTypeFactory':getInstance(),
        case ((get({This, '$class'})):size(This) =:= 0) of
            true ->
            throw({'$return', (-1)});
            false -> ok
        end,
        put({local, index}, (get({This, '$class'})):getSelectedIndex(This)),
        case ((get({This, formType}) =:= get({FormTypeFactory, 'HORIZONTAL_FORM'})) orelse (get({This, formType}) =:= get({FormTypeFactory, 'TEMP_HORIZONTAL_FORM'}))) of
            true ->
            case (GameKeyCode =:= get({'Canvas', 'RIGHT'})) of
                true ->
                put({local, index}, get({local, index}) + 1);
                false ->
                case (GameKeyCode =:= get({'Canvas', 'LEFT'})) of
                true ->
                put({local, index}, get({local, index}) - 1);
                false -> ok
            end
            end;
            false ->
            case (get({This, formType}) =:= get({FormTypeFactory, 'VERTICAL_CENTER_FORM'})) of
            true ->
            case (GameKeyCode =:= get({'Canvas', 'DOWN'})) of
                true ->
                put({local, index}, get({local, index}) + 1);
                false ->
                case (GameKeyCode =:= get({'Canvas', 'UP'})) of
                true ->
                put({local, index}, get({local, index}) - 1);
                false -> ok
            end
            end;
            false ->
            case (get({This, formType}) =:= get({FormTypeFactory, 'NULL_FORM_TYPE'})) of
            true ->
            ok;
            false ->
            erlang:error({'Exception', get({FormTypeFactory, 'UNK'})})
        end
        end
        end,
        Max = ((get({This, '$class'})):size(This) - 1),
        case (get({local, index}) < 0) of
            true ->
            (get({This, '$class'})):setSelectedIndex(This, 0);
            false ->
            case (get({local, index}) > Max) of
            true ->
            (get({This, '$class'})):setSelectedIndex(This, Max);
            false ->
            (get({This, '$class'})):setSelectedIndex(This, get({local, index}))
        end
        end,
        (-1)
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isInForm(This, Point) ->
        try
        case (get({get({This, rectangleCollisionUtil}), '$class'})):isInside(get({This, rectangleCollisionUtil}), get({This, x}), (get({This, y}) - get({This, halfBorder})), ((get({get({This, rectangle}), '$class'})):getMaxX(get({This, rectangle})) + get({This, border})), ((get({get({This, rectangle}), '$class'})):getMaxY(get({This, rectangle})) + get({This, border})), (get({Point, '$class'})):getX(Point), (get({Point, '$class'})):getY(Point)) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N75384) -> (get({Target_N75384, '$class'})):toString(Target_N75384) end)((fun(Target_N75391) -> (get({Target_N75391, '$class'})):append(Target_N75391, get({'ScrollSelectionForm', 'INSIDE_FORM'})) end)((fun(Target_N75398) -> (get({Target_N75398, '$class'})):append(Target_N75398, (fun(Target_N75419) -> (get({Target_N75419, '$class'})):toString(Target_N75419, Point) end)('StringUtil':getInstance())) end)('StringMaker':new()))), This, get({'ScrollSelectionForm', 'IS_IN_FORM'})),
            throw({'$return', true});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
paintItem(This, Graphics, Index, Item, X, Y) when is_integer(Index), is_integer(X), is_integer(Y) ->
        (get({Item, '$class'})):paintXY(Item, Graphics, X, Y),
        Width = (get({Item, '$class'})):getMinimumWidth(Item),
        Height = (get({Item, '$class'})):getMinimumHeight(Item),
        (get({Graphics, '$class'})):setColor(Graphics, (fun(Target_N75734) -> (get({Target_N75734, '$class'})):intValue(Target_N75734) end)((get({This, '$class'})):getButtonBasicColor(This))),
        AdjustedBorder = 3,
        (get({Graphics, '$class'})):drawRect(Graphics, ((X - get({This, halfBorder})) - AdjustedBorder), ((Y - get({This, halfBorder})) - AdjustedBorder), ((Width + get({This, border})) + get({This, adjustedExtraBorder})), ((Height + get({This, border})) + get({This, adjustedExtraBorder}))),
        (get({get({This, scrollSelectionFormFormTypeItemIndexPaintable}), '$class'})):paint(get({This, scrollSelectionFormFormTypeItemIndexPaintable}), Graphics, Index, Item, X, Y).

% throws Exception
paintUnselectedItem(This, Graphics, Index, Item, X, Y) when is_integer(Index), is_integer(X), is_integer(Y) ->
        (get({Graphics, '$class'})):setColor(Graphics, (fun(Target_N76209) -> (get({Target_N76209, '$class'})):intValue(Target_N76209) end)((get({This, '$class'})):getButtonBasicColor(This))),
        (get({Item, '$class'})):paintUnselected(Item, Graphics, X, Y),
        (get({get({This, scrollSelectionFormFormTypeItemIndexPaintable}), '$class'})):paint(get({This, scrollSelectionFormFormTypeItemIndexPaintable}), Graphics, Index, Item, X, Y).

getDiffX(This, Item) ->
        0.

getDx(This) ->
        get({This, x}).

getDy(This) ->
        get({This, y}).

setButtonBasicColor(This, ButtonBasicColor) ->
        put({This, buttonBasicColor}, ButtonBasicColor).

getButtonBasicColor(This) ->
        get({This, buttonBasicColor}).
% Java nested class ScrollSelectionFormHorizontalPaintable: move it to its own module 'ScrollSelectionFormHorizontalPaintable'
% Java nested class ScrollSelectionFormVerticalPaintable: move it to its own module 'ScrollSelectionFormVerticalPaintable'
% Java nested class ScrollSelectionFormTempHorizontalPaintable: move it to its own module 'ScrollSelectionFormTempHorizontalPaintable'
% Java nested class ScrollSelectionFormHorizontalDx: move it to its own module 'ScrollSelectionFormHorizontalDx'
% Java nested class ScrollSelectionFormVericalDx: move it to its own module 'ScrollSelectionFormVericalDx'
% Java nested class ScrollSelectionFormTempHorizontalDx: move it to its own module 'ScrollSelectionFormTempHorizontalDx'

