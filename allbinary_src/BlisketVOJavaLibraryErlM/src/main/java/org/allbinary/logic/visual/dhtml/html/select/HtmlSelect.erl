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
% package org.allbinary.logic.visual.dhtml.html.select
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.io.LineReader
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.visual.dhtml.html.HtmlTag

-module('HtmlSelect').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('HtmlTag', Function, Arguments).

init_fields(This) ->
    put({This, 'END'}, ">"),
    put({This, 'STARTSELECT'}, "<SELECT "),
    put({This, 'ENDSELECT'}, "</SELECT>"),
    put({This, 'SIZE'}, "SIZE=\""),
    put({This, 'NAME'}, "NAME=\""),
    put({This, 'STARTOPTION'}, "<OPTION"),
    put({This, 'SELETED'}, "SELECTED"),
    put({This, 'ENDOPTION'}, "</OPTION>"),
    put({This, before}, undefined),
    put({This, name}, undefined),
    put({This, 'after'}, undefined),
    put({This, size}, undefined),
    put({This, selected}, undefined),
    put({This, options}, undefined),
    put({This, multiple}, "multiple"),
    put({This, isMultipleSelect}, false),
    ok.


new(Before, Size, Name, After) when (is_list(Before) orelse Before =:= undefined), (is_list(Size) orelse Size =:= undefined), (is_list(Name) orelse Name =:= undefined), (is_list(After) orelse After =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Before, Size, Name, After),
    This.

'$init'(This, Before, Size, Name, After) when (is_list(Before) orelse Before =:= undefined), (is_list(Size) orelse Size =:= undefined), (is_list(Name) orelse Name =:= undefined), (is_list(After) orelse After =:= undefined) ->
    'HtmlTag':'$init'(This),
    init_fields(This),
        put({This, before}, Before),
        put({This, size}, Size),
        put({This, name}, Name),
        put({This, 'after'}, After),
        put({This, options}, 'BasicArrayListD':new()).

addOption(This, Key) when (is_list(Key) orelse Key =:= undefined) ->
        (get({get({This, options}), '$class'})):add(get({This, options}), Key).

addOptions(This, FileName) when (is_list(FileName) orelse FileName =:= undefined) ->
        try
            LineReader = 'LineReader':new(FileName),
            (fun Loop() -> case (get({LineReader, '$class'})):hasNext(LineReader) of true ->
                Option = (get({LineReader, '$class'})):next(LineReader),
                (get({This, '$class'})):addOption(This, Option),
                Loop();
            false -> ok end end)()
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({This, '$class'})):addOption(This, "Error")
        end.

setSelected(This, Selected) when (is_list(Selected) orelse Selected =:= undefined) ->
        put({This, selected}, Selected).

isMultiple(This) ->
        get({This, isMultipleSelect}).

setMultiple(This, Value) when is_boolean(Value) ->
        put({This, isMultipleSelect}, Value).

getOptions(This) ->
        StringUtil = 'StringUtil':getInstance(),
        put({local, result}, get({StringUtil, 'EMPTY_STRING'})),
        OptionsArray = (get({get({This, options}), '$class'})):toArray(get({This, options})),
        OptionsSize = array:size(OptionsArray),
        lists:foreach(fun(I) ->
            Value = array:get(I, OptionsArray),
            case ((Value =/= undefined) andalso ((get({Value, '$class'})):compareTo(Value, get({StringUtil, 'EMPTY_STRING'})) =/= 0)) of
                true ->
                put({local, result}, lists:concat([get({local, result}), get({This, 'STARTOPTION'})])),
                put({local, result}, lists:concat([get({local, result}), get({This, 'END'})])),
                put({local, result}, lists:concat([get({local, result}), Value])),
                put({local, result}, lists:concat([get({local, result}), get({This, 'ENDOPTION'})]));
                false -> ok
            end
        end, lists:seq(0, OptionsSize - 1)),
        get({local, result}).

toString(This) ->
        StringUtil = 'StringUtil':getInstance(),
        put({local, result}, get({StringUtil, 'EMPTY_STRING'})),
        AttributeKeys = (fun(Target_N67741) -> (get({Target_N67741, '$class'})):toArray(Target_N67741) end)((get({get({This, otherAttributes}), '$class'})):keySet(get({This, otherAttributes}))),
        AttributeSize = array:size(AttributeKeys),
        put({local, result}, get({This, before})),
        put({local, result}, lists:concat([get({local, result}), get({This, 'STARTSELECT'})])),
        put({local, result}, lists:concat([get({local, result}), get({This, 'NAME'})])),
        put({local, result}, lists:concat([get({local, result}), get({This, name})])),
        put({local, result}, lists:concat([get({local, result}), "\" "])),
        put({local, result}, lists:concat([get({local, result}), get({This, 'SIZE'})])),
        put({local, result}, lists:concat([get({local, result}), get({This, size})])),
        put({local, result}, lists:concat([get({local, result}), "\" "])),
        lists:foreach(fun(I) ->
            Key = array:get(I, AttributeKeys),
            Value = (get({get({This, otherAttributes}), '$class'})):get(get({This, otherAttributes}), Key),
            case ((Value =/= undefined) andalso ((get({Value, '$class'})):compareTo(Value, get({StringUtil, 'EMPTY_STRING'})) =/= 0)) of
                true ->
                put({local, result}, lists:concat([get({local, result}), Key])),
                put({local, result}, lists:concat([get({local, result}), "=\""])),
                put({local, result}, lists:concat([get({local, result}), Value])),
                put({local, result}, lists:concat([get({local, result}), "\" "]));
                false -> ok
            end
        end, lists:seq(0, AttributeSize - 1)),
        case (get({This, '$class'})):isMultiple(This) of
            true ->
            put({local, result}, lists:concat([get({local, result}), lists:concat([lists:concat([" ", get({This, multiple})]), " "])]));
            false -> ok
        end,
        put({local, result}, lists:concat([get({local, result}), get({This, 'END'})])),
        put({local, result}, lists:concat([get({local, result}), (get({This, '$class'})):getOptions(This)])),
        put({local, result}, lists:concat([get({local, result}), get({This, 'ENDSELECT'})])),
        put({local, result}, lists:concat([get({local, result}), get({This, 'after'})])),
        get({local, result}).

