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
% package org.allbinary.game.multiplayer.layer
% import org.allbinary.game.identification.Group
% import org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer
% import org.allbinary.graphics.Rectangle
% import org.allbinary.view.ViewPositionBase

-module('MultiPlayerGameLayer').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements MultiPlayerGameLayerInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('CollidableDestroyableDamageableLayer', Function, Arguments).

init_fields(This) ->
    ok.


new(RemoteInfo, GroupInterface, Name, LayerInfo, ViewPosition) when (is_tuple(GroupInterface) orelse GroupInterface =:= undefined), (is_list(Name) orelse Name =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, RemoteInfo, GroupInterface, Name, LayerInfo, ViewPosition),
    This.

init(This, RemoteInfo, GroupInterface, Name, LayerInfo, ViewPosition) when (is_tuple(GroupInterface) orelse GroupInterface =:= undefined), (is_list(Name) orelse Name =:= undefined) ->
        'CollidableDestroyableDamageableLayer':init(This, GroupInterface, Name, LayerInfo, ViewPosition).

getMultiplayerBehavior(This) ->
        get({'MultiplayerBehavior', 'NULL_MULTIPLAYER_BEHAVIOR'}).

setPingInfo(This, Show) when is_boolean(Show) ->
        ok.

setFiring(This, Firing) when is_integer(Firing) ->
        ok.

getFiring(This) ->
        0.

