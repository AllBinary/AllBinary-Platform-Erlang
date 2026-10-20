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
% package org.allbinary.game.layer.hud
% import org.allbinary.logic.string.StringMaker

-module('LapInfo').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'NULL_LAP_INFO'}, 'LapInfo':new((-1))),
    ok.

init_fields(This) ->
    put({This, numberOfLaps}, 0),
    put({This, totalLaps}, 0),
    ok.


new(TotalLaps) when is_integer(TotalLaps) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, TotalLaps),
    This.

'$init'(This, TotalLaps) when is_integer(TotalLaps) ->
    init_fields(This),
        put({This, totalLaps}, TotalLaps),
        put({This, numberOfLaps}, 1).

add(This) ->
        put({This, numberOfLaps}, get({This, numberOfLaps}) + 1).

getCurrentLap(This) ->
        get({This, numberOfLaps}).

getTotalLaps(This) ->
        get({This, totalLaps}).

isDone(This) ->
        try
        case (get({This, numberOfLaps}) >= get({This, totalLaps})) of
            true ->
            throw({'$return', true});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "isDone: "),
        (get({StringBuffer, '$class'})):appendboolean(StringBuffer, (get({This, '$class'})):isDone(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, " CurrentLap: "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, (get({This, '$class'})):getCurrentLap(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Total Laps: "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, (get({This, '$class'})):getTotalLaps(This)),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

