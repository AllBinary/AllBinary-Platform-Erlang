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
% package org.allbinary.data.tree.dom
% import java.util.HashMap
% import org.allbinary.data.tables.TableMappingInterface
% import org.allbinary.logic.io.file.AbFile
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('FileDomDataModel').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements DomNodeInterface

init_fields(This) ->
    put({This, file}, undefined),
    ok.


new(File) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, File),
    This.

init(This, File) ->
    init_fields(This),
        put({This, file}, File).

% throws Exception
toXmlNode(This, Document) ->
        TableMappingInterface = 'FileTableMapping':new(get({This, file})),
        HashMap = (get({TableMappingInterface, '$class'})):toHashMap(TableMappingInterface),
        'ModDomHelper':createNodeWithValueNodes(Document, "file", HashMap).

