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
% package org.allbinary.game.input
% import javax.microedition.lcdui.Canvas
% import org.allbinary.util.BasicArrayList
% import org.allbinary.logic.system.security.licensing.LockedFeatureNotificationUtil
% import org.allbinary.logic.system.security.licensing.LockedUtil
% import org.allbinary.canvas.Processor
% import org.allbinary.game.displayable.canvas.AllBinaryGameCanvas
% import org.allbinary.game.displayable.canvas.PreGameSelectorPaintable
% import org.allbinary.game.input.event.GameKeyEventHandler
% import org.allbinary.game.input.event.GameKeyEventUtil
% import org.allbinary.layer.AllBinaryLayerManager
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings
% import org.allbinary.media.audio.SecondaryPlayerQueueFactory
% import org.allbinary.media.audio.SelectSound
% import org.allbinary.media.graphics.geography.map.racetrack.MultiLevelRaceTrackGeographicMapInterfaceFactoryInterface
% import org.allbinary.thread.ABRunnable
% import org.allbinary.thread.ThreadObjectUtil
% import org.allbinary.time.TimeDelayHelper

-module('MapSelectionGameInputProcessor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements GameInputProcessorInterface
% implements PlayerGameInputCompositeInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('Processor', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, gameCanvas}, undefined),
    put({This, raceTrackGeographicMapInterfaceFactoryInterface}, undefined),
    put({This, preGameSelectorPaintable}, undefined),
    put({This, inputTimeHelper}, 'TimeDelayHelper':new(650)),
    put({This, playerGameInput}, undefined),
    put({This, lockedIndex}, 0),
    put({This, abRunnable}, 'ABRunnable':new() % Java anonymous class body: implement it as a module
%         ok % run
),
    ok.


new(GameCanvas, RaceTrackGeographicMapInterfaceFactoryInterface, MapSelectorPaintable, LockedIndex) when is_integer(LockedIndex) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, GameCanvas, RaceTrackGeographicMapInterfaceFactoryInterface, MapSelectorPaintable, LockedIndex),
    This.

'$init'(This, GameCanvas, RaceTrackGeographicMapInterfaceFactoryInterface, MapSelectorPaintable, LockedIndex) when is_integer(LockedIndex) ->
    'Processor':'$init'(This),
    init_fields(This),
        put({This, gameCanvas}, GameCanvas),
        put({This, raceTrackGeographicMapInterfaceFactoryInterface}, RaceTrackGeographicMapInterfaceFactoryInterface),
        put({This, preGameSelectorPaintable}, MapSelectorPaintable),
        put({This, playerGameInput}, 'GameInputProcessorComposite':new("Map Selection", This)),
        put({This, lockedIndex}, LockedIndex).

% throws Exception
process(This) ->
        (fun(Target_N67339) -> (get({Target_N67339, '$class'})):update(Target_N67339) end)((get({This, '$class'})):getPlayerGameInput(This)).

% throws Exception
onInput(This, List) ->
        Size = (get({List, '$class'})):size(List),
        lists:foreach(fun(Index) ->
            AnyType = (get({List, '$class'})):get(List, Index),
            Key = 'GameKeyEventUtil':getKey(AnyType),
            case ((((Key =:= get({'Canvas', 'LEFT'})) orelse (Key =:= get({'Canvas', 'RIGHT'}))) orelse (Key =:= get({'Canvas', 'UP'}))) orelse (Key =:= get({'Canvas', 'DOWN'}))) of
                true ->
                case (get({get({This, inputTimeHelper}), '$class'})):isTimeTNT(get({This, inputTimeHelper})) of
                    true ->
                    (fun(Target_N68037) -> (get({Target_N68037, '$class'})):add(Target_N68037, 'SelectSound':getInstance()) end)('SecondaryPlayerQueueFactory':getInstance()),
                    (fun(Target_N68084) -> (get({Target_N68084, '$class'})):processInputKey(Target_N68084, Key) end)((get({get({This, preGameSelectorPaintable}), '$class'})):getPreGameSelectionForm(get({This, preGameSelectorPaintable}))),
                    throw('$break');
                    false -> ok
                end;
                false ->
                case (Key =:= get({'Canvas', 'KEY_NUM0'})) of
                true ->
                SelectedIndex = (fun(Target_N67747) -> (get({Target_N67747, '$class'})):getSelectedIndex(Target_N67747) end)((get({get({This, preGameSelectorPaintable}), '$class'})):getPreGameSelectionForm(get({This, preGameSelectorPaintable}))),
                case ((SelectedIndex < get({This, lockedIndex})) orelse (not (fun(Target_N67821) -> (get({Target_N67821, '$class'})):isLocked(Target_N67821) end)('LockedUtil':getInstance()))) of
                    true ->
                    case (not (get({get({This, abRunnable}), '$class'})):isRunning(get({This, abRunnable}))) of
                        true ->
                        (get({get({This, abRunnable}), '$class'})):setRunning(get({This, abRunnable}), true),
                        (fun(Target_N67946) -> (get({Target_N67946, '$class'})):processThread(Target_N67946, get({This, abRunnable})) end)('ThreadObjectUtil':getInstance());
                        false -> ok
                    end,
                    throw('$break');
                    false ->
                    (fun(Target_N67855) -> (get({Target_N67855, '$class'})):fire(Target_N67855) end)('LockedFeatureNotificationUtil':getInstance())
                end;
                false -> ok
            end
            end,
            (get({List, '$class'})):clear(List)
        end, lists:seq(0, Size - 1)).

% throws Exception
processInput(This, LayerManager) ->
        ok.

initInputProcessors(This) ->
        ok.

getName(This) ->
        (get({This, '$class'})):toString(This).

getPlayerGameInput(This) ->
        get({This, playerGameInput}).

