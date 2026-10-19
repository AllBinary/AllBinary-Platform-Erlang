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
% import java.io.File
% import java.io.FileInputStream
% import java.util.HashMap
% import java.util.List
% import org.allbinary.data.tree.dom.document.DomDocumentHelper
% import org.allbinary.input.automation.module.InputAutomationModuleData
% import org.allbinary.input.automation.module.NewInputAutomationModulesData
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.w3c.dom.Document
% import org.w3c.dom.Node
% import org.w3c.dom.NodeList

-module('InputAutomationModuleConfigurations').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, hashMap}, undefined),
    ok.


new(AbeClientInformation, File) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, AbeClientInformation, File),
    This;
new(AbeClientInformation, Document) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, AbeClientInformation, Document),
    This.

init(This, AbeClientInformation, File) ->
    init_fields(This),
        (get({This, '$class'})):setHashMap(This, 'HashMap':new()),
        Bytes = array:new(100000, {default, 0}),
        IdFile = 'FileInputStream':new(File),
        Length = (get({IdFile, '$class'})):read(IdFile, Bytes),
        Data = allbinary_java:to_string(Bytes),
        EndIndex = (get({Data, '$class'})):lastIndexOf(Data, $>),
        Document = 'DomDocumentHelper':create(string:slice(Data, 0, ((EndIndex + 1)) - (0))),
        NodeList = (get({Document, '$class'})):getElementsByTagName(Document, get({'NewInputAutomationModulesData', 'NAME'})),
        case ((get({NodeList, '$class'})):getLength(NodeList) > 0) of
            true ->
            NameNodeList = (get({Document, '$class'})):getElementsByTagName(Document, get({'InputAutomationModuleData', 'NAME'})),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Number Of Module(s) Specified: ", (get({NameNodeList, '$class'})):getLength(NameNodeList)]), This, "Contructor"),
            lists:foreach(fun(Index) ->
                Node = (get({NameNodeList, '$class'})):item(NameNodeList, Index),
                (get({This, '$class'})):add(This, 'InputAutomationModuleConfiguration':new(AbeClientInformation, Node))
            end, lists:seq(0, (get({NameNodeList, '$class'})):getLength(NameNodeList) - 1));
            false -> ok
        end;
init(This, AbeClientInformation, Document) ->
    init_fields(This),
        (get({This, '$class'})):setHashMap(This, 'HashMap':new()),
        NameNodeList = (get({Document, '$class'})):getElementsByTagName(Document, get({'InputAutomationModuleData', 'NAME'})),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Number Of Module(s) Specified: ", (get({NameNodeList, '$class'})):getLength(NameNodeList)]), This, "Contructor"),
        lists:foreach(fun(Index) ->
            Node = (get({NameNodeList, '$class'})):item(NameNodeList, Index),
            (get({This, '$class'})):add(This, 'InputAutomationModuleConfiguration':new(AbeClientInformation, Node))
        end, lists:seq(0, (get({NameNodeList, '$class'})):getLength(NameNodeList) - 1)).


new(InputAutomationModuleConfigurationList) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, InputAutomationModuleConfigurationList),
    This.

init(This, InputAutomationModuleConfigurationList) ->
    init_fields(This),
        (get({This, '$class'})):setHashMap(This, 'HashMap':new()),
        Size = (get({InputAutomationModuleConfigurationList, '$class'})):size(InputAutomationModuleConfigurationList),
        put({local, inputAutomationModuleConfiguration}, undefined),
        lists:foreach(fun(Index) ->
            put({local, inputAutomationModuleConfiguration}, (get({InputAutomationModuleConfigurationList, '$class'})):get(InputAutomationModuleConfigurationList, Index)),
            (get({This, '$class'})):add(This, get({local, inputAutomationModuleConfiguration}))
        end, lists:seq(0, Size - 1)).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        (get({This, '$class'})):setHashMap(This, 'HashMap':new()).

add(This, InputAutomationModuleConfiguration) ->
        (fun(Target_N67718) -> (get({Target_N67718, '$class'})):put(Target_N67718, (get({InputAutomationModuleConfiguration, '$class'})):getClassName(InputAutomationModuleConfiguration), InputAutomationModuleConfiguration) end)((get({This, '$class'})):getHashMap(This)).

remove(This, InputAutomationModuleConfiguration) ->
        (fun(Target_N67820) -> (get({Target_N67820, '$class'})):remove(Target_N67820, (get({InputAutomationModuleConfiguration, '$class'})):getClassName(InputAutomationModuleConfiguration)) end)((get({This, '$class'})):getHashMap(This)).

getHashMap(This) ->
        get({This, hashMap}).

setHashMap(This, HashMap) ->
        put({This, hashMap}, HashMap).

