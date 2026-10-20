% Generated Code Do Not Modify
% package org.allbinary.device

-module('OpenGLESGraphicsFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getOpenGLESGraphicsInstance(This) ->
        undefined.

