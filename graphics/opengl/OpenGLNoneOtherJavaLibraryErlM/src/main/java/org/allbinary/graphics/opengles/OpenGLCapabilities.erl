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
% import org.allbinary.logic.string.StringUtil

-module('OpenGLCapabilities').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'OpenGLCapabilities':new()),
    ok.

init_fields(This) ->
    put({This, 'CUSTOM_GL_SURFACE_VIEW'}, true),
    put({This, 'VERSION_1_0'}, "1.0"),
    put({This, 'VERSION_1_1'}, "1.1"),
    put({This, 'VERSION_2_0'}, "2.0"),
    put({This, 'VERSION_3_0'}, "3.0"),
    put({This, 'VERSION_3_1'}, "3.1"),
    put({This, 'VERSION_3_2'}, "3.2"),
    put({This, 'VERSION_HIGHER_THAN_EXISTS'}, "999.999"),
    put({This, glVersion}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
    put({This, shaderVersion}, 0),
    put({This, glInstanceVersion}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
    put({This, maxTextureSize}, 64),
    ok.


getInstance() ->
        get({'OpenGLCapabilities', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

isInitialized(This) ->
        true.

initCapabilities(This, Gl) ->
        ok.

isGlExtensionDrawTexture(This) ->
        false.

getGlVersion(This) ->
        get({This, glVersion}).

isVertexBufferObjectSupport(This) ->
        false.

isTextureSizeValid(This, WidthAndHeight) when is_integer(WidthAndHeight) ->
        true.

