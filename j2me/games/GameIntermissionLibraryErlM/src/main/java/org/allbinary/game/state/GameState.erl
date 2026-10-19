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
% package org.allbinary.game.state

-module('GameState').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, name}, undefined),
    ok.


new(Name, State) when (is_list(Name) orelse Name =:= undefined), is_integer(State) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Name, State),
    This.

init(This, Name, State) when (is_list(Name) orelse Name =:= undefined), is_integer(State) ->
    init_fields(This),
        put({This, name}, Name).

toString(This) ->
        get({This, name}).

