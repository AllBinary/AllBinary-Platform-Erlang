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
% package org.allbinary.animation
% import javax.microedition.lcdui.Graphics
% import org.allbinary.math.AngleFactory
% import org.allbinary.math.AngleInfo
% import org.allbinary.media.ScaleProperties
% import org.allbinary.util.CircularIndexUtil

-module('NullRotationAnimationFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements AnimationInterfaceFactoryInterface
% implements ProceduralAnimationInterfaceFactoryInterface

static_init() ->
    put({?MODULE, 'NULL_ROTATION_ANIMATION_FACTORY'}, 'NullRotationAnimationFactory':new()),
    ok.

init_fields(This) ->
    put({This, 'NULL_ROTATION_ANIMATION_ARRAY'}, array:new(0, {default, undefined})),
    put({This, 'NULL_ANIMATION'}, 'NullRotationAnimation2':new()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

getFactoryInstance() ->
        get({'NullRotationAnimationFactory', 'NULL_ROTATION_ANIMATION_FACTORY'}).

getInstance(This, InstanceId) when is_integer(InstanceId) ->
        get({This, 'NULL_ANIMATION'}).

% throws Exception
getInstanceAnimation(This, AnimationInterface) ->
        get({This, 'NULL_ANIMATION'}).

setInitialScale(This, ScaleProperties) ->
        ok.
% Java nested class NullRotationAnimation2: move it to its own module 'NullRotationAnimation2'

