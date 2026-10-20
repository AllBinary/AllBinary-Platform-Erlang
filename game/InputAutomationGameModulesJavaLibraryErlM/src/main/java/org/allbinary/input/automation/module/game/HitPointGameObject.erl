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

-module('HitPointGameObject').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements HitPointGameObjectInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('MeteredGameObject', Function, Arguments).

init_fields(This) ->
    put({This, damaged}, false),
    put({This, closeDeath}, false),
    put({This, 'HP_LABEL'}, "HP: "),
    put({This, 'IS_DAMAGED_LABEL'}, "isDamaged: "),
    put({This, 'IS_CLOSE_DEATH_LABEL'}, "isCloseDeath: "),
    ok.


new(BufferedImage, MinX, MaxX, Y) when (is_tuple(BufferedImage) orelse BufferedImage =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, BufferedImage, MinX, MaxX, Y),
    This.

'$init'(This, BufferedImage, MinX, MaxX, Y) when (is_tuple(BufferedImage) orelse BufferedImage =:= undefined) ->
        'MeteredGameObject':'$init'(This, BufferedImage, MinX, MaxX, Y),
        init_fields(This),
        case ((fun(Target_N65924) -> (get({Target_N65924, '$class'})):doubleValue(Target_N65924) end)(array:get((array:size(BufferedImage) - 1), (get({This, '$class'})):getRatios(This))) < 1.0) of
            true ->
            (get({This, '$class'})):setDamaged(This, true);
            false ->
            (get({This, '$class'})):setDamaged(This, false)
        end,
        case ((fun(Target_N66043) -> (get({Target_N66043, '$class'})):doubleValue(Target_N66043) end)(array:get((array:size(BufferedImage) - 1), (get({This, '$class'})):getRatios(This))) > 0.25) of
            true ->
            put({This, closeDeath}, false);
            false ->
            put({This, closeDeath}, true)
        end.

isMoreThan(This, AFloat) when is_number(AFloat) ->
        try
        case ((fun(Target_N66275) -> (get({Target_N66275, '$class'})):doubleValue(Target_N66275) end)(array:get((array:size((get({This, '$class'})):getRatios(This)) - 1), (get({This, '$class'})):getRatios(This))) > AFloat) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isCloseDeath(This) ->
        get({This, closeDeath}).

setCloseDeath(This, CloseDeath) when is_boolean(CloseDeath) ->
        put({This, closeDeath}, CloseDeath).

isDamaged(This) ->
        get({This, damaged}).

setDamaged(This, Damaged) when is_boolean(Damaged) ->
        put({This, damaged}, Damaged).

toString(This) ->
        CommonSeps = 'CommonSeps':getInstance(),
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'HP_LABEL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, 'MeteredGameObject':toString(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'NEW_LINE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'IS_DAMAGED_LABEL'})),
        (get({StringBuffer, '$class'})):appendboolean(StringBuffer, (get({This, '$class'})):isDamaged(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'NEW_LINE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'IS_CLOSE_DEATH_LABEL'})),
        (get({StringBuffer, '$class'})):appendboolean(StringBuffer, (get({This, '$class'})):isCloseDeath(This)),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

