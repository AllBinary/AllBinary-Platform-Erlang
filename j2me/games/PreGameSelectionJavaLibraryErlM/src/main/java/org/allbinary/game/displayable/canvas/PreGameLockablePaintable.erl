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
% package org.allbinary.game.displayable.canvas
% import javax.microedition.lcdui.Graphics
% import org.allbinary.image.GameFeatureImageCacheFactory
% import org.allbinary.logic.system.security.licensing.LockedResources
% import org.allbinary.logic.system.security.licensing.LockedUtil
% import org.allbinary.graphics.form.LockablePaintable
% import org.allbinary.graphics.form.ScrollCurrentSelectionForm

-module('PreGameLockablePaintable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('LockablePaintable', Function, Arguments).

init_fields(This) ->
    put({This, halfWidth}, 0),
    put({This, paintableForm}, undefined),
    ok.


new(PaintableForm, LockedIndex) when is_integer(LockedIndex) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, PaintableForm, LockedIndex),
    This.

'$init'(This, PaintableForm, LockedIndex) when is_integer(LockedIndex) ->
        'LockablePaintable':'$init'(This, LockedIndex),
        init_fields(This),
        put({This, paintableForm}, PaintableForm),
        put({This, halfWidth}, ((fun(Target_N65931) -> (get({Target_N65931, '$class'})):getWidth(Target_N65931) end)((fun(Target_N65938) -> (get({Target_N65938, '$class'})):getWithKey(Target_N65938, get({'LockedResources':getInstance(), 'LOCKED_DEMO_GAME_FEATURE_RESOURCE'})) end)('GameFeatureImageCacheFactory':getInstance())) / 2)).

paint(This, Graphics, CurrentIndex, X, Y) when is_integer(CurrentIndex), is_integer(X), is_integer(Y) ->
        case ((fun(Target_N66070) -> (get({Target_N66070, '$class'})):isLocked(Target_N66070) end)('LockedUtil':getInstance()) andalso ((fun(Target_N66098) -> (get({Target_N66098, '$class'})):getSelectedIndex(Target_N66098) end)((get({This, '$class'})):getPaintableForm(This)) >= (get({This, '$class'})):getLockedIndex(This))) of
            true ->
            (fun(Target_N66138) -> (get({Target_N66138, '$class'})):paintXY(Target_N66138, Graphics, ((fun(Target_N66170) -> (get({Target_N66170, '$class'})):getDx(Target_N66170) end)((get({This, '$class'})):getPaintableForm(This)) - get({This, halfWidth})), ((fun(Target_N66205) -> (get({Target_N66205, '$class'})):getDy(Target_N66205) end)((get({This, '$class'})):getPaintableForm(This)) + 34)) end)((get({This, '$class'})):getAnimation(This));
            false -> ok
        end.

getPaintableForm(This) ->
        get({This, paintableForm}).

