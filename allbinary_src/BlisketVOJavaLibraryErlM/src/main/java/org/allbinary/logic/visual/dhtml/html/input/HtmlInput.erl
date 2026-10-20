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
% package org.allbinary.logic.visual.dhtml.html.input
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.visual.dhtml.html.HtmlTag

-module('HtmlInput').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('HtmlTag', Function, Arguments).

init_fields(This) ->
    put({This, 'END'}, ">"),
    put({This, 'STARTINPUT'}, "<INPUT "),
    put({This, 'ENDINPUT'}, "</INPUT>"),
    put({This, 'TYPE'}, "TYPE=\""),
    put({This, 'NAME'}, "NAME=\""),
    put({This, before}, undefined),
    put({This, type}, undefined),
    put({This, name}, undefined),
    put({This, 'after'}, undefined),
    ok.


new(Before, Type, Name, After) when (is_list(Before) orelse Before =:= undefined), (is_list(Type) orelse Type =:= undefined), (is_list(Name) orelse Name =:= undefined), (is_list(After) orelse After =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Before, Type, Name, After),
    This.

'$init'(This, Before, Type, Name, After) when (is_list(Before) orelse Before =:= undefined), (is_list(Type) orelse Type =:= undefined), (is_list(Name) orelse Name =:= undefined), (is_list(After) orelse After =:= undefined) ->
    'HtmlTag':'$init'(This),
    init_fields(This),
        put({This, before}, Before),
        put({This, type}, Type),
        put({This, name}, Name),
        put({This, 'after'}, After).

toString(This) ->
        StringUtil = 'StringUtil':getInstance(),
        put({local, result}, get({StringUtil, 'EMPTY_STRING'})),
        AttributeKeys = (fun(Target_N66306) -> (get({Target_N66306, '$class'})):toArray(Target_N66306) end)((get({get({This, otherAttributes}), '$class'})):keySet(get({This, otherAttributes}))),
        AttributeSize = array:size(AttributeKeys),
        put({local, result}, get({This, before})),
        put({local, result}, lists:concat([get({local, result}), get({This, 'STARTINPUT'})])),
        put({local, result}, lists:concat([get({local, result}), get({This, 'TYPE'})])),
        put({local, result}, lists:concat([get({local, result}), get({This, type})])),
        put({local, result}, lists:concat([get({local, result}), "\" "])),
        put({local, result}, lists:concat([get({local, result}), get({This, 'NAME'})])),
        put({local, result}, lists:concat([get({local, result}), get({This, name})])),
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
        put({local, result}, lists:concat([get({local, result}), get({This, 'END'})])),
        put({local, result}, lists:concat([get({local, result}), get({This, 'ENDINPUT'})])),
        put({local, result}, lists:concat([get({local, result}), get({This, 'after'})])),
        get({local, result}).

