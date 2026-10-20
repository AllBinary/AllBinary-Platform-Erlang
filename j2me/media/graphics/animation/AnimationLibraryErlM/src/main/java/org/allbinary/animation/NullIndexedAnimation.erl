% Generated Code Do Not Modify
% package org.allbinary.animation

-module('NullIndexedAnimation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('IndexedAnimation', Function, Arguments).

init_fields(This) ->
    ok.


new(AnimationBehavior) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, AnimationBehavior),
    This.

'$init'(This, AnimationBehavior) ->
        'IndexedAnimation':'$init'(This, AnimationBehavior).

% throws Exception
getAnimationSize(This) ->
        0.

