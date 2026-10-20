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
% package org.allbinary.direction
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonPhoneStrings
% import org.allbinary.string.CommonSeps

-module('DirectionFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'DirectionFactory':new()),
    ok.

init_fields(This) ->
    put({This, 'NAME'}, "DIRECTION"),
    put({This, 'LEFT'}, 'Direction':new(get({'CommonPhoneStrings':getInstance(), 'LEFT'}), "WEST", 0, 1)),
    put({This, 'RIGHT'}, 'Direction':new(get({'CommonPhoneStrings':getInstance(), 'RIGHT'}), "EAST", 1, 0)),
    put({This, 'DOWN'}, 'Direction':new(get({'CommonPhoneStrings':getInstance(), 'DOWN'}), "SOUTH", 2, 0)),
    put({This, 'UP'}, 'Direction':new(get({'CommonPhoneStrings':getInstance(), 'UP'}), "NORTH", 3, 0)),
    put({This, 'UP_LEFT'}, undefined),
    put({This, 'UP_RIGHT'}, undefined),
    put({This, 'DOWN_LEFT'}, undefined),
    put({This, 'DOWN_RIGHT'}, undefined),
    put({This, 'NOT_BORDERED_WITH'}, 'Direction':new("NOT_BORDERED_WITH", "NOT_BORDERED_WITH", 8, 0)),
    put({This, 'NO_DIRECTION'}, 'Direction':new("NO_DIRECTION", "NO_DIRECTION", 9, 0)),
    put({This, 'TOP'}, 'Direction':new("TOP", "TOP", 10, 0)),
    put({This, 'BOTTOM'}, 'Direction':new("BOTTOM", "BOTTOM", 11, 0)),
    put({This, 'ALL_DIRECTION'}, 'Direction':new("ALL_DIRECTION", "ALL_DIRECTION", 12, 0)),
    ok.


getInstance() ->
        get({'DirectionFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        StringBuffer = 'StringMaker':new(),
        CommonSeps = 'CommonSeps':getInstance(),
        put({This, 'UP_LEFT'}, 'Direction':new("UP LEFT", (fun(Target_N66726) -> (get({Target_N66726, '$class'})):toString(Target_N66726) end)((fun(Target_N66733) -> (get({Target_N66733, '$class'})):append(Target_N66733, (get({get({This, 'LEFT'}), '$class'})):getOtherName(get({This, 'LEFT'}))) end)((fun(Target_N66740) -> (get({Target_N66740, '$class'})):append(Target_N66740, get({CommonSeps, 'SPACE'})) end)((get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, 'UP'}), '$class'})):getOtherName(get({This, 'UP'})))))), 4, 0)),
        (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
        put({This, 'UP_RIGHT'}, 'Direction':new("UP RIGHT", (fun(Target_N66919) -> (get({Target_N66919, '$class'})):toString(Target_N66919) end)((fun(Target_N66926) -> (get({Target_N66926, '$class'})):append(Target_N66926, (get({get({This, 'RIGHT'}), '$class'})):getOtherName(get({This, 'RIGHT'}))) end)((fun(Target_N66933) -> (get({Target_N66933, '$class'})):append(Target_N66933, get({CommonSeps, 'SPACE'})) end)((get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, 'UP'}), '$class'})):getOtherName(get({This, 'UP'})))))), 5, 0)),
        (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
        put({This, 'DOWN_LEFT'}, 'Direction':new("DOWN LEFT", (fun(Target_N67112) -> (get({Target_N67112, '$class'})):toString(Target_N67112) end)((fun(Target_N67119) -> (get({Target_N67119, '$class'})):append(Target_N67119, (get({get({This, 'LEFT'}), '$class'})):getOtherName(get({This, 'LEFT'}))) end)((fun(Target_N67126) -> (get({Target_N67126, '$class'})):append(Target_N67126, get({CommonSeps, 'SPACE'})) end)((get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, 'DOWN'}), '$class'})):getOtherName(get({This, 'DOWN'})))))), 6, 0)),
        (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
        put({This, 'DOWN_RIGHT'}, 'Direction':new("DOWN RIGHT", (fun(Target_N67305) -> (get({Target_N67305, '$class'})):toString(Target_N67305) end)((fun(Target_N67312) -> (get({Target_N67312, '$class'})):append(Target_N67312, (get({get({This, 'RIGHT'}), '$class'})):getOtherName(get({This, 'RIGHT'}))) end)((fun(Target_N67319) -> (get({Target_N67319, '$class'})):append(Target_N67319, get({CommonSeps, 'SPACE'})) end)((get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, 'DOWN'}), '$class'})):getOtherName(get({This, 'DOWN'})))))), 7, 0)).

