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
% package org.allbinary.logic.communication.http.request
% import org.allbinary.logic.io.path.AbPathData

-module('HttpRequestUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'HttpRequestUtil':new()),
    ok.

init_fields(This) ->
    ok.


getInstance() ->
        get({'HttpRequestUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

getLastSeparatorIndex(This, RequestPath) when (is_list(RequestPath) orelse RequestPath =:= undefined) ->
        put({local, beginIndex}, (get({RequestPath, '$class'})):lastIndexOf(RequestPath, get({'AbPathData':getInstance(), 'SEPARATOR'}))),
        case (get({local, beginIndex}) < 0) of
            true ->
            put({local, beginIndex}, (get({RequestPath, '$class'})):lastIndexOf(RequestPath, "\\"));
            false -> ok
        end,
        get({local, beginIndex}).

% throws Exception
generateFileName(This, RequestPath) when (is_list(RequestPath) orelse RequestPath =:= undefined) ->
        try
        BeginIndex = (get({This, '$class'})):getLastSeparatorIndex(This, RequestPath),
        case (BeginIndex < 0) of
            true ->
            throw({'$return', RequestPath});
            false ->
            throw({'$return', string:slice(RequestPath, (BeginIndex + 1))})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

