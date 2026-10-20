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
% package org.allbinary.input.automation.module.game
% import java.awt.image.BufferedImage
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonSeps

-module('MeteredGameObject').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements MeteredGameObjectInterface

init_fields(This) ->
    put({This, ratios}, undefined),
    put({This, good}, false),
    put({This, dropping}, false),
    put({This, minX}, undefined),
    put({This, maxX}, undefined),
    put({This, y}, undefined),
    put({This, size}, undefined),
    put({This, 'RATIOS_LABEL'}, "Ratios: "),
    put({This, 'IS_GOOD_LABEL'}, "isGood: "),
    put({This, 'IS_DROPPPING_LABEL'}, "isDropping: "),
    ok.


new(BufferedImage, MinX, MaxX, Y) when (is_tuple(BufferedImage) orelse BufferedImage =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, BufferedImage, MinX, MaxX, Y),
    This.

'$init'(This, BufferedImage, MinX, MaxX, Y) when (is_tuple(BufferedImage) orelse BufferedImage =:= undefined) ->
    init_fields(This),
        (get({This, '$class'})):setRatios(This, array:new(array:size(BufferedImage), {default, undefined})),
        (get({This, '$class'})):setMinX(This, MinX),
        (get({This, '$class'})):setMaxX(This, MaxX),
        (get({This, '$class'})):setY(This, Y),
        (get({This, '$class'})):setSize(This, (MaxX - MinX)),
        lists:foreach(fun(Index) ->
            Nominator = 'GraphicsAnalysisUtil':getNominator(array:get(Index, BufferedImage), (get({This, '$class'})):getMinX(This), (get({This, '$class'})):getMaxX(This), (get({This, '$class'})):getY(This)),
            array:set(Index, (Nominator / (get({This, '$class'})):getSize(This)), (get({This, '$class'})):getRatios(This))
        end, lists:seq(0, array:size(BufferedImage) - 1)),
        case ((fun(Target_N66446) -> (get({Target_N66446, '$class'})):doubleValue(Target_N66446) end)(array:get((array:size(BufferedImage) - 1), (get({This, '$class'})):getRatios(This))) > 0.93) of
            true ->
            (get({This, '$class'})):setGood(This, true);
            false ->
            (get({This, '$class'})):setGood(This, false)
        end,
        case ((fun(Target_N66565) -> (get({Target_N66565, '$class'})):doubleValue(Target_N66565) end)(array:get((array:size(BufferedImage) - 1), (get({This, '$class'})):getRatios(This))) < (fun(Target_N66613) -> (get({Target_N66613, '$class'})):doubleValue(Target_N66613) end)(array:get(0, (get({This, '$class'})):getRatios(This)))) of
            true ->
            (get({This, '$class'})):setDropping(This, true);
            false ->
            (get({This, '$class'})):setDropping(This, false)
        end.

isGood(This) ->
        get({This, good}).

setGood(This, Good) when is_boolean(Good) ->
        put({This, good}, Good).

isDropping(This) ->
        get({This, dropping}).

setDropping(This, Dropping) when is_boolean(Dropping) ->
        put({This, dropping}, Dropping).

getRatios(This) ->
        get({This, ratios}).

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        CommonSeps = 'CommonSeps':getInstance(),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'NEW_LINE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'RATIOS_LABEL'})),
        lists:foreach(fun(Index) ->
            (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N67276) -> (get({Target_N67276, '$class'})):toString(Target_N67276) end)(array:get(Index, (get({This, '$class'})):getRatios(This)))),
            case (Index < (array:size((get({This, '$class'})):getRatios(This)) - 1)) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'COMMA_SEP'}));
                false -> ok
            end
        end, lists:seq(0, array:size((get({This, '$class'})):getRatios(This)) - 1)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'NEW_LINE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'IS_GOOD_LABEL'})),
        (get({StringBuffer, '$class'})):appendboolean(StringBuffer, (get({This, '$class'})):isGood(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'NEW_LINE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'IS_DROPPPING_LABEL'})),
        (get({StringBuffer, '$class'})):appendboolean(StringBuffer, (get({This, '$class'})):isDropping(This)),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

setRatios(This, Ratios) when (is_tuple(Ratios) orelse Ratios =:= undefined) ->
        put({This, ratios}, Ratios).

getMinX(This) ->
        get({This, minX}).

setMinX(This, MinX) ->
        put({This, minX}, MinX).

getMaxX(This) ->
        get({This, maxX}).

setMaxX(This, MaxX) ->
        put({This, maxX}, MaxX).

getY(This) ->
        get({This, y}).

setY(This, Y) ->
        put({This, y}, Y).

getSize(This) ->
        get({This, size}).

setSize(This, Size) ->
        put({This, size}, Size).

