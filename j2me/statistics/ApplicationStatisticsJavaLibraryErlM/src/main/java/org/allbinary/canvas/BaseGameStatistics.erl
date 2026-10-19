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
% import org.allbinary.logic.math.PrimitiveLongSingleton
% import org.allbinary.logic.math.ScaleFactorFactory
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.string.CommonSeps
% import org.allbinary.time.GameTickTimeDelayHelper
% import org.allbinary.time.GameTickTimeDelayHelperFactory
% import org.allbinary.time.TimeDelayHelper

-module('BaseGameStatistics').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, timeDelayHelper}, 'TimeDelayHelper':new(get({'Integer', 'MAX_VALUE'}))),
    put({This, updateDelayHelper}, 'TimeDelayHelper':new(2000)),
    put({This, totalRefreshes}, 0),
    put({This, totalFrames}, 0),
    put({This, gameTickTimeDelayHelper}, 'GameTickTimeDelayHelperFactory':getInstance()),
    put({This, 'DEFAULT_SCALE_FACTOR'}, get({'ScaleFactorFactory':getInstance(), 'DEFAULT_SCALE_FACTOR'})),
    put({This, 'NOT'}, "Not enough Time to Calculate"),
    put({This, 'EMPTY_STRING'}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
    put({This, 'STRING_ARRAY'}, array:from_list([" Total Time: ", get({This, 'EMPTY_STRING'}), " Total Frames: ", get({This, 'EMPTY_STRING'}), " Frames/10 Sec: ", get({This, 'EMPTY_STRING'}), " Total Paints: ", get({This, 'EMPTY_STRING'}), " Paints/10 Sec: ", get({This, 'EMPTY_STRING'})])),
    put({This, 'SPACE_CHAR'}, $\s),
    put({This, 'PLUS_CHAR'}, $+),
    put({This, 'X_CHAR'}, $X),
    put({This, 'CHAR_ARRAY'}, array:from_list([array:from_list([$F, $r, $a, $m, $e, $s, $/, $1, $0, $\s, $S, $e, $c, $:]), array:from_list([$X, $X]), array:from_list([$P, $a, $i, $n, $t, $s, $/, $1, $0, $\s, $S, $e, $c, $:]), array:from_list([$X, $X])])),
    put({This, primitiveLongSingleton}, 'PrimitiveLongSingleton':getInstance()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

init(This) ->
        (get({get({This, timeDelayHelper}), '$class'})):setStartTimeTNT(get({This, timeDelayHelper})),
        put({This, totalRefreshes}, 0),
        put({This, totalFrames}, 0).

add(This, String) when (is_list(String) orelse String =:= undefined) ->
        ok.

process(This) ->
        ok.

nextFrame(This) ->
        put({This, totalFrames}, get({This, totalFrames}) + 1).

nextRefresh(This) ->
        put({This, totalRefreshes}, get({This, totalRefreshes}) + 1).

getRefreshRate(This) ->
        try
        Elapsed = (get({get({This, timeDelayHelper}), '$class'})):getElapsed(get({This, timeDelayHelper}), get({get({This, gameTickTimeDelayHelper}), startTime})),
        case (Elapsed > 1) of
            true ->
            Time = ((get({This, totalRefreshes}) div ((Elapsed bsr get({This, 'DEFAULT_SCALE_FACTOR'}))))),
            throw({'$return', Time});
            false ->
            throw({'$return', 0})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getTimeDelayHelper(This) ->
        get({This, timeDelayHelper}).

to2DCharArray(This) ->
        put({local, totalTime}, (get({get({This, timeDelayHelper}), '$class'})):getElapsed(get({This, timeDelayHelper}), get({get({This, gameTickTimeDelayHelper}), startTime}))),
        put({local, totalTime}, ((get({local, totalTime}) bsr get({This, 'DEFAULT_SCALE_FACTOR'})))),
        case ((get({local, totalTime}) > 0) andalso (get({get({This, updateDelayHelper}), '$class'})):isTime(get({This, updateDelayHelper}), get({get({This, gameTickTimeDelayHelper}), startTime}))) of
            true ->
            FramesPerSec = ((get({This, totalFrames}) div get({local, totalTime}))),
            case (FramesPerSec < 10) of
                true ->
                put({This, 'CHAR_ARRAY'}, array:set(1, array:set(0, get({This, 'SPACE_CHAR'}), array:get(1, get({This, 'CHAR_ARRAY'}))), get({This, 'CHAR_ARRAY'}))),
                put({This, 'CHAR_ARRAY'}, array:set(1, array:set(1, array:get(FramesPerSec, get({get({This, primitiveLongSingleton}), 'NUMBER_CHAR_ARRAY'})), array:get(1, get({This, 'CHAR_ARRAY'}))), get({This, 'CHAR_ARRAY'})));
                false ->
                case (FramesPerSec < 100) of
                true ->
                put({local, tens}, (FramesPerSec div 10)),
                put({local, removeTens}, (get({local, tens}) * 10)),
                put({This, 'CHAR_ARRAY'}, array:set(1, array:set(0, array:get(get({local, tens}), get({get({This, primitiveLongSingleton}), 'NUMBER_CHAR_ARRAY'})), array:get(1, get({This, 'CHAR_ARRAY'}))), get({This, 'CHAR_ARRAY'}))),
                put({This, 'CHAR_ARRAY'}, array:set(1, array:set(1, array:get((FramesPerSec - get({local, removeTens})), get({get({This, primitiveLongSingleton}), 'NUMBER_CHAR_ARRAY'})), array:get(1, get({This, 'CHAR_ARRAY'}))), get({This, 'CHAR_ARRAY'})));
                false ->
                put({This, 'CHAR_ARRAY'}, array:set(1, array:set(0, get({This, 'PLUS_CHAR'}), array:get(1, get({This, 'CHAR_ARRAY'}))), get({This, 'CHAR_ARRAY'}))),
                put({This, 'CHAR_ARRAY'}, array:set(1, array:set(1, get({This, 'PLUS_CHAR'}), array:get(1, get({This, 'CHAR_ARRAY'}))), get({This, 'CHAR_ARRAY'})))
            end
            end,
            RefreshesPerSec = ((get({This, totalRefreshes}) div get({local, totalTime}))),
            case (RefreshesPerSec < 10) of
                true ->
                put({This, 'CHAR_ARRAY'}, array:set(3, array:set(0, get({This, 'X_CHAR'}), array:get(3, get({This, 'CHAR_ARRAY'}))), get({This, 'CHAR_ARRAY'}))),
                put({This, 'CHAR_ARRAY'}, array:set(3, array:set(1, array:get(RefreshesPerSec, get({get({This, primitiveLongSingleton}), 'NUMBER_CHAR_ARRAY'})), array:get(3, get({This, 'CHAR_ARRAY'}))), get({This, 'CHAR_ARRAY'})));
                false ->
                case (RefreshesPerSec < 100) of
                true ->
                put({local, tens}, (RefreshesPerSec div 10)),
                put({local, removeTens}, (get({local, tens}) * 10)),
                put({This, 'CHAR_ARRAY'}, array:set(3, array:set(0, array:get((RefreshesPerSec div 10), get({get({This, primitiveLongSingleton}), 'NUMBER_CHAR_ARRAY'})), array:get(3, get({This, 'CHAR_ARRAY'}))), get({This, 'CHAR_ARRAY'}))),
                put({This, 'CHAR_ARRAY'}, array:set(3, array:set(1, array:get((RefreshesPerSec - get({local, removeTens})), get({get({This, primitiveLongSingleton}), 'NUMBER_CHAR_ARRAY'})), array:get(3, get({This, 'CHAR_ARRAY'}))), get({This, 'CHAR_ARRAY'})));
                false ->
                put({This, 'CHAR_ARRAY'}, array:set(3, array:set(0, get({This, 'PLUS_CHAR'}), array:get(3, get({This, 'CHAR_ARRAY'}))), get({This, 'CHAR_ARRAY'}))),
                put({This, 'CHAR_ARRAY'}, array:set(3, array:set(1, get({This, 'PLUS_CHAR'}), array:get(3, get({This, 'CHAR_ARRAY'}))), get({This, 'CHAR_ARRAY'})))
            end
            end;
            false -> ok
        end,
        get({This, 'CHAR_ARRAY'}).

toStringArray(This) ->
        put({local, totalTime}, (get({get({This, timeDelayHelper}), '$class'})):getElapsed(get({This, timeDelayHelper}), get({get({This, gameTickTimeDelayHelper}), startTime}))),
        put({local, totalTime}, ((get({local, totalTime}) div 10000))),
        case (get({local, totalTime}) > 0) of
            true ->
            put({This, 'STRING_ARRAY'}, array:set(1, allbinary_java:to_string(get({local, totalTime})), get({This, 'STRING_ARRAY'}))),
            put({This, 'STRING_ARRAY'}, array:set(3, allbinary_java:to_string(get({This, totalFrames})), get({This, 'STRING_ARRAY'}))),
            put({This, 'STRING_ARRAY'}, array:set(5, allbinary_java:to_string((get({This, totalFrames}) div get({local, totalTime}))), get({This, 'STRING_ARRAY'}))),
            put({This, 'STRING_ARRAY'}, array:set(7, allbinary_java:to_string(get({This, totalRefreshes})), get({This, 'STRING_ARRAY'}))),
            put({This, 'STRING_ARRAY'}, array:set(9, allbinary_java:to_string((get({This, totalRefreshes}) div get({local, totalTime}))), get({This, 'STRING_ARRAY'})));
            false ->
            String = get({This, 'EMPTY_STRING'}),
            put({This, 'STRING_ARRAY'}, array:set(1, String, get({This, 'STRING_ARRAY'}))),
            put({This, 'STRING_ARRAY'}, array:set(3, String, get({This, 'STRING_ARRAY'}))),
            put({This, 'STRING_ARRAY'}, array:set(5, String, get({This, 'STRING_ARRAY'}))),
            put({This, 'STRING_ARRAY'}, array:set(7, String, get({This, 'STRING_ARRAY'}))),
            put({This, 'STRING_ARRAY'}, array:set(9, String, get({This, 'STRING_ARRAY'})))
        end,
        get({This, 'STRING_ARRAY'}).

toStringAt(This, TotalTime) when is_integer(TotalTime) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, array:get(0, get({This, 'STRING_ARRAY'}))),
        (get({StringBuffer, '$class'})):appendlong(StringBuffer, TotalTime),
        (get({StringBuffer, '$class'})):append(StringBuffer, array:get(2, get({This, 'STRING_ARRAY'}))),
        (get({StringBuffer, '$class'})):appendlong(StringBuffer, get({This, totalFrames})),
        (get({StringBuffer, '$class'})):append(StringBuffer, array:get(4, get({This, 'STRING_ARRAY'}))),
        (get({StringBuffer, '$class'})):appendlong(StringBuffer, (get({This, totalFrames}) div TotalTime)),
        case (get({This, totalRefreshes}) > 0) of
            true ->
            (get({StringBuffer, '$class'})):append(StringBuffer, array:get(6, get({This, 'STRING_ARRAY'}))),
            (get({StringBuffer, '$class'})):appendlong(StringBuffer, get({This, totalRefreshes})),
            (get({StringBuffer, '$class'})):append(StringBuffer, array:get(8, get({This, 'STRING_ARRAY'}))),
            (get({StringBuffer, '$class'})):appendlong(StringBuffer, (get({This, totalRefreshes}) div TotalTime)),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({'CommonSeps':getInstance(), 'NEW_LINE'}));
            false -> ok
        end,
        (get({StringBuffer, '$class'})):toString(StringBuffer).

toString(This) ->
        try
        put({local, totalTime}, (get({get({This, timeDelayHelper}), '$class'})):getElapsed(get({This, timeDelayHelper}), get({get({This, gameTickTimeDelayHelper}), startTime}))),
        put({local, totalTime}, ((get({local, totalTime}) div 1000))),
        case (get({local, totalTime}) > 0) of
            true ->
            throw({'$return', (get({This, '$class'})):toStringAt(This, get({local, totalTime}))});
            false ->
            throw({'$return', get({This, 'NOT'})})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

