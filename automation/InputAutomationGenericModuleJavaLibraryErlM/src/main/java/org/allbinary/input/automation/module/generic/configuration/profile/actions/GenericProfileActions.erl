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
% package org.allbinary.input.automation.module.generic.configuration.profile.actions
% import java.io.DataOutputStream
% import java.io.File
% import java.io.FileInputStream
% import java.io.FileOutputStream
% import java.util.HashMap
% import java.util.Set
% import org.allbinary.data.tree.dom.DomNodeInterface
% import org.allbinary.data.tree.dom.document.DomDocumentHelper
% import org.allbinary.data.tree.dom.document.XmlDocumentHelper
% import org.allbinary.data.tree.dom.document.mapping.DomDocumentMappingInterface
% import org.allbinary.input.automation.module.DefaultListModelHelper
% import org.allbinary.input.automation.module.generic.configuration.profile.GenericProfiles
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.io.file.CommonDataFileStrings
% import org.allbinary.logic.io.path.AbPath
% import org.w3c.dom.Document
% import org.w3c.dom.Node
% import org.w3c.dom.NodeList

-module('GenericProfileActions').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements DomNodeInterface
% implements DomDocumentMappingInterface

static_init() ->
    put({?MODULE, 'DEFAULT_PROFILE_ACTIONS_PATH'}, lists:concat([get({'GenericProfiles', 'DEFAULT_PROFILES_PATH'}), "actions/"])),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonFileStrings}, 'CommonDataFileStrings':getInstance()),
    put({This, name}, undefined),
    put({This, genericProfileActionsJPanel}, undefined),
    put({This, actionsDefaultListModelHelper}, undefined),
    put({This, hashMap}, undefined),
    ok.


new(GenericProfileActionsJPanel, Name) when (is_list(Name) orelse Name =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, GenericProfileActionsJPanel, Name),
    This.

init(This, GenericProfileActionsJPanel, Name) when (is_list(Name) orelse Name =:= undefined) ->
    init_fields(This),
        (get({This, '$class'})):setName(This, Name),
        (get({This, '$class'})):init(This, GenericProfileActionsJPanel),
        (get({This, '$class'})):load(This).

new(GenericProfileActionsJPanel, AbPath, Name) when (is_list(Name) orelse Name =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, GenericProfileActionsJPanel, AbPath, Name),
    This;
new(GenericProfileActionsJPanel, FileInputStream, Name) when (is_list(Name) orelse Name =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, GenericProfileActionsJPanel, FileInputStream, Name),
    This.

init(This, GenericProfileActionsJPanel, AbPath, Name) when (is_list(Name) orelse Name =:= undefined) ->
    init_fields(This),
        (get({This, '$class'})):setName(This, Name),
        (get({This, '$class'})):init(This, GenericProfileActionsJPanel),
        (get({This, '$class'})):load(This);
init(This, GenericProfileActionsJPanel, FileInputStream, Name) when (is_list(Name) orelse Name =:= undefined) ->
    init_fields(This),
        (get({This, '$class'})):setName(This, Name),
        (get({This, '$class'})):init(This, GenericProfileActionsJPanel),
        (get({This, '$class'})):fileInit(This, FileInputStream).


% throws Exception
init(This, GenericProfileActionsJPanel) ->
        (get({This, '$class'})):setGenericProfileActionsJPanel(This, GenericProfileActionsJPanel),
        put({This, actionsDefaultListModelHelper}, 'DefaultListModelHelper':new()),
        (get({This, '$class'})):setHashMap(This, 'HashMap':new()).

% throws Exception
save(This) ->
        IdFile = 'FileOutputStream':new(lists:concat([lists:concat([get({'GenericProfileActions', 'DEFAULT_PROFILE_ACTIONS_PATH'}), (get({This, '$class'})):getName(This)]), get({get({This, commonFileStrings}), '_XML'})])),
        IdOutData = 'DataOutputStream':new(IdFile),
        (get({IdOutData, '$class'})):writeBytes(IdOutData, 'XmlDocumentHelper':toString((get({This, '$class'})):toXmlDoc(This))).

getFile(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
        FileName = lists:concat([lists:concat([get({'GenericProfileActions', 'DEFAULT_PROFILE_ACTIONS_PATH'}), Name]), get({get({This, commonFileStrings}), '_XML'})]),
        'File':new(FileName).

% throws Exception
load(This) ->
        File = (get({This, '$class'})):getFile(This, (get({This, '$class'})):getName(This)),
        case (get({File, '$class'})):isFile(File) of
            true ->
            IdFile = 'FileInputStream':new(File),
            (get({This, '$class'})):fileInit(This, IdFile);
            false ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["No Profile: ", (get({File, '$class'})):getAbsolutePath(File)]), This, "Contructor")
        end.

% throws Exception
fileInit(This, FileInputStream) ->
        Bytes = array:new(100000, {default, 0}),
        Length = (get({FileInputStream, '$class'})):read(FileInputStream, Bytes),
        Data = allbinary_java:to_string(Bytes),
        EndIndex = (get({Data, '$class'})):lastIndexOf(Data, $>),
        Document = 'DomDocumentHelper':create(string:slice(Data, 0, ((EndIndex + 1)) - (0))),
        NameNodeList = (get({Document, '$class'})):getElementsByTagName(Document, get({'GenericProfileActionsData', 'NAME'})),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Number Of Profiles Specified: ", (get({NameNodeList, '$class'})):getLength(NameNodeList)]), This, "Contructor"),
        lists:foreach(fun(Index) ->
            Node = (get({NameNodeList, '$class'})):item(NameNodeList, Index),
            NodeList = (get({Node, '$class'})):getChildNodes(Node),
            case (NodeList =/= undefined) of
                true ->
                (get({This, '$class'})):initActions(This, NodeList);
                false ->
                erlang:error({'Exception', lists:concat([get({'GenericProfileActionData', 'NAME'}), " Name Node Node Children"])})
            end
        end, lists:seq(0, (get({NameNodeList, '$class'})):getLength(NameNodeList) - 1)),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([lists:concat(["Loaded: ", (fun(Target_N68441) -> (get({Target_N68441, '$class'})):size(Target_N68441) end)((get({This, '$class'})):getHashMap(This))]), " Configuration Profile Action(s)"]), This, "Contructor"),
        (fun(Target_N68479) -> (get({Target_N68479, '$class'})):initDefaultModelList(Target_N68479) end)((get({This, '$class'})):getDefaultListModelHelper(This)).

