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
% package org.allbinary.graphics.j2me.workarea
% import org.allbinary.dom.DomHelper
% import org.allbinary.util.BasicArrayList
% import org.w3c.dom.Document
% import org.w3c.dom.Node
% import org.w3c.dom.NodeList

-module('WorkAreaDom').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'WORKAREA'}, "workArea"),
    put({?MODULE, 'NAME'}, "name"),
    put({?MODULE, 'FRAMES'}, "frames"),
    ok.

init_fields(This) ->
    put({This, name}, undefined),
    put({This, canvasNodeList}, undefined),
    ok.


new(Document) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Document),
    This.

init(This, Document) ->
    init_fields(This),
        WorkAreaNodeList = (get({Document, '$class'})):getElementsByTagName(Document, get({?MODULE, 'WORKAREA'})),
        case (WorkAreaNodeList =/= undefined) of
            true ->
            NumberOfworkAreas = (get({WorkAreaNodeList, '$class'})):getLength(WorkAreaNodeList),
            case (NumberOfworkAreas =:= 1) of
                true ->
                NumberOfNodes = (get({WorkAreaNodeList, '$class'})):getLength(WorkAreaNodeList),
                NameNode = (fun(Target_N66175) -> (get({Target_N66175, '$class'})):searchNodeList(Target_N66175, get({?MODULE, 'NAME'}), (fun(Target_N66211) -> (get({Target_N66211, '$class'})):getChildNodes(Target_N66211) end)((get({WorkAreaNodeList, '$class'})):item(WorkAreaNodeList, 0))) end)('DomHelper':getInstance()),
                NameTextNode = (get({NameNode, '$class'})):getFirstChild(NameNode),
                put({This, name}, (get({NameTextNode, '$class'})):getNodeValue(NameTextNode));
                false ->
                erlang:error({'Exception', lists:concat(["Wrong Number of WorkAreas: ", NumberOfworkAreas])})
            end,
            put({This, canvasNodeList}, (fun(Target_N66364) -> (get({Target_N66364, '$class'})):getChildrenWithoutTextNodes(Target_N66364, get({'WorkAreaDom', 'FRAMES'}), (fun(Target_N66405) -> (get({Target_N66405, '$class'})):getChildNodes(Target_N66405) end)((get({WorkAreaNodeList, '$class'})):item(WorkAreaNodeList, 0))) end)('DomHelper':getInstance()));
            false ->
            erlang:error({'Exception', "workArea Node Not Found"})
        end.

getName(This) ->
        get({This, name}).

getCanvasNodes(This) ->
        get({This, canvasNodeList}).

