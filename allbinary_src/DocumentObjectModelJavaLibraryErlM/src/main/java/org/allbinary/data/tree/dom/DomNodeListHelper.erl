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
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.logic.StdUtil
% import org.w3c.dom.NodeList

-module('DomNodeListHelper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getVector(NodeList) ->
        Vector = 'BasicArrayListD':new(),
        Size = (get({NodeList, '$class'})):getLength(NodeList),
        lists:foreach(fun(Index) ->
            (get({Vector, '$class'})):add(Vector, 'DomNodeHelper':getTextNodeValue((get({NodeList, '$class'})):item(NodeList, Index)))
        end, lists:seq(0, Size - 1)),
        Vector.

