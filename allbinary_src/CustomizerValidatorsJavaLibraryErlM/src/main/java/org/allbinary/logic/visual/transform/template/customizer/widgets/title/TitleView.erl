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
% package org.allbinary.logic.visual.transform.template.customizer.widgets.title
% import java.util.HashMap
% import org.allbinary.data.tree.dom.DomData
% import org.allbinary.data.tree.dom.DomNodeHelper
% import org.allbinary.data.tree.dom.DomNodeInterface
% import org.allbinary.data.tree.dom.DomSearchHelper
% import org.allbinary.data.tree.dom.ModDomHelper
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringValidationUtil
% import org.allbinary.string.CommonStrings
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('TitleView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements DomNodeInterface

static_init() ->
    put({?MODULE, 'NAME'}, "None"),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, title}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        put({This, title}, get({'TitleView', 'NAME'})).

new(Node) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Node),
    This;
new(HashMap) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, HashMap),
    This.

init(This, Node) ->
    init_fields(This),
        TitleTextNode = 'DomSearchHelper':getNode(get({'TitleData':getInstance(), 'TEXT'}), (get({Node, '$class'})):getChildNodes(Node)),
        ValueNode = 'DomSearchHelper':getNode(get({'DomData', 'VALUE'}), (get({TitleTextNode, '$class'})):getChildNodes(TitleTextNode)),
        put({This, title}, 'DomNodeHelper':getTextNodeValue(ValueNode)),
        case (fun(Target_N66431) -> (get({Target_N66431, '$class'})):isEmpty(Target_N66431, get({This, title})) end)('StringValidationUtil':getInstance()) of
            true ->
            put({This, title}, get({'TitleView', 'NAME'}));
            false -> ok
        end,
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Title: ", (get({This, '$class'})):getTitle(This)]), This, "Consructor()");
            false -> ok
        end;
init(This, HashMap) ->
    init_fields(This),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["HashMap: ", (get({HashMap, '$class'})):toString(HashMap)]), This, get({get({This, commonStrings}), 'CONSTRUCTOR'}));
            false -> ok
        end,
        (get({This, '$class'})):getFormData(This, HashMap).


getTitle(This) ->
        get({This, title}).

getFormData(This, HashMap) ->
        put({This, title}, (get({HashMap, '$class'})):get(HashMap, get({'TitleData':getInstance(), 'TEXT'}))),
        case (fun(Target_N67231) -> (get({Target_N67231, '$class'})):isEmpty(Target_N67231, get({This, title})) end)('StringValidationUtil':getInstance()) of
            true ->
            put({This, title}, get({'TitleView', 'NAME'}));
            false -> ok
        end.

toHashMap(This) ->
        HashMap = (fun(Target_N67369) -> (get({Target_N67369, '$class'})):createHashMap(Target_N67369) end)('StdUtil':getInstance()),
        (get({HashMap, '$class'})):put(HashMap, get({'TitleData':getInstance(), 'TEXT'}), (get({This, '$class'})):getTitle(This)),
        HashMap.

% throws Exception
toXmlNode(This, Document) ->
        HashMap = (get({This, '$class'})):toHashMap(This),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["TitleView HashMap: ", (get({HashMap, '$class'})):toString(HashMap)]), This, "toXmlNode()");
            false -> ok
        end,
        'ModDomHelper':createNameValueNodes(Document, get({'TitleData':getInstance(), 'NAME'}), HashMap).

