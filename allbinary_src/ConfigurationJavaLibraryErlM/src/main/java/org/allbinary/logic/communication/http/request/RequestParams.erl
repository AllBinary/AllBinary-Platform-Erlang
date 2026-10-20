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
% package org.allbinary.logic.communication.http.request
% import java.util.HashMap
% import java.util.Map
% import java.util.Set
% import javax.servlet.http.HttpServletRequest
% import javax.servlet.jsp.PageContext
% import org.allbinary.data.tree.dom.ModDomHelper
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonStrings
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('RequestParams').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, map}, undefined),
    put({This, 'KEY'}, "Key: "),
    put({This, 'VALUE'}, " Value: "),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "New RequestParams Size: 0", This, get({get({This, commonStrings}), 'CONSTRUCTOR'})).

new(Request) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Request),
    This;
new(PageContext) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, PageContext),
    This.

'$init'(This, Request) ->
    init_fields(This),
        put({This, map}, (get({Request, '$class'})):getParameterMap(Request)),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["RequestParams Size: ", (fun(Target_N66186) -> (get({Target_N66186, '$class'})):size(Target_N66186) end)((fun(Target_N66193) -> (get({Target_N66193, '$class'})):keySet(Target_N66193) end)((get({This, '$class'})):getMap(This)))]), This, get({get({This, commonStrings}), 'CONSTRUCTOR'}));
'$init'(This, PageContext) ->
    init_fields(This),
        put({This, map}, (fun(Target_N66299) -> (get({Target_N66299, '$class'})):getParameterMap(Target_N66299) end)((get({PageContext, '$class'})):getRequest(PageContext))),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Request Params Size: ", (fun(Target_N66356) -> (get({Target_N66356, '$class'})):size(Target_N66356) end)((fun(Target_N66363) -> (get({Target_N66363, '$class'})):keySet(Target_N66363) end)((get({This, '$class'})):getMap(This)))]), This, get({get({This, commonStrings}), 'CONSTRUCTOR'})).


setMap(This, Map) ->
        put({This, map}, Map).

getMap(This) ->
        get({This, map}).

toXmlNode(This, Document) ->
        try
            Node = (get({Document, '$class'})):createElement(Document, get({'RequestData', 'REQUEST'})),
            StringBuffer = 'StringMaker':new(),
            Keys = (get({get({This, map}), '$class'})):keySet(get({This, map})),
            KeyArray = (get({Keys, '$class'})):toArray(Keys),
            Size = array:size(KeyArray),
            lists:foreach(fun(I) ->
                Key = array:get(I, KeyArray),
                Values = (get({get({This, map}), '$class'})):get(get({This, map}), Key),
                (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'KEY'})),
                (get({StringBuffer, '$class'})):append(StringBuffer, Key),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'VALUE'})),
                (get({StringBuffer, '$class'})):append(StringBuffer, array:get(0, Values)),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "toXmlNode(document)"),
                (get({Node, '$class'})):appendChild(Node, 'ModDomHelper':createNameValueNodes(Document, get({'RequestData', 'PARAMETER'}), allbinary_java:to_string(Key), allbinary_java:to_string(array:get(0, Values))))
            end, lists:seq(0, Size - 1)),
            Node
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "toXmlNode(document)", E),
            undefined
        end.

% throws Exception
toHashMap(This) ->
        HashMap = (fun(Target_N67662) -> (get({Target_N67662, '$class'})):createHashMap(Target_N67662) end)('StdUtil':getInstance()),
        Keys = (get({get({This, map}), '$class'})):keySet(get({This, map})),
        KeyArray = (get({Keys, '$class'})):toArray(Keys),
        Size = array:size(KeyArray),
        StringBuffer = 'StringMaker':new(),
        lists:foreach(fun(I) ->
            Key = array:get(I, KeyArray),
            Values = (get({get({This, map}), '$class'})):get(get({This, map}), Key),
            (get({HashMap, '$class'})):put(HashMap, allbinary_java:to_string(Key), allbinary_java:to_string(array:get(0, Values)))
        end, lists:seq(0, Size - 1)),
        (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
        (get({StringBuffer, '$class'})):append(StringBuffer, "RequestParams: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, map}), '$class'})):toString(get({This, map}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, "\ntoHashMap: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({HashMap, '$class'})):toString(HashMap)),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "toHashMap()"),
        HashMap.

