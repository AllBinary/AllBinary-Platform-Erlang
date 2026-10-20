% Generated Code Do Not Modify
% package org.allbinary.graphics.form
% import org.allbinary.graphics.GPoint
% import org.allbinary.graphics.Rectangle
% import org.allbinary.graphics.RectangleFactory
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.graphics.displayable.CanvasStrings
% import org.allbinary.graphics.form.item.ABCustomItem
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.string.StringUtil

-module('PaintableForm').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ABCustomForm', Function, Arguments).

static_init() ->
    put({?MODULE, 'NULL_PAINTABLE_FORM'}, get({'NullUtil':getInstance(), 'NULL_OBJECT'})),
    ok.

init_fields(This) ->
    put({This, canvasStrings}, 'CanvasStrings':getInstance()),
    put({This, rectangle}, get({'RectangleFactory', 'SINGLETON'})),
    put({This, x}, 0),
    put({This, y}, 0),
    put({This, formType}, get({'FormTypeFactory':getInstance(), 'NULL_FORM_TYPE'})),
    ok.


getNullPaintableForm() ->
        case (get({'PaintableForm', 'NULL_PAINTABLE_FORM'}) =:= get({'NullUtil':getInstance(), 'NULL_OBJECT'})) of
            true ->
            put({'PaintableForm', 'NULL_PAINTABLE_FORM'}, 'PaintableForm':new(get({'StringUtil':getInstance(), 'EMPTY_STRING'}), array:new(0, {default, undefined}), get({'BasicColorFactory':getInstance(), 'BLACK'}), get({'BasicColorFactory':getInstance(), 'WHITE'})));
            false -> ok
        end,
        get({'PaintableForm', 'NULL_PAINTABLE_FORM'}).

new(Title, Items, BackgroundBasicColor, ForegroundBasicColor) when (is_list(Title) orelse Title =:= undefined), (is_tuple(Items) orelse Items =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Title, Items, BackgroundBasicColor, ForegroundBasicColor),
    This.

'$init'(This, Title, Items, BackgroundBasicColor, ForegroundBasicColor) when (is_list(Title) orelse Title =:= undefined), (is_tuple(Items) orelse Items =:= undefined) ->
        'ABCustomForm':'$init'(This, Title, Items, BackgroundBasicColor, ForegroundBasicColor),
        init_fields(This),
        (get({This, '$class'})):setSelectedIndex(This, 0).

% throws Exception
init(This, Rectangle, FormType) ->
        put({This, rectangle}, Rectangle),
        Point = (get({get({This, rectangle}), '$class'})):getPoint(get({This, rectangle})),
        put({This, x}, (get({Point, '$class'})):getX(Point)),
        put({This, y}, (get({Point, '$class'})):getY(Point)),
        put({This, formType}, FormType).

getWidth(This) ->
        (get({get({This, rectangle}), '$class'})):getWidth(get({This, rectangle})).

