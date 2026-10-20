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
% package org.allbinary.canvas
% import android.view.View
% import org.allbinary.logic.string.StringMaker

-module('ProfilingRefreshHelper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('AndroidGameStatistics', Function, Arguments).

static_init() ->
    put({?MODULE, instance}, 'ProfilingRefreshHelper':new()),
    ok.

init_fields(This) ->
    put({This, firstTime}, true),
    put({This, bestFrameProcessingTime}, 0),
    put({This, worstFrameProcessingTime}, 0),
    put({This, frameProcessingTimeElapsed}, 0),
    ok.


getInstance() ->
        get({'ProfilingRefreshHelper', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'AndroidGameStatistics':'$init'(This),
    init_fields(This),
        ok.

initView(This, View) ->
        'AndroidGameStatistics':initView(This, View),
        put({This, frameProcessingTimeElapsed}, (fun(Target_N65925) -> (get({Target_N65925, '$class'})):getStartTime(Target_N65925) end)((get({This, '$class'})):getTimeDelayHelper(This))),
        put({This, bestFrameProcessingTime}, get({'Integer', 'MAX_VALUE'})),
        put({This, worstFrameProcessingTime}, 0).

nextFrame(This) ->
        put({This, frameProcessingTimeElapsed}, (erlang:system_time(millisecond) - get({This, frameProcessingTimeElapsed}))),
        case (get({This, firstTime}) =/= true) of
            true ->
            case (get({This, frameProcessingTimeElapsed}) > get({This, worstFrameProcessingTime})) of
                true ->
                put({This, worstFrameProcessingTime}, get({This, frameProcessingTimeElapsed}));
                false -> ok
            end,
            case (get({This, frameProcessingTimeElapsed}) < get({This, bestFrameProcessingTime})) of
                true ->
                put({This, bestFrameProcessingTime}, get({This, frameProcessingTimeElapsed}));
                false -> ok
            end;
            false ->
            put({This, firstTime}, false)
        end,
        'AndroidGameStatistics':nextFrame(This).

toString(This) ->
        (fun(Target_N66378) -> (get({Target_N66378, '$class'})):toString(Target_N66378) end)((fun(Target_N66385) -> (get({Target_N66385, '$class'})):appendint(Target_N66385, get({This, bestFrameProcessingTime})) end)((fun(Target_N66392) -> (get({Target_N66392, '$class'})):append(Target_N66392, " Best: ") end)((fun(Target_N66399) -> (get({Target_N66399, '$class'})):appendint(Target_N66399, get({This, worstFrameProcessingTime})) end)((fun(Target_N66406) -> (get({Target_N66406, '$class'})):append(Target_N66406, " Worst: ") end)((fun(Target_N66413) -> (get({Target_N66413, '$class'})):append(Target_N66413, 'AndroidGameStatistics':toString(This)) end)('StringMaker':new())))))).

