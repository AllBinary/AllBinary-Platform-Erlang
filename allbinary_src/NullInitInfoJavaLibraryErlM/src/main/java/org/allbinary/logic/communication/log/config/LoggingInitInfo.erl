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
% package org.allbinary.logic.communication.log.config
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('LoggingInitInfo').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, logConfigInfoList}, undefined),
    put({?MODULE, hasRead}, false),
    ok.

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

% throws Exception
write() ->
        try
            put({'LoggingInitInfo', hasRead}, false)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        end.

% throws Exception
read() ->
        try
            ok
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        end.

setHasRead(Value) when is_boolean(Value) ->
        put({'LoggingInitInfo', hasRead}, Value).

% throws Exception
updateIfNeeded() ->
        case (not get({'LoggingInitInfo', hasRead})) of
            true ->
            'LoggingInitInfo':read(),
            put({'LoggingInitInfo', hasRead}, true),
            case (get({'LoggingInitInfo', logConfigInfoList}) =:= undefined) of
                true ->
                erlang:error({'Exception', "Read Failed"});
                false -> ok
            end;
            false -> ok
        end.

isValid(This) ->
        try
            true
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            false
        end.

set(LogConfigInfoList) ->
        put({'LoggingInitInfo', logConfigInfoList}, LogConfigInfoList).

% throws Exception
get() ->
        'LoggingInitInfo':updateIfNeeded(),
        get({'LoggingInitInfo', logConfigInfoList}).

% throws Exception
getTypeList() ->
        'LoggingInitInfo':updateIfNeeded(),
        AllLogTypeVector = 'BasicArrayListD':new(),
        Size = (get({get({'LoggingInitInfo', logConfigInfoList}), '$class'})):size(get({'LoggingInitInfo', logConfigInfoList})),
        lists:foreach(fun(Index) ->
            LogConfigInfo = array:get(Index, get({get({'LoggingInitInfo', logConfigInfoList}), objectArray})),
            LogTypeVector = (get({LogConfigInfo, '$class'})):getTypeVector(LogConfigInfo),
            case (get({LogConfigInfo, '$class'})):isEnabled(LogConfigInfo) of
                true ->
                (get({AllLogTypeVector, '$class'})):addAllList(AllLogTypeVector, LogTypeVector);
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        AllLogTypeVector.

% throws Exception
getNumberOfLogConfigs(This) ->
        (get({get({'LoggingInitInfo', logConfigInfoList}), '$class'})):size(get({'LoggingInitInfo', logConfigInfoList})).

toString(This) ->
        try
            undefined
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            "Error"
        end.

