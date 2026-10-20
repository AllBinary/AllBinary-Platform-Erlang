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
% import javax.microedition.khronos.opengles.GL10
% import javax.microedition.khronos.opengles.GL11
% import org.allbinary.AndroidUtil
% import org.allbinary.image.opengles.OpenGLESGL10ImageFactory
% import org.allbinary.image.opengles.OpenGLESGL11VBOImageFactory
% import org.allbinary.image.opengles.OpenGLImageSpecificFactory
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.string.CommonSeps
% import org.allbinary.string.CommonStrings
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.string.tokens.Tokenizer
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.game.configuration.feature.Features
% import org.allbinary.logic.communication.log.LogUtil

-module('OpenGLCapabilities').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'OpenGLCapabilities':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, 'CUSTOM_GL_SURFACE_VIEW'}, true),
    put({This, stringUtil}, 'StringUtil':getInstance()),
    put({This, initialized}, false),
    put({This, glVersionString}, get({get({This, stringUtil}), 'EMPTY_STRING'})),
    put({This, glShaderVersionString}, get({get({This, stringUtil}), 'EMPTY_STRING'})),
    put({This, shaderVersion}, 0),
    put({This, glRenderer}, get({get({This, stringUtil}), 'EMPTY_STRING'})),
    put({This, glVendor}, get({get({This, stringUtil}), 'EMPTY_STRING'})),
    put({This, glExtensions}, get({get({This, stringUtil}), 'EMPTY_STRING'})),
    put({This, possiblyAccelerated}, false),
    put({This, acceleratedString}, get({get({This, stringUtil}), 'EMPTY_STRING'})),
    put({This, maxTextureSize}, 64),
    put({This, 'VERSION_1_0'}, "1.0"),
    put({This, 'VERSION_1_1'}, "1.1"),
    put({This, 'VERSION_2_0'}, "2.0"),
    put({This, 'VERSION_3_0'}, "3.0"),
    put({This, 'VERSION_3_1'}, "3.1"),
    put({This, 'VERSION_3_2'}, "3.2"),
    put({This, 'VERSION_HIGHER_THAN_EXISTS'}, "999.999"),
    put({This, 'VERSION_UNK'}, "Unk"),
    put({This, 'GL_EXT_GPU_SHADER_100'}, "GL_ARB_shading_language_100"),
    put({This, 'GL_EXT_GPU_SHADER4'}, "GL_EXT_gpu_shader4"),
    put({This, glVersion}, get({This, glVersionString})),
    put({This, glInstanceVersion}, get({This, 'VERSION_UNK'})),
    put({This, glExtensionDrawTexture}, false),
    put({This, glThreedDrawTexture}, false),
    put({This, glExtensionGPUShader4}, false),
    put({This, glExtensionGPUShader100}, false),
    put({This, vertexBufferObjectSupport}, false),
    ok.


