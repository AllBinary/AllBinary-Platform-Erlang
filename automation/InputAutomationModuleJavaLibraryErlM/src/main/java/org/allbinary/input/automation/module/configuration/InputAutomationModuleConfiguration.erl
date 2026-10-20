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
% package org.allbinary.input.automation.module.configuration
% import javax.xml.bind.annotation.XmlAccessType
% import javax.xml.bind.annotation.XmlAccessorType
% import javax.xml.bind.annotation.XmlElement
% import javax.xml.bind.annotation.XmlRootElement
% import javax.xml.bind.annotation.XmlType
% import org.allbinary.business.DynamicObjectData
% import org.allbinary.data.tree.dom.DomNodeHelper
% import org.allbinary.data.tree.dom.DomSearchHelper
% import org.allbinary.data.tree.dom.ModDomHelper
% import org.allbinary.input.automation.InputAutomationData
% import org.allbinary.input.automation.module.InputAutomationModuleData
% import org.allbinary.input.automation.module.InputAutomationModuleFactoryInterface
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.system.loader.AbeFactory
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.string.CommonStrings
% import org.w3c.dom.Document
% import org.w3c.dom.Node
% import org.w3c.dom.NodeList

-module('InputAutomationModuleConfiguration').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, className}, undefined),
    put({This, name}, undefined),
    put({This, inputAutomationModuleInterface}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

new(AbeClientInformation, Node) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, AbeClientInformation, Node),
    This.

'$init'(This, AbeClientInformation, Node) ->
    init_fields(This),
        (get({This, '$class'})):init(This, AbeClientInformation, Node).

new(AbeClientInformation, Name, ClassName) when (is_list(Name) orelse Name =:= undefined), (is_list(ClassName) orelse ClassName =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, AbeClientInformation, Name, ClassName),
    This.

'$init'(This, AbeClientInformation, Name, ClassName) when (is_list(Name) orelse Name =:= undefined), (is_list(ClassName) orelse ClassName =:= undefined) ->
    init_fields(This),
        (get({This, '$class'})):setName(This, Name),
        (get({This, '$class'})):setClassName(This, ClassName),
        (get({This, '$class'})):init(This, AbeClientInformation).

new(InputAutomationModuleInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, InputAutomationModuleInterface),
    This.

'$init'(This, InputAutomationModuleInterface) ->
    init_fields(This),
        (get({This, '$class'})):setInputAutomationModuleInterface(This, InputAutomationModuleInterface),
        (get({This, '$class'})):setClassName(This, atom_to_list(get({get({This, inputAutomationModuleInterface}), '$class'}))).

% throws Exception
init(This, AbeClientInformation, Node) ->
        NodeList = (get({Node, '$class'})):getChildNodes(Node),
        case (NodeList =/= undefined) of
            true ->
            ClassNameNode = 'DomSearchHelper':getNode(get({'DynamicObjectData', 'NAME'}), NodeList),
            case (ClassNameNode =/= undefined) of
                true ->
                (get({This, '$class'})):setClassName(This, 'DomNodeHelper':getTextNodeValue(ClassNameNode)),
                (get({This, '$class'})):init(This, AbeClientInformation);
                false ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Class Node Null", This, get({get({This, commonStrings}), 'INIT'}))
            end;
            false ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([get({'InputAutomationData', 'NAME'}), " Node Has No Children"]), This, "Contructor")
        end.

init(This, AbeClientInformation) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Name: ", (get({This, '$class'})):getName(This)]), This, get({get({This, commonStrings}), 'INIT'})),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["ClassName: ", get({This, className})]), This, get({get({This, commonStrings}), 'INIT'})),
            (get({This, '$class'})):setInputAutomationModuleInterface(This, (fun(Target_N67473) -> (get({Target_N67473, '$class'})):getInstance(Target_N67473, AbeClientInformation, (get({This, '$class'})):getClassName(This)) end)((fun(Target_N67480) -> (get({Target_N67480, '$class'})):getInstance(Target_N67480) end)('AbeFactory':getInstance())))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'INIT'}), E),
            erlang:error({'RuntimeException'})
        end.

% throws Exception
toDomNode(This, Document) ->
        Node = (get({Document, '$class'})):createElement(Document, get({'InputAutomationModuleData', 'NAME'})),
        ClassNameNode = 'ModDomHelper':createTextNode(Document, get({'DynamicObjectData', 'NAME'}), (get({This, '$class'})):getClassName(This)),
        (get({Node, '$class'})):appendChild(Node, ClassNameNode),
        Node.

getName(This) ->
        get({This, name}).

setName(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Name: ", Name]), This, "setName"),
        put({This, name}, Name).

getClassName(This) ->
        get({This, className}).

setClassName(This, ClassName) when (is_list(ClassName) orelse ClassName =:= undefined) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["ClassName : ", ClassName]), This, "setClassName"),
        put({This, className}, ClassName).

getInputAutomationModuleInterface(This) ->
        get({This, inputAutomationModuleInterface}).

setInputAutomationModuleInterface(This, InputAutomationModuleInterface) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["InputAutomationModuleFactoryInterface : ", InputAutomationModuleInterface]), This, "setInputAutomationModuleInterface"),
        put({This, inputAutomationModuleInterface}, InputAutomationModuleInterface),
        (get({This, '$class'})):setName(This, (get({get({This, inputAutomationModuleInterface}), '$class'})):getName(get({This, inputAutomationModuleInterface}))).

