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
% package org.allbinary.data.resource
% import java.io.ByteArrayInputStream
% import java.io.ByteArrayOutputStream
% import java.io.FileInputStream
% import java.io.InputStream
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.io.StreamUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil

-module('ResourceUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ResourceUtil':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, path}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
    put({This, ext}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
    ok.


getInstance() ->
        get({'ResourceUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

setLoadingPaths(This, Path, Ext) when (is_list(Path) orelse Path =:= undefined), (is_list(Ext) orelse Ext =:= undefined) ->
        put({This, path}, Path),
        put({This, ext}, Ext).

setClassLoader(This, ClassLoader) ->
        ok.

% throws Exception
getResourceAsStream(This, Resource) when (is_list(Resource) orelse Resource =:= undefined) ->
        put({local, inputStream}, (get({This, '$class'})):getResourceAsStreamAtStart(This, Resource, 2)),
        case (get({local, inputStream}) =:= undefined) of
            true ->
            put({local, inputStream}, (get({This, '$class'})):getResourceAsStreamAtStart(This, Resource, 1)),
            case (get({local, inputStream}) =:= undefined) of
                true ->
                erlang:error({'Exception', (fun(Target_N66410) -> (get({Target_N66410, '$class'})):toString(Target_N66410) end)((fun(Target_N66417) -> (get({Target_N66417, '$class'})):append(Target_N66417, Resource) end)((fun(Target_N66424) -> (get({Target_N66424, '$class'})):append(Target_N66424, "Unable to obtain: ") end)('StringMaker':new())))});
                false -> ok
            end;
            false -> ok
        end,
        get({local, inputStream}).

% throws Exception
getResourceAsStreamAtStart(This, Resource, StartIndex) when (is_list(Resource) orelse Resource =:= undefined), is_integer(StartIndex) ->
        try
        InputStream = 'FileInputStream':new((fun(Target_N66581) -> (get({Target_N66581, '$class'})):toString(Target_N66581) end)((fun(Target_N66588) -> (get({Target_N66588, '$class'})):append(Target_N66588, get({This, ext})) end)((fun(Target_N66595) -> (get({Target_N66595, '$class'})):append(Target_N66595, Resource) end)((fun(Target_N66602) -> (get({Target_N66602, '$class'})):append(Target_N66602, get({This, path})) end)('StringMaker':new()))))),
        case (InputStream =/= undefined) of
            true ->
            ByteArray = array:new((get({InputStream, '$class'})):available(InputStream), {default, 0}),
            (fun(Target_N66783) -> (get({Target_N66783, '$class'})):getByteArray(Target_N66783, InputStream, 'ByteArrayOutputStream':new(), ByteArray) end)('StreamUtil':getInstance()),
            throw({'$return', 'ByteArrayInputStream':new(ByteArray)});
            false -> ok
        end,
        InputStream
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

addResource(This, Resource, Value) when (is_list(Resource) orelse Resource =:= undefined) ->
        ok.

