% 
% AllBinary Open License Version 1 
% Copyright (c) 2022 AllBinary 
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
% package javax.microedition.lcdui
% import org.allbinary.logic.NullUtil

-module('PlatformImage').
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


getImage(This, GraphicsSurface2) ->
        get({'NullImage', 'NULL_IMAGE'}).

getSurfaceWidth(This, GraphicsSurface2, Width) when is_integer(Width) ->
        Width.

getSurfaceHeight(This, GraphicsSurface2, Height) when is_integer(Height) ->
        Height.

getWidth(This, Image, Width) when is_integer(Width) ->
        Width.

getHeight(This, Image, Height) when is_integer(Height) ->
        Height.

getGraphics(This, GraphicsSurface, Width, Height, Image) when is_integer(Width), is_integer(Height) ->
        erlang:error({'RuntimeException'}).

drawImage(This, Image, X, Y, Anchor, G2, G) when is_integer(X), is_integer(Y), is_integer(Anchor) ->
        ok.

drawRegion(This, Image, X_src, Y_src, Width, Height, Transform, X_dst, Y_dst, Anchor, G) when is_integer(X_src), is_integer(Y_src), is_integer(Width), is_integer(Height), is_integer(Transform), is_integer(X_dst), is_integer(Y_dst), is_integer(Anchor) ->
        ok.

getRGB(This, Argb, Offset, Scanlength, X, Y, Width, Height, Image) when (is_tuple(Argb) orelse Argb =:= undefined), is_integer(Offset), is_integer(Scanlength), is_integer(X), is_integer(Y), is_integer(Width), is_integer(Height) ->
        ok.

setRGB(This, Argb, Offset, Scanlength, X, Y, Width, Height, Image) when (is_tuple(Argb) orelse Argb =:= undefined), is_integer(Offset), is_integer(Scanlength), is_integer(X), is_integer(Y), is_integer(Width), is_integer(Height) ->
        ok.

getData(This, Image) ->
        get({'NullUtil':getInstance(), 'NULL_INT_ARRAY'}).

