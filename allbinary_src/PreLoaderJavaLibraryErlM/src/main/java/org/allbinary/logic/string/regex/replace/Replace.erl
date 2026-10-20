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
% package org.allbinary.logic.string.regex.replace
% import java.util.HashMap
% import org.allbinary.J2SEUtil
% import org.allbinary.globals.AppUrlGlobals
% import org.allbinary.globals.URLGLOBALS
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.communication.log.config.type.LogConfigTypes

-module('Replace').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, j2seUtil}, 'J2SEUtil':getInstance()),
    put({This, 'REPLACERS_'}, "Replacers: "),
    put({This, 'ALL'}, "all"),
    put({This, 'FOUND_KEY'}, "found key total: "),
    put({This, hashMap}, undefined),
    ok.


new(Key, Value) when (is_list(Key) orelse Key =:= undefined), (is_list(Value) orelse Value =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Key, Value),
    This;
new(Keys, Values) when (is_tuple(Keys) orelse Keys =:= undefined), (is_tuple(Values) orelse Values =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Keys, Values),
    This.

'$init'(This, Key, Value) when (is_list(Key) orelse Key =:= undefined), (is_list(Value) orelse Value =:= undefined) ->
    init_fields(This),
        put({This, hashMap}, (fun(Target_N66126) -> (get({Target_N66126, '$class'})):createHashMap(Target_N66126) end)('StdUtil':getInstance())),
        (get({get({This, hashMap}), '$class'})):put(get({This, hashMap}), array:from_list([Key]), array:from_list([Value]));
'$init'(This, Keys, Values) when (is_tuple(Keys) orelse Keys =:= undefined), (is_tuple(Values) orelse Values =:= undefined) ->
    init_fields(This),
        put({This, hashMap}, (fun(Target_N66335) -> (get({Target_N66335, '$class'})):createHashMap(Target_N66335) end)('StdUtil':getInstance())),
        (get({get({This, hashMap}), '$class'})):put(get({This, hashMap}), Keys, Values).


new(HashMap) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, HashMap),
    This.

'$init'(This, HashMap) ->
    init_fields(This),
        put({This, hashMap}, HashMap).

all(This, Replace) when (is_list(Replace) orelse Replace =:= undefined) ->
        (get({This, '$class'})):upTo(This, Replace, get({'Integer', 'MIN_VALUE'})).

