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
% import org.allbinary.TsUtil
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.util.ABHashtable
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('Tokenizer').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, sep}, undefined),
    put({This, endSep}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
    ok.


new(Sep) when (is_list(Sep) orelse Sep =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Sep),
    This.

init(This, Sep) when (is_list(Sep) orelse Sep =:= undefined) ->
    init_fields(This),
        case ((Sep =:= undefined) orelse ((fun(Target_N65857) -> (get({Target_N65857, '$class'})):compareTo(Target_N65857, Sep, get({'StringUtil':getInstance(), 'EMPTY_STRING'})) end)('TsUtil':getInstance()) =:= 0)) of
            true ->
            erlang:error({'Exception', "Sep provided is not valid"});
            false -> ok
        end,
        put({This, sep}, Sep).

setSep(This, Sep) when (is_list(Sep) orelse Sep =:= undefined) ->
        put({This, sep}, Sep).

setEndSep(This, EndSep) when (is_list(EndSep) orelse EndSep =:= undefined) ->
        put({This, endSep}, EndSep).

getInsideSep(This, String) when (is_list(String) orelse String =:= undefined) ->
        TokenList = 'BasicArrayListD':new(),
        put({local, index}, 0),
        Size = string:length(String),
        (fun Loop() -> case (get({local, index}) < Size) of true ->
            put({local, index}, (get({String, '$class'})):indexOf(String, get({This, sep}), get({local, index}))),
            case (get({local, index}) =/= (-1)) of
                true ->
                End = (get({String, '$class'})):indexOf(String, get({This, endSep}), (get({local, index}) + string:length(get({This, sep})))),
                case (End =/= (-1)) of
                    true ->
                    (get({TokenList, '$class'})):add(TokenList, string:slice(String, (get({local, index}) + string:length(get({This, sep}))), ((End - ((string:length(get({This, endSep})) - 1)))) - ((get({local, index}) + string:length(get({This, sep})))))),
                    put({local, index}, (End + string:length(get({This, endSep}))));
                    false ->
                    ok
                end;
                false ->
                throw('$break')
            end,
            Loop();
        false -> ok end end)(),
        TokenList.

getTokensFromString(This, String, TokenVector) when (is_list(String) orelse String =:= undefined) ->
        put({local, index}, 0),
        put({local, 'end'}, 0),
        (fun Loop() -> case (get({local, index}) < string:length(String)) of true ->
            put({local, 'end'}, (get({String, '$class'})):indexOf(String, get({This, sep}), get({local, index}))),
            case (get({local, 'end'}) =/= (-1)) of
                true ->
                (get({TokenVector, '$class'})):add(TokenVector, string:slice(String, get({local, index}), (get({local, 'end'})) - (get({local, index})))),
                put({local, index}, (get({local, 'end'}) + string:length(get({This, sep}))));
                false ->
                (get({TokenVector, '$class'})):add(TokenVector, string:slice(String, get({local, index}), (string:length(String)) - (get({local, index})))),
                throw('$break')
            end,
            Loop();
        false -> ok end end)(),
        TokenVector.

getTokens(This, StringVector) ->
        TokenHashtable = (fun(Target_N67245) -> (get({Target_N67245, '$class'})):createHashtable(Target_N67245) end)('StdUtil':getInstance()),
        put({local, string}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
        put({local, 'end'}, 0),
        Size = (get({StringVector, '$class'})):size(StringVector),
        lists:foreach(fun(Index) ->
            put({local, string}, array:get(Index, get({StringVector, objectArray}))),
            put({local, 'end'}, allbinary_java:index_of(get({local, string}), get({This, sep}))),
            case (get({local, 'end'}) >= 0) of
                true ->
                (get({TokenHashtable, '$class'})):put(TokenHashtable, string:slice(get({local, string}), 0, (get({local, 'end'})) - (0)), string:slice(get({local, string}), (get({local, 'end'}) + 1), (string:length(get({local, string}))) - ((get({local, 'end'}) + 1))));
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        TokenHashtable.

