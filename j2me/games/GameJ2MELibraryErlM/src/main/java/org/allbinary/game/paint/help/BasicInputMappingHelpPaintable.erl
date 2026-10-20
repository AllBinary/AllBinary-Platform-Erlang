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
% package org.allbinary.game.paint.help
% import org.allbinary.game.input.GameKey
% import org.allbinary.game.input.GameKeyFactory
% import org.allbinary.game.input.Input
% import org.allbinary.game.input.PlatformInputMappingFactory
% import org.allbinary.game.input.mapping.GameInputMapping
% import org.allbinary.game.input.mapping.PersistentInputMapping
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonSeps
% import org.allbinary.util.BasicArrayList

-module('BasicInputMappingHelpPaintable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('HelpPaintable', Function, Arguments).

init_fields(This) ->
    put({This, gameInputMappingArray}, undefined),
    put({This, 'NONE'}, get({'GameKeyFactory':getInstance(), 'NONE'})),
    ok.


new(GameInputMappingArray, BasicColor) when (is_tuple(GameInputMappingArray) orelse GameInputMappingArray =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, GameInputMappingArray, BasicColor),
    This.

'$init'(This, GameInputMappingArray, BasicColor) when (is_tuple(GameInputMappingArray) orelse GameInputMappingArray =:= undefined) ->
        'HelpPaintable':'$init'(This, "Help Screen", get({'BasicColorFactory':getInstance(), 'BLACK'}), BasicColor),
        init_fields(This),
        put({This, gameInputMappingArray}, GameInputMappingArray),
        (get({This, '$class'})):update(This, get({This, 'NONE'}), get({This, 'NONE'})).

update(This, SelectedGameKey, SelectedInput) ->
        GameKeyMapping = (fun(Target_N66238) -> (get({Target_N66238, '$class'})):getPersistentInputMappingInstance(Target_N66238) end)('PlatformInputMappingFactory':getInstance()),
        EQUAL = " = ",
        StringMaker = 'StringMaker':new(),
        Size = array:size(get({This, gameInputMappingArray})),
        KeyInfo = array:new(Size, {default, undefined}),
        put({local, gameInputMapping}, undefined),
        put({local, gameKey}, undefined),
        put({local, list}, undefined),
        lists:foreach(fun(Index) ->
            put({local, gameInputMapping}, array:get(Index, get({This, gameInputMappingArray}))),
            put({local, gameKey}, (get({get({local, gameInputMapping}), '$class'})):getGameKey(get({local, gameInputMapping}))),
            put({local, list}, (fun(Target_N66654) -> (get({Target_N66654, '$class'})):getMappedInput(Target_N66654, get({local, gameKey})) end)((get({GameKeyMapping, '$class'})):getInputMapping(GameKeyMapping))),
            (get({StringMaker, '$class'})):delete(StringMaker, 0, (get({StringMaker, '$class'})):length(StringMaker)),
            array:set(Index, (fun(Target_N66761) -> (get({Target_N66761, '$class'})):toString(Target_N66761) end)((fun(Target_N66768) -> (get({Target_N66768, '$class'})):append(Target_N66768, (get({This, '$class'})):get(This, get({local, list}))) end)((fun(Target_N66775) -> (get({Target_N66775, '$class'})):append(Target_N66775, EQUAL) end)((get({StringMaker, '$class'})):append(StringMaker, (get({get({local, gameInputMapping}), '$class'})):getName(get({local, gameInputMapping})))))), KeyInfo)
        end, lists:seq(0, Size - 1)),
        'HelpPaintable':setInputInfoP(This, KeyInfo).

get(This, KeyList) ->
        CommonSeps = 'CommonSeps':getInstance(),
        StringBuffer = 'StringMaker':new(),
        AND = "and ",
        put({local, key}, undefined),
        Size = (get({KeyList, '$class'})):size(KeyList),
        lists:foreach(fun(Index) ->
            put({local, key}, array:get(Index, get({KeyList, objectArray}))),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({local, key}), '$class'})):getName(get({local, key}))),
            case ((Index + 1) < (get({KeyList, '$class'})):size(KeyList)) of
                true ->
                case ((get({KeyList, '$class'})):size(KeyList) =:= 2) of
                    true ->
                    (fun(Target_N67595) -> (get({Target_N67595, '$class'})):append(Target_N67595, AND) end)((get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'SPACE'})));
                    false ->
                    case ((Index + 2) =:= (get({KeyList, '$class'})):size(KeyList)) of
                        true ->
                        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'COMMA_SEP'})),
                        (get({StringBuffer, '$class'})):append(StringBuffer, AND);
                        false ->
                        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'COMMA_SEP'}))
                    end
                end;
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

