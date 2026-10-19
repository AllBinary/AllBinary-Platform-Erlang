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
% package org.allbinary.game.multiplayer.layer
% import org.allbinary.logic.string.StringUtil

-module('MultiplayerBehavior').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'NULL_MULTIPLAYER_BEHAVIOR'}, 'MultiplayerBehavior':new(get({'StringUtil':getInstance(), 'EMPTY_STRING'}))),
    ok.

init_fields(This) ->
    ok.


new(Username) when (is_list(Username) orelse Username =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Username),
    This.

init(This, Username) when (is_list(Username) orelse Username =:= undefined) ->
    init_fields(This),
        ok.

startTick(This) ->
        ok.

endTick(This) ->
        ok.

getApproximateElapsed(This) ->
        0.

