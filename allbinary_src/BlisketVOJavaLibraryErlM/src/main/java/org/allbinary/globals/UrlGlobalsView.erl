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
% package org.allbinary.globals
% import java.util.HashMap
% import org.allbinary.data.tree.dom.DomNodeInterface
% import org.allbinary.data.tree.dom.ModDomHelper
% import org.allbinary.logic.StdUtil
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('UrlGlobalsView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements DomNodeInterface

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

% throws Exception
toXmlNode(This, Document) ->
        HashMap = (fun(Target_N65791) -> (get({Target_N65791, '$class'})):createHashMap(Target_N65791) end)('StdUtil':getInstance()),
        (get({HashMap, '$class'})):put(HashMap, get({'UrlGlobalsData', 'WEBAPPPATH'}), (get({get({get({get({'org', allbinary}), globals}), 'URLGLOBALS'}), '$class'})):getWebappPath(get({get({get({'org', allbinary}), globals}), 'URLGLOBALS'}))),
        Node = 'ModDomHelper':createNameValueNodes(Document, get({'UrlGlobalsData', 'NAME'}), HashMap),
        Node.

