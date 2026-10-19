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
% import javax.microedition.lcdui.Graphics
% import org.allbinary.canvas.Processor
% import org.allbinary.graphics.Rectangle
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.font.MyFontProcessor
% import org.allbinary.graphics.font.UpdateMyFontInterface
% import org.allbinary.graphics.font.UpdateMyFontProcessor
% import org.allbinary.graphics.form.item.ABCustomItem

-module('ScrollCurrentSelectionForm').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements UpdateMyFontInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('ScrollSelectionForm', Function, Arguments).

init_fields(This) ->
    put({This, moveForSmallScreen}, false),
    put({This, updateMyFontProcessor}, 'UpdateMyFontProcessor':new(This)),
    put({This, myFontProcessor}, get({This, updateMyFontProcessor})),
    put({This, processor}, 'Processor':getInstance()),
    put({This, preItemIndexDx}, 'ItemIndexDx':getInstance()),
    put({This, dx}, 0),
    put({This, dy}, 0),
    put({This, maxWidth}, 0),
    ok.


new(Title, Items, FormPaintableFactory, Border, AdjustedExtraBorder, MoveForSmallScreen, BackgroundBasicColor, ForegroundBasicColor) when (is_list(Title) orelse Title =:= undefined), (is_tuple(Items) orelse Items =:= undefined), is_integer(Border), is_integer(AdjustedExtraBorder), is_boolean(MoveForSmallScreen) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Title, Items, FormPaintableFactory, Border, AdjustedExtraBorder, MoveForSmallScreen, BackgroundBasicColor, ForegroundBasicColor),
    This.

init(This, Title, Items, FormPaintableFactory, Border, AdjustedExtraBorder, MoveForSmallScreen, BackgroundBasicColor, ForegroundBasicColor) when (is_list(Title) orelse Title =:= undefined), (is_tuple(Items) orelse Items =:= undefined), is_integer(Border), is_integer(AdjustedExtraBorder), is_boolean(MoveForSmallScreen) ->
        'ScrollSelectionForm':init(This, Title, Items, FormPaintableFactory, Border, AdjustedExtraBorder, BackgroundBasicColor, ForegroundBasicColor),
        init_fields(This),
        put({This, moveForSmallScreen}, MoveForSmallScreen).

% throws Exception
init(This, Rectangle, FormType) ->
        'ScrollSelectionForm':init(This, Rectangle, FormType),
        FormTypeFactory = 'FormTypeFactory':getInstance(),
        case (FormType =:= get({FormTypeFactory, 'TEMP_HORIZONTAL_FORM'})) of
            true ->
            put({This, processor}, 'TempHorizontalFormProcessor':new(This)),
            put({This, preItemIndexDx}, 'TempHorizontalItemIndexDx':new(This));
            false ->
            case (FormType =:= get({FormTypeFactory, 'HORIZONTAL_FORM'})) of
            true ->
            put({This, processor}, 'HorizontalFormProcessor':new(This)),
            put({This, preItemIndexDx}, 'HorizontalItemIndexDx':new(This));
            false ->
            case (FormType =:= get({FormTypeFactory, 'VERTICAL_CENTER_FORM'})) of
            true ->
            put({This, processor}, 'VerticalFormProcessor':new(This)),
            put({This, preItemIndexDx}, 'VerticalItemIndexDx':new(This));
            false ->
            case (FormType =:= get({FormTypeFactory, 'NULL_FORM_TYPE'})) of
            true ->
            ok;
            false ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({FormTypeFactory, 'UNK'}), This, get({get({This, commonStrings}), 'INIT'}))
        end
        end
        end
        end,
        put({This, myFontProcessor}, get({This, updateMyFontProcessor})).

updateMeasurement(This, Graphics) ->
        put({This, myFontProcessor}, 'MyFontProcessor':getInstance()).

processTempHorizontalForm(This) ->
        put({This, dx}, ((get({This, x}) - 30) + (((get({get({This, rectangle}), '$class'})):getWidth(get({This, rectangle})) bsr 1)))),
        put({This, dy}, get({This, y})).

processHorizontalForm(This) ->
        Size = (get({This, '$class'})):size(This),
        put({local, totalWidth}, 0),
        put({local, item}, undefined),
        lists:foreach(fun(Index) ->
            put({local, item}, (get({This, '$class'})):get(This, Index)),
            put({local, totalWidth}, (get({local, totalWidth}) + ((get({get({local, item}), '$class'})):getMinimumWidth(get({local, item})) + get({This, border}))))
        end, lists:seq(0, Size - 1)),
        put({This, dx}, ((get({This, x}) + (((get({get({This, rectangle}), '$class'})):getWidth(get({This, rectangle})) bsr 1))) - ((get({local, totalWidth}) bsr 1)))),
        put({This, dy}, (get({This, y}) + (((get({get({This, rectangle}), '$class'})):getHeight(get({This, rectangle})) bsr 1)))),
        case get({This, moveForSmallScreen}) of
            true ->
            MaxTitleHeight = 175,
            case (get({This, dy}) < MaxTitleHeight) of
                true ->
                put({This, dy}, MaxTitleHeight);
                false -> ok
            end;
            false -> ok
        end.