% throws Exception
initActions(This, NodeList) ->
        lists:foreach(fun(Index) ->
            ActionNode = (get({NodeList, '$class'})):item(NodeList, Index),
            case (ActionNode =/= undefined) of
                true ->
                GenericConfigurationProfileAction = 'GenericProfileAction':new((fun(Target_N68716) -> (get({Target_N68716, '$class'})):getGenericProfileActionJPanel(Target_N68716) end)((get({This, '$class'})):getGenericProfileActionsJPanel(This)), ActionNode),
                (fun(Target_N68764) -> (get({Target_N68764, '$class'})):put(Target_N68764, (get({GenericConfigurationProfileAction, '$class'})):getName(GenericConfigurationProfileAction), GenericConfigurationProfileAction) end)((get({This, '$class'})):getHashMap(This)),
                (fun(Target_N68814) -> (get({Target_N68814, '$class'})):add(Target_N68814, (get({GenericConfigurationProfileAction, '$class'})):getName(GenericConfigurationProfileAction)) end)((get({This, '$class'})):getDefaultListModelHelper(This));
                false ->
                erlang:error({'Exception', lists:concat([get({'GenericProfileActionData', 'NAME'}), " Node Null"])})
            end
        end, lists:seq(0, (get({NodeList, '$class'})):getLength(NodeList) - 1)).

getDefaultListModelHelper(This) ->
        get({This, actionsDefaultListModelHelper}).

getAction(This, String) when (is_list(String) orelse String =:= undefined) ->
        (fun(Target_N69041) -> (get({Target_N69041, '$class'})):get(Target_N69041, String) end)((get({This, '$class'})):getHashMap(This)).

% throws Exception
add(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
        GenericProfileAction = 'GenericProfileAction':new(Name),
        (fun(Target_N69184) -> (get({Target_N69184, '$class'})):put(Target_N69184, (get({GenericProfileAction, '$class'})):getName(GenericProfileAction), GenericProfileAction) end)((get({This, '$class'})):getHashMap(This)),
        (fun(Target_N69234) -> (get({Target_N69234, '$class'})):add(Target_N69234, (get({GenericProfileAction, '$class'})):getName(GenericProfileAction)) end)((get({This, '$class'})):getDefaultListModelHelper(This)),
        (fun(Target_N69276) -> (get({Target_N69276, '$class'})):initDefaultModelList(Target_N69276) end)((get({This, '$class'})):getDefaultListModelHelper(This)),
        (get({This, '$class'})):save(This).

% throws Exception
remove(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
        (fun(Target_N69370) -> (get({Target_N69370, '$class'})):remove(Target_N69370, Name) end)((get({This, '$class'})):getHashMap(This)),
        (fun(Target_N69404) -> (get({Target_N69404, '$class'})):remove(Target_N69404, Name) end)((get({This, '$class'})):getDefaultListModelHelper(This)),
        (fun(Target_N69438) -> (get({Target_N69438, '$class'})):initDefaultModelList(Target_N69438) end)((get({This, '$class'})):getDefaultListModelHelper(This)),
        (get({This, '$class'})):save(This).

toHashMap(This) ->
        HashMap = (fun(Target_N69540) -> (get({Target_N69540, '$class'})):createHashMap(Target_N69540) end)('StdUtil':getInstance()),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["HashMap: ", (get({HashMap, '$class'})):toString(HashMap)]), This, "toHashMap()"),
        HashMap.

% throws Exception
toXmlNode(This, Document) ->
        Node = (get({Document, '$class'})):createElement(Document, get({'GenericProfileActionsData', 'NAME'})),
        Set = (fun(Target_N69753) -> (get({Target_N69753, '$class'})):keySet(Target_N69753) end)((get({This, '$class'})):getHashMap(This)),
        ActionNameArray = (get({Set, '$class'})):toArray(Set),
        Size = array:size(ActionNameArray),
        lists:foreach(fun(Index) ->
            NextActionName = array:get(Index, ActionNameArray),
            NextGenericProfileAction = (get({This, '$class'})):getAction(This, NextActionName),
            (get({Node, '$class'})):appendChild(Node, (get({NextGenericProfileAction, '$class'})):toXmlNode(NextGenericProfileAction, Document))
        end, lists:seq(0, Size - 1)),
        Node.

% throws Exception
toXmlDoc(This) ->
        Document = 'DomDocumentHelper':create(),
        Node = (get({This, '$class'})):toXmlNode(This, Document),
        (get({Document, '$class'})):appendChild(Document, Node),
        Document.

getGenericProfileActionsJPanel(This) ->
        get({This, genericProfileActionsJPanel}).

setGenericProfileActionsJPanel(This, GenericProfileActionsJPanel) ->
        put({This, genericProfileActionsJPanel}, GenericProfileActionsJPanel).

getHashMap(This) ->
        get({This, hashMap}).

setHashMap(This, HashMap) ->
        put({This, hashMap}, HashMap).

getName(This) ->
        get({This, name}).

setName(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
        put({This, name}, Name).

