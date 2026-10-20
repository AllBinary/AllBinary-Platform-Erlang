% Generated Code Do Not Modify
% package org.allbinary.game.input
% import org.allbinary.logic.string.StringUtil

-module('AndroidGameKey').
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
        InputFactory = 'InputFactory':getInstance(),
        put({InputFactory, inputIntegerArray}, array:set((get({This, '$class'})):getId(This), This, get({InputFactory, inputIntegerArray}))).

toString(This) ->
        lists:concat(["AndroidGameKey: ", 'Input':toString(This)]).

getString(KeyCode) when is_integer(KeyCode) ->
        try
        Input = (fun(Target_N65858) -> (get({Target_N65858, '$class'})):getInstanceById(Target_N65858, KeyCode) end)('InputFactory':getInstance()),
        case (Input =/= undefined) of
            true ->
            throw({'$return', (get({Input, '$class'})):getName(Input)});
            false ->
            throw({'$return', get({'StringUtil':getInstance(), 'EMPTY_STRING'})})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

