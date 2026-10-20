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
% package org.allbinary.logic.visual.theme
% import org.allbinary.data.tree.dom.DomNodeInterface
% import org.allbinary.data.tree.dom.ModDomHelper
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('ThemePropertiesView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements DomNodeInterface

init_fields(This) ->
    put({This, themeInterface}, undefined),
    ok.


new(ThemeInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, ThemeInterface),
    This.

'$init'(This, ThemeInterface) ->
    init_fields(This),
        put({This, themeInterface}, ThemeInterface).

% throws Exception
toXmlNode(This, Document) ->
        Node = 'ModDomHelper':createNameValueNodes(Document, get({'ThemeData':getInstance(), 'NAME'}), (get({get({This, themeInterface}), '$class'})):toHashMap(get({This, themeInterface}))),
        Node.

