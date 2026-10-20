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
% import org.allbinary.android.view.BaseViewWrapper
% import org.allbinary.android.view.ViewWrapper
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil

-module('AndroidGameStatistics').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BaseGameStatistics', Function, Arguments).

init_fields(This) ->
    put({This, view}, get({'BaseViewWrapper', 'NULL_VIEW_WRAPPER'})),
    put({This, totalOnDraws}, 0),
    put({This, 'ANDROID_STRING_ARRAY'}, array:new(14, {default, undefined})),
    put({This, 'TOTAL_ONDRAWS'}, " Total onDraws: "),
    put({This, 'ONDRAWS_RATE'}, " onDraws(/10) Sec: "),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'BaseGameStatistics':'$init'(This),
    init_fields(This),
        StringUtil = 'StringUtil':getInstance(),
        lists:foreach(fun(Index) ->
            put({This, 'ANDROID_STRING_ARRAY'}, array:set(Index, get({StringUtil, 'EMPTY_STRING'}), get({This, 'ANDROID_STRING_ARRAY'})))
        end, lists:seq(0, array:size(get({This, 'ANDROID_STRING_ARRAY'})) - 1)).

initView(This, View) ->
        'BaseGameStatistics':init(This),
        put({This, view}, 'ViewWrapper':new(View)),
        put({This, totalOnDraws}, 0).

process(This) ->
        (get({get({This, view}), '$class'})):postInvalidate(get({This, view})).

nextOnDraw(This) ->
        put({This, totalOnDraws}, get({This, totalOnDraws}) + 1).

toStringArray(This) ->
        StringArray = 'BaseGameStatistics':toStringArray(This),
        lists:foreach(fun(Index) ->
            put({This, 'ANDROID_STRING_ARRAY'}, array:set(Index, array:get(Index, StringArray), get({This, 'ANDROID_STRING_ARRAY'})))
        end, lists:seq(0, array:size(StringArray) - 1)),
        put({local, totalTime}, (fun(Target_N66586) -> (get({Target_N66586, '$class'})):getElapsed(Target_N66586, get({get({This, gameTickTimeDelayHelper}), startTime})) end)((get({This, '$class'})):getTimeDelayHelper(This))),
        put({local, totalTime}, ((get({local, totalTime}) div 10000))),
        put({This, 'ANDROID_STRING_ARRAY'}, array:set(10, get({This, 'TOTAL_ONDRAWS'}), get({This, 'ANDROID_STRING_ARRAY'}))),
        put({This, 'ANDROID_STRING_ARRAY'}, array:set(11, allbinary_java:to_string(get({This, totalOnDraws})), get({This, 'ANDROID_STRING_ARRAY'}))),
        put({This, 'ANDROID_STRING_ARRAY'}, array:set(12, get({This, 'ONDRAWS_RATE'}), get({This, 'ANDROID_STRING_ARRAY'}))),
        put({This, 'ANDROID_STRING_ARRAY'}, array:set(13, allbinary_java:to_string((get({This, totalOnDraws}) div get({local, totalTime}))), get({This, 'ANDROID_STRING_ARRAY'}))),
        get({This, 'ANDROID_STRING_ARRAY'}).

toString(This) ->
        try
        put({local, totalTime}, (fun(Target_N66956) -> (get({Target_N66956, '$class'})):getElapsed(Target_N66956, get({get({This, gameTickTimeDelayHelper}), startTime})) end)((get({This, '$class'})):getTimeDelayHelper(This))),
        put({local, totalTime}, ((get({local, totalTime}) div 1000))),
        case (get({local, totalTime}) > 0) of
            true ->
            StringBuffer = 'StringMaker':new(),
            (get({StringBuffer, '$class'})):append(StringBuffer, 'BaseGameStatistics':toStringAt(This, get({local, totalTime}))),
            case (get({This, totalOnDraws}) > 0) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'TOTAL_ONDRAWS'})),
                (get({StringBuffer, '$class'})):append(StringBuffer, allbinary_java:to_string(get({This, totalOnDraws}))),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'ONDRAWS_RATE'})),
                DrawsOverTime = allbinary_java:to_string((get({This, totalOnDraws}) div get({local, totalTime}))),
                (get({StringBuffer, '$class'})):append(StringBuffer, DrawsOverTime);
                false -> ok
            end,
            throw({'$return', (get({StringBuffer, '$class'})):toString(StringBuffer)});
            false ->
            throw({'$return', get({This, 'NOT'})})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

