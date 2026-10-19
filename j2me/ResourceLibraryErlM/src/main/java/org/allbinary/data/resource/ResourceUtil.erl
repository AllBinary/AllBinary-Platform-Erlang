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
% import java.io.InputStream
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonSeps
% import org.allbinary.string.CommonStrings

-module('ResourceUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, classLoader}, get({'NullUtil':getInstance(), 'NULL_OBJECT'})),
    put({?MODULE, instance}, 'ResourceUtil':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
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
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({'CommonStrings':getInstance(), 'NOT_IMPLEMENTED'}), This, "setLoadingPaths").

setClassLoader(This, ClassLoader) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N66127) -> (get({Target_N66127, '$class'})):toString(Target_N66127) end)((fun(Target_N66134) -> (get({Target_N66134, '$class'})):append(Target_N66134, atom_to_list(get({ClassLoader, '$class'}))) end)((fun(Target_N66141) -> (get({Target_N66141, '$class'})):append(Target_N66141, "Resource Loader: ") end)('StringMaker':new()))), This, "setClassLoader"),
        put({'ResourceUtil', classLoader}, ClassLoader).

% throws Exception
getResourceAsStream(This, Resource) when (is_list(Resource) orelse Resource =:= undefined) ->
        put({local, inputStream}, (get({This, '$class'})):getResourceAsStreamAtStart(This, Resource, 2)),
        case (get({local, inputStream}) =:= undefined) of
            true ->
            put({local, inputStream}, (get({This, '$class'})):getResourceAsStreamAtStart(This, Resource, 1)),
            case (get({local, inputStream}) =:= undefined) of
                true ->
                erlang:error({'Exception', (fun(Target_N66456) -> (get({Target_N66456, '$class'})):toString(Target_N66456) end)((fun(Target_N66463) -> (get({Target_N66463, '$class'})):append(Target_N66463, Resource) end)((fun(Target_N66470) -> (get({Target_N66470, '$class'})):append(Target_N66470, "Unable to obtain: ") end)('StringMaker':new())))});
                false -> ok
            end;
            false -> ok
        end,
        get({local, inputStream}).

% throws Exception
getResourceAsStreamAtStart(This, Resource, StartIndex) when (is_list(Resource) orelse Resource =:= undefined), is_integer(StartIndex) ->
        try
        CommonSeps = 'CommonSeps':getInstance(),
        Index = allbinary_java:index_of(Resource, get({CommonSeps, 'COLON'})),
        ResourcePath = string:slice(Resource, (Index + StartIndex)),
        put({local, inputStream}, (get({get({Resource, '$class'}), '$class'})):getResourceAsStream(get({Resource, '$class'}), ResourcePath)),
        case (get({local, inputStream}) =/= undefined) of
            true ->
            throw({'$return', get({local, inputStream})});
            false -> ok
        end,
        ClassLoader = get({'ResourceUtil', classLoader}),
        put({local, inputStream}, (get({ClassLoader, '$class'})):getResourceAsStream(ClassLoader, ResourcePath)),
        case (get({local, inputStream}) =/= undefined) of
            true ->
            throw({'$return', get({local, inputStream})});
            false -> ok
        end,
        put({local, inputStream}, (fun(Target_N67073) -> (get({Target_N67073, '$class'})):getResourceAsStream(Target_N67073, ResourcePath) end)((fun(Target_N67080) -> (get({Target_N67080, '$class'})):getContextClassLoader(Target_N67080) end)('Thread':currentThread()))),
        case (get({local, inputStream}) =/= undefined) of
            true ->
            throw({'$return', get({local, inputStream})});
            false -> ok
        end,
        get({local, inputStream})
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

addResource(This, Resource, Value) when (is_list(Resource) orelse Resource =:= undefined) ->
        ok.

