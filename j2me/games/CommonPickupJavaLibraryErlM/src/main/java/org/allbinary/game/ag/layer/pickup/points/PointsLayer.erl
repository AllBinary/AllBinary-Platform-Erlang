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
% package org.allbinary.game.ag.layer.pickup.points
% import javax.microedition.lcdui.Graphics
% import org.allbinary.game.score.ScoreableInterface
% import org.allbinary.graphics.PointFactory
% import org.allbinary.graphics.Rectangle
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.view.ViewPosition

-module('PointsLayer').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('AllBinaryLayer', Function, Arguments).

init_fields(This) ->
    put({This, points}, 0),
    ok.


new(Points) when is_integer(Points) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Points),
    This.

'$init'(This, Points) when is_integer(Points) ->
        'AllBinaryLayer':'$init'(This, get({'StringUtil':getInstance(), 'EMPTY_STRING'}), 'Rectangle':new(get({'PointFactory':getInstance(), 'ZERO_ZERO'}), 0, 0), 'ViewPosition':getInstanceD()),
        init_fields(This),
        put({This, points}, Points).

paint(This, Graphics) ->
        ok.

visit(This, ScoreableInterface) ->
        (get({ScoreableInterface, '$class'})):addPoints(ScoreableInterface, get({This, points})).

