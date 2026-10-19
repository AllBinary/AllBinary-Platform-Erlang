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
% package org.allbinary.graphics.j2me.workarea.tools
% import org.w3c.dom.Node

-module('GraphicItemBuilder').
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

% throws Exception
getInstance(Node) ->
        try
        GraphicItemName = (get({Node, '$class'})):getNodeName(Node),
        case ((get({GraphicItemName, '$class'})):compareTo(GraphicItemName, get({'PointsDomUtil':getInstance(), 'LINES'})) =:= 0) of
            true ->
            throw({'$return', 'LinesGraphicItem':new(Node)});
            false ->
            erlang:error({'Exception', lists:concat(["Graphic Item Does Not Exist: ", GraphicItemName])})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

