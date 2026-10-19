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
% package org.allbinary.game.combat.canvas
% import javax.microedition.lcdui.CommandListener
% import org.allbinary.game.combat.destroy.DestroyedLayerProcessor
% import org.allbinary.game.combat.destroy.event.DestroyEventCircularStaticPool
% import org.allbinary.game.combat.destroy.event.DestroyedEventHandler
% import org.allbinary.game.configuration.feature.Features
% import org.allbinary.game.configuration.feature.GameFeatureFactory
% import org.allbinary.game.displayable.canvas.AllBinaryGameCanvas
% import org.allbinary.game.init.BasicBuildGameInitializerFactory
% import org.allbinary.game.layer.AllBinaryGameLayerManager
% import org.allbinary.game.layer.drop.DropLayerProcessor
% import org.allbinary.game.layer.identification.GroupLayerManagerListener
% import org.allbinary.game.score.HighScoresFactoryInterface
% import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory
% import org.allbinary.layer.BasicLayerProcessor
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface

-module('CombatGameCanvas').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('AllBinaryGameCanvas', Function, Arguments).

static_init() ->
    put({?MODULE, basicLayerProcessor}, array:new(0, {default, undefined})),
    ok.

init_fields(This) ->
    ok.


new(CmdListener, GameLayerManager, HighScoresFactoryInterface, GameInitializationInterfaceFactoryInterface, Buffered) when is_boolean(Buffered) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, CmdListener, GameLayerManager, HighScoresFactoryInterface, GameInitializationInterfaceFactoryInterface, Buffered),
    This.

init(This, CmdListener, GameLayerManager, HighScoresFactoryInterface, GameInitializationInterfaceFactoryInterface, Buffered) when is_boolean(Buffered) ->
        'AllBinaryGameCanvas':init(This, CmdListener, GameLayerManager, HighScoresFactoryInterface, GameInitializationInterfaceFactoryInterface, Buffered).

'CombatGameCanvas_init'(This) ->
        (fun(Target_N66382) -> (get({Target_N66382, '$class'})):init(Target_N66382, This) end)('DestroyEventCircularStaticPool':getInstance()),
        (fun(Target_N66416) -> (get({Target_N66416, '$class'})):addNormalPortion(Target_N66416, 50, "Destroy Events") end)('ProgressCanvasFactory':getInstance()).

% throws Exception
initApp(This, AbeClientInformation) ->
        (get({This, '$class'})):'CombatGameCanvas_init'(This),
        'AllBinaryGameCanvas':initApp(This, AbeClientInformation).

initConfigurablePortion(This, Portion) when is_integer(Portion) ->
        'DestroyedLayerProcessor':init(),
        (fun(Target_N66615) -> (get({Target_N66615, '$class'})):addNormalPortion(Target_N66615, Portion, "Basic Processors") end)('ProgressCanvasFactory':getInstance()),
        Features = 'Features':getInstance(),
        GameFeatureFactory = 'GameFeatureFactory':getInstance(),
        case ((get({Features, '$class'})):isFeature(Features, get({GameFeatureFactory, 'DROPPED_ITEMS'})) andalso (get({Features, '$class'})):isFeature(Features, get({GameFeatureFactory, 'DROPPED_ITEMS_FROM_DEATH'}))) of
            true ->
            put({'CombatGameCanvas', basicLayerProcessor}, array:new(2, {default, undefined})),
            put({'CombatGameCanvas', basicLayerProcessor}, array:set(0, 'DestroyedLayerProcessor':getInstance(), get({'CombatGameCanvas', basicLayerProcessor}))),
            put({'CombatGameCanvas', basicLayerProcessor}, array:set(1, 'DropLayerProcessor':getInstance(), get({'CombatGameCanvas', basicLayerProcessor})));
            false ->
            put({'CombatGameCanvas', basicLayerProcessor}, array:new(1, {default, undefined})),
            put({'CombatGameCanvas', basicLayerProcessor}, array:set(0, 'DestroyedLayerProcessor':getInstance(), get({'CombatGameCanvas', basicLayerProcessor})))
        end.

% throws Exception
processPlayingGame(This) ->
        'AllBinaryGameCanvas':processPlayingGame(This),
        put({local, index}, array:size(get({'CombatGameCanvas', basicLayerProcessor}))),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            (fun(Target_N67165) -> (get({Target_N67165, '$class'})):process(Target_N67165, get({This, gameLayerManager})) end)(array:get(get({local, index}), get({'CombatGameCanvas', basicLayerProcessor}))),
            Loop();
        false -> ok end end)().

% throws Exception
cleanupGame(This) ->
        'AllBinaryGameCanvas':cleanupGame(This),
        put({local, index}, array:size(get({'CombatGameCanvas', basicLayerProcessor}))),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            (fun(Target_N67360) -> (get({Target_N67360, '$class'})):clear(Target_N67360) end)((fun(Target_N67367) -> (get({Target_N67367, '$class'})):getList(Target_N67367) end)(array:get(get({local, index}), get({'CombatGameCanvas', basicLayerProcessor})))),
            Loop();
        false -> ok end end)(),
        (fun(Target_N67479) -> (get({Target_N67479, '$class'})):clear(Target_N67479) end)('GroupLayerManagerListener':getInstance()),
        (fun(Target_N67507) -> (get({Target_N67507, '$class'})):log(Target_N67507) end)('GroupLayerManagerListener':getInstance()),
        (fun(Target_N67535) -> (get({Target_N67535, '$class'})):removeAllListeners(Target_N67535) end)('DestroyedEventHandler':getInstance()),
        (get({This, '$class'})):cleanupManager(This).

% throws Exception
cleanupManager(This) ->
        (get({get({This, gameLayerManager}), '$class'})):cleanup(get({This, gameLayerManager})).

