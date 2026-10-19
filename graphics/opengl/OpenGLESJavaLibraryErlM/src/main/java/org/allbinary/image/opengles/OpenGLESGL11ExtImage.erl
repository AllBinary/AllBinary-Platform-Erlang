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
% package org.allbinary.image.opengles
% import javax.microedition.khronos.opengles.GL
% import javax.microedition.khronos.opengles.GL10
% import javax.microedition.khronos.opengles.GL11
% import javax.microedition.khronos.opengles.GL11Ext
% import javax.microedition.lcdui.Image
% import org.allbinary.graphics.displayable.DisplayInfoSingleton
% import org.allbinary.graphics.displayable.event.DisplayChangeEvent
% import org.allbinary.graphics.opengles.OpenGLLogUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.platform.graphics.PlatformBitmapBaseFactory
% import org.allbinary.platform.opengles.PlatformTextureBaseFactory

-module('OpenGLESGL11ExtImage').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('OpenGLESImage', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, a}, 0),
    put({This, rectangle}, undefined),
    ok.


new(Image, BitmapFactory, TextureFactory) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Image, BitmapFactory, TextureFactory),
    This.

init(This, Image, BitmapFactory, TextureFactory) ->
        'OpenGLESImage':init(This, Image, BitmapFactory, TextureFactory),
        init_fields(This),
        (get({This, '$class'})):onDisplayChangeEvent(This, get({'DisplayInfoSingleton':getInstance(), displayChangeEvent})),
        put({This, rectangle}, array:from_list([0, (get({This, '$class'})):getHeight(This), (get({This, '$class'})):getWidth(This), (-(get({This, '$class'})):getHeight(This))])).

onDisplayChangeEvent(This, DisplayChangeEvent) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "onResize"),
            put({This, a}, ((fun(Target_N66392) -> (get({Target_N66392, '$class'})):getLastHeight(Target_N66392) end)('DisplayInfoSingleton':getInstance()) - (get({This, '$class'})):getHeight(This)))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "onResize", E)
        end.

set(This, Gl) ->
        (get({This, '$class'})):onDisplayChangeEvent(This, get({'DisplayInfoSingleton':getInstance(), displayChangeEvent})),
        Gl11 = Gl,
        case 'OpenGLESImage':initTexture(This, Gl11) of
            true ->
            (get({get({This, textureFactory}), '$class'})):load(get({This, textureFactory}), Gl11, get({get({'OpenGLESGL11ExtImage', 'GL10'}), 'GL_TEXTURE_2D'}), 0, This, 0, true),
            (get({Gl11, '$class'})):glTexParameteriv(Gl11, get({get({'OpenGLESGL11ExtImage', 'GL10'}), 'GL_TEXTURE_2D'}), get({'GL11Ext', 'GL_TEXTURE_CROP_RECT_OES'}), get({This, rectangle}), 0),
            (get({Gl11, '$class'})):glDisable(Gl11, get({get({'OpenGLESGL11ExtImage', 'GL10'}), 'GL_TEXTURE_2D'})),
            (fun(Target_N66887) -> (get({Target_N66887, '$class'})):logError(Target_N66887, Gl11, This) end)('OpenGLLogUtil':getInstance());
            false -> ok
        end.

draw(This, Gl, X, Y, Z) when is_integer(X), is_integer(Y), is_integer(Z) ->
        (get({Gl, '$class'})):glEnable(Gl, get({get({'OpenGLESGL11ExtImage', 'GL10'}), 'GL_TEXTURE_2D'})),
        (get({Gl, '$class'})):glBindTexture(Gl, get({get({'OpenGLESGL11ExtImage', 'GL10'}), 'GL_TEXTURE_2D'}), get({get({This, openGLESImageProperties}), textureID})),
        Gl11Ext = Gl,
        (get({Gl11Ext, '$class'})):glDrawTexfOES(Gl11Ext, float(X), float(((get({This, a}) - Y))), float(Z), float((get({This, '$class'})):getWidth(This)), float((get({This, '$class'})):getHeight(This))),
        (get({Gl, '$class'})):glDisable(Gl, get({get({'OpenGLESGL11ExtImage', 'GL10'}), 'GL_TEXTURE_2D'})).

