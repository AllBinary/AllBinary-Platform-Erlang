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
% package org.allbinary.business.time.created
% import org.allbinary.business.entry.EntryData
% import org.allbinary.data.tree.dom.DomNodeHelper
% import org.allbinary.data.tree.dom.DomNodeInterface
% import org.allbinary.data.tree.dom.ModDomHelper
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('TimeCreatedView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements DomNodeInterface

init_fields(This) ->
    put({This, timeCreated}, undefined),
    ok.


new(TimeCreated) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, TimeCreated),
    This;
new(Node) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Node),
    This.

init(This, TimeCreated) ->
    init_fields(This),
        (get({This, '$class'})):setTimeCreated(This, TimeCreated);
init(This, Node) ->
    init_fields(This),
        (get({This, '$class'})):setTimeCreated(This, 'TimeCreated':new('DomNodeHelper':getTextNodeValue(Node))).


% throws Exception
toXmlNode(This, Document) ->
        'ModDomHelper':createTextNode(Document, get({'EntryData':getInstance(), 'TIMECREATED'}), (fun(Target_N66044) -> (get({Target_N66044, '$class'})):toString(Target_N66044) end)((get({This, '$class'})):getTimeCreated(This))).

getTimeCreated(This) ->
        get({This, timeCreated}).

setTimeCreated(This, TimeCreated) ->
        put({This, timeCreated}, TimeCreated).

