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
% import org.allbinary.debug.DebugFactory
% import org.allbinary.debug.NoDebug
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('LicenseInitInfo').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, id}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
    put({This, serverList}, 'BasicArrayListD':new()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

getLicenseId(This) ->
        get({This, id}).

getServer(This, Index) when is_integer(Index) ->
        (get({get({This, serverList}), '$class'})):get(get({This, serverList}), Index).

getNumberOfServers(This) ->
        (get({get({This, serverList}), '$class'})):size(get({This, serverList})).

setLicenseId(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, id}, Value).

clearServers(This) ->
        (get({get({This, serverList}), '$class'})):clear(get({This, serverList})).

setServer(This, Value, Index) when (is_list(Value) orelse Value =:= undefined), is_integer(Index) ->
        (get({get({This, serverList}), '$class'})):addAt(get({This, serverList}), Index, Value).

addServer(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        (get({get({This, serverList}), '$class'})):add(get({This, serverList}), Value).

getServerList(This) ->
        get({This, serverList}).

setServerList(This, Servers) ->
        case ('DebugFactory':getInstance() =:= 'NoDebug':getInstance()) of
            true ->
            put({This, serverList}, Servers);
            false -> ok
        end.

