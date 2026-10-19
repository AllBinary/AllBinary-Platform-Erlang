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
% package org.allbinary.game.paint
% import javax.microedition.lcdui.Font
% import javax.microedition.lcdui.Graphics
% import org.allbinary.graphics.Anchor
% import org.allbinary.graphics.displayable.CanvasStrings
% import org.allbinary.graphics.displayable.DisplayInfoSingleton
% import org.allbinary.graphics.font.MyFontProcessor
% import org.allbinary.graphics.font.UpdateMyFontInterface
% import org.allbinary.graphics.font.UpdateMyFontProcessor
% import org.allbinary.graphics.paint.Paintable

-module('AboutPaintable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements UpdateMyFontInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('Paintable', Function, Arguments).

init_fields(This) ->
    put({This, displayInfoSingleton}, 'DisplayInfoSingleton':getInstance()),
    put({This, 'ABOUT'}, get({'CanvasStrings':getInstance(), 'ABOUT'})),
    put({This, info}, undefined),
    put({This, developers}, undefined),
    put({This, paintableArray}, array:from_list([This])),
    put({This, myFontProcessor}, 'UpdateMyFontProcessor':new(This)),
    put({This, charHeight}, 0),
    put({This, aboutBeginWidth}, 0),
    put({This, infoBeginWidth}, undefined),
    put({This, developersBeginWidth}, undefined),
    put({This, anchor}, get({'Anchor', 'TOP_LEFT'})),
    ok.


getInstance(Info, Developers) when (is_tuple(Info) orelse Info =:= undefined), (is_tuple(Developers) orelse Developers =:= undefined) ->
        'AboutPaintable':new(Info, Developers).

new(Info, Developers) when (is_tuple(Info) orelse Info =:= undefined), (is_tuple(Developers) orelse Developers =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Info, Developers),
    This.

init(This, Info, Developers) when (is_tuple(Info) orelse Info =:= undefined), (is_tuple(Developers) orelse Developers =:= undefined) ->
    'Paintable':init(This),
    init_fields(This),
        put({This, info}, Info),
        put({This, infoBeginWidth}, array:new(array:size(get({This, info})), {default, 0})),
        put({This, developers}, Developers),
        put({This, developersBeginWidth}, array:new(array:size(get({This, developers})), {default, 0})).

updateMeasurement(This, Graphics) ->
        Font = (get({Graphics, '$class'})):getFont(Graphics),
        put({This, charHeight}, (get({Font, '$class'})):getHeight(Font)),
        put({This, aboutBeginWidth}, (((get({Font, '$class'})):stringWidth(Font, get({This, 'ABOUT'})) bsr 1))),
        InfoSize = array:size(get({This, info})),
        lists:foreach(fun(Index) ->
            put({This, infoBeginWidth}, array:set(Index, (((get({Font, '$class'})):stringWidth(Font, array:get(Index, get({This, info}))) bsr 1)), get({This, infoBeginWidth})))
        end, lists:seq(0, InfoSize - 1)),
        Size = array:size(get({This, developers})),
        lists:foreach(fun(Index) ->
            put({This, developersBeginWidth}, array:set(Index, (((get({Font, '$class'})):stringWidth(Font, array:get(Index, get({This, developers}))) bsr 1)), get({This, developersBeginWidth})))
        end, lists:seq(0, Size - 1)),
        put({This, myFontProcessor}, 'MyFontProcessor':getInstance()).

getPaintableArrayInstance(This) ->
        get({This, paintableArray}).

paint(This, Graphics) ->
        (get({get({This, myFontProcessor}), '$class'})):process(get({This, myFontProcessor}), Graphics),
        HalfWidth = (get({get({This, displayInfoSingleton}), '$class'})):getLastHalfWidth(get({This, displayInfoSingleton})),
        (get({Graphics, '$class'})):drawString(Graphics, get({This, 'ABOUT'}), (HalfWidth - get({This, aboutBeginWidth})), (2 * get({This, charHeight})), get({This, anchor})),
        InfoSize = array:size(get({This, info})),
        lists:foreach(fun(Index) ->
            (get({Graphics, '$class'})):drawString(Graphics, array:get(Index, get({This, info})), (HalfWidth - array:get(Index, get({This, infoBeginWidth}))), (((4 + Index)) * get({This, charHeight})), get({This, anchor}))
        end, lists:seq(0, InfoSize - 1)),
        Size = array:size(get({This, developers})),
        lists:foreach(fun(Index) ->
            (get({Graphics, '$class'})):drawString(Graphics, array:get(Index, get({This, developers})), (HalfWidth - array:get(Index, get({This, developersBeginWidth}))), ((((5 + InfoSize) + Index)) * get({This, charHeight})), get({This, anchor}))
        end, lists:seq(0, Size - 1)).

