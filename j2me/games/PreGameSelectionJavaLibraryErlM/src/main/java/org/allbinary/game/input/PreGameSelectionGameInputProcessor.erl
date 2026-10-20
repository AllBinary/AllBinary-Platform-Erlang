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
% import org.allbinary.game.state.GameState
% import org.allbinary.layer.AllBinaryLayerManager
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings
% import org.allbinary.media.audio.SecondaryPlayerQueueFactory
% import org.allbinary.media.audio.SelectSound
% import org.allbinary.thread.ABRunnable
% import org.allbinary.thread.ThreadObjectUtil
% import org.allbinary.time.TimeDelayHelper

-module('PreGameSelectionGameInputProcessor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements GameInputProcessorInterface
% implements PlayerGameInputCompositeInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('Processor', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, gameCanvas}, undefined),
    put({This, preGameSelectorPaintable}, undefined),
    put({This, inputTimeHelper}, 'TimeDelayHelper':new(650)),
    put({This, nextGameState}, undefined),
    put({This, playerGameInput}, undefined),
    put({This, lockedIndex}, 0),
    put({This, abRunnable}, 'ABRunnable':new() % Java anonymous class body: implement it as a module
%         ok % run
),
    ok.


new(GameCanvas, PreGameSelectorPaintable, NextGameState, LockedIndex) when is_integer(LockedIndex) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, GameCanvas, PreGameSelectorPaintable, NextGameState, LockedIndex),
    This.

'$init'(This, GameCanvas, PreGameSelectorPaintable, NextGameState, LockedIndex) when is_integer(LockedIndex) ->
    'Processor':'$init'(This),
    init_fields(This),
        put({This, gameCanvas}, GameCanvas),
        put({This, preGameSelectorPaintable}, PreGameSelectorPaintable),
        put({This, nextGameState}, NextGameState),
        put({This, playerGameInput}, 'GameInputProcessorComposite':new("Pre Game Selection", This)),
        put({This, lockedIndex}, LockedIndex).

% throws Exception
process(This) ->
        (fun(Target_N67157) -> (get({Target_N67157, '$class'})):update(Target_N67157) end)((get({This, '$class'})):getPlayerGameInput(This)).

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
                    (fun(Target_N67851) -> (get({Target_N67851, '$class'})):add(Target_N67851, 'SelectSound':getInstance()) end)('SecondaryPlayerQueueFactory':getInstance()),
                    (fun(Target_N67898) -> (get({Target_N67898, '$class'})):processInputKey(Target_N67898, Key) end)((fun(Target_N67905) -> (get({Target_N67905, '$class'})):getPreGameSelectionForm(Target_N67905) end)((get({This, '$class'})):getPreGameSelectorPaintable(This))),
                    throw('$break');
                    false -> ok
                end;
                false ->
                case (Key =:= get({'Canvas', 'KEY_NUM0'})) of
                true ->
                SelectedIndex = (fun(Target_N67561) -> (get({Target_N67561, '$class'})):getSelectedIndex(Target_N67561) end)((get({get({This, preGameSelectorPaintable}), '$class'})):getPreGameSelectionForm(get({This, preGameSelectorPaintable}))),
                case ((SelectedIndex < get({This, lockedIndex})) orelse (not (fun(Target_N67635) -> (get({Target_N67635, '$class'})):isLocked(Target_N67635) end)('LockedUtil':getInstance()))) of
                    true ->
                    case (not (get({get({This, abRunnable}), '$class'})):isRunning(get({This, abRunnable}))) of
                        true ->
                        (get({get({This, abRunnable}), '$class'})):setRunning(get({This, abRunnable}), true),
                        (fun(Target_N67760) -> (get({Target_N67760, '$class'})):processThread(Target_N67760, get({This, abRunnable})) end)('ThreadObjectUtil':getInstance());
                        false -> ok
                    end,
                    throw('$break');
                    false ->
                    (fun(Target_N67669) -> (get({Target_N67669, '$class'})):fire(Target_N67669) end)('LockedFeatureNotificationUtil':getInstance())
                end;
                false -> ok
            end
            end
        end, lists:seq(0, Size - 1)),
        (get({List, '$class'})):clear(List).

getPreGameSelectorPaintable(This) ->
        get({This, preGameSelectorPaintable}).

% throws Exception
processInput(This, LayerManager) ->
        ok.

initInputProcessors(This) ->
        ok.

getName(This) ->
        (get({This, '$class'})):toString(This).

getPlayerGameInput(This) ->
        get({This, playerGameInput}).

