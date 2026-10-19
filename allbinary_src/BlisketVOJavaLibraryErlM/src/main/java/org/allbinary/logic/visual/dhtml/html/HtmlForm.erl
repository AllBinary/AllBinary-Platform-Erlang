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
% package org.allbinary.logic.visual.dhtml.html
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.visual.dhtml.html.input.HtmlInput
% import org.allbinary.logic.visual.dhtml.html.table.HtmlTable

-module('HtmlForm').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, 'FORMBEGIN'}, "<form "),
    put({This, 'END'}, ">"),
    put({This, 'FORMEND'}, "</form>"),
    put({This, 'ACTION'}, "ACTION=\""),
    put({This, 'GET'}, "GET\""),
    put({This, 'POST'}, "POST\""),
    put({This, 'METHODS'}, array:from_list([get({This, 'GET'}), get({This, 'POST'})])),
    put({This, 'METHOD'}, "METHOD=\""),
    put({This, method}, undefined),
    put({This, action}, undefined),
    put({This, inputs}, undefined),
    ok.


new(Action) when (is_list(Action) orelse Action =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Action),
    This.

init(This, Action) when (is_list(Action) orelse Action =:= undefined) ->
    init_fields(This),
        put({This, action}, Action),
        put({This, inputs}, 'BasicArrayListD':new()).

setPost(This) ->
        put({This, method}, get({This, 'POST'})).

setGet(This) ->
        put({This, method}, get({This, 'GET'})).

addInput(This, HtmlInput) ->
        (get({get({This, inputs}), '$class'})):add(get({This, inputs}), HtmlInput).

addTable(This, HtmlTable) ->
        (get({get({This, inputs}), '$class'})):add(get({This, inputs}), HtmlTable).

toString(This) ->
        StringUtil = 'StringUtil':getInstance(),
        put({local, result}, get({StringUtil, 'EMPTY_STRING'})),
        InputArray = (get({get({This, inputs}), '$class'})):toArray(get({This, inputs})),
        InputSize = array:size(InputArray),
        put({local, result}, get({This, 'FORMBEGIN'})),
        put({local, result}, lists:concat([get({local, result}), get({This, 'METHOD'})])),
        put({local, result}, lists:concat([get({local, result}), get({This, method})])),
        put({local, result}, lists:concat([get({local, result}), "\" "])),
        put({local, result}, lists:concat([get({local, result}), get({This, 'ACTION'})])),
        put({local, result}, lists:concat([get({local, result}), get({This, action})])),
        put({local, result}, lists:concat([get({local, result}), "\" "])),
        put({local, result}, lists:concat([get({local, result}), get({This, 'END'})])),
        lists:foreach(fun(I) ->
            put({local, result}, lists:concat([get({local, result}), (fun(Target_N67005) -> (get({Target_N67005, '$class'})):toString(Target_N67005) end)(array:get(I, InputArray))])),
            put({local, result}, lists:concat([get({local, result}), " "]))
        end, lists:seq(0, InputSize - 1)),
        put({local, result}, lists:concat([get({local, result}), get({This, 'FORMEND'})])),
        get({local, result}).

