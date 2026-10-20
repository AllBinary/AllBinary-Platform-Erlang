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
% package org.allbinary.input.automation.module.generic.configuration.profile
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
% import org.allbinary.input.automation.module.generic.configuration.profile.actions.GenericProfileActionData
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings
% import org.w3c.dom.Document
% import org.w3c.dom.Node
% import org.w3c.dom.NodeList

-module('GenericProfiles').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements DomNodeInterface
% implements DomDocumentMappingInterface

static_init() ->
    put({?MODULE, 'DEFAULT_PROFILES_PATH'}, "./modules/configs/profiles/"),
    put({?MODULE, 'DEFAULT_PROFILE_ACTIONS_PATH'}, lists:concat([get({'GenericProfiles', 'DEFAULT_PROFILES_PATH'}), "actions/"])),
    put({?MODULE, 'DEFAULT_FILE'}, lists:concat([get({'GenericProfiles', 'DEFAULT_PROFILES_PATH'}), "profiles.xml"])),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, hashMap}, undefined),
    put({This, profilesDefaultListModelHelper}, undefined),
    put({This, fileName}, undefined),
    ok.


new(FileName) when (is_list(FileName) orelse FileName =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, FileName),
    This.

'$init'(This, FileName) when (is_list(FileName) orelse FileName =:= undefined) ->
    init_fields(This),
        put({This, fileName}, FileName),
        put({This, profilesDefaultListModelHelper}, 'DefaultListModelHelper':new()),
        put({This, hashMap}, (fun(Target_N66550) -> (get({Target_N66550, '$class'})):createHashMap(Target_N66550) end)('StdUtil':getInstance())),
        case (fun(Target_N66579) -> (get({Target_N66579, '$class'})):isFile(Target_N66579) end)('File':new(FileName)) of
            true ->
            Bytes = array:new(100000, {default, 0}),
            IdFile = 'FileInputStream':new(FileName),
            Length = (get({IdFile, '$class'})):read(IdFile, Bytes),
            Data = allbinary_java:to_string(Bytes),
            EndIndex = (get({Data, '$class'})):lastIndexOf(Data, $>),
            Document = 'DomDocumentHelper':create(string:slice(Data, 0, ((EndIndex + 1)) - (0))),
            NodeList = (get({Document, '$class'})):getElementsByTagName(Document, get({'GenericProfilesData', 'NAME'})),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Number Of Profiles Specified: ", (get({NodeList, '$class'})):getLength(NodeList)]), This, "Contructor"),
            case (NodeList =/= undefined) of
                true ->
                (get({This, '$class'})):initProfiles(This, (get({NodeList, '$class'})):item(NodeList, 0));
                false ->
                erlang:error({'Exception', lists:concat([get({'GenericProfileActionData', 'NAME'}), " Name Node Node Children"])})
            end,
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([lists:concat(["Loaded: ", (get({get({This, hashMap}), '$class'})):size(get({This, hashMap}))]), " Configuration Profile Actions"]), This, "Contructor");
            false ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["No Generic Profile: ", FileName]), This, "Contructor")
        end,
        (fun(Target_N67316) -> (get({Target_N67316, '$class'})):initDefaultModelList(Target_N67316) end)((get({This, '$class'})):getDefaultListModelHelper(This)).

% throws Exception
initProfiles(This, Node) ->
        NodeList = (get({Node, '$class'})):getChildNodes(Node),
        lists:foreach(fun(Index) ->
            ProfileNameNode = (get({NodeList, '$class'})):item(NodeList, Index),
            case ((fun(Target_N67501) -> (get({Target_N67501, '$class'})):compareTo(Target_N67501, get({'GenericProfileData', 'NAME'})) end)((get({ProfileNameNode, '$class'})):getNodeName(ProfileNameNode)) =:= 0) of
                true ->
                GenericProfile = 'GenericProfile':new(ProfileNameNode),
                (get({get({This, hashMap}), '$class'})):put(get({This, hashMap}), (get({GenericProfile, '$class'})):getName(GenericProfile), GenericProfile),
                (fun(Target_N67657) -> (get({Target_N67657, '$class'})):add(Target_N67657, (get({GenericProfile, '$class'})):getName(GenericProfile)) end)((get({This, '$class'})):getDefaultListModelHelper(This));
                false -> ok
            end
        end, lists:seq(0, (get({NodeList, '$class'})):getLength(NodeList) - 1)).

getDefaultListModelHelper(This) ->
        get({This, profilesDefaultListModelHelper}).

% throws Exception
get(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
        GenericProfile = (get({get({This, hashMap}), '$class'})):get(get({This, hashMap}), Name),
        case (GenericProfile =:= undefined) of
            true ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([lists:concat([lists:concat(["No Generic Profile Named: ", Name]), " availability was: "]), get({This, hashMap})]), This, get({CommonStrings, 'GET'}));
            false -> ok
        end,
        GenericProfile.

% throws Exception
add(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
        (get({get({This, hashMap}), '$class'})):put(get({This, hashMap}), Name, 'GenericProfile':new(Name)),
        (fun(Target_N68240) -> (get({Target_N68240, '$class'})):add(Target_N68240, Name) end)((get({This, '$class'})):getDefaultListModelHelper(This)),
        (fun(Target_N68274) -> (get({Target_N68274, '$class'})):initDefaultModelList(Target_N68274) end)((get({This, '$class'})):getDefaultListModelHelper(This)),
        (get({This, '$class'})):save(This).

% throws Exception
remove(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
        (get({get({This, hashMap}), '$class'})):remove(get({This, hashMap}), Name),
        (fun(Target_N68402) -> (get({Target_N68402, '$class'})):remove(Target_N68402, Name) end)((get({This, '$class'})):getDefaultListModelHelper(This)),
        (fun(Target_N68436) -> (get({Target_N68436, '$class'})):initDefaultModelList(Target_N68436) end)((get({This, '$class'})):getDefaultListModelHelper(This)),
        (get({This, '$class'})):save(This).

% throws Exception
toXmlNode(This, Document) ->
        Node = (get({Document, '$class'})):createElement(Document, get({'GenericProfilesData', 'NAME'})),
        Set = (get({get({This, hashMap}), '$class'})):keySet(get({This, hashMap})),
        NameArray = (get({Set, '$class'})):toArray(Set),
        Size = array:size(NameArray),
        lists:foreach(fun(Index) ->
            GenericProfile = (get({get({This, hashMap}), '$class'})):get(get({This, hashMap}), array:get(Index, NameArray)),
            (get({Node, '$class'})):appendChild(Node, (get({GenericProfile, '$class'})):toXmlNode(GenericProfile, Document))
        end, lists:seq(0, Size - 1)),
        Node.

% throws Exception
toXmlDoc(This) ->
        Document = 'DomDocumentHelper':create(),
        Node = (get({This, '$class'})):toXmlNode(This, Document),
        (get({Document, '$class'})):appendChild(Document, Node),
        Document.

% throws Exception
save(This) ->
        IdFile = 'FileOutputStream':new(get({This, fileName})),
        IdOutData = 'DataOutputStream':new(IdFile),
        DocumentString = 'XmlDocumentHelper':toString((get({This, '$class'})):toXmlDoc(This)),
        (get({IdOutData, '$class'})):writeBytes(IdOutData, DocumentString).

