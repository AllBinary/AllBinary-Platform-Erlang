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
% import javax.microedition.lcdui.Graphics
% import org.allbinary.game.input.event.GameKeyEvent
% import org.allbinary.game.layer.AllBinaryGameLayer
% import org.allbinary.graphics.RectangleFactory
% import org.allbinary.graphics.paint.NullPaintable
% import org.allbinary.graphics.paint.PaintableInterface
% import org.allbinary.layer.AllBinaryLayerManager
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.util.BasicArrayList
% import org.allbinary.view.ViewPosition

-module('TestingInputSingleton').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements GameInputInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('AllBinaryGameLayer', Function, Arguments).

static_init() ->
    put({?MODULE, instance}, 'TestingInputSingleton':new()),
    ok.

init_fields(This) ->
    put({This, inputProcessorArray}, array:new(get({'InputFactory':getInstance(), 'MAX'}), {default, undefined})),
    put({This, paintable}, 'NullPaintable':getInstance()),
    ok.


getInstance() ->
        get({'TestingInputSingleton', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
        'AllBinaryGameLayer':'$init'(This, get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({'RectangleFactory', 'SINGLETON'}), 'ViewPosition':getInstanceD()),
        init_fields(This),
        'GameInputProcessorUtil':init(get({This, inputProcessorArray})).

initInputProcessors(This) ->
        ok.

initInputProcessorsForTestInput(This, ATestInputInterface) ->
        TestInputInterface = ATestInputInterface,
        put({This, paintable}, TestInputInterface),
        put({This, inputProcessorArray}, array:set(get({'Canvas', 'UP'}), 'GameInputProcessor':new() % Java anonymous class body: implement it as a module
%             ok % processEvent
, get({This, inputProcessorArray}))),
        put({This, inputProcessorArray}, array:set(get({'Canvas', 'DOWN'}), 'GameInputProcessor':new() % Java anonymous class body: implement it as a module
%             ok % processEvent
, get({This, inputProcessorArray}))),
        put({This, inputProcessorArray}, array:set(get({'Canvas', 'LEFT'}), 'GameInputProcessor':new() % Java anonymous class body: implement it as a module
%             ok % processEvent
, get({This, inputProcessorArray}))),
        put({This, inputProcessorArray}, array:set(get({'Canvas', 'RIGHT'}), 'GameInputProcessor':new() % Java anonymous class body: implement it as a module
%             ok % processEvent
, get({This, inputProcessorArray}))),
        put({This, inputProcessorArray}, array:set(get({'Canvas', 'KEY_NUM7'}), 'GameInputProcessor':new() % Java anonymous class body: implement it as a module
%             ok % processEvent
, get({This, inputProcessorArray}))),
        put({This, inputProcessorArray}, array:set(get({'Canvas', 'KEY_NUM9'}), 'GameInputProcessor':new() % Java anonymous class body: implement it as a module
%             ok % processEvent
, get({This, inputProcessorArray}))),
        'GameInputProcessorUtil':init(get({This, inputProcessorArray})).

% throws Exception
processInputList(This, AllbinaryLayerManager, List) ->
        put({local, key}, 0),
        put({local, gameKeyEvent}, undefined),
        Size = (get({List, '$class'})):size(List),
        lists:foreach(fun(Index) ->
            put({local, gameKeyEvent}, (array:get(Index, get({List, objectArray})))),
            put({local, key}, (get({get({local, gameKeyEvent}), '$class'})):getKey(get({local, gameKeyEvent}))),
            (fun(Target_N67544) -> (get({Target_N67544, '$class'})):processEvent(Target_N67544, AllbinaryLayerManager, get({'GameKeyEvent', 'NONE'})) end)(array:get(get({local, key}), get({This, inputProcessorArray})))
        end, lists:seq(0, Size - 1)).

% throws Exception
processInput(This, AllbinaryLayerManager) ->
        (get({This, '$class'})):processInputList(This, AllbinaryLayerManager, (get({This, '$class'})):getGameKeyEventList(This)),
        (fun(Target_N67800) -> (get({Target_N67800, '$class'})):clear(Target_N67800) end)((get({This, '$class'})):getGameKeyEventList(This)).

paint(This, Graphics) ->
        (get({get({This, paintable}), '$class'})):paint(get({This, paintable}), Graphics).

implmentsGameInputInterface(This) ->
        true.

