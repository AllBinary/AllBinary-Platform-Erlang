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
% import java.util.HashMap
% import org.allbinary.data.tree.dom.DomNodeHelper
% import org.allbinary.data.tree.dom.ModDomHelper
% import org.allbinary.input.media.image.InputImageType
% import org.allbinary.logic.StdUtil
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('GenericProfileDataWorkerType').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements GenericProfileDataWorkerTypeInterface

static_init() ->
    put({?MODULE, hashMap}, (fun(Target_N65833) -> (get({Target_N65833, '$class'})):createHashMap(Target_N65833) end)('StdUtil':getInstance())),
    put({?MODULE, 'SAVED_CAPTURE'}, get({'SavedCaptureGenericProfileDataWorkerType', 'SAVED_CAPTURE'})),
    put({?MODULE, 'SCREEN_CAPTURE'}, 'GenericProfileDataWorkerType':new(lists:concat(["Screen ", (get({get({'InputImageType', 'CAPTURE'}), '$class'})):getName(get({'InputImageType', 'CAPTURE'}))]))),
    put({?MODULE, 'COMPARISON'}, 'GenericProfileDataWorkerType':new((get({get({'InputImageType', 'COMPARISON'}), '$class'})):getName(get({'InputImageType', 'COMPARISON'})))),
    put({?MODULE, 'MOTION'}, 'GenericProfileDataWorkerType':new((get({get({'InputImageType', 'MOTION'}), '$class'})):getName(get({'InputImageType', 'MOTION'})))),
    ok.

init_fields(This) ->
    put({This, name}, undefined),
    ok.


new(Name) when (is_list(Name) orelse Name =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Name),
    This.

init(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
    init_fields(This),
        (get({This, '$class'})):setName(This, Name),
        (get({get({'GenericProfileDataWorkerType', hashMap}), '$class'})):put(get({'GenericProfileDataWorkerType', hashMap}), (get({This, '$class'})):getName(This), This).

getName(This) ->
        get({This, name}).

setName(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
        put({This, name}, Name).

% throws Exception
toXmlNode(This, Document) ->
        Node = 'ModDomHelper':createTextNode(Document, get({'GenericProfileDataWorkerData', 'NAME'}), get({This, name})),
        Node.

toString(This) ->
        lists:concat(["GenericProfileDataWorkerType: ", (get({This, '$class'})):getName(This)]).

getInstance(Node) ->
        Name = 'DomNodeHelper':getTextNodeValue(Node),
        (get({get({'GenericProfileDataWorkerType', hashMap}), '$class'})):get(get({'GenericProfileDataWorkerType', hashMap}), Name).

