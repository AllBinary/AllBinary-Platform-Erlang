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
% package org.allbinary.game.layer.pickup
% import javax.microedition.lcdui.Graphics
% import org.allbinary.animation.Animation
% import org.allbinary.animation.NullAnimationFactory
% import org.allbinary.graphics.PointFactory
% import org.allbinary.graphics.Rectangle
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.view.ViewPosition

-module('IconLayer').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('AllBinaryLayer', Function, Arguments).

static_init() ->
    put({?MODULE, 'NULL_ICON_LAYER'}, 'IconLayer':new((fun(Target_N65840) -> (get({Target_N65840, '$class'})):getInstance(Target_N65840, 0) end)('NullAnimationFactory':getFactoryInstance()), 0, 0)),
    ok.

init_fields(This) ->
    put({This, animationInterface}, undefined),
    ok.


new(AnimationInterface, Width, Height) when is_integer(Width), is_integer(Height) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, AnimationInterface, Width, Height),
    This.

'$init'(This, AnimationInterface, Width, Height) when is_integer(Width), is_integer(Height) ->
        'AllBinaryLayer':'$init'(This, get({'StringUtil':getInstance(), 'EMPTY_STRING'}), 'Rectangle':new(get({'PointFactory':getInstance(), 'ZERO_ZERO'}), Width, Height), 'ViewPosition':getInstanceD()),
        init_fields(This),
        put({This, animationInterface}, AnimationInterface).

paint(This, Graphics) ->
        (get({get({This, animationInterface}), '$class'})):paintXY(get({This, animationInterface}), Graphics, get({This, x}), get({This, y})).

paintThreed(This, Graphics) ->
        (get({get({This, animationInterface}), '$class'})):paintThreedXYZ(get({This, animationInterface}), Graphics, get({This, x}), get({This, y}), get({This, z})).

getAnimationInterface(This) ->
        get({This, animationInterface}).

