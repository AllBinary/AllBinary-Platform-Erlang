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
% package org.allbinary.game.input
% import org.allbinary.logic.string.StringUtil

-module('PCGameKey').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('Input', Function, Arguments).

init_fields(This) ->
    ok.


new(KeyCode, Name) when is_integer(KeyCode), (is_list(Name) orelse Name =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, KeyCode, Name),
    This.

'$init'(This, KeyCode, Name) when is_integer(KeyCode), (is_list(Name) orelse Name =:= undefined) ->
        'Input':'$init'(This, KeyCode, Name),
        Id = (get({This, '$class'})):getId(This),
        case (Id >= 0) of
            true ->
            (fun(Target_N65718) -> (get({Target_N65718, '$class'})):add(Target_N65718, Id, This) end)('InputFactory':getInstance());
            false -> ok
        end.

toString(This) ->
        lists:concat(["PCGameKey: ", 'Input':toString(This)]).

getString(KeyCode) when is_integer(KeyCode) ->
        try
        Input = (fun(Target_N65873) -> (get({Target_N65873, '$class'})):getInstanceById(Target_N65873, KeyCode) end)('InputFactory':getInstance()),
        case (Input =/= undefined) of
            true ->
            throw({'$return', (get({Input, '$class'})):getName(Input)});
            false ->
            throw({'$return', get({'StringUtil':getInstance(), 'EMPTY_STRING'})})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

