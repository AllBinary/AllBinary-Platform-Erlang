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

-module('GameKey').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('Input', Function, Arguments).

static_init() ->
    put({?MODULE, 'NULL_GAME_KEY'}, 'GameKey':new((-1), get({'StringUtil':getInstance(), 'NULL_STRING'}))),
    ok.

init_fields(This) ->
    ok.


new(Key, Name) when is_integer(Key), (is_list(Name) orelse Name =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Key, Name),
    This.

'$init'(This, Key, Name) when is_integer(Key), (is_list(Name) orelse Name =:= undefined) ->
        'Input':'$init'(This, Key, Name).

toString(This) ->
        (fun(Target_N65841) -> (get({Target_N65841, '$class'})):toString(Target_N65841) end)((fun(Target_N65848) -> (get({Target_N65848, '$class'})):append(Target_N65848, 'Input':toString(This)) end)((fun(Target_N65855) -> (get({Target_N65855, '$class'})):append(Target_N65855, "GameKey ") end)('StringMaker':new()))).

