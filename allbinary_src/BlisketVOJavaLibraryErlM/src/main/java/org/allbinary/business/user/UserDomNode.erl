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
% package org.allbinary.business.user
% import java.util.HashMap
% import org.allbinary.business.entry.EntryData
% import org.allbinary.data.tables.TableMappingInterface
% import org.allbinary.data.tree.dom.DomNodeInterface
% import org.allbinary.data.tree.dom.ModDomHelper
% import org.allbinary.logic.string.StringUtil
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('UserDomNode').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements DomNodeInterface

init_fields(This) ->
    put({This, dataMappingInterface}, undefined),
    ok.


new(DataMappingInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, DataMappingInterface),
    This.

'$init'(This, DataMappingInterface) ->
    init_fields(This),
        put({This, dataMappingInterface}, DataMappingInterface).

% throws Exception
toXmlNode(This, Document) ->
        EMPTY_STRING = get({'StringUtil':getInstance(), 'EMPTY_STRING'}),
        HashMap = (get({get({This, dataMappingInterface}), '$class'})):toHashMap(get({This, dataMappingInterface})),
        (get({HashMap, '$class'})):put(HashMap, get({'EntryData':getInstance(), 'LASTMODIFIED'}), EMPTY_STRING),
        (get({HashMap, '$class'})):put(HashMap, get({'EntryData':getInstance(), 'ENCRYPTION'}), EMPTY_STRING),
        (get({HashMap, '$class'})):put(HashMap, get({'UserData', 'PASSWORD'}), EMPTY_STRING),
        'ModDomHelper':createNameValueNodes(Document, get({'UserData', 'NAME'}), HashMap).

% throws Exception
toXmlDoc(This) ->
        undefined.

% throws Exception
view(This) ->
        undefined.

