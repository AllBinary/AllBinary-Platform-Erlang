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
% package org.allbinary.input.gyro
% import org.allbinary.game.input.InputFactory
% import org.allbinary.input.motion.gesture.MotionGestureInput
% import org.allbinary.logic.NullUtil

-module('OrientationMotionGestureFactory').
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
    put({This, 'ROLL_LEFT'}, undefined),
    put({This, 'ROLL_RIGHT'}, undefined),
    ok.


getInstance() ->
        case (get({'OrientationMotionGestureFactory', instance}) =:= get({'NullUtil':getInstance(), 'NULL_OBJECT'})) of
            true ->
            put({'OrientationMotionGestureFactory', instance}, 'OrientationMotionGestureFactory':new());
            false -> ok
        end,
        get({'OrientationMotionGestureFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        MAX = get({'InputFactory':getInstance(), 'MAX'}),
        put({This, 'LEFT'}, 'MotionGestureInput':new((MAX - 20), "Left Orient")),
        put({This, 'RIGHT'}, 'MotionGestureInput':new((MAX - 21), "Right Orient")),
        put({This, 'UP'}, 'MotionGestureInput':new((MAX - 22), "Up Orient")),
        put({This, 'DOWN'}, 'MotionGestureInput':new((MAX - 23), "Down Orient")),
        put({This, 'ROLL_LEFT'}, 'MotionGestureInput':new((MAX - 24), "Roll Left")),
        put({This, 'ROLL_RIGHT'}, 'MotionGestureInput':new((MAX - 25), "Roll Right")).

