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
% package org.allbinary.input.motion.gesture
% import org.allbinary.game.input.InputFactory
% import org.allbinary.logic.NullUtil

-module('TouchMotionGestureFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, get({'NullUtil':getInstance(), 'NULL_OBJECT'})),
    ok.

init_fields(This) ->
    put({This, 'LEFT'}, undefined),
    put({This, 'RIGHT'}, undefined),
    put({This, 'UP'}, undefined),
    put({This, 'DOWN'}, undefined),
    put({This, 'PRESSED'}, undefined),
    put({This, 'RELEASED'}, undefined),
    put({This, 'DIAGONAL_DOWN_RIGHT'}, undefined),
    put({This, 'DIAGONAL_DOWN_LEFT'}, undefined),
    put({This, 'DIAGONAL_UP_RIGHT'}, undefined),
    put({This, 'DIAGONAL_UP_LEFT'}, undefined),
    put({This, 'SCROLL_UP'}, undefined),
    put({This, 'SCROLL_DOWN'}, undefined),
    put({This, 'NO_MOTION'}, undefined),
    put({This, 'LAST_MOTION'}, undefined),
    ok.


getInstance() ->
        case (get({'TouchMotionGestureFactory', instance}) =:= get({'NullUtil':getInstance(), 'NULL_OBJECT'})) of
            true ->
            put({'TouchMotionGestureFactory', instance}, 'TouchMotionGestureFactory':new());
            false -> ok
        end,
        get({'TouchMotionGestureFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        MAX = get({'InputFactory':getInstance(), 'MAX'}),
        put({This, 'LEFT'}, 'MotionGestureInput':new((MAX - 3), "Left Touch")),
        put({This, 'RIGHT'}, 'MotionGestureInput':new((MAX - 4), "Right Touch")),
        put({This, 'UP'}, 'MotionGestureInput':new((MAX - 5), "Up Touch")),
        put({This, 'DOWN'}, 'MotionGestureInput':new((MAX - 6), "Down Touch")),
        put({This, 'PRESSED'}, 'MotionGestureInput':new((MAX - 7), "Screen Press")),
        put({This, 'RELEASED'}, 'MotionGestureInput':new((MAX - 8), "Released")),
        put({This, 'DIAGONAL_DOWN_RIGHT'}, 'MotionGestureInput':new((MAX - 9), "Diagonal Dn R")),
        put({This, 'DIAGONAL_DOWN_LEFT'}, 'MotionGestureInput':new((MAX - 10), "Diagonal Dn L")),
        put({This, 'DIAGONAL_UP_RIGHT'}, 'MotionGestureInput':new((MAX - 11), "Diagonal Up R")),
        put({This, 'DIAGONAL_UP_LEFT'}, 'MotionGestureInput':new((MAX - 12), "Diagonal Up L")),
        put({This, 'SCROLL_UP'}, 'MotionGestureInput':new((MAX - 13), "Scroll Up")),
        put({This, 'SCROLL_DOWN'}, 'MotionGestureInput':new((MAX - 14), "Scroll Down")),
        put({This, 'NO_MOTION'}, 'MotionGestureInput':new((MAX - 2), "No Motion")),
        put({This, 'LAST_MOTION'}, 'MotionGestureInput':new((MAX - 19), "Last Motion")).

