% Generated Code Do Not Modify
% package org.allbinary.graphics.opengles
% import javax.microedition.lcdui.Image

-module('OpenGLUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'OpenGLUtil':new()),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'OpenGLUtil', instance}).

addImage(This, Image) ->
        Image.

clear(This) ->
        ok.

addRunnable(This, Runnable) ->
        ok.

