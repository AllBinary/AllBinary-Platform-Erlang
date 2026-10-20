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
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.visual.dhtml.html.HtmlTag

-module('HtmlCell').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('HtmlTag', Function, Arguments).

init_fields(This) ->
    put({This, 'END'}, ">"),
    put({This, 'START'}, "<td "),
    put({This, 'ENDTAG'}, "</td>"),
    put({This, 'HEIGHT'}, "height"),
    put({This, 'WIDTH'}, "width"),
    put({This, height}, undefined),
    put({This, width}, undefined),
    put({This, before}, undefined),
    put({This, body}, undefined),
    put({This, 'after'}, undefined),
    ok.


new(Before, Width, Height, After) when (is_list(Before) orelse Before =:= undefined), (is_list(Width) orelse Width =:= undefined), (is_list(Height) orelse Height =:= undefined), (is_list(After) orelse After =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Before, Width, Height, After),
    This.

'$init'(This, Before, Width, Height, After) when (is_list(Before) orelse Before =:= undefined), (is_list(Width) orelse Width =:= undefined), (is_list(Height) orelse Height =:= undefined), (is_list(After) orelse After =:= undefined) ->
    'HtmlTag':'$init'(This),
    init_fields(This),
        put({This, before}, allbinary_java:to_string(Before)),
        put({This, 'after'}, allbinary_java:to_string(After)),
        put({This, height}, allbinary_java:to_string(Height)),
        put({This, width}, allbinary_java:to_string(Width)),
        (get({This, '$class'})):addAttribute(This, get({This, 'HEIGHT'}), get({This, height})),
        (get({This, '$class'})):addAttribute(This, get({This, 'WIDTH'}), get({This, width})).

addText(This, Body) when (is_list(Body) orelse Body =:= undefined) ->
        put({This, body}, Body).

toString(This) ->
        StringUtil = 'StringUtil':getInstance(),
        put({local, result}, get({StringUtil, 'EMPTY_STRING'})),
        AttributeKeys = (fun(Target_N66543) -> (get({Target_N66543, '$class'})):toArray(Target_N66543) end)((get({get({This, otherAttributes}), '$class'})):keySet(get({This, otherAttributes}))),
        AttributeSize = array:size(AttributeKeys),
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
        put({local, result}, lists:concat([get({local, result}), get({This, body})])),
        put({local, result}, lists:concat([get({local, result}), get({This, 'ENDTAG'})])),
        put({local, result}, lists:concat([get({local, result}), get({This, 'after'})])),
        get({local, result}).

