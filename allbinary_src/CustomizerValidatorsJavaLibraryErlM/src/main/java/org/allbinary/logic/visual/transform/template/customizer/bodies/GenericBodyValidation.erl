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
% package org.allbinary.logic.visual.transform.template.customizer.bodies
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
% import org.w3c.dom.Document
% import org.w3c.dom.Node
% import org.w3c.dom.NodeList

-module('GenericBodyValidation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements DomNodeInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('Validation', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, body}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'Validation':'$init'(This),
    init_fields(This),
        put({This, body}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})).

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
        NodeList = (get({Document, '$class'})):getElementsByTagName(Document, get({'BodyData':getInstance(), 'NAME'})),
        lists:foreach(fun(Index) ->
            ABodyNode = (get({NodeList, '$class'})):item(NodeList, Index),
            ABodyValueNode = 'DomSearchHelper':getNode(get({'DomData', 'VALUE'}), (get({ABodyNode, '$class'})):getChildNodes(ABodyNode)),
            put({This, body}, 'DomNodeHelper':getTextNodeValue(ABodyValueNode))
        end, lists:seq(0, (get({NodeList, '$class'})):getLength(NodeList) - 1));
'$init'(This, HashMap) ->
    'Validation':'$init'(This),
    init_fields(This),
        (get({This, '$class'})):getFormData(This, HashMap).


% throws Exception
getFormData(This, HashMap) ->
        put({This, body}, (get({HashMap, '$class'})):get(HashMap, get({'BodyData':getInstance(), 'NAME'}))).

isValid(This) ->
        try
            put({local, isValid}, true),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'IS_VALID'}));
                false -> ok
            end,
            case (not (fun(Target_N67137) -> (get({Target_N67137, '$class'})):isValidNotRequired(Target_N67137, get({This, body}), get({'BodyData':getInstance(), 'MIN'}), get({'AbSqlData', 'MAXBLOB'})) end)('StringValidationUtil':getInstance())) of
                true ->
                put({local, isValid}, false);
                false -> ok
            end,
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["BodyValidation: ", get({local, isValid})]), This, get({get({This, commonStrings}), 'IS_VALID'}));
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
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
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
        Node = 'ModDomHelper':createNameValueNodes(Document, get({'BodyData':getInstance(), 'NAME'}), get({This, body})),
        Node.