processVerticalForm(This) ->
        put({local, totalHeight}, 0),
        Size = (get({This, '$class'})):size(This),
        put({local, item2}, undefined),
        lists:foreach(fun(Index) ->
            put({local, item2}, (get({This, '$class'})):get(This, Index)),
            case (get({This, maxWidth}) < (get({get({local, item2}), '$class'})):getMinimumWidth(get({local, item2}))) of
                true ->
                put({This, maxWidth}, (get({get({local, item2}), '$class'})):getMinimumWidth(get({local, item2})));
                false -> ok
            end,
            put({local, totalHeight}, (get({local, totalHeight}) + ((get({get({local, item2}), '$class'})):getMinimumHeight(get({local, item2})) + get({This, border}))))
        end, lists:seq(0, Size - 1)),
        put({This, dx}, (((((get({get({This, rectangle}), '$class'})):getWidth(get({This, rectangle})) - get({This, maxWidth}))) / 2))),
        case ((get({This, '$class'})):size(This) > 0) of
            true ->
            put({This, dy}, (get({This, y}) + (((((get({get({This, rectangle}), '$class'})):getHeight(get({This, rectangle})) - get({local, totalHeight}))) / 2)))),
            case get({This, moveForSmallScreen}) of
                true ->
                MaxTitleHeight = 175,
                case (get({This, dy}) < MaxTitleHeight) of
                    true ->
                    put({This, dy}, MaxTitleHeight);
                    false -> ok
                end;
                false -> ok
            end;
            false ->
            put({This, dy}, get({This, y}))
        end.

getXTempHorizontalForm(This, Index, Item, Dx, Dy) when is_integer(Index), is_integer(Dx), is_integer(Dy) ->
        (get({This, '$class'})):getDiffX(This, Item).

getXHorizontalForm(This, Index, Item, Dx, Dy) when is_integer(Index), is_integer(Dx), is_integer(Dy) ->
        0.

getXVerticalForm(This, Index, Item, Dx, Dy) when is_integer(Index), is_integer(Dx), is_integer(Dy) ->
        ((get({This, '$class'})):getDiffX(This, Item) + get({This, halfBorder})).

getDiffX(This, Item) ->
        ((((get({This, maxWidth}) - (get({Item, '$class'})):getMinimumWidth(Item))) bsr 1)).

getDx(This) ->
        get({This, dx}).

getDy(This) ->
        get({This, dy}).

paint(This, Graphics) ->
        try
            (get({get({This, processor}), '$class'})):process(get({This, processor})),
            put({local, delta}, 0),
            put({local, deltaX}, (get({This, '$class'})):getDx(This)),
            put({local, deltaY}, (get({This, '$class'})):getDy(This)),
            Size = (get({This, '$class'})):size(This),
            FormTypeFactory = 'FormTypeFactory':getInstance(),
            put({local, item}, undefined),
            lists:foreach(fun(Index) ->
                put({local, item}, (get({This, '$class'})):get(This, Index)),
                DiffX = (get({get({This, preItemIndexDx}), '$class'})):getDx(get({This, preItemIndexDx}), Index, get({local, item}), get({This, dx}), get({This, dy})),
                case (Index =:= (get({This, '$class'})):getSelectedIndex(This)) of
                    true ->
                    put({local, delta}, (get({This, '$class'})):paintItem(This, Graphics, Index, get({local, item}), (get({local, deltaX}) + DiffX), get({local, deltaY}))),
                    (get({get({This, paintable}), '$class'})):paint(get({This, paintable}), Graphics, Index, (get({local, deltaX}) + DiffX), get({local, deltaY}));
                    false ->
                    put({local, delta}, (get({This, '$class'})):paintUnselectedItem(This, Graphics, Index, get({local, item}), (get({local, deltaX}) + DiffX), get({local, deltaY}))),
                    (get({get({This, paintable}), '$class'})):paint(get({This, paintable}), Graphics, Index, (get({local, deltaX}) + DiffX), get({local, deltaY}))
                end,
                case (get({This, formType}) =:= get({FormTypeFactory, 'TEMP_HORIZONTAL_FORM'})) of
                    true ->
                    ok;
                    false ->
                    case (get({This, formType}) =:= get({FormTypeFactory, 'HORIZONTAL_FORM'})) of
                    true ->
                    put({local, deltaX}, get({local, delta}));
                    false ->
                    case (get({This, formType}) =:= get({FormTypeFactory, 'VERTICAL_CENTER_FORM'})) of
                    true ->
                    put({local, deltaY}, get({local, delta}));
                    false ->
                    erlang:error({'Exception', get({FormTypeFactory, 'UNK'})})
                end
                end
                end
            end, lists:seq(0, Size - 1))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, canvasStrings}), 'PAINT'}), E)
        end.
% Java nested class TempHorizontalFormProcessor: move it to its own module 'TempHorizontalFormProcessor'
% Java nested class HorizontalFormProcessor: move it to its own module 'HorizontalFormProcessor'
% Java nested class VerticalFormProcessor: move it to its own module 'VerticalFormProcessor'
% Java nested class TempHorizontalItemIndexDx: move it to its own module 'TempHorizontalItemIndexDx'
% Java nested class HorizontalItemIndexDx: move it to its own module 'HorizontalItemIndexDx'
% Java nested class VerticalItemIndexDx: move it to its own module 'VerticalItemIndexDx'

