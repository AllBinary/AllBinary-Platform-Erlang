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
% package org.allbinary.graphics.form
% import javax.microedition.lcdui.Graphics
% import org.allbinary.animation.Animation
% import org.allbinary.animation.FeaturedAnimationInterfaceFactoryInterfaceFactory
% import org.allbinary.logic.system.security.licensing.LockedResources
% import org.allbinary.logic.system.security.licensing.LockedUtil

-module('LockablePaintable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ItemPaintable', Function, Arguments).

init_fields(This) ->
    put({This, animation}, (fun(Target_N65768) -> (get({Target_N65768, '$class'})):getInstance(Target_N65768, 0) end)((fun(Target_N65775) -> (get({Target_N65775, '$class'})):get(Target_N65775, get({'LockedResources':getInstance(), 'LOCKED_DEMO_GAME_FEATURE_RESOURCE'})) end)('FeaturedAnimationInterfaceFactoryInterfaceFactory':getInstance()))),
    put({This, lockedIndex}, 0),
    ok.


new(LockedIndex) when is_integer(LockedIndex) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, LockedIndex),
    This.

init(This, LockedIndex) when is_integer(LockedIndex) ->
    'ItemPaintable':init(This),
    init_fields(This),
        put({This, lockedIndex}, LockedIndex).

paint(This, Graphics, CurrentIndex, X, Y) when is_integer(CurrentIndex), is_integer(X), is_integer(Y) ->
        case ((fun(Target_N65971) -> (get({Target_N65971, '$class'})):isLocked(Target_N65971) end)('LockedUtil':getInstance()) andalso (CurrentIndex >= (get({This, '$class'})):getLockedIndex(This))) of
            true ->
            (fun(Target_N66028) -> (get({Target_N66028, '$class'})):paintXY(Target_N66028, Graphics, X, Y) end)((get({This, '$class'})):getAnimation(This));
            false -> ok
        end.

getLockedIndex(This) ->
        get({This, lockedIndex}).

getAnimation(This) ->
        get({This, animation}).

