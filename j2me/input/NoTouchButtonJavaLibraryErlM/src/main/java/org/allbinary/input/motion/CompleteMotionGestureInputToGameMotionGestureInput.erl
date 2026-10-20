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
% package org.allbinary.input.motion
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.string.CommonStrings

-module('CompleteMotionGestureInputToGameMotionGestureInput').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'CompleteMotionGestureInputToGameMotionGestureInput':new()),
    ok.

init_fields(This) ->
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'CompleteMotionGestureInputToGameMotionGestureInput', instance}).

init(This) ->
        'PreLogUtil':put("No Touch Button = No Compound Motion Gestures", This, get({get({This, commonStrings}), 'INIT'})).

