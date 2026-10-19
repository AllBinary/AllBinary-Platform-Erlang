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
% package org.allbinary.game.score
% import org.allbinary.logic.math.SmallIntegerSingletonFactory

-module('Scoreable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements ScoreableInterface

static_init() ->
    put({?MODULE, 'ID'}, (fun(Target_N65643) -> (get({Target_N65643, '$class'})):getAt(Target_N65643, 3) end)('SmallIntegerSingletonFactory':getInstance())),
    ok.

init_fields(This) ->
    put({This, points}, 0),
    ok.


new(Points) when is_integer(Points) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Points),
    This.

init(This, Points) when is_integer(Points) ->
    init_fields(This),
        put({This, points}, Points).

addPoints(This, Points) when is_integer(Points) ->
        put({This, points}, (get({This, points}) + Points)).

removePoints(This, Points) when is_integer(Points) ->
        put({This, points}, (get({This, points}) - Points)).

setPoints(This, Points) when is_integer(Points) ->
        put({This, points}, Points).

getPoints(This) ->
        get({This, points}).

