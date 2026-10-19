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
% package org.allbinary.game.combat.destroy
% import org.allbinary.game.layer.CollidableCompositeLayer

-module('DestroyableSimpleBehavior').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('DestroyableBaseBehavior', Function, Arguments).

init_fields(This) ->
    put({This, ownerLayer}, undefined),
    put({This, destroyed}, false),
    ok.


new(OwnerLayer) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, OwnerLayer),
    This.

init(This, OwnerLayer) ->
    'DestroyableBaseBehavior':init(This),
    init_fields(This),
        put({This, ownerLayer}, OwnerLayer).

isDestroyed(This) ->
        get({This, destroyed}).

setDestroyed(This, Destroyed) when is_boolean(Destroyed) ->
        put({This, destroyed}, Destroyed),
        case (get({This, '$class'})):isDestroyed(This) of
            true ->
            (fun(Target_N65873) -> (get({Target_N65873, '$class'})):add(Target_N65873, get({This, ownerLayer})) end)('DestroyedLayerProcessor':getInstance());
            false -> ok
        end.

