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
% package org.allbinary.logic.communication.ftp.configuration
% import java.util.HashMap
% import org.allbinary.data.tree.dom.DomNodeHelper
% import org.allbinary.data.tree.dom.DomNodeInterface
% import org.allbinary.data.tree.dom.ModDomHelper
% import org.w3c.dom.Document
% import org.w3c.dom.Node
% import org.w3c.dom.NodeList

-module('FtpConfigurationView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements DomNodeInterface

init_fields(This) ->
    put({This, ftpConfigurationInterface}, undefined),
    ok.


new(Node) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Node),
    This;
new(FtpConfigurationInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, FtpConfigurationInterface),
    This.

init(This, Node) ->
    init_fields(This),
        (get({This, '$class'})):setFtpConfigurationInterface(This, 'FtpConfiguration':new()),
        ChileNodeList = (get({Node, '$class'})):getChildNodes(Node),
        Server = 'DomNodeHelper':getTextNodeValue(get({'FtpConfigurationData', 'SERVER'}), ChileNodeList),
        (fun(Target_N66000) -> (get({Target_N66000, '$class'})):setServer(Target_N66000, Server) end)((get({This, '$class'})):getFtpConfigurationInterface(This)),
        UserName = 'DomNodeHelper':getTextNodeValue(get({'FtpConfigurationData', 'USERNAME'}), ChileNodeList),
        (fun(Target_N66104) -> (get({Target_N66104, '$class'})):setUserName(Target_N66104, UserName) end)((get({This, '$class'})):getFtpConfigurationInterface(This)),
        Password = 'DomNodeHelper':getTextNodeValue(get({'FtpConfigurationData', 'PASSWORD'}), ChileNodeList),
        (fun(Target_N66208) -> (get({Target_N66208, '$class'})):setPassword(Target_N66208, Password) end)((get({This, '$class'})):getFtpConfigurationInterface(This)),
        Path = 'DomNodeHelper':getTextNodeValue(get({'FtpConfigurationData', 'PATH'}), ChileNodeList),
        (fun(Target_N66312) -> (get({Target_N66312, '$class'})):setPath(Target_N66312, Path) end)((get({This, '$class'})):getFtpConfigurationInterface(This));
init(This, FtpConfigurationInterface) ->
    init_fields(This),
        (get({This, '$class'})):setFtpConfigurationInterface(This, FtpConfigurationInterface).


% throws Exception
toXmlNode(This, Document) ->
        FtpConfigurationMapping = 'FtpConfigurationMapping':new((get({This, '$class'})):getFtpConfigurationInterface(This)),
        HashMap = (get({FtpConfigurationMapping, '$class'})):toHashMap(FtpConfigurationMapping),
        Node = 'ModDomHelper':createNameValueNodes(Document, get({'FtpConfigurationData', 'NAME'}), HashMap),
        Node.

getFtpConfigurationInterface(This) ->
        get({This, ftpConfigurationInterface}).

setFtpConfigurationInterface(This, FtpConfigurationInterface) ->
        put({This, ftpConfigurationInterface}, FtpConfigurationInterface).

