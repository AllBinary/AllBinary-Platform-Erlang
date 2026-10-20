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
% package org.allbinary.input.automation.module.actions.script.condition.processors.output
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.data.tree.dom.DomNodeHelper
% import org.allbinary.data.tree.dom.ModDomHelper
% import org.allbinary.input.media.image.InputImageType
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.string.StringMaker
% import org.w3c.dom.Document
% import org.w3c.dom.Node
% import org.w3c.dom.NodeList

-module('ImageTypes').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, vector}, 'BasicArrayListD':new()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

new(Node) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Node),
    This.

'$init'(This, Node) ->
    init_fields(This),
        NodeList = (get({Node, '$class'})):getChildNodes(Node),
        lists:foreach(fun(Index) ->
            ChildNode = (get({NodeList, '$class'})):item(NodeList, Index),
            case ((fun(Target_N66078) -> (get({Target_N66078, '$class'})):compareTo(Target_N66078, get({'ImageActionScriptOutputData', 'TYPE'})) end)((get({ChildNode, '$class'})):getNodeName(ChildNode)) =:= 0) of
                true ->
                NextImageTypeString = 'DomNodeHelper':getTextNodeValue(ChildNode),
                (fun(Target_N66218) -> (get({Target_N66218, '$class'})):add(Target_N66218, 'InputImageType':getInstance(NextImageTypeString)) end)((get({This, '$class'})):getVector(This));
                false ->
                erlang:error({'Exception', "ImageTypes Unknown Node"})
            end
        end, lists:seq(0, (get({NodeList, '$class'})):getLength(NodeList) - 1)).

valueOf(AnyType) when (is_tuple(AnyType) orelse AnyType =:= undefined) ->
        ImageTypes = 'ImageTypes':new(),
        lists:foreach(fun(Index) ->
            ImageType = 'InputImageType':getInstance(array:get(Index, AnyType)),
            (fun(Target_N66526) -> (get({Target_N66526, '$class'})):add(Target_N66526, ImageType) end)((get({ImageTypes, '$class'})):getVector(ImageTypes))
        end, lists:seq(0, array:size(AnyType) - 1)),
        ImageTypes.

getVector(This) ->
        get({This, vector}).

% throws Exception
toXmlNode(This, Document) ->
        NewNode = (get({Document, '$class'})):createElement(Document, get({'ImageActionScriptOutputData', 'TYPES'})),
        Size = (get({get({This, vector}), '$class'})):size(get({This, vector})),
        lists:foreach(fun(Index) ->
            ImageType = (get({get({This, vector}), '$class'})):get(get({This, vector}), Index),
            (get({NewNode, '$class'})):appendChild(NewNode, 'ModDomHelper':createTextNode(Document, get({'ImageActionScriptOutputData', 'TYPE'}), (get({ImageType, '$class'})):getName(ImageType)))
        end, lists:seq(0, Size - 1)),
        NewNode.

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "ImageTypes: "),
        Size = (get({get({This, vector}), '$class'})):size(get({This, vector})),
        lists:foreach(fun(Index) ->
            ImageType = (get({get({This, vector}), '$class'})):get(get({This, vector}), Index),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({ImageType, '$class'})):getName(ImageType)),
            case (Index < (Size - 1)) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, ", ");
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

