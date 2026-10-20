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
% package org.allbinary.graphics.opengles

-module('OpenGLFeatureFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'OpenGLFeatureFactory':new()),
    ok.

init_fields(This) ->
    put({This, 'OPENGL_OPTIONS'}, 'OpenGLFeature':new("OpenGL Options")),
    put({This, 'OPENGL'}, 'OpenGLFeature':new("OpenGL")),
    put({This, 'OPENGL_SURFACE_VIEW'}, 'OpenGLFeature':new("GLSurfaceView")),
    put({This, 'OPENGL_2D'}, 'OpenGLFeature':new("OpenGL 2D")),
    put({This, 'OPENGL_3D'}, 'OpenGLFeature':new("OpenGL 3D")),
    put({This, 'OPENGL_2D_AND_3D'}, 'OpenGLFeature':new("OpenGL 2D/3D")),
    put({This, 'OPENGL_AUTO_SELECT'}, 'OpenGLFeature':new("Auto Select")),
    put({This, 'OPENGL_MINIMUM'}, 'OpenGLFeature':new("Minimum")),
    put({This, 'OPENGL_AS_GAME_THREAD'}, 'OpenGLFeature':new("As game thread")),
    put({This, 'OPENGL_AND_GAME_HAVE_DIFFERENT_THREADS'}, 'OpenGLFeature':new("As different threads")),
    put({This, 'IMAGE_COLOR_DEPTH_4444'}, 'OpenGLFeature':new("4444")),
    put({This, 'IMAGE_COLOR_DEPTH_8888'}, 'OpenGLFeature':new("8888")),
    put({This, 'IMAGE_COLOR_DEPTH_565'}, 'OpenGLFeature':new("565")),
    put({This, 'OPENGL_COLOR_DEPTH_4444'}, 'OpenGLFeature':new("4444")),
    put({This, 'OPENGL_COLOR_DEPTH_8888'}, 'OpenGLFeature':new("8888")),
    put({This, 'OPENGL_COLOR_DEPTH_565'}, 'OpenGLFeature':new("565")),
    put({This, 'OPENGL_DRAW_TEXTURE'}, 'OpenGLFeature':new("GL_OES_draw_texture")),
    put({This, 'OPENGL_VERTEX_BUFFER_OBJECT'}, 'OpenGLFeature':new("vertex_buffer_object")),
    put({This, 'OPENGL_SIMPLE_OBJECT3D_PROCESSOR'}, 'OpenGLFeature':new("Simple Object3d Processor")),
    put({This, 'OPENGL_COMPLEX_OBJECT3D_PROCESSOR'}, 'OpenGLFeature':new("Complex Object3d Processor")),
    put({This, 'OPENGL_SIMPLE_TEXTURE_PROCESSOR'}, 'OpenGLFeature':new("Simple Texture Processor")),
    put({This, 'OPENGL_COMPLEX_TEXTURE_PROCESSOR'}, 'OpenGLFeature':new("Complex Texture Processor")),
    ok.


getInstance() ->
        get({'OpenGLFeatureFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