getInstance() ->
        get({'OpenGLCapabilities', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

isInitialized(This) ->
        get({This, initialized}).

requireInitialization(This) ->
        ok.

initCapabilities(This, Gl) ->
        METHOD_NAME = "initGLCapabilities",
        try
            Features = 'Features':getInstance(),
            OpenGLFeatureFactory = 'OpenGLFeatureFactory':getInstance(),
            OpenGLImageSpecificFactory = 'OpenGLImageSpecificFactory':getInstance(),
            StringBuffer = 'StringMaker':new(),
            put({This, glVersionString}, (get({Gl, '$class'})):glGetString(Gl, get({get({'OpenGLCapabilities', 'GL10'}), 'GL_VERSION'}))),
            GL_SHADING_LANGUAGE_VERSION = 16#8b8c,
            put({This, glShaderVersionString}, (get({Gl, '$class'})):glGetString(Gl, GL_SHADING_LANGUAGE_VERSION)),
            case (get({This, glShaderVersionString}) =:= undefined) of
                true ->
                put({This, glShaderVersionString}, get({get({This, stringUtil}), 'EMPTY_STRING'}));
                false -> ok
            end,
            try
                case ((get({This, glShaderVersionString}) =/= undefined) andalso (allbinary_java:index_of(get({This, glShaderVersionString}), $.) >= 0)) of
                    true ->
                    StartIndex = (get({get({This, glShaderVersionString}), '$class'})):lastIndexOf(get({This, glShaderVersionString}), $\s),
                    case (StartIndex >= 0) of
                        true ->
                        put({This, glShaderVersionString}, string:slice(get({This, glShaderVersionString}), (StartIndex + 1)));
                        false -> ok
                    end,
                    put({This, shaderVersion}, list_to_integer((get({get({This, glShaderVersionString}), '$class'})):replace(get({This, glShaderVersionString}), get({'CommonSeps':getInstance(), 'PERIOD'}), get({'StringUtil':getInstance(), 'EMPTY_STRING'}))));
                    false -> ok
                end
            catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
                put({local, commonStrings}, 'CommonStrings':getInstance()),
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({local, commonStrings}), 'EXCEPTION'}), This, METHOD_NAME, E)
            end,
            put({This, glRenderer}, (get({Gl, '$class'})):glGetString(Gl, get({get({'OpenGLCapabilities', 'GL10'}), 'GL_RENDERER'}))),
            put({This, glVendor}, (get({Gl, '$class'})):glGetString(Gl, get({get({'OpenGLCapabilities', 'GL10'}), 'GL_VENDOR'}))),
            put({This, glExtensions}, (get({Gl, '$class'})):glGetString(Gl, get({get({'OpenGLCapabilities', 'GL10'}), 'GL_EXTENSIONS'}))),
            case (allbinary_java:index_of(get({This, glExtensions}), get({This, 'GL_EXT_GPU_SHADER_100'})) >= 0) of
                true ->
                put({This, glExtensionGPUShader100}, true);
                false ->
                put({This, glExtensionGPUShader100}, false)
            end,
            case (allbinary_java:index_of(get({This, glExtensions}), get({This, 'GL_EXT_GPU_SHADER4'})) >= 0) of
                true ->
                put({This, glExtensionGPUShader4}, true);
                false ->
                put({This, glExtensionGPUShader4}, false)
            end,
            case (get({This, glRenderer}) =:= undefined) of
                true ->
                put({This, glRenderer}, get({get({This, stringUtil}), 'EMPTY_STRING'}));
                false -> ok
            end,
            case (allbinary_java:index_of(string:lowercase(get({This, glRenderer})), "pixelflinger") >= 0) of
                true ->
                put({This, acceleratedString}, lists:concat(["Probably Not for ", get({This, glRenderer})])),
                put({This, possiblyAccelerated}, false);
                false ->
                put({This, acceleratedString}, lists:concat(["Probably for ", get({This, glRenderer})])),
                put({This, possiblyAccelerated}, true)
            end,
            put({This, glExtensionDrawTexture}, false),
            case (get({This, glVersionString}) =:= undefined) of
                true ->
                put({This, glVersionString}, get({get({This, stringUtil}), 'EMPTY_STRING'})),
                put({This, glVersion}, get({This, 'VERSION_UNK'}));
                false ->
                case (allbinary_java:index_of(get({This, glVersionString}), " 1.0") >= 0) of
                true ->
                put({This, glVersion}, get({This, 'VERSION_1_0'}));
                false ->
                case (allbinary_java:index_of(get({This, glVersionString}), " 1.1") >= 0) of
                true ->
                put({This, glVersion}, get({This, 'VERSION_1_1'}));
                false ->
                put({This, glVersion}, get({This, 'VERSION_UNK'}))
            end
            end
            end,
            case allbinary_java:instance_of(Gl, 'GL11') of
                true ->
                put({This, glInstanceVersion}, get({This, 'VERSION_1_1'}));
                false ->
                case allbinary_java:instance_of(Gl, 'GL10') of
                true ->
                put({This, glInstanceVersion}, get({This, 'VERSION_1_0'}));
                false -> ok
            end
            end,
            case (get({This, glVendor}) =:= undefined) of
                true ->
                put({This, glVendor}, get({get({This, stringUtil}), 'EMPTY_STRING'}));
                false -> ok
            end,
            case (get({This, glExtensions}) =:= undefined) of
                true ->
                put({This, glExtensions}, get({get({This, stringUtil}), 'EMPTY_STRING'}));
                false -> ok
            end,
            case get({This, possiblyAccelerated}) of
                true ->
                'PreLogUtil':put((fun(Target_N69574) -> (get({Target_N69574, '$class'})):toString(Target_N69574) end)((fun(Target_N69581) -> (get({Target_N69581, '$class'})):appendboolean(Target_N69581, (get({This, '$class'})):isExtension(This, get({OpenGLFeatureFactory, 'OPENGL_VERTEX_BUFFER_OBJECT'}))) end)((fun(Target_N69588) -> (get({Target_N69588, '$class'})):append(Target_N69588, "||") end)((fun(Target_N69595) -> (get({Target_N69595, '$class'})):appendboolean(Target_N69595, ((get({This, glInstanceVersion}) =:= get({This, 'VERSION_1_1'})))) end)((fun(Target_N69602) -> (get({Target_N69602, '$class'})):append(Target_N69602, "VBO:?") end)('StringMaker':new()))))), This, METHOD_NAME),
                case (((get({This, glInstanceVersion}) =:= get({This, 'VERSION_1_1'})) orelse (get({This, '$class'})):isExtension(This, get({OpenGLFeatureFactory, 'OPENGL_VERTEX_BUFFER_OBJECT'})))) of
                    true ->
                    case 'AndroidUtil':isAndroid() of
                        true ->
                        'PreLogUtil':put("VBO implementation was detected, but disabled by default for Android", This, METHOD_NAME);
                        false ->
                        'PreLogUtil':put("VBO implementation was detected, but disabled for now", This, METHOD_NAME)
                    end;
                    false -> ok
                end;
                false -> ok
            end,
            StringUtil = 'StringUtil':getInstance(),
            case (get({Features, '$class'})):isDefault(Features, get({OpenGLFeatureFactory, 'OPENGL_AUTO_SELECT'})) of
                true ->
                case get({This, vertexBufferObjectSupport}) of
                    true ->
                    (get({OpenGLImageSpecificFactory, '$class'})):setImageFactory(OpenGLImageSpecificFactory, 'OpenGLESGL11VBOImageFactory':new());
                    false ->
                    (get({StringBuffer, '$class'})):append(StringBuffer, "OpenGL is on but "),
                    (get({StringBuffer, '$class'})):append(StringBuffer, (get({StringUtil, '$class'})):toString(StringUtil, get({OpenGLFeatureFactory, 'OPENGL_DRAW_TEXTURE'}))),
                    (get({StringBuffer, '$class'})):append(StringBuffer, " was not available"),
                    'PreLogUtil':put((get({StringBuffer, '$class'})):toString(StringBuffer), This, METHOD_NAME),
                    (get({OpenGLImageSpecificFactory, '$class'})):setImageFactory(OpenGLImageSpecificFactory, 'OpenGLESGL10ImageFactory':new())
                end;
                false ->
                (get({StringBuffer, '$class'})):append(StringBuffer, (get({StringUtil, '$class'})):toString(StringUtil, get({OpenGLFeatureFactory, 'OPENGL_AUTO_SELECT'}))),
                (get({StringBuffer, '$class'})):append(StringBuffer, " is not on"),
                'PreLogUtil':put((get({StringBuffer, '$class'})):toString(StringBuffer), This, METHOD_NAME),
                (get({OpenGLImageSpecificFactory, '$class'})):setImageFactory(OpenGLImageSpecificFactory, 'OpenGLESGL10ImageFactory':new())
            end,
            MaxTextureSizeArray = array:new(1, {default, 0}),
            (get({Gl, '$class'})):glGetIntegerv(Gl, get({get({'OpenGLCapabilities', 'GL10'}), 'GL_MAX_TEXTURE_SIZE'}), MaxTextureSizeArray, 0),
            put({This, maxTextureSize}, array:get(0, MaxTextureSizeArray)),
            put({This, initialized}, true)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            put({local, commonStrings}, 'CommonStrings':getInstance()),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({local, commonStrings}), 'EXCEPTION'}), This, METHOD_NAME, E)
        end.

