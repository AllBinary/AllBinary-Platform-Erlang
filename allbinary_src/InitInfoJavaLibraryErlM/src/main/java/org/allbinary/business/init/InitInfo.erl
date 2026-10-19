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
% package org.allbinary.business.init
% import java.util.HashMap
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory
% import org.allbinary.logic.communication.log.config.type.LogConfigTypes
% import org.allbinary.logic.io.path.AbPath
% import org.allbinary.logic.java.bool.BooleanUtil
% import org.allbinary.logic.string.StringUtil

-module('InitInfo').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'InitInfo':new()),
    ok.

init_fields(This) ->
    put({This, 'TESTING'}, "TESTING"),
    put({This, 'MAINPATH'}, "MAINPATH"),
    put({This, 'TESTHTMLPATH'}, "TESTHTMLPATH"),
    put({This, testing}, undefined),
    put({This, mainPath}, undefined),
    put({This, testHtmlPath}, undefined),
    put({This, hasRead}, false),
    ok.


getInstance() ->
        get({'InitInfo', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

% throws InitException
set(This) ->
        try
            InitInfoEntity = 'InitInfoEntity':new(),
            case (get({get({'LogConfigTypes', 'LOGGING'}), '$class'})):contains(get({'LogConfigTypes', 'LOGGING'}), get({'LogConfigTypeFactory':getInstance(), 'PRELOADER'})) of
                true ->
                'PreLogUtil':put("created entity", "InitInfo", "set()");
                false -> ok
            end,
            case (not (get({InitInfoEntity, '$class'})):is(InitInfoEntity)) of
                true ->
                case (get({get({'LogConfigTypes', 'LOGGING'}), '$class'})):contains(get({'LogConfigTypes', 'LOGGING'}), get({'LogConfigTypeFactory':getInstance(), 'PRELOADER'})) of
                    true ->
                    'PreLogUtil':put("adding", "InitInfo", "set()");
                    false -> ok
                end,
                (get({InitInfoEntity, '$class'})):add(InitInfoEntity);
                false ->
                case (get({get({'LogConfigTypes', 'LOGGING'}), '$class'})):contains(get({'LogConfigTypes', 'LOGGING'}), get({'LogConfigTypeFactory':getInstance(), 'PRELOADER'})) of
                    true ->
                    'PreLogUtil':put("update", "InitInfo", "set()");
                    false -> ok
                end,
                (get({InitInfoEntity, '$class'})):update(InitInfoEntity)
            end,
            put({This, hasRead}, false)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({'LogConfigTypes', 'LOGGING'}), '$class'})):contains(get({'LogConfigTypes', 'LOGGING'}), get({'LogConfigTypeFactory':getInstance(), 'PRELOADERERROR'})) of
                true ->
                'PreLogUtil':putOE("error", "InitInfo", "set()", E);
                false -> ok
            end
        end.

set(This, HashMap) ->
        try
            put({This, testing}, (get({HashMap, '$class'})):get(HashMap, get({This, 'TESTING'}))),
            put({This, mainPath}, 'AbPath':new((get({HashMap, '$class'})):get(HashMap, get({This, 'MAINPATH'})), get({'StringUtil':getInstance(), 'EMPTY_STRING'}))),
            put({This, testHtmlPath}, 'AbPath':new((get({HashMap, '$class'})):get(HashMap, get({This, 'TESTHTMLPATH'})), get({'StringUtil':getInstance(), 'EMPTY_STRING'})))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({'LogConfigTypes', 'LOGGING'}), '$class'})):contains(get({'LogConfigTypes', 'LOGGING'}), get({'LogConfigTypeFactory':getInstance(), 'PRELOADERERROR'})) of
                true ->
                'PreLogUtil':putOE("error", "InitInfo", "set()", E);
                false -> ok
            end
        end.

