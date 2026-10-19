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
% package org.allbinary.game.layer

-module('BasicLayerPlacement').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, layerType}, undefined),
    put({This, width}, 0),
    put({This, height}, 0),
    ok.


new(LayerType, Width, Height) when is_integer(Width), is_integer(Height) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, LayerType, Width, Height),
    This.

init(This, LayerType, Width, Height) when is_integer(Width), is_integer(Height) ->
    init_fields(This),
        put({This, layerType}, LayerType),
        put({This, width}, Width),
        put({This, height}, Height).

getWidth(This) ->
        get({This, width}).

getHeight(This) ->
        get({This, height}).

getLayerType(This) ->
        get({This, layerType}).

setLayerType(This, LayerType) ->
        put({This, layerType}, LayerType).

