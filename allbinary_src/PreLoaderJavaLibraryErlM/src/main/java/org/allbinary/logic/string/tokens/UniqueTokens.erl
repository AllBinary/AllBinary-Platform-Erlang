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
% package org.allbinary.logic.string.tokens
% import java.util.HashSet
% import org.allbinary.logic.io.path.AbPathData
% import org.allbinary.logic.string.regex.replace.Replace
% import org.allbinary.string.CommonPhoneStrings
% import org.allbinary.string.CommonSeps
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('UniqueTokens').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, specialCharacters}, 'BasicArrayListD':new()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        (get({get({This, specialCharacters}), '$class'})):add(get({This, specialCharacters}), "!"),
        (get({get({This, specialCharacters}), '$class'})):add(get({This, specialCharacters}), "@"),
        (get({get({This, specialCharacters}), '$class'})):add(get({This, specialCharacters}), get({'CommonPhoneStrings':getInstance(), 'POUND'})),
        (get({get({This, specialCharacters}), '$class'})):add(get({This, specialCharacters}), "$"),
        (get({get({This, specialCharacters}), '$class'})):add(get({This, specialCharacters}), "%"),
        (get({get({This, specialCharacters}), '$class'})):add(get({This, specialCharacters}), "^"),
        (get({get({This, specialCharacters}), '$class'})):add(get({This, specialCharacters}), get({'CommonSeps':getInstance(), 'AMPERSAND'})),
        (get({get({This, specialCharacters}), '$class'})):add(get({This, specialCharacters}), get({'CommonPhoneStrings':getInstance(), 'STAR'})),
        (get({get({This, specialCharacters}), '$class'})):add(get({This, specialCharacters}), "("),
        (get({get({This, specialCharacters}), '$class'})):add(get({This, specialCharacters}), ")"),
        (get({get({This, specialCharacters}), '$class'})):add(get({This, specialCharacters}), "-"),
        (get({get({This, specialCharacters}), '$class'})):add(get({This, specialCharacters}), "_"),
        (get({get({This, specialCharacters}), '$class'})):add(get({This, specialCharacters}), "+"),
        (get({get({This, specialCharacters}), '$class'})):add(get({This, specialCharacters}), "="),
        (get({get({This, specialCharacters}), '$class'})):add(get({This, specialCharacters}), "\\"),
        (get({get({This, specialCharacters}), '$class'})):add(get({This, specialCharacters}), "|"),
        (get({get({This, specialCharacters}), '$class'})):add(get({This, specialCharacters}), get({'AbPathData':getInstance(), 'EXTENSION_SEP'})),
        (get({get({This, specialCharacters}), '$class'})):add(get({This, specialCharacters}), ","),
        (get({get({This, specialCharacters}), '$class'})):add(get({This, specialCharacters}), "<"),
        (get({get({This, specialCharacters}), '$class'})):add(get({This, specialCharacters}), ">"),
        (get({get({This, specialCharacters}), '$class'})):add(get({This, specialCharacters}), "?"),
        (get({get({This, specialCharacters}), '$class'})):add(get({This, specialCharacters}), "/"),
        (get({get({This, specialCharacters}), '$class'})):add(get({This, specialCharacters}), "~"),
        (get({get({This, specialCharacters}), '$class'})):add(get({This, specialCharacters}), "`").

% throws Exception
getWhithoutDashesAndSkipNumberOnlyTokens(This, StringVector) ->
        try
            HashSet = 'HashSet':new(),
            put({local, index}, 0),
            CommonSeps = 'CommonSeps':getInstance(),
            (fun Loop() -> case (get({local, index}) < (get({StringVector, '$class'})):size(StringVector)) of true ->
                Keywords = (get({StringVector, '$class'})):get(StringVector, get({local, index})),
                Tokenizer = 'Tokenizer':new(get({CommonSeps, 'COMMA'})),
                KeywordVector = (get({Tokenizer, '$class'})):getTokensFromString(Tokenizer, Keywords, 'BasicArrayListD':new()),
                lists:foreach(fun(ForIndex) ->
                    put({local, cleanString}, (get({KeywordVector, '$class'})):get(KeywordVector, ForIndex)),
                    put({local, cleanString}, string:trim(get({local, cleanString}))),
                    case (allbinary_java:index_of(get({local, cleanString}), $-) =/= (-1)) of
                        true ->
                        put({local, cleanString}, (fun(Target_N67136) -> (get({Target_N67136, '$class'})):all(Target_N67136, get({local, cleanString})) end)('Replace':new("-", get({CommonSeps, 'SPACE'}))));
                        false -> ok
                    end,
                    (get({HashSet, '$class'})):add(HashSet, get({local, cleanString})),
                    case (allbinary_java:index_of(get({local, cleanString}), $\s) =/= (-1)) of
                        true ->
                        SpaceTokenizer = 'Tokenizer':new(get({CommonSeps, 'SPACE'})),
                        SubKeywordVector = (get({SpaceTokenizer, '$class'})):getTokensFromString(SpaceTokenizer, get({local, cleanString}), 'BasicArrayListD':new()),
                        lists:foreach(fun(SpaceIndex) ->
                            SubCleanString = (get({SubKeywordVector, '$class'})):get(SubKeywordVector, SpaceIndex),
                            case ((not (get({This, '$class'})):isSpecialCharacter(This, SubCleanString)) andalso (not (get({This, '$class'})):numberOnly(This, SubCleanString))) of
                                true ->
                                (get({HashSet, '$class'})):add(HashSet, SubCleanString);
                                false -> ok
                            end
                        end, lists:seq(0, (get({SubKeywordVector, '$class'})):size(SubKeywordVector) - 1));
                        false -> ok
                    end
                end, lists:seq(0, (get({KeywordVector, '$class'})):size(KeywordVector) - 1)),
                put({local, index}, get({local, index}) + 1),
                Loop();
            false -> ok end end)(),
            HashSet
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        end.

numberOnly(This, SubCleaningString) when (is_list(SubCleaningString) orelse SubCleaningString =:= undefined) ->
        try
            list_to_integer(SubCleaningString),
            true
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            false
        end.

isSpecialCharacter(This, SubCleaningString) when (is_list(SubCleaningString) orelse SubCleaningString =:= undefined) ->
        lists:foreach(fun(Index) ->
            case ((get({SubCleaningString, '$class'})):compareTo(SubCleaningString, (get({get({This, specialCharacters}), '$class'})):get(get({This, specialCharacters}), Index)) =:= 0) of
                true ->
                throw({'$return', true});
                false -> ok
            end
        end, lists:seq(0, (get({get({This, specialCharacters}), '$class'})):size(get({This, specialCharacters})) - 1)),
        false.

