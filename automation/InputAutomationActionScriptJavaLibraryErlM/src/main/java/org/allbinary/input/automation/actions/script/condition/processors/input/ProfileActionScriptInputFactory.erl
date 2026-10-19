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
% package org.allbinary.input.automation.actions.script.condition.processors.input
% import org.allbinary.data.tree.dom.DomSearchHelper
% import org.w3c.dom.Node

-module('ProfileActionScriptInputFactory').
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
        put({local, profileActionScriptInputInterface}, undefined),
        case ('DomSearchHelper':getNodeNoThrow(get({'KeyboardActionScriptInputData', 'NAME'}), (get({Node, '$class'})):getChildNodes(Node)) =/= undefined) of
            true ->
            put({local, profileActionScriptInputInterface}, 'KeyboardActionScriptInput':new(Node));
            false ->
            case ('DomSearchHelper':getNodeNoThrow(get({'MouseActionScriptInputData', 'NAME'}), (get({Node, '$class'})):getChildNodes(Node)) =/= undefined) of
            true ->
            put({local, profileActionScriptInputInterface}, 'MouseActionScriptInput':new(Node));
            false ->
            erlang:error({'Exception', "No Such ActionScript Input"})
        end
        end,
        get({local, profileActionScriptInputInterface}).

