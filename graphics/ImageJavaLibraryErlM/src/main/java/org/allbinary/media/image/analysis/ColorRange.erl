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
% package org.allbinary.media.image.analysis
% import java.awt
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonSeps

-module('ColorRange').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ColorRangeInterface

init_fields(This) ->
    put({This, minRed}, 0),
    put({This, maxRed}, 0),
    put({This, minGreen}, 0),
    put({This, maxGreen}, 0),
    put({This, minBlue}, 0),
    put({This, maxBlue}, 0),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        put({This, minRed}, 0),
        put({This, maxRed}, 0),
        put({This, minGreen}, 0),
        put({This, maxGreen}, 0),
        put({This, minBlue}, 0),
        put({This, maxBlue}, 0).

getMinRed(This) ->
        get({This, minRed}).

setMinRed(This, MinRed) when is_integer(MinRed) ->
        put({This, minRed}, MinRed).

getMaxRed(This) ->
        get({This, maxRed}).

setMaxRed(This, MaxRed) when is_integer(MaxRed) ->
        put({This, maxRed}, MaxRed).

getMinGreen(This) ->
        get({This, minGreen}).

setMinGreen(This, MinGreen) when is_integer(MinGreen) ->
        put({This, minGreen}, MinGreen).

getMaxGreen(This) ->
        get({This, maxGreen}).

setMaxGreen(This, MaxGreen) when is_integer(MaxGreen) ->
        put({This, maxGreen}, MaxGreen).

getMinBlue(This) ->
        get({This, minBlue}).

setMinBlue(This, MinBlue) when is_integer(MinBlue) ->
        put({This, minBlue}, MinBlue).

getMaxBlue(This) ->
        get({This, maxBlue}).

setMaxBlue(This, MaxBlue) when is_integer(MaxBlue) ->
        put({This, maxBlue}, MaxBlue).

isInRange(This, Color) ->
        try
        case (((((((get({Color, '$class'})):getRed(Color) >= (get({This, '$class'})):getMinRed(This)) andalso ((get({Color, '$class'})):getRed(Color) =< (get({This, '$class'})):getMaxRed(This))) andalso ((get({Color, '$class'})):getGreen(Color) >= (get({This, '$class'})):getMinGreen(This))) andalso ((get({Color, '$class'})):getGreen(Color) =< (get({This, '$class'})):getMaxGreen(This))) andalso ((get({Color, '$class'})):getBlue(Color) >= (get({This, '$class'})):getMinBlue(This))) andalso ((get({Color, '$class'})):getBlue(Color) =< (get({This, '$class'})):getMaxBlue(This))) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "getMinRed(): "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, (get({This, '$class'})):getMinRed(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'CommonSeps':getInstance(), 'NEW_LINE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, "getMaxRed(): "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, (get({This, '$class'})):getMaxRed(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'CommonSeps':getInstance(), 'NEW_LINE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, "getMinGreen(): "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, (get({This, '$class'})):getMinGreen(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'CommonSeps':getInstance(), 'NEW_LINE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, "getMaxGreen(): "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, (get({This, '$class'})):getMaxGreen(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'CommonSeps':getInstance(), 'NEW_LINE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, "getMinBlue(): "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, (get({This, '$class'})):getMinGreen(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'CommonSeps':getInstance(), 'NEW_LINE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, "getMaxBlue(): "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, (get({This, '$class'})):getMaxBlue(This)),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

