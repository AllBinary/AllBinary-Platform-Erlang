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

-module('HtmlRow').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('HtmlTag', Function, Arguments).

init_fields(This) ->
    put({This, 'END'}, ">"),
    put({This, 'START'}, "<tr "),
    put({This, 'ENDTAG'}, "</tr>"),
    put({This, numberOfColumns}, 0),
    put({This, before}, undefined),
    put({This, 'after'}, undefined),
    put({This, htmlCellsVector}, undefined),
    ok.


new(Before, After) when (is_list(Before) orelse Before =:= undefined), (is_list(After) orelse After =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Before, After),
    This.

'$init'(This, Before, After) when (is_list(Before) orelse Before =:= undefined), (is_list(After) orelse After =:= undefined) ->
    'HtmlTag':'$init'(This),
    init_fields(This),
        put({This, before}, allbinary_java:to_string(Before)),
        put({This, 'after'}, allbinary_java:to_string(After)),
        put({This, htmlCellsVector}, 'BasicArrayListD':new()).

addCell(This, HtmlCell) ->
        (get({get({This, htmlCellsVector}), '$class'})):add(get({This, htmlCellsVector}), HtmlCell),
        put({This, numberOfColumns}, get({This, numberOfColumns}) + 1).

getNumberOfColumns(This) ->
        get({This, numberOfColumns}).

toString(This) ->
        StringUtil = 'StringUtil':getInstance(),
        put({local, result}, get({StringUtil, 'EMPTY_STRING'})),
        AttributeKeys = (fun(Target_N66417) -> (get({Target_N66417, '$class'})):toArray(Target_N66417) end)((get({get({This, otherAttributes}), '$class'})):keySet(get({This, otherAttributes}))),
        AttributeSize = array:size(AttributeKeys),
        CellSize = (get({get({This, htmlCellsVector}), '$class'})):size(get({This, htmlCellsVector})),
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
        end, lists:seq(0, AttributeSize - 1)),
        put({local, result}, lists:concat([get({local, result}), get({This, 'END'})])),
        lists:foreach(fun(I) ->
            put({local, result}, lists:concat([get({local, result}), (fun(Target_N67041) -> (get({Target_N67041, '$class'})):toString(Target_N67041) end)((get({get({This, htmlCellsVector}), '$class'})):get(get({This, htmlCellsVector}), I))])),
            put({local, result}, lists:concat([get({local, result}), " "]))
        end, lists:seq(0, CellSize - 1)),
        put({local, result}, lists:concat([get({local, result}), get({This, 'ENDTAG'})])),
        put({local, result}, lists:concat([get({local, result}), get({This, 'after'})])),
        get({local, result}).

