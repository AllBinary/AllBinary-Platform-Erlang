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
% import javax.microedition.lcdui.Graphics
% import org.allbinary.game.input.PlayerGameInput
% import org.allbinary.game.input.PlayerGameInputCompositeInterface
% import org.allbinary.graphics.PointFactory
% import org.allbinary.graphics.Rectangle
% import org.allbinary.graphics.displayable.CanvasStrings
% import org.allbinary.layer.AllBinaryLayerManager
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.view.StaticViewPosition

-module('PlayerGameInputGameLayer').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements PlayerGameInputCompositeInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('AllBinaryGameLayer', Function, Arguments).

init_fields(This) ->
    put({This, playerGameInput}, undefined),
    ok.


new(PlayerInputId) when is_integer(PlayerInputId) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, PlayerInputId),
    This.

'$init'(This, PlayerInputId) when is_integer(PlayerInputId) ->
        'AllBinaryGameLayer':'$init'(This, get({'StringUtil':getInstance(), 'EMPTY_STRING'}), 'Rectangle':new(get({'PointFactory':getInstance(), 'ZERO_ZERO'}), 0, 0), 'StaticViewPosition':new(0, 0, 0)),
        init_fields(This),
        put({This, playerGameInput}, 'PlayerGameInput':new((get({This, '$class'})):getGameKeyEventList(This), 'BasicArrayListD':new(), PlayerInputId)),
        CanvasStrings = 'CanvasStrings':getInstance(),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Danger Danger Danger: Should Not Be Called Except For Testing Input", This, get({CanvasStrings, 'PAINT'})).

getPlayerGameInput(This) ->
        get({This, playerGameInput}).

initInputProcessors(This) ->
        ok.

% throws Exception
processInput(This, MyManager) ->
        ok.

paint(This, Graphics) ->
        ok.

