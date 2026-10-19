% Generated Code Do Not Modify
% package org.allbinary.graphics.form
% import javax.microedition.lcdui.Font
% import javax.microedition.lcdui.Graphics
% import org.allbinary.J2MEUtil
% import org.allbinary.graphics.Rectangle
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.graphics.font.MyFontProcessor
% import org.allbinary.graphics.font.UpdateMyFontInterface
% import org.allbinary.graphics.font.UpdateMyFontProcessor
% import org.allbinary.graphics.form.item.ABCustomItem
% import org.allbinary.graphics.paint.NullPaintable
% import org.allbinary.graphics.paint.Paintable
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.logic.string.StringMaker

-module('MultipleScrollSelectionHorizontalForm').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements UpdateMyFontInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('ScrollSelectionForm', Function, Arguments).

init_fields(This) ->
    put({This, rectPaintable}, 'NullPaintable':getInstance()),
    put({This, multipleScrollSelectionHorizontalFormTypeItemIndexPaintable}, 'ItemIndexPaintable':getInstance()),
    put({This, backgroundColor}, (fun(Target_N67188) -> (get({Target_N67188, '$class'})):intValue(Target_N67188) end)(get({'BasicColorFactory':getInstance(), 'TRANSPARENT_GREY'}))),
    put({This, myFontProcessor}, 'UpdateMyFontProcessor':new(This)),
    put({This, logged}, false),
    put({This, fontHeight}, 0),
    ok.


% throws Exception
createForm(Title, Items, Rectangle, FormType, Border, BackgroundBasicColor, ForegroundBasicColor) when (is_list(Title) orelse Title =:= undefined), (is_tuple(Items) orelse Items =:= undefined), is_integer(Border) ->
        ScrollSelectionForm = 'MultipleScrollSelectionHorizontalForm':new(Title, Items, 'ItemPaintableFactory':getInstance(), Border, BackgroundBasicColor, ForegroundBasicColor),
        (get({ScrollSelectionForm, '$class'})):init(ScrollSelectionForm, Rectangle, FormType),
        ScrollSelectionForm.

new(Title, Items, FormPaintableFactory, Border, BackgroundBasicColor, ForegroundBasicColor) when (is_list(Title) orelse Title =:= undefined), (is_tuple(Items) orelse Items =:= undefined), is_integer(Border) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Title, Items, FormPaintableFactory, Border, BackgroundBasicColor, ForegroundBasicColor),
    This.

init(This, Title, Items, FormPaintableFactory, Border, BackgroundBasicColor, ForegroundBasicColor) when (is_list(Title) orelse Title =:= undefined), (is_tuple(Items) orelse Items =:= undefined), is_integer(Border) ->
        'ScrollSelectionForm':init(This, Title, Items, FormPaintableFactory, Border, 3, BackgroundBasicColor, ForegroundBasicColor),
        init_fields(This),
        case ('J2MEUtil':isJ2ME() orelse 'J2MEUtil':isHTML()) of
            true ->
            ok;
            false ->
            ok % Java nested type MPaintable: move it to its own module
,
            put({This, rectPaintable}, 'MPaintable':new())
        end.

fillRect(This, Graphics) ->
        (get({Graphics, '$class'})):setColor(Graphics, get({This, backgroundColor})),
        (get({Graphics, '$class'})):fillRect(Graphics, get({This, x}), get({This, y}), (get({get({This, rectangle}), '$class'})):getWidth(get({This, rectangle})), (get({get({This, rectangle}), '$class'})):getHeight(get({This, rectangle}))).

% throws Exception
init(This, Rectangle, FormType) ->
        'ScrollSelectionForm':init(This, Rectangle, FormType),
        FormTypeFactory = 'FormTypeFactory':getInstance(),
        case (FormType =:= get({FormTypeFactory, 'HORIZONTAL_FORM'})) of
            true ->
            put({This, multipleScrollSelectionHorizontalFormTypeItemIndexPaintable}, 'MultipleScrollSelectionFormHorizontalPaintable':new(This));
            false ->
            case (FormType =:= get({FormTypeFactory, 'VERTICAL_CENTER_FORM'})) of
            true ->
            put({This, multipleScrollSelectionHorizontalFormTypeItemIndexPaintable}, 'MultipleScrollSelectionFormVerticalPaintable':new(This));
            false ->
            case (FormType =:= get({FormTypeFactory, 'NULL_FORM_TYPE'})) of
            true ->
            ok;
            false ->
            erlang:error({'Exception', get({FormTypeFactory, 'UNK'})})
        end
        end
        end.