get(This) ->
        try
            put({This, testing}, undefined),
            put({This, mainPath}, undefined),
            put({This, testHtmlPath}, undefined),
            InitInfoEntity = 'InitInfoEntity':new(),
            (get({InitInfoEntity, '$class'})):get(InitInfoEntity)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({'LogConfigTypes', 'LOGGING'}), '$class'})):contains(get({'LogConfigTypes', 'LOGGING'}), get({'LogConfigTypeFactory':getInstance(), 'PRELOADERERROR'})) of
                true ->
                'PreLogUtil':putOE("error", "InitInfo", "set()", E);
                false -> ok
            end,
            ok
        end.

setHasRead(This, Value) when is_boolean(Value) ->
        put({This, hasRead}, Value).

updateIfNeeded(This) ->
        try
            case (not get({This, hasRead})) of
                true ->
                put({This, hasRead}, true),
                (get({This, '$class'})):get(This);
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({'LogConfigTypes', 'LOGGING'}), '$class'})):contains(get({'LogConfigTypes', 'LOGGING'}), get({'LogConfigTypeFactory':getInstance(), 'PRELOADERERROR'})) of
                true ->
                'PreLogUtil':putOE("error", "InitInfo", "updateIfNeeded()", E);
                false -> ok
            end,
            ok
        end.

isTesting(This) ->
        try
            (get({This, '$class'})):updateIfNeeded(This),
            (fun(Target_N67969) -> (get({Target_N67969, '$class'})):getFromString(Target_N67969, get({This, testing})) end)('BooleanUtil':getInstance())
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({'LogConfigTypes', 'LOGGING'}), '$class'})):contains(get({'LogConfigTypes', 'LOGGING'}), get({'LogConfigTypeFactory':getInstance(), 'PRELOADERERROR'})) of
                true ->
                'PreLogUtil':putOE("error", "InitInfo", "updateIfNeeded()", E);
                false -> ok
            end,
            false
        end.

getTesting(This) ->
        (get({This, '$class'})):updateIfNeeded(This),
        get({This, testing}).

getTestHtmlPath(This) ->
        try
        (get({This, '$class'})):updateIfNeeded(This),
        case (get({This, testHtmlPath}) =/= undefined) of
            true ->
            throw({'$return', (get({get({This, testHtmlPath}), '$class'})):toString(get({This, testHtmlPath}))});
            false ->
            throw({'$return', undefined})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getMainPath(This) ->
        try
        (get({This, '$class'})):updateIfNeeded(This),
        case (get({This, mainPath}) =/= undefined) of
            true ->
            throw({'$return', (get({get({This, mainPath}), '$class'})):toString(get({This, mainPath}))});
            false ->
            throw({'$return', undefined})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

setTesting(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, testing}, Value).

setTestHtmlPath(This, Value) ->
        put({This, testHtmlPath}, Value).

setMainPath(This, Value) ->
        put({This, mainPath}, Value).

isMainPathValid(This, AbPath) ->
        true.

isTestHtmlPathValid(This, AbPath) ->
        true.

% throws Exception
isTestingValid(This, Testing) when (is_list(Testing) orelse Testing =:= undefined) ->
        (fun(Target_N68795) -> (get({Target_N68795, '$class'})):isStringBoolean(Target_N68795, Testing) end)('BooleanUtil':getInstance()).

toHashMap(This) ->
        HashMap = (fun(Target_N68899) -> (get({Target_N68899, '$class'})):createHashMap(Target_N68899) end)('StdUtil':getInstance()),
        (get({HashMap, '$class'})):put(HashMap, get({This, 'TESTING'}), (get({This, '$class'})):getTesting(This)),
        (get({HashMap, '$class'})):put(HashMap, get({This, 'MAINPATH'}), (get({This, '$class'})):getMainPath(This)),
        (get({HashMap, '$class'})):put(HashMap, get({This, 'TESTHTMLPATH'}), (get({This, '$class'})):getTestHtmlPath(This)),
        HashMap.

