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
% package org.allbinary.logic.communication.log.config
% import org.allbinary.business.entry.EntryData
% import org.allbinary.data.tree.dom.DomNodeHelper
% import org.allbinary.data.tree.dom.DomSearchHelper
% import org.allbinary.data.tree.dom.document.DomDocumentHelper
% import org.allbinary.globals.PATH_GLOBALS
% import org.allbinary.globals.URLGLOBALS
% import org.allbinary.logic.communication.log.config.type.LogConfigType
% import org.allbinary.logic.communication.log.config.type.LogConfigTypeData
% import org.allbinary.logic.communication.log.config.type.LogConfigTypes
% import org.allbinary.logic.communication.log.config.type.LogConfigTypesData
% import org.allbinary.logic.io.AbFileLocalInputStream
% import org.allbinary.logic.io.file.AbFile
% import org.allbinary.logic.java.bool.BooleanUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.w3c.dom.Document
% import org.w3c.dom.Node
% import org.w3c.dom.NodeList

-module('LogConfig').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, isEnabled}, false),
    put({This, name}, undefined),
    put({This, description}, undefined),
    put({This, path}, undefined),
    put({This, fileName}, undefined),
    ok.


new(AName, ADescription, APath, AFileName) when (is_list(AName) orelse AName =:= undefined), (is_list(ADescription) orelse ADescription =:= undefined), (is_list(APath) orelse APath =:= undefined), (is_list(AFileName) orelse AFileName =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, AName, ADescription, APath, AFileName),
    This.

'$init'(This, AName, ADescription, APath, AFileName) when (is_list(AName) orelse AName =:= undefined), (is_list(ADescription) orelse ADescription =:= undefined), (is_list(APath) orelse APath =:= undefined), (is_list(AFileName) orelse AFileName =:= undefined) ->
    init_fields(This),
        put({This, isEnabled}, false),
        put({This, name}, AName),
        put({This, description}, ADescription),
        put({This, path}, APath),
        put({This, fileName}, AFileName).

new(Node) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Node),
    This.

'$init'(This, Node) ->
    init_fields(This),
        EnabledValueNode = 'DomSearchHelper':getNode(get({'EntryData':getInstance(), 'ENABLE'}), (get({Node, '$class'})):getChildNodes(Node)),
        IsEnabledString = 'DomNodeHelper':getTextNodeValue(EnabledValueNode),
        put({This, isEnabled}, (fun(Target_N66759) -> (get({Target_N66759, '$class'})):getFromString(Target_N66759, IsEnabledString) end)('BooleanUtil':getInstance())),
        LogConfigData = 'LogConfigData':getInstance(),
        NameValueNode = 'DomSearchHelper':getNode(get({LogConfigData, 'NAME'}), (get({Node, '$class'})):getChildNodes(Node)),
        put({This, name}, 'DomNodeHelper':getTextNodeValue(NameValueNode)),
        DescriptionValueNode = 'DomSearchHelper':getNode(get({LogConfigData, 'DESCRIPTION'}), (get({Node, '$class'})):getChildNodes(Node)),
        put({This, description}, 'DomNodeHelper':getTextNodeValue(DescriptionValueNode)),
        FileValueNode = 'DomSearchHelper':getNode(get({LogConfigData, 'FILE'}), (get({Node, '$class'})):getChildNodes(Node)),
        put({This, fileName}, 'DomNodeHelper':getTextNodeValue(FileValueNode)).

getName(This) ->
        get({This, name}).

isEnabled(This) ->
        get({This, isEnabled}).

enable(This) ->
        put({This, isEnabled}, true).

disable(This) ->
        put({This, isEnabled}, false).

getDescription(This) ->
        get({This, description}).

getFileName(This) ->
        get({This, fileName}).

setName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, name}, Value).

setDescription(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, description}, Value).

setPath(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, path}, Value).

setFileName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, fileName}, Value).

% throws Exception
getDoc(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({'LogConfig', 'URLGLOBALS'}), '$class'})):getWebappPath(get({'LogConfig', 'URLGLOBALS'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({(get({get({'LogConfig', 'PATH_GLOBALS'}), '$class'})):getInstance(get({'LogConfig', 'PATH_GLOBALS'})), 'INIT_PATH'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getFileName(This)),
        File = 'AbFile':createAbFile((get({StringBuffer, '$class'})):toString(StringBuffer)),
        Document = 'DomDocumentHelper':create('AbFileLocalInputStream':new(File)),
        Document.

% throws Exception
getTypeVector(This) ->
        LogKeyVector = 'BasicArrayListD':new(),
        Document = (get({This, '$class'})):getDoc(This),
        LogConfigTypesNodeList = (get({Document, '$class'})):getElementsByTagName(Document, get({'LogConfigTypesData':getInstance(), 'NAME'})),
        LogConfigTypesNode = (get({LogConfigTypesNodeList, '$class'})):item(LogConfigTypesNodeList, 0),
        LogConfigTypeNodeVector = 'DomSearchHelper':getAllNodes(get({'LogConfigTypeData':getInstance(), 'NAME'}), (get({LogConfigTypesNode, '$class'})):getChildNodes(LogConfigTypesNode)),
        Size = (get({LogConfigTypeNodeVector, '$class'})):size(LogConfigTypeNodeVector),
        lists:foreach(fun(I) ->
            Node = (get({LogConfigTypeNodeVector, '$class'})):get(LogConfigTypeNodeVector, I),
            LogType = 'LogConfigTypes':getInstance(Node),
            (get({LogKeyVector, '$class'})):add(LogKeyVector, LogType)
        end, lists:seq(0, Size - 1)),
        LogKeyVector.

