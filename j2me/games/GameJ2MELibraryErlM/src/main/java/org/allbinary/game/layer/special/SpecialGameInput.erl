% 
% AllBinary Open License Version 1 
% Copyright (c) 2025 AllBinary 
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
% package org.allbinary.game.layer.special
% import javax.microedition.lcdui.Graphics
% import org.allbinary.game.input.event.GameKeyEvent
% import org.allbinary.layer.AllBinaryLayerManager

-module('SpecialGameInput').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements SpecialGameInputInterface

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


% throws Exception
up(This) ->
        ok.

% throws Exception
down(This) ->
        ok.

% throws Exception
right(This) ->
        ok.

% throws Exception
left(This) ->
        ok.

% throws Exception
strafeLeft(This) ->
        ok.

% throws Exception
strafeRight(This) ->
        ok.

% throws Exception
fire(This, LayerManager, GameKeyEvent) ->
        ok.

% throws Exception
special1(This, LayerManager, GameKeyEvent) ->
        ok.

% throws Exception
special2(This, LayerManager, GameKeyEvent) ->
        ok.

% throws Exception
special3(This, LayerManager, GameKeyEvent) ->
        ok.

% throws Exception
special4(This, LayerManager, GameKeyEvent) ->
        ok.

% throws Exception
special5(This, LayerManager, GameKeyEvent) ->
        ok.

paint(This, Graphics) ->
        ok.

paintThreed(This, Graphics) ->
        ok.

