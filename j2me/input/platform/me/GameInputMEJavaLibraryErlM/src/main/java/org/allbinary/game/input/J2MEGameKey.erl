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
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil

-module('J2MEGameKey').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('Input', Function, Arguments).

init_fields(This) ->
    ok.


new(Key, KeyName) when is_integer(Key), (is_list(KeyName) orelse KeyName =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Key, KeyName),
    This.

init(This, Key, KeyName) when is_integer(Key), (is_list(KeyName) orelse KeyName =:= undefined) ->
        'Input':init(This, Key, KeyName),
        Id = (get({This, '$class'})):getId(This),
        case (Id >= 0) of
            true ->
            InputFactory = 'InputFactory':getInstance(),
            (get({InputFactory, '$class'})):add(InputFactory, Id, This);
            false -> ok
        end.

toString(This) ->
        (fun(Target_N65890) -> (get({Target_N65890, '$class'})):toString(Target_N65890) end)((fun(Target_N65897) -> (get({Target_N65897, '$class'})):append(Target_N65897, 'Input':toString(This)) end)((fun(Target_N65904) -> (get({Target_N65904, '$class'})):append(Target_N65904, "J2MEGameKey: ") end)('StringMaker':new()))).

getString(KeyCode) when is_integer(KeyCode) ->
        try
        Input = (fun(Target_N65989) -> (get({Target_N65989, '$class'})):getInstanceById(Target_N65989, KeyCode) end)('InputFactory':getInstance()),
        case (Input =/= undefined) of
            true ->
            throw({'$return', (get({Input, '$class'})):getName(Input)});
            false ->
            throw({'$return', get({'StringUtil':getInstance(), 'EMPTY_STRING'})})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

