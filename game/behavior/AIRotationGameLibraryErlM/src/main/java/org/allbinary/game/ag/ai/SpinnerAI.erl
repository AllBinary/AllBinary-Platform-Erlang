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
% package org.allbinary.game.ag.ai
% import javax.microedition.lcdui.Canvas
% import org.allbinary.game.ai.BasicAI
% import org.allbinary.game.input.GameInput
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.layer.AllBinaryLayerManager

-module('SpinnerAI').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicAI', Function, Arguments).

init_fields(This) ->
    put({This, isEven}, false),
    put({This, direction}, undefined),
    ok.


new(Direction, OwnerLayerInterface, GameInput) when (is_tuple(Direction) orelse Direction =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Direction, OwnerLayerInterface, GameInput),
    This.

'$init'(This, Direction, OwnerLayerInterface, GameInput) when (is_tuple(Direction) orelse Direction =:= undefined) ->
        'BasicAI':'$init'(This, OwnerLayerInterface, GameInput),
        init_fields(This),
        put({This, direction}, Direction).

% throws Exception
processAI(This, AllBinaryLayerManager) ->
        case get({This, isEven}) of
            true ->
            'BasicAI':processKeyAI(This, array:get(0, get({This, direction}))),
            put({This, isEven}, false);
            false ->
            'BasicAI':processKeyAI(This, get({'Canvas', 'KEY_NUM1'})),
            put({This, isEven}, true)
        end.

