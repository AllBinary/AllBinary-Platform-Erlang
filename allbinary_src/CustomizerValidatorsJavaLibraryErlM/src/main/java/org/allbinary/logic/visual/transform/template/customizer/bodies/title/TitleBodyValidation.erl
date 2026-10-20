%
% AllBinary Open License Version 1
% Copyright (c) 2011 AllBinary
% 
% By agreeing to this license you and any business entity you represent are
% legally bound to the AllBinary Open License Version 1 leIIgal agreement.
% 
% You may obtain the AllBinary Open License Version 1 legal agreement from
% AllBinary or the root directory of AllBinary's AllBinary Platform repository.
% 
% Created By: Travis Berthelot
%  
% Generated Code Do Not Modify
% package org.allbinary.logic.visual.transform.template.customizer.bodies.title
% import java.util.HashMap
% import org.allbinary.data.tree.dom.DomData
% import org.allbinary.data.tree.dom.DomNodeHelper
% import org.allbinary.data.tree.dom.DomNodeInterface
% import org.allbinary.data.tree.dom.DomSearchHelper
% import org.allbinary.data.tree.dom.ModDomHelper
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.sql.AbSqlData
% import org.allbinary.logic.control.validate.Validation
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.string.StringValidationUtil
% import org.allbinary.logic.visual.transform.template.customizer.bodies.BodyData
% import org.allbinary.logic.visual.transform.template.customizer.widgets.title.TitleData
% import org.allbinary.logic.visual.transform.template.customizer.widgets.title.TitleNotRequiredValidation
% import org.w3c.dom.Document
% import org.w3c.dom.Node
% import org.w3c.dom.NodeList

-module('TitleBodyValidation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements DomNodeInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('Validation', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, body}, undefined),
    put({This, titleValidation}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'Validation':'$init'(This),
    init_fields(This),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'}));
            false -> ok
        end,
        StringUtil = 'StringUtil':getInstance(),
        put({This, body}, get({StringUtil, 'EMPTY_STRING'})),
        put({This, titleValidation}, 'TitleNotRequiredValidation':new()).

new(Document) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Document),
    This;
new(HashMap) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, HashMap),
    This.

'$init'(This, Document) ->
    'Validation':'$init'(This),
    init_fields(This),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'CONSTRUCTOR'}), This, "Constructor(document)");
            false -> ok
        end,
        NodeList = (get({Document, '$class'})):getElementsByTagName(Document, get({'BodyData':getInstance(), 'NAME'})),
        lists:foreach(fun(Index) ->
            ABodyNode = (get({NodeList, '$class'})):item(NodeList, Index),
            ABodyValueNode = 'DomSearchHelper':getNode(get({'DomData', 'VALUE'}), (get({ABodyNode, '$class'})):getChildNodes(ABodyNode)),
            put({This, body}, 'DomNodeHelper':getTextNodeValue(ABodyValueNode)),
            TitleNode = 'DomSearchHelper':getNode(get({'TitleData':getInstance(), 'NAME'}), (get({ABodyNode, '$class'})):getChildNodes(ABodyNode)),
            put({This, titleValidation}, 'TitleNotRequiredValidation':new(TitleNode)),
            case (Index > 1) of
                true ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "To Many Body Nodes", This, get({get({This, commonStrings}), 'CONSTRUCTOR'}));
                    false -> ok
                end;
                false -> ok
            end
        end, lists:seq(0, (get({NodeList, '$class'})):getLength(NodeList) - 1));
'$init'(This, HashMap) ->
    'Validation':'$init'(This),
    init_fields(This),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "Constructor(hashmap)");
            false -> ok
        end,
        (get({This, '$class'})):getFormData(This, HashMap).


% throws Exception
getFormData(This, HashMap) ->
        put({This, body}, (get({HashMap, '$class'})):get(HashMap, get({'BodyData':getInstance(), 'NAME'}))),
        put({This, titleValidation}, 'TitleNotRequiredValidation':new(HashMap)).

isValid(This) ->
        try
            put({local, isValid}, true),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "TitleBodyValidation", This, get({get({This, commonStrings}), 'IS_VALID'}));
                false -> ok
            end,
            case (not (fun(Target_N68510) -> (get({Target_N68510, '$class'})):isValidNotRequired(Target_N68510, get({This, body}), get({'BodyData':getInstance(), 'MIN'}), get({'AbSqlData', 'MAXBLOB'})) end)('StringValidationUtil':getInstance())) of
                true ->
                put({local, isValid}, false);
                false -> ok
            end,
            case (not (fun(Target_N68637) -> (get({Target_N68637, '$class'})):booleanValue(Target_N68637) end)((get({get({This, titleValidation}), '$class'})):isValid(get({This, titleValidation})))) of
                true ->
                put({local, isValid}, false);
                false -> ok
            end,
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["TitleBodyValidation: ", get({local, isValid})]), This, get({get({This, commonStrings}), 'IS_VALID'}));
                false -> ok
            end,
            get({local, isValid})
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Failed to validate form", This, get({get({This, commonStrings}), 'IS_VALID'}), E);
                false -> ok
            end,
            false
        end.

validationInfo(This) ->
        try
            StringBuffer = 'StringMaker':new(),
            begin
                (get({StringBuffer, '$class'})):append(StringBuffer, "Error: Data submitted is < "),
                (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc(get({'BodyData':getInstance(), 'MIN'}))),
                (get({StringBuffer, '$class'})):append(StringBuffer, " or > "),
                (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc(get({'AbSqlData', 'MAXBLOB'})))
            end,
            (get({StringBuffer, '$class'})):toString(StringBuffer)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEWERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Failed to generate validation error info", This, "validationInfo()", E);
                false -> ok
            end,
            "Error Validating Form"
        end.

toValidationInfoDoc(This) ->
        undefined.

toValidationInfoNode(This, Document) ->
        undefined.

% throws Exception
toXmlNode(This, Document) ->
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Title Body: ", get({This, body})]), This, "toXmlNode(document)");
            false -> ok
        end,
        Node = 'ModDomHelper':createNameValueNodes(Document, get({'BodyData':getInstance(), 'NAME'}), get({This, body})),
        (get({Node, '$class'})):appendChild(Node, (get({get({This, titleValidation}), '$class'})):toXmlNode(get({This, titleValidation}), Document)),
        Node.