isExtension(This, GameFeature) ->
        try
        Index = allbinary_java:index_of(get({This, glExtensions}), (get({GameFeature, '$class'})):getName(GameFeature)),
        case (Index >= 0) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isGlExtensionDrawTexture(This) ->
        (get({This, '$class'})):requireInitialization(This),
        get({This, glExtensionDrawTexture}).

isGlExtensionGPUShader100(This) ->
        get({This, glExtensionGPUShader100}).

isGlExtensionGPUShader4(This) ->
        (get({This, '$class'})):requireInitialization(This),
        get({This, glExtensionGPUShader4}).

getGlVersion(This) ->
        (get({This, '$class'})):requireInitialization(This),
        get({This, glVersion}).

getGlVersionString(This) ->
        (get({This, '$class'})):requireInitialization(This),
        get({This, glVersionString}).

getGlShaderVersion(This) ->
        (get({This, '$class'})):requireInitialization(This),
        get({This, glShaderVersionString}).

isGlThreedDrawTexture(This) ->
        (get({This, '$class'})):requireInitialization(This),
        get({This, glThreedDrawTexture}).

getGlRenderer(This) ->
        (get({This, '$class'})):requireInitialization(This),
        get({This, glRenderer}).

isVertexBufferObjectSupport(This) ->
        (get({This, '$class'})):requireInitialization(This),
        get({This, vertexBufferObjectSupport}).

