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
% package org.allbinary.business.category
% import org.allbinary.data.tree.dom.DomNodeHelper
% import org.allbinary.data.tree.dom.DomSearchHelper
% import org.allbinary.logic.io.path.AbPath
% import org.allbinary.logic.io.path.AbPathData
% import org.allbinary.logic.string.StringUtil
% import org.apache.commons.lang3.StringUtils
% import org.w3c.dom.Attr
% import org.w3c.dom.NamedNodeMap
% import org.w3c.dom.Node

-module('CategoryUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

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

getPathLevel(CategoryPath) ->
        Count = 'StringUtils':countMatches((get({CategoryPath, '$class'})):toString(CategoryPath), get({'AbPathData':getInstance(), 'SEPARATOR'})),
        Count.

getNameFromNode(Node) ->
        try
        Attributes = (get({Node, '$class'})):getAttributes(Node),
        AttrNode = (get({Attributes, '$class'})):getNamedItem(Attributes, get({'CategoryData':getInstance(), 'LABEL'})),
        case (AttrNode =/= undefined) of
            true ->
            throw({'$return', (get({AttrNode, '$class'})):getValue(AttrNode)});
            false ->
            LabelNode = 'DomSearchHelper':getNodeNoThrow(get({'CategoryData':getInstance(), 'LABEL'}), (get({Node, '$class'})):getChildNodes(Node)),
            case (LabelNode =/= undefined) of
                true ->
                throw({'$return', 'DomNodeHelper':getTextNodeValue(LabelNode)});
                false -> ok
            end
        end,
        get({'StringUtil':getInstance(), 'EMPTY_STRING'})
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

