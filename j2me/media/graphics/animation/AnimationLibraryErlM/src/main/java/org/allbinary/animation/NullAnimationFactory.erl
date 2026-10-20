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
% import org.allbinary.media.ScaleProperties

-module('NullAnimationFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements AnimationInterfaceFactoryInterface
% implements ProceduralAnimationInterfaceFactoryInterface

static_init() ->
    put({?MODULE, 'NULL_NOT_FOR_USE_ANIMATION_FACTORY'}, 'NullAnimationFactory':new()),
    put({?MODULE, 'NULL_ANIMATION_FACTORY'}, 'NullAnimationFactory':new()),
    ok.

init_fields(This) ->
    put({This, 'NULL_ANIMATION'}, 'Animation':new() % Java anonymous class body: implement it as a module
%         ok % paintXY
),
    put({This, 'EMPTY_ARRAY'}, array:new(0, {default, undefined})),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

getFactoryInstance() ->
        get({'NullAnimationFactory', 'NULL_ANIMATION_FACTORY'}).

getInstance(This, InstanceId) when is_integer(InstanceId) ->
        get({This, 'NULL_ANIMATION'}).

% throws Exception
getInstanceAnimation(This, AnimationInterface) ->
        get({This, 'NULL_ANIMATION'}).

setInitialScale(This, ScaleProperties) ->
        ok.

