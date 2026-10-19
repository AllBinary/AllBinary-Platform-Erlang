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
% package org.allbinary.logic.visual.dhtml.html.table
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.visual.dhtml.html.HtmlTag
% import org.allbinary.string.CommonPhoneStrings

-module('HtmlTable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('HtmlTag', Function, Arguments).

init_fields(This) ->
    put({This, 'END'}, ">"),
    put({This, 'START'}, "<table "),
    put({This, 'ENDTAG'}, "</table>"),
    put({This, 'CLASS'}, "class"),
    put({This, 'DIRECTION'}, "dir"),
    put({This, 'ID'}, "id"),
    put({This, 'LANG'}, "lang"),
    put({This, 'UNITS'}, "units"),
    put({This, 'BORDER'}, "border"),
    put({This, 'CELLPADDING'}, "cellpadding"),
    put({This, 'CELLSPACING'}, "cellspacing"),
    put({This, 'COLS'}, "cols"),
    put({This, 'FLOAT'}, "float"),
    put({This, 'FRAME'}, "frame"),
    put({This, 'RULES'}, "rules"),
    put({This, 'STYLE'}, "style"),
    put({This, 'BORDERCOLLAPSE'}, "border-collapse: collapse"),
    put({This, numberOfColumns}, 0),
    put({This, before}, undefined),
    put({This, border}, undefined),
    put({This, cellpadding}, undefined),
    put({This, cellspacing}, undefined),
    put({This, style}, undefined),
    put({This, name}, undefined),
    put({This, 'after'}, undefined),
    put({This, htmlRowsVector}, undefined),
    ok.


new(Before, Cellpadding, Cellspacing, After) when (is_list(Before) orelse Before =:= undefined), (is_list(Cellpadding) orelse Cellpadding =:= undefined), (is_list(Cellspacing) orelse Cellspacing =:= undefined), (is_list(After) orelse After =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Before, Cellpadding, Cellspacing, After),
    This.

init(This, Before, Cellpadding, Cellspacing, After) when (is_list(Before) orelse Before =:= undefined), (is_list(Cellpadding) orelse Cellpadding =:= undefined), (is_list(Cellspacing) orelse Cellspacing =:= undefined), (is_list(After) orelse After =:= undefined) ->
    'HtmlTag':init(This),
    init_fields(This),
        put({This, before}, Before),
        put({This, cellpadding}, Cellpadding),
        put({This, cellspacing}, Cellspacing),
        put({This, 'after'}, After),
        put({This, htmlRowsVector}, 'BasicArrayListD':new()),
        (get({This, '$class'})):addAttribute(This, get({This, 'BORDER'}), get({'CommonPhoneStrings':getInstance(), 'ZERO'})),
        (get({This, '$class'})):addAttribute(This, get({This, 'CELLPADDING'}), get({This, cellpadding})),
        (get({This, '$class'})):addAttribute(This, get({This, 'CELLSPACING'}), get({This, cellspacing})),
        (get({This, '$class'})):addAttribute(This, get({This, 'STYLE'}), get({This, 'BORDERCOLLAPSE'})).

addRow(This, HtmlRow) ->
        case (get({This, numberOfColumns}) < (get({HtmlRow, '$class'})):getNumberOfColumns(HtmlRow)) of
            true ->
            put({This, numberOfColumns}, (get({HtmlRow, '$class'})):getNumberOfColumns(HtmlRow));
            false -> ok
        end,
        (get({get({This, htmlRowsVector}), '$class'})):add(get({This, htmlRowsVector}), HtmlRow).

toString(This) ->
        StringUtil = 'StringUtil':getInstance(),
        put({local, result}, get({StringUtil, 'EMPTY_STRING'})),
        AttributeKeys = (fun(Target_N67364) -> (get({Target_N67364, '$class'})):toArray(Target_N67364) end)((get({get({This, otherAttributes}), '$class'})):keySet(get({This, otherAttributes}))),
        put({local, result}, get({This, before})),
        put({local, result}, lists:concat([get({local, result}), get({This, 'START'})])),
        put({local, result}, lists:concat([get({local, result}), " "])),
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
        end, lists:seq(0, array:size(AttributeKeys) - 1)),
        put({local, result}, lists:concat([get({local, result}), get({This, 'END'})])),
        Size = (get({get({This, htmlRowsVector}), '$class'})):size(get({This, htmlRowsVector})),
        lists:foreach(fun(I) ->
            put({local, result}, lists:concat([get({local, result}), (fun(Target_N67964) -> (get({Target_N67964, '$class'})):toString(Target_N67964) end)((get({get({This, htmlRowsVector}), '$class'})):get(get({This, htmlRowsVector}), I))])),
            put({local, result}, lists:concat([get({local, result}), " "]))
        end, lists:seq(0, Size - 1)),
        put({local, result}, lists:concat([get({local, result}), get({This, 'ENDTAG'})])),
        put({local, result}, lists:concat([get({local, result}), get({This, 'after'})])),
        get({local, result}).

