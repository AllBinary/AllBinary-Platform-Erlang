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
% package org.allbinary.thread
% import org.allbinary.J2MEUtil
% import org.allbinary.canvas.RunnableCanvas
% import org.allbinary.game.displayable.canvas.AllBinaryGameCanvas
% import org.allbinary.game.displayable.canvas.DemoCanvas
% import org.allbinary.game.displayable.canvas.GameCanvasRunnableInterface
% import org.allbinary.game.displayable.canvas.RunnableCanvasSingleThreadStartRunnable
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.string.CommonStrings

-module('ThreadFactoryUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ThreadFactoryUtil':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'ThreadFactoryUtil', instance}).

getInstanceGameCanvasRunnable(This, Runnable) ->
        (get({This, '$class'})):getInstanceType(This, Runnable, (get({Runnable, '$class'})):getType(Runnable)).

getInstanceForRunnable(This, Runnable) ->
        (get({This, '$class'})):getInstanceType(This, Runnable, (get({Runnable, '$class'})):getType(Runnable)).

getInstanceType(This, Runnable, Type) when is_integer(Type) ->
        CommonStrings = 'CommonStrings':getInstance(),
        case 'J2MEUtil':isHTML() of
            true ->
            case ((Type =:= get({'DemoCanvas', 'TYPE'})) orelse (Type =:= get({'AllBinaryGameCanvas', 'TYPE'}))) of
                true ->
                DemoGameSingleThreadStartRunnable = 'RunnableCanvasSingleThreadStartRunnable':new(Runnable),
                'PreLogUtil':put((fun(Target_N66720) -> (get({Target_N66720, '$class'})):toString(Target_N66720) end)((fun(Target_N66727) -> (get({Target_N66727, '$class'})):append(Target_N66727, (fun(Target_N66763) -> (get({Target_N66763, '$class'})):toString(Target_N66763, Runnable) end)('StringUtil':getInstance())) end)((fun(Target_N66734) -> (get({Target_N66734, '$class'})):append(Target_N66734, "Using Pseudo Thread for DemoCanvas/AllBinaryGameCanvas under PlayN/HTML5: ") end)('StringMaker':new()))), This, get({CommonStrings, 'CONSTRUCTOR'})),
                put({local, primaryThreadPool}, 'PrimaryThreadPool':getInstance()),
                (get({get({local, primaryThreadPool}), '$class'})):runTask(get({local, primaryThreadPool}), DemoGameSingleThreadStartRunnable);
                false ->
                'PreLogUtil':put((fun(Target_N66443) -> (get({Target_N66443, '$class'})):toString(Target_N66443) end)((fun(Target_N66450) -> (get({Target_N66450, '$class'})):append(Target_N66450, (fun(Target_N66486) -> (get({Target_N66486, '$class'})):toString(Target_N66486, Runnable) end)('StringUtil':getInstance())) end)((fun(Target_N66457) -> (get({Target_N66457, '$class'})):append(Target_N66457, "Using Pseudo Thread for Runnable under PlayN/HTML5: ") end)('StringMaker':new()))), This, get({CommonStrings, 'CONSTRUCTOR'})),
                put({local, primaryThreadPool}, 'PrimaryThreadPool':getInstance()),
                (get({get({local, primaryThreadPool}), '$class'})):runTask(get({local, primaryThreadPool}), Runnable)
            end;
            false -> ok
        end,
        Thread = 'Thread':new(Runnable, (get({Runnable, '$class'})):toString(Runnable)),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({Thread, '$class'})):toString(Thread), This, get({CommonStrings, 'CONSTRUCTOR'})),
        Thread.

start(This, Thread) ->
        (get({Thread, '$class'})):start(Thread).

