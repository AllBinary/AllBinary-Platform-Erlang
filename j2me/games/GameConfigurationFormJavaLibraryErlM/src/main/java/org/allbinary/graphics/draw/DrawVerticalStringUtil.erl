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

-module('DrawVerticalStringUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'DrawVerticalStringUtil':new()),
    ok.

init_fields(This) ->
    put({This, 'EMPTY_STRING'}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
    put({This, anchor}, get({'Anchor', 'TOP_LEFT'})),
    put({This, charHeight}, 0),
    put({This, offsetY}, 0),
    put({This, offsetXArray}, get({'NullUtil':getInstance(), 'NULL_INT_ARRAY'})),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'DrawVerticalStringUtil', instance}).

updateMeasurement(This, Graphics, String) when (is_list(String) orelse String =:= undefined) ->
        OpenGLFeatureUtil = 'OpenGLFeatureUtil':getInstance(),
        Font = (get({Graphics, '$class'})):getFont(Graphics),
        put({This, charHeight}, (get({Font, '$class'})):getHeight(Font)),
        put({This, offsetY}, 0),
        case 'J2MEUtil':isHTML() of
            true ->
            put({This, charHeight}, (get({This, charHeight}) + 1));
            false ->
            case (get({OpenGLFeatureUtil, '$class'})):isAnyThreed(OpenGLFeatureUtil) of
            true ->
            put({This, charHeight}, (get({This, charHeight}) + 2)),
            case 'AndroidUtil':isAndroid() of
                true ->
                ok;
                false ->
                put({This, offsetY}, (2 + (((get({This, charHeight}) * 2) div 3))))
            end;
            false -> ok
        end
        end,
        Size = string:length(String),
        put({local, aChar}, 0),
        OffsetXArray = array:new(Size, {default, 0}),
        lists:foreach(fun(Index) ->
            put({local, aChar}, lists:nth((Index) + 1, String)),
            case (get({OpenGLFeatureUtil, '$class'})):isAnyThreed(OpenGLFeatureUtil) of
                true ->
                array:set(Index, ((get({Font, '$class'})):charWidth(Font, get({local, aChar})) / 2), OffsetXArray);
                false -> ok
            end
        end, lists:seq((Size - 1), 0, -1)),
        put({This, offsetXArray}, OffsetXArray).

paintVerticle(This, Graphics, String, X, Y, Anchor) when (is_list(String) orelse String =:= undefined), is_integer(X), is_integer(Y), is_integer(Anchor) ->
        Size = string:length(String),
        put({local, aChar}, 0),
        lists:foreach(fun(Index) ->
            put({local, aChar}, lists:nth((Index) + 1, String)),
            (get({Graphics, '$class'})):drawChar(Graphics, get({local, aChar}), (X + array:get(Index, get({This, offsetXArray}))), ((Y + ((get({This, charHeight}) * Index))) + get({This, offsetY})), Anchor)
        end, lists:seq((Size - 1), 0, -1)).

drawCenterString(This, Graphics, String, Offset, Length, X, Y) when (is_list(String) orelse String =:= undefined), is_integer(Offset), is_integer(Length), is_integer(X), is_integer(Y) ->
        Width = (((fun(Target_N67461) -> (get({Target_N67461, '$class'})):substringWidth(Target_N67461, String, Offset, Length) end)((get({Graphics, '$class'})):getFont(Graphics)) bsr 1)),
        try
            (get({Graphics, '$class'})):drawSubstring(Graphics, String, Offset, Length, (X - Width), Y, get({This, anchor}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            'PreLogUtil':put((fun(Target_N67661) -> (get({Target_N67661, '$class'})):toString(Target_N67661) end)((fun(Target_N67668) -> (get({Target_N67668, '$class'})):appendint(Target_N67668, Length) end)((fun(Target_N67675) -> (get({Target_N67675, '$class'})):append(Target_N67675, " currentLength: ") end)((fun(Target_N67682) -> (get({Target_N67682, '$class'})):appendint(Target_N67682, Offset) end)((fun(Target_N67689) -> (get({Target_N67689, '$class'})):append(Target_N67689, " offset: ") end)((fun(Target_N67696) -> (get({Target_N67696, '$class'})):appendint(Target_N67696, string:length(String)) end)((fun(Target_N67703) -> (get({Target_N67703, '$class'})):append(Target_N67703, "Exception: stringLength: ") end)('StringMaker':new()))))))), This, "drawCenterString")
        end.

drawCenterStrings(This, Graphics, StringArray, MaxWidth, X, Y) when (is_tuple(StringArray) orelse StringArray =:= undefined), is_integer(MaxWidth), is_integer(X), is_integer(Y) ->
        put({local, extraLines}, 0),
        lists:foreach(fun(Index) ->
            String = array:get(Index, StringArray),
            case (String =/= get({This, 'EMPTY_STRING'})) of
                true ->
                Width = (fun(Target_N68083) -> (get({Target_N68083, '$class'})):stringWidth(Target_N68083, String) end)((get({Graphics, '$class'})):getFont(Graphics)),
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
                        (fun Loop() -> case ((get({local, currentLength}) > 0) andalso ((fun(Target_N68582) -> (get({Target_N68582, '$class'})):charAt(Target_N68582, (get({local, offset}) + get({local, currentLength}))) end)(array:get(Index, StringArray)) =/= $\s)) of true ->
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
                    (get({This, '$class'})):drawCenterString(This, Graphics, String, get({local, offset}), get({local, currentLength}), X, (Y + ((((Index + allbinary_java:first(get({local, extraLines}), put({local, extraLines}, get({local, extraLines}) + 1)))) * get({This, charHeight}))))),
                    put({local, offset}, (get({local, offset}) + get({local, currentLength}))),
                    put({local, currentLength}, LinePortion),
                    Loop();
                false -> ok end end)(),
                put({local, extraLines}, get({local, extraLines}) - 1);
                false -> ok
            end
        end, lists:seq(0, array:size(StringArray) - 1)).

