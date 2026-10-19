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
% package org.allbinary.game.layer
% import org.allbinary.game.ag.layer.hud.basic.notification.GameNotificationHud
% import org.allbinary.game.combat.destroy.event.DestroyedEvent
% import org.allbinary.game.input.PlayerGameInput
% import org.allbinary.game.input.form.NullRTSFormInputFactory
% import org.allbinary.game.input.form.RTSFormInput
% import org.allbinary.game.layer.capital.Capital
% import org.allbinary.graphics.form.ScrollSelectionForm
% import org.allbinary.layer.AllBinaryLayerManager
% import org.allbinary.logic.util.event.AllBinaryEventObject
% import org.allbinary.media.audio.Sound

-module('NullRTSLayer').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements RTSPlayerLayerInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('NullPathFindingLayer', Function, Arguments).

static_init() ->
    put({?MODULE, 'NULL_RTS_LAYER'}, 'NullRTSLayer':new()),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'NullPathFindingLayer':init(This),
    init_fields(This).


getName(This) ->
        erlang:error({'RuntimeException'}).

% throws Exception
processInput(This, LayerManager) ->
        erlang:error({'RuntimeException'}).

initInputProcessors(This) ->
        erlang:error({'RuntimeException'}).

getGameNotificationHud(This) ->
        erlang:error({'RuntimeException'}).

getCurrentScrollSelectionForm(This) ->
        erlang:error({'RuntimeException'}).

setCurrentScrollSelectionForm(This, CurrentScrollSelectionForm) ->
        erlang:error({'RuntimeException'}).

getBuildingScrollSelectionForm(This) ->
        erlang:error({'RuntimeException'}).

getPlayerGameInput(This) ->
        erlang:error({'RuntimeException'}).

onEvent(This, EventObject) ->
        erlang:error({'RuntimeException'}).

% throws Exception
onDestroyed(This, DestroyedEvent) ->
        erlang:error({'RuntimeException'}).

% throws Exception
processTick(This, AllBinaryLayerManager) ->
        erlang:error({'RuntimeException'}).

getCapital(This) ->
        erlang:error({'RuntimeException'}).

getRTSFormInput(This) ->
        'NullRTSFormInputFactory':getInstance().

add(This, Sound) ->
        erlang:error({'RuntimeException'}).

getPlayerOwnedRTSLayers(This) ->
        erlang:error({'RuntimeException'}).

implmentsArtificialIntelligenceCompositeInterface(This) ->
        erlang:error({'RuntimeException'}).

