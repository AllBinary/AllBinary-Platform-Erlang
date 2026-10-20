% Generated Code Do Not Modify
% package org.allbinary.device
% import javax.microedition.khronos.opengles.GL
% import javax.microedition.khronos.opengles.GL10
% import javax.microedition.lcdui.Font
% import org.allbinary.graphics.font.FontDebugBase
% import org.allbinary.image.opengles.OpenGLSurfaceChangedInterface
% import org.allbinary.string.CommonStrings

-module('OpenGLESGraphics').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements OpenGLSurfaceChangedInterface
% implements GraphicsInterface

init_fields(This) ->
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, gl}, get({'NullGL10', 'NULL_GL10'})),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

updateGL(This, Gl) ->
        ok.

set(This, Gl) ->
        ok.

% throws Exception
init(This) ->
        ok.

% throws Exception
update(This) ->
        ok.

setOrthoginalMode(This) ->
        ok.

setCameraMode(This) ->
        ok.

getGlP(This) ->
        get({This, gl}).

setFontDebug(This, Font, FontDebug) ->
        erlang:error({'RuntimeException'}).