isTextureSizeValid(This, WidthAndHeight) when is_integer(WidthAndHeight) ->
        try
        (get({This, '$class'})):requireInitialization(This),
        case (get({This, maxTextureSize}) >= WidthAndHeight) of
            true ->
            throw({'$return', true});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

toString(This) ->
        CommonSeps = 'CommonSeps':getInstance(),
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "GL_VERSION: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, glVersionString})),
        (get({StringBuffer, '$class'})):append(StringBuffer, " GL_SHADING_LANGUAGE_VERSION: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, glShaderVersionString})),
        (get({StringBuffer, '$class'})):append(StringBuffer, " GL_RENDERER: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, glRenderer})),
        (get({StringBuffer, '$class'})):append(StringBuffer, " GL_VENDOR: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, glVendor})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'NEW_LINE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Is Accelerated: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, acceleratedString})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'NEW_LINE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, " VBO Support: "),
        (get({StringBuffer, '$class'})):appendboolean(StringBuffer, (get({This, '$class'})):isVertexBufferObjectSupport(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'NEW_LINE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Max Texture Size: "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, get({This, maxTextureSize})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'NEW_LINE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, " GL_EXTENSIONS: "),
        try
            Tokenizer = 'Tokenizer':new(get({CommonSeps, 'SPACE'})),
            List = (get({Tokenizer, '$class'})):getTokensFromString(Tokenizer, get({This, glExtensions}), 'BasicArrayListD':new()),
            Size = (get({List, '$class'})):size(List),
            lists:foreach(fun(Index) ->
                (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'NEW_LINE'})),
                (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, stringUtil}), '$class'})):toString(get({This, stringUtil}), array:get(Index, get({List, objectArray}))))
            end, lists:seq(0, Size - 1))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            'PreLogUtil':putOE(get({CommonStrings, 'EXCEPTION'}), This, get({CommonStrings, 'TOSTRING'}), E)
        end,
        (get({StringBuffer, '$class'})):toString(StringBuffer).