upTo(This, Replace, Total) when (is_list(Replace) orelse Replace =:= undefined), is_integer(Total) ->
        put({local, replace}, Replace),
        NewStringBuffer = 'StringMaker':new(),
        put({local, totalNumberOfReplaces}, 0),
        put({local, keys}, undefined),
        put({local, values}, undefined),
        KeyArray = (get({get({This, j2seUtil}), '$class'})):getHashMapAsArray(get({This, j2seUtil}), get({This, hashMap})),
        Size = array:size(KeyArray),
        lists:foreach(fun(Index2) ->
            put({local, keys}, array:get(Index2, KeyArray)),
            put({local, values}, (get({get({This, hashMap}), '$class'})):get(get({This, hashMap}), get({local, keys}))),
            put({local, foundTotal}, 0),
            put({local, index}, 0),
            put({local, nextKey}, undefined),
            put({local, 'end'}, 0),
            put({local, nextSecondKey}, undefined),
            put({local, begin2}, 0),
            (fun Loop() -> case (get({local, index}) < string:length(get({local, replace}))) of true ->
                Begin = (get({get({local, replace}), '$class'})):indexOf(get({local, replace}), array:get(0, get({local, keys})), get({local, index})),
                case (Begin =/= (-1)) of
                    true ->
                    put({local, foundTotal}, get({local, foundTotal}) + 1),
                    case ((get({local, foundTotal}) rem 100) =:= 0) of
                        true ->
                        io:format("~ts~n", [allbinary_java:to_string(lists:concat([get({This, 'FOUND_KEY'}), get({local, foundTotal})]))]);
                        false -> ok
                    end,
                    put({local, nextKey}, array:get(0, get({local, keys}))),
                    put({local, 'end'}, (Begin + string:length(get({local, nextKey})))),
                    (get({NewStringBuffer, '$class'})):delete(NewStringBuffer, 0, (get({NewStringBuffer, '$class'})):length(NewStringBuffer)),
                    (get({NewStringBuffer, '$class'})):append(NewStringBuffer, string:slice(get({local, replace}), 0, (Begin) - (0))),
                    (get({NewStringBuffer, '$class'})):append(NewStringBuffer, array:get(0, get({local, values}))),
                    put({local, index}, (get({NewStringBuffer, '$class'})):length(NewStringBuffer)),
                    (get({NewStringBuffer, '$class'})):append(NewStringBuffer, string:slice(get({local, replace}), get({local, 'end'}), (string:length(get({local, replace}))) - (get({local, 'end'})))),
                    put({local, replace}, (get({NewStringBuffer, '$class'})):toString(NewStringBuffer)),
                    case (array:size(get({local, keys})) > 1) of
                        true ->
                        put({local, nextSecondKey}, array:get(1, get({local, keys}))),
                        put({local, begin2}, (get({get({local, replace}), '$class'})):indexOf(get({local, replace}), get({local, nextSecondKey}), get({local, index}))),
                        case (get({local, begin2}) =/= (-1)) of
                            true ->
                            End2 = (get({local, begin2}) + string:length(get({local, nextSecondKey}))),
                            (get({NewStringBuffer, '$class'})):delete(NewStringBuffer, 0, (get({NewStringBuffer, '$class'})):length(NewStringBuffer)),
                            (get({NewStringBuffer, '$class'})):append(NewStringBuffer, string:slice(get({local, replace}), 0, (get({local, begin2})) - (0))),
                            (get({NewStringBuffer, '$class'})):append(NewStringBuffer, array:get(1, get({local, values}))),
                            put({local, index}, (get({NewStringBuffer, '$class'})):length(NewStringBuffer)),
                            (get({NewStringBuffer, '$class'})):append(NewStringBuffer, string:slice(get({local, replace}), End2, (string:length(get({local, replace}))) - (End2))),
                            put({local, replace}, (get({NewStringBuffer, '$class'})):toString(NewStringBuffer));
                            false -> ok
                        end;
                        false -> ok
                    end,
                    put({local, totalNumberOfReplaces}, get({local, totalNumberOfReplaces}) + 1),
                    case ((Total =/= get({'Integer', 'MIN_VALUE'})) andalso (get({local, totalNumberOfReplaces}) >= Total)) of
                        true ->
                        throw('$break');
                        false -> ok
                    end;
                    false ->
                    throw('$break')
                end,
                Loop();
            false -> ok end end)()
        end, lists:seq(0, Size - 1)),
        case (get({local, totalNumberOfReplaces}) > 0) of
            true ->
            case (get({get({'LogConfigTypes', 'LOGGING'}), '$class'})):contains(get({'LogConfigTypes', 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'REPLACE'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Total Number Of Replaces: ", get({local, totalNumberOfReplaces})]), This, get({This, 'ALL'}));
                false -> ok
            end;
            false -> ok
        end,
        get({local, replace}).

line(This, Replace) when (is_list(Replace) orelse Replace =:= undefined) ->
        put({local, replace}, Replace),
        NewStringBuffer = 'StringMaker':new(),
        put({local, totalNumberOfReplaces}, 0),
        put({local, key}, undefined),
        put({local, value}, undefined),
        KeyArray = (get({get({This, j2seUtil}), '$class'})):getHashMapAsArray(get({This, j2seUtil}), get({This, hashMap})),
        Size = array:size(KeyArray),
        lists:foreach(fun(Index2) ->
            put({local, key}, array:get(Index2, KeyArray)),
            put({local, value}, (get({get({This, hashMap}), '$class'})):get(get({This, hashMap}), get({local, key}))),
            put({local, index}, 0),
            (fun Loop() -> case (get({local, index}) < string:length(get({local, replace}))) of true ->
                (get({NewStringBuffer, '$class'})):delete(NewStringBuffer, 0, (get({NewStringBuffer, '$class'})):length(NewStringBuffer)),
                Begin = (get({get({local, replace}), '$class'})):indexOf(get({local, replace}), get({local, key}), get({local, index})),
                case (Begin =/= (-1)) of
                    true ->
                    io:format("~ts~n", [allbinary_java:to_string(get({This, 'FOUND_KEY'}))]),
                    End = ((get({get({local, replace}), '$class'})):indexOf(get({local, replace}), $\n, (Begin + string:length(get({local, key})))) + 1),
                    case (End >= 0) of
                        true ->
                        (get({NewStringBuffer, '$class'})):append(NewStringBuffer, string:slice(get({local, replace}), 0, (Begin) - (0))),
                        put({local, index}, (get({NewStringBuffer, '$class'})):length(NewStringBuffer)),
                        (get({NewStringBuffer, '$class'})):append(NewStringBuffer, string:slice(get({local, replace}), End, (string:length(get({local, replace}))) - (End))),
                        put({local, replace}, (get({NewStringBuffer, '$class'})):toString(NewStringBuffer)),
                        put({local, totalNumberOfReplaces}, get({local, totalNumberOfReplaces}) + 1);
                        false -> ok
                    end;
                    false ->
                    throw('$break')
                end,
                Loop();
            false -> ok end end)()
        end, lists:seq(0, Size - 1)),
        case (get({get({'LogConfigTypes', 'LOGGING'}), '$class'})):contains(get({'LogConfigTypes', 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'REPLACE'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Total Number Of Replaces: ", get({local, totalNumberOfReplaces})]), This, get({This, 'ALL'}));
            false -> ok
        end,
        get({local, replace}).

main(Args) when (is_tuple(Args) orelse Args =:= undefined) ->
        try
            StringUtil = 'StringUtil':getInstance(),
            AppUrlGlobals = 'AppUrlGlobals':new(),
            (get({AppUrlGlobals, '$class'})):setWebappPath(AppUrlGlobals, "G:/mnt/bc/mydev/work/allbinary_src/ToolsJavaLibrary/tools"),
            (get({get({'Replace', 'URLGLOBALS'}), '$class'})):init(get({'Replace', 'URLGLOBALS'}), AppUrlGlobals),
            put({local, testString}, "\"super gun\" big tank \"goodgunriflegun"),
            Replace = 'Replace':new("gun", "abcdefghijklmnopqrstuxwxyzabcdefghijklmnopqrstuxwxyz"),
            io:format("~ts~n", [allbinary_java:to_string(lists:concat(["Old String: ", get({local, testString})]))]),
            put({local, testString}, (get({Replace, '$class'})):all(Replace, get({local, testString}))),
            io:format("~ts~n", [allbinary_java:to_string(lists:concat(["New String: ", get({local, testString})]))]),
            ReplaceCat = 'Replace':new("abcdefghijklmnopqrstuxwxyzabcdefghijklmnopqrstuxwxyz", get({StringUtil, 'EMPTY_STRING'})),
            put({local, testString}, (get({ReplaceCat, '$class'})):all(ReplaceCat, get({local, testString}))),
            io:format("~ts~n", [allbinary_java:to_string(lists:concat(["New String: ", get({local, testString})]))])
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            ok
        end.

