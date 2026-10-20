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
% package org.allbinary.game.ag.layer.pickup.health
% import javax.microedition.lcdui.Graphics
% import org.allbinary.game.health.HealthInterface
% import org.allbinary.game.health.HealthVisitorInterface
% import org.allbinary.graphics.PointFactory
% import org.allbinary.graphics.Rectangle
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.view.ViewPosition

-module('HealLayer').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements HealthVisitorInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('AllBinaryLayer', Function, Arguments).

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
        'AllBinaryLayer':'$init'(This, get({'StringUtil':getInstance(), 'EMPTY_STRING'}), 'Rectangle':new(get({'PointFactory':getInstance(), 'ZERO_ZERO'}), 0, 0), 'ViewPosition':getInstanceD()).

paint(This, Graphics) ->
        ok.

visit(This, HealthInterface) ->
        case (get({HealthInterface, '$class'})):isAlive(HealthInterface) of
            true ->
            (get({HealthInterface, '$class'})):healMax(HealthInterface);
            false ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Heal attempt on dead: Does not currently occur", This, "visit")
        end.

