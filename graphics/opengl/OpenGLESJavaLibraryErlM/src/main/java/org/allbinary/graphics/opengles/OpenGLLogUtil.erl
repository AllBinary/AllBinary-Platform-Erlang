% Generated Code Do Not Modify
% package org.allbinary.graphics.opengles
% import javax.microedition.khronos.opengles.GL10
% import javax.microedition.lcdui.Image
% import org.allbinary.image.opengles.OpenGLStrings
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.communication.log.ForcedLogUtil
% import org.allbinary.logic.communication.log.PreLogUtil

-module('OpenGLLogUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'OpenGLLogUtil':new()),
    ok.

init_fields(This) ->
    put({This, 'MAX_TEXTURE'}, " Max Texture Size: "),
    put({This, 'LOG_ERROR'}, "logError"),
    put({This, 'IMAGE'}, " Image: "),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'OpenGLLogUtil', instance}).

logError(This, Gl) ->
        Error = (get({Gl, '$class'})):glGetError(Gl),
        case (Error =/= get({get({'OpenGLLogUtil', 'GL10'}), 'GL_NO_ERROR'})) of
            true ->
            StringBuffer = 'StringMaker':new(),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({'OpenGLStrings':getInstance(), 'GL_ERROR_LABEL'})),
            (get({StringBuffer, '$class'})):appendint(StringBuffer, Error),
            case (Error =:= 1281) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'MAX_TEXTURE'})),
                MaxTextureSize = array:new(1, {default, 0}),
                (get({Gl, '$class'})):glGetIntegerv(Gl, get({get({'OpenGLLogUtil', 'GL10'}), 'GL_MAX_TEXTURE_SIZE'}), MaxTextureSize, 0),
                (get({StringBuffer, '$class'})):appendint(StringBuffer, array:get(0, MaxTextureSize));
                false -> ok
            end,
            case (Error =:= 1280) of
                true ->
                'PreLogUtil':put((get({StringBuffer, '$class'})):toString(StringBuffer), This, get({'OpenGLStrings':getInstance(), 'SET'}));
                false ->
                'ForcedLogUtil':log((get({StringBuffer, '$class'})):toString(StringBuffer), This)
            end;
            false -> ok
        end.

logError(This, Gl, Image) ->
        Error = (get({Gl, '$class'})):glGetError(Gl),
        case (Error =/= get({get({'OpenGLLogUtil', 'GL10'}), 'GL_NO_ERROR'})) of
            true ->
            StringBuffer = 'StringMaker':new(),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({'OpenGLStrings':getInstance(), 'GL_ERROR_LABEL'})),
            (get({StringBuffer, '$class'})):appendint(StringBuffer, Error),
            case (Error =:= 1281) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'MAX_TEXTURE'})),
                MaxTextureSize = array:new(1, {default, 0}),
                (get({Gl, '$class'})):glGetIntegerv(Gl, get({get({'OpenGLLogUtil', 'GL10'}), 'GL_MAX_TEXTURE_SIZE'}), MaxTextureSize, 0),
                (get({StringBuffer, '$class'})):appendint(StringBuffer, array:get(0, MaxTextureSize));
                false -> ok
            end,
            (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'IMAGE'})),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({Image, '$class'})):toString(Image)),
            'PreLogUtil':put((get({StringBuffer, '$class'})):toString(StringBuffer), This, get({This, 'LOG_ERROR'}));
            false -> ok
        end.

