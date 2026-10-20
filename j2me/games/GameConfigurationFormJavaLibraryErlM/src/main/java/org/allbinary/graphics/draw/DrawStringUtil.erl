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
% package org.allbinary.graphics.draw
% import javax.microedition.lcdui.Font
% import javax.microedition.lcdui.Graphics
% import org.allbinary.AndroidUtil
% import org.allbinary.J2MEUtil
% import org.allbinary.graphics.Anchor
% import org.allbinary.graphics.opengles.OpenGLFeatureUtil
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil

-module('DrawStringUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'DrawStringUtil':new()),
    ok.

init_fields(This) ->
    put({This, 'EMPTY_STRING'}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
    put({This, anchor}, get({'Anchor', 'TOP_LEFT'})),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'DrawStringUtil', instance}).

drawCenterString(This, Graphics, String, Offset, Length, X, Y) when (is_list(String) orelse String =:= undefined), is_integer(Offset), is_integer(Length), is_integer(X), is_integer(Y) ->
        Width = (((fun(Target_N66093) -> (get({Target_N66093, '$class'})):substringWidth(Target_N66093, String, Offset, Length) end)((get({Graphics, '$class'})):getFont(Graphics)) bsr 1)),
        try
            (get({Graphics, '$class'})):drawSubstring(Graphics, String, Offset, Length, (X - Width), Y, get({This, anchor}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            'PreLogUtil':put((fun(Target_N66293) -> (get({Target_N66293, '$class'})):toString(Target_N66293) end)((fun(Target_N66300) -> (get({Target_N66300, '$class'})):appendint(Target_N66300, Length) end)((fun(Target_N66307) -> (get({Target_N66307, '$class'})):append(Target_N66307, " currentLength: ") end)((fun(Target_N66314) -> (get({Target_N66314, '$class'})):appendint(Target_N66314, Offset) end)((fun(Target_N66321) -> (get({Target_N66321, '$class'})):append(Target_N66321, " offset: ") end)((fun(Target_N66328) -> (get({Target_N66328, '$class'})):appendint(Target_N66328, string:length(String)) end)((fun(Target_N66335) -> (get({Target_N66335, '$class'})):append(Target_N66335, "Exception: stringLength: ") end)('StringMaker':new()))))))), This, "drawCenterString")
        end.

drawCenterStrings(This, Graphics, StringArray, MaxWidth, CharHeight, X, Y) when (is_tuple(StringArray) orelse StringArray =:= undefined), is_integer(MaxWidth), is_integer(CharHeight), is_integer(X), is_integer(Y) ->
        put({local, extraLines}, 0),
        lists:foreach(fun(Index) ->
            String = array:get(Index, StringArray),
            case (String =/= get({This, 'EMPTY_STRING'})) of
                true ->
                Width = (fun(Target_N66715) -> (get({Target_N66715, '$class'})):stringWidth(Target_N66715, String) end)((get({Graphics, '$class'})):getFont(Graphics)),
                put({local, minTotalLines}, 1),
                case (Width > MaxWidth) of
                    true ->
                    put({local, minTotalLines}, (((Width div MaxWidth)) + 1));
                    false -> ok
                end,
                LinePortion = (string:length(String) div get({local, minTotalLines})),
                put({local, offset}, 0),
                put({local, currentLength}, LinePortion),
                Size = string:length(String),
                (fun Loop() -> case (get({local, offset}) < Size) of true ->
                    case ((get({local, offset}) + get({local, currentLength})) > Size) of
                        true ->
                        put({local, currentLength}, (Size - get({local, offset})));
                        false -> ok
                    end,
                    case ((get({local, offset}) + get({local, currentLength})) =/= Size) of
                        true ->
                        (fun Loop() -> case ((get({local, currentLength}) > 0) andalso ((fun(Target_N67214) -> (get({Target_N67214, '$class'})):charAt(Target_N67214, (get({local, offset}) + get({local, currentLength}))) end)(array:get(Index, StringArray)) =/= $\s)) of true ->
                            put({local, currentLength}, get({local, currentLength}) - 1),
                            Loop();
                        false -> ok end end)(),
                        case (get({local, currentLength}) =< 4) of
                            true ->
                            put({local, currentLength}, LinePortion);
                            false -> ok
                        end;
                        false -> ok
                    end,
                    (get({This, '$class'})):drawCenterString(This, Graphics, String, get({local, offset}), get({local, currentLength}), X, (Y + ((((Index + allbinary_java:first(get({local, extraLines}), put({local, extraLines}, get({local, extraLines}) + 1)))) * CharHeight)))),
                    put({local, offset}, (get({local, offset}) + get({local, currentLength}))),
                    put({local, currentLength}, LinePortion),
                    Loop();
                false -> ok end end)(),
                put({local, extraLines}, get({local, extraLines}) - 1);
                false -> ok
            end
        end, lists:seq(0, array:size(StringArray) - 1)).

