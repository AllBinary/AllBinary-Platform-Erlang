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
% import org.allbinary.business.error.ErrorData
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('BasicErrorNodeUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

% throws Exception
get(Document, ErrorText) when (is_list(ErrorText) orelse ErrorText =:= undefined) ->
        try
            Node = (get({Document, '$class'})):createElement(Document, get({'ErrorData':getInstance(), 'NAME'})),
            (get({Node, '$class'})):appendChild(Node, 'ModDomHelper':createNameValueNodes(Document, get({'ErrorData':getInstance(), 'TEXT'}), ErrorText)),
            Node
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error({'Exception', "Error Node Creation Failure"})
        end.

