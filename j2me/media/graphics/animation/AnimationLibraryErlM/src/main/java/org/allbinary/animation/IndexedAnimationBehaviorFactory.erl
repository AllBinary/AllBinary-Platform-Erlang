% 
% AllBinary Open License Version 1 
% Copyright (c) 2022 AllBinary 
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

-module('IndexedAnimationBehaviorFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('AnimationBehaviorFactory', Function, Arguments).

init_fields(This) ->
    put({This, frameDelayTime}, 0),
    put({This, loopTotal}, 0),
    ok.


new(LoopTotal, FrameDelayTime) when is_integer(LoopTotal), is_integer(FrameDelayTime) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, LoopTotal, FrameDelayTime),
    This.

init(This, LoopTotal, FrameDelayTime) when is_integer(LoopTotal), is_integer(FrameDelayTime) ->
    'AnimationBehaviorFactory':init(This),
    init_fields(This),
        put({This, loopTotal}, LoopTotal),
        put({This, frameDelayTime}, FrameDelayTime).

getOrCreateInstance(This) ->
        'IndexedAnimationBehavior':new(get({This, loopTotal}), get({This, frameDelayTime})).