updateMeasurement(This, Graphics) ->
        Font = (get({Graphics, '$class'})):getFont(Graphics),
        put({This, fontHeight}, (get({Font, '$class'})):getHeight(Font)),
        put({This, myFontProcessor}, 'MyFontProcessor':getInstance()).

% throws Exception
paintHorizontal(This, Graphics, Index, Item, Dx, Dy) when is_integer(Index), is_integer(Dx), is_integer(Dy) ->
        put({local, dx}, Dx),
        Dx2 = ((get({This, '$class'})):paintItem(This, Graphics, Index, Item, get({local, dx}), Dy) + get({This, border})),
        (get({get({This, paintable}), '$class'})):paint(get({This, paintable}), Graphics, Index, get({local, dx}), Dy),
        put({local, dx}, Dx2),
        get({local, dx}).

% throws Exception
paintVertical(This, Graphics, Index, Item, Dx, Dy) when is_integer(Index), is_integer(Dx), is_integer(Dy) ->
        (get({This, '$class'})):paintItem(This, Graphics, Index, Item, Dx, Dy),
        (get({get({This, paintable}), '$class'})):paint(get({This, paintable}), Graphics, Index, Dx, Dy),
        Dx.

getStartIndex(This) ->
        (get({This, '$class'})):getSelectedIndex(This).

paint(This, Graphics) ->
        try
            (get({get({This, myFontProcessor}), '$class'})):process(get({This, myFontProcessor}), Graphics),
            Start = (get({This, '$class'})):getStartIndex(This),
            Size = (get({This, '$class'})):size(This),
            put({local, dx}, get({This, x})),
            Dy = get({This, y}),
            (get({get({This, rectPaintable}), '$class'})):paint(get({This, rectPaintable}), Graphics),
            (get({Graphics, '$class'})):drawString(Graphics, (get({This, '$class'})):getTitle(This), get({This, x}), (get({This, y}) - get({This, fontHeight})), 0),
            put({local, item}, undefined),
            lists:foreach(fun(Index) ->
                put({local, item}, (get({This, '$class'})):get(This, Index)),
                case (get({local, dx}) >= (get({get({This, rectangle}), '$class'})):getMaxX(get({This, rectangle}))) of
                    true ->
                    case get({This, logged}) of
                        true ->
                        ok;
                        false ->
                        put({This, logged}, true),
                        'PreLogUtil':put((fun(Target_N69731) -> (get({Target_N69731, '$class'})):toString(Target_N69731) end)((fun(Target_N69738) -> (get({Target_N69738, '$class'})):appendint(Target_N69738, trunc((get({get({This, rectangle}), '$class'})):getMaxX(get({This, rectangle})))) end)((fun(Target_N69745) -> (get({Target_N69745, '$class'})):append(Target_N69745, "painting beyond maxx: ") end)('StringMaker':new()))), This, get({get({This, canvasStrings}), 'PAINT'}))
                    end;
                    false -> ok
                end,
                put({local, dx}, (get({get({This, multipleScrollSelectionHorizontalFormTypeItemIndexPaintable}), '$class'})):paint(get({This, multipleScrollSelectionHorizontalFormTypeItemIndexPaintable}), Graphics, Index, get({local, item}), get({local, dx}), Dy))
            end, lists:seq(Start, Size - 1))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            'PreLogUtil':put(get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, canvasStrings}), 'PAINT'}))
        end.
% Java nested class MultipleScrollSelectionFormHorizontalPaintable: move it to its own module 'MultipleScrollSelectionFormHorizontalPaintable'
% Java nested class MultipleScrollSelectionFormVerticalPaintable: move it to its own module 'MultipleScrollSelectionFormVerticalPaintable'

