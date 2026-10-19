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
% package org.allbinary.animation.text
% import javax.microedition.lcdui.Font
% import javax.microedition.lcdui.Graphics
% import org.allbinary.animation.AnimationBehavior
% import org.allbinary.animation.IndexedAnimation
% import org.allbinary.graphics.Anchor
% import org.allbinary.graphics.font.MyFontProcessor
% import org.allbinary.graphics.font.UpdateMyFontInterface
% import org.allbinary.graphics.font.UpdateMyFontProcessor
% import org.allbinary.graphics.threed.SWTJOGLProcessor
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('TextAnimation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements UpdateMyFontInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('IndexedAnimation', Function, Arguments).

init_fields(This) ->
    put({This, updateMyFontProcessor}, 'UpdateMyFontProcessor':new(This)),
    put({This, myFontProcessor}, get({This, updateMyFontProcessor})),
    put({This, textArrayP}, get({'StringUtil':getInstance(), 'ONE_EMPTY_STRING_ARRAY'})),
    put({This, anchor}, get({'Anchor', 'TOP_LEFT'})),
    put({This, fontHeight}, 0),
    put({This, offsetY}, 0),
    put({This, textChangeListener}, 'TextChangeListener':getInstance()),
    ok.


new(Text, AnimationBehavior) when (is_list(Text) orelse Text =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Text, AnimationBehavior),
    This.

init(This, Text, AnimationBehavior) when (is_list(Text) orelse Text =:= undefined) ->
        'IndexedAnimation':init(This, AnimationBehavior),
        init_fields(This),
        (get({This, '$class'})):setText(This, Text).

updateMeasurement(This, Graphics) ->
        Font = (get({Graphics, '$class'})):getFont(Graphics),
        put({This, fontHeight}, (get({Font, '$class'})):getHeight(Font)),
        AdjustedFontHeight = trunc((-((float(get({This, fontHeight})) * 2.00)))),
        put({This, offsetY}, case (fun(Target_N66565) -> (get({Target_N66565, '$class'})):isJOGL(Target_N66565) end)('SWTJOGLProcessor':getInstance()) of true -> AdjustedFontHeight; false -> 0 end),
        (get({get({This, textChangeListener}), '$class'})):onMeasure(get({This, textChangeListener})),
        put({This, textChangeListener}, 'TextChangeListener':getInstance()),
        put({This, myFontProcessor}, 'MyFontProcessor':getInstance()).

% throws Exception
nextFrame(This) ->
        ok.

paintXY(This, Graphics, X, Y) when is_integer(X), is_integer(Y) ->
        (get({get({This, myFontProcessor}), '$class'})):process(get({This, myFontProcessor}), Graphics),
        (get({This, '$class'})):paintXYNoUpdate(This, Graphics, X, Y).

paintXYNoUpdate(This, Graphics, X, Y) when is_integer(X), is_integer(Y) ->
        (get({get({This, basicSetColorUtil}), '$class'})):setBasicColorP3(get({This, basicSetColorUtil}), Graphics, (get({This, '$class'})):getBasicColorP(This), (get({This, '$class'})):getColor(This)),
        Size = array:size(get({This, textArrayP})),
        lists:foreach(fun(Index) ->
            (get({Graphics, '$class'})):drawString(Graphics, array:get(Index, get({This, textArrayP})), X, ((Y + get({This, offsetY})) + ((Index * get({This, fontHeight})))), get({This, anchor}))
        end, lists:seq(0, Size - 1)).

setTextWithOnMeasure(This, Text, TextChangeListener) when (is_list(Text) orelse Text =:= undefined) ->
        (get({This, '$class'})):setText(This, Text),
        put({This, textChangeListener}, TextChangeListener).

setText(This, Text) when (is_list(Text) orelse Text =:= undefined) ->
        List = 'BasicArrayListD':new(),
        case ((Text =/= undefined) andalso (string:length(Text) > 0)) of
            true ->
            put({local, index}, 0),
            put({local, startIndex}, 0),
            put({local, endIndex}, 0),
            (fun Loop() -> case (get({local, index}) >= 0) of true ->
                put({local, startIndex}, get({local, index})),
                put({local, index}, (get({Text, '$class'})):indexOf(Text, $\n, get({local, startIndex}))),
                put({local, endIndex}, get({local, index})),
                case (get({local, index}) < 0) of
                    true ->
                    put({local, endIndex}, string:length(Text));
                    false -> ok
                end,
                (get({List, '$class'})):add(List, string:slice(Text, get({local, startIndex}), (get({local, endIndex})) - (get({local, startIndex})))),
                case (get({local, index}) < 0) of
                    true ->
                    throw('$break');
                    false -> ok
                end,
                put({local, index}, get({local, index}) + 1),
                Loop();
            false -> ok end end)();
            false -> ok
        end,
        case ((get({List, '$class'})):size(List) > 0) of
            true ->
            TextArray = array:new((get({List, '$class'})):size(List), {default, undefined}),
            Size = (get({List, '$class'})):size(List),
            lists:foreach(fun(Index) ->
                array:set(Index, (get({List, '$class'})):get(List, Index), TextArray)
            end, lists:seq(0, Size - 1)),
            put({This, textArrayP}, TextArray);
            false ->
            put({This, textArrayP}, get({'StringUtil':getInstance(), 'ONE_EMPTY_STRING_ARRAY'}))
        end,
        put({This, myFontProcessor}, get({This, updateMyFontProcessor})).

getTextArray(This) ->
        get({This, textArrayP}).

getFontHeight(This) ->
        get({This, fontHeight}).

