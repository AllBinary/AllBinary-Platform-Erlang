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
% import org.allbinary.math.Angle
% import org.allbinary.math.AngleFactory

-module('DirectionUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'DirectionUtil':new()),
    ok.

init_fields(This) ->
    put({This, directionArray}, array:new(10, {default, undefined})),
    put({This, directionArray2}, array:new(10, {default, undefined})),
    ok.


getInstance() ->
        get({'DirectionUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        AngleFactory = 'AngleFactory':getInstance(),
        DirectionFactory = 'DirectionFactory':getInstance(),
        put({This, directionArray}, array:set((get({get({DirectionFactory, 'LEFT'}), '$class'})):getValue(get({DirectionFactory, 'LEFT'})), get({AngleFactory, 'LEFT'}), get({This, directionArray}))),
        put({This, directionArray}, array:set((get({get({DirectionFactory, 'RIGHT'}), '$class'})):getValue(get({DirectionFactory, 'RIGHT'})), get({AngleFactory, 'RIGHT'}), get({This, directionArray}))),
        put({This, directionArray}, array:set((get({get({DirectionFactory, 'UP'}), '$class'})):getValue(get({DirectionFactory, 'UP'})), get({AngleFactory, 'UP'}), get({This, directionArray}))),
        put({This, directionArray}, array:set((get({get({DirectionFactory, 'DOWN'}), '$class'})):getValue(get({DirectionFactory, 'DOWN'})), get({AngleFactory, 'DOWN'}), get({This, directionArray}))),
        put({This, directionArray2}, array:set((get({get({DirectionFactory, 'LEFT'}), '$class'})):getValue(get({DirectionFactory, 'LEFT'})), get({AngleFactory, 'LEFT'}), get({This, directionArray2}))),
        put({This, directionArray2}, array:set((get({get({DirectionFactory, 'RIGHT'}), '$class'})):getValue(get({DirectionFactory, 'RIGHT'})), get({AngleFactory, 'RIGHT'}), get({This, directionArray2}))),
        put({This, directionArray2}, array:set((get({get({DirectionFactory, 'UP'}), '$class'})):getValue(get({DirectionFactory, 'UP'})), get({AngleFactory, 'UP'}), get({This, directionArray2}))),
        put({This, directionArray2}, array:set((get({get({DirectionFactory, 'DOWN'}), '$class'})):getValue(get({DirectionFactory, 'DOWN'})), get({AngleFactory, 'DOWN'}), get({This, directionArray2}))).

getAngle(This, Direction) ->
        array:get((get({Direction, '$class'})):getValue(Direction), get({This, directionArray2})).

getFrameAngle(This, Direction) ->
        array:get((get({Direction, '$class'})):getValue(Direction), get({This, directionArray})).

