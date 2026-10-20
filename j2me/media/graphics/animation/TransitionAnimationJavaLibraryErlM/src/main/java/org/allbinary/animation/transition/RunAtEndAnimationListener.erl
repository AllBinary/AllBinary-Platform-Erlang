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
% package org.allbinary.animation.transition

-module('RunAtEndAnimationListener').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements AnimationListenerInterface

init_fields(This) ->
    put({This, runnable}, undefined),
    ok.


new(Runnable) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Runnable),
    This.

'$init'(This, Runnable) ->
    init_fields(This),
        put({This, runnable}, Runnable).

onPlatformAnimationStart(This) ->
        ok.

onPlatformAnimationEnd(This) ->
        ok.

onPlatformAnimationRepeat(This) ->
        ok.

