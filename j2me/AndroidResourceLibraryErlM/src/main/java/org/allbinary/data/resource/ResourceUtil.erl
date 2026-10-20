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
% import android.app.Activity
% import android.content.Context
% import android.content.res.Resources
% import org.allbinary.debug.DebugFactory
% import org.allbinary.debug.NoDebug
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.ForcedLogUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonSeps
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.ABHashtable
% import org.allbinary.util.HashtableUtil

-module('ResourceUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ResourceUtil':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, context}, get({'NullUtil':getInstance(), 'NULL_OBJECT'})),
    put({This, resources}, get({'NullUtil':getInstance(), 'NULL_OBJECT'})),
    put({This, hashMap}, (fun(Target_N66288) -> (get({Target_N66288, '$class'})):createHashtable(Target_N66288) end)('StdUtil':getInstance())),
    ok.


getInstance() ->
        get({'ResourceUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

setLoadingPaths(This, Path, Ext) when (is_list(Path) orelse Path =:= undefined), (is_list(Ext) orelse Ext =:= undefined) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({'CommonStrings':getInstance(), 'NOT_IMPLEMENTED'}), This, "setLoadingPaths").

getContext(This) ->
        get({This, context}).

setContextFromActivity(This, Activity) ->
        put({This, context}, Activity).

setContext(This, AContext) ->
        put({This, context}, AContext).

getResourceId(This, Resource) when (is_list(Resource) orelse Resource =:= undefined) ->
        Value = (get({get({This, hashMap}), '$class'})):get(get({This, hashMap}), Resource),
        case ('DebugFactory':getInstance() =/= 'NoDebug':getInstance()) of
            true ->
            'PreLogUtil':put((fun(Target_N66843) -> (get({Target_N66843, '$class'})):toString(Target_N66843) end)((fun(Target_N66850) -> (get({Target_N66850, '$class'})):append(Target_N66850, (get({Value, '$class'})):toString(Value)) end)((fun(Target_N66857) -> (get({Target_N66857, '$class'})):append(Target_N66857, get({'CommonSeps':getInstance(), 'COLON'})) end)((fun(Target_N66864) -> (get({Target_N66864, '$class'})):append(Target_N66864, Resource) end)('StringMaker':new())))), This, "getResourceId");
            false -> ok
        end,
        Value.

addResource(This, Resource, Value) when (is_list(Resource) orelse Resource =:= undefined) ->
        case ('DebugFactory':getInstance() =/= 'NoDebug':getInstance()) of
            true ->
            'PreLogUtil':put((fun(Target_N67084) -> (get({Target_N67084, '$class'})):toString(Target_N67084) end)((fun(Target_N67091) -> (get({Target_N67091, '$class'})):append(Target_N67091, (get({Value, '$class'})):toString(Value)) end)((fun(Target_N67098) -> (get({Target_N67098, '$class'})):append(Target_N67098, get({'CommonSeps':getInstance(), 'COLON'})) end)((fun(Target_N67105) -> (get({Target_N67105, '$class'})):append(Target_N67105, Resource) end)('StringMaker':new())))), This, "addResource"),
            case (get({This, '$class'})):containsDuplicate(This, Resource, Value) of
                true ->
                'ForcedLogUtil':log((fun(Target_N67253) -> (get({Target_N67253, '$class'})):toString(Target_N67253) end)((fun(Target_N67260) -> (get({Target_N67260, '$class'})):append(Target_N67260, Resource) end)((fun(Target_N67267) -> (get({Target_N67267, '$class'})):append(Target_N67267, "Found Duplicate Resource: ") end)('StringMaker':new()))), This);
                false -> ok
            end;
            false -> ok
        end,
        (get({get({This, hashMap}), '$class'})):put(get({This, hashMap}), Resource, Value).

containsDuplicate(This, Resource, Value) when (is_list(Resource) orelse Resource =:= undefined) ->
        try
        ObjectArray = (fun(Target_N67434) -> (get({Target_N67434, '$class'})):getKeysAsArray(Target_N67434, get({This, hashMap})) end)('HashtableUtil':getInstance()),
        put({local, index}, array:size(ObjectArray)),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            Integer = (get({get({This, hashMap}), '$class'})):get(get({This, hashMap}), array:get(get({local, index}), ObjectArray)),
            case (Resource =/= array:get(get({local, index}), ObjectArray)) of
                true ->
                case (Value =/= Integer) of
                    true ->
                    case ((get({Value, '$class'})):intValue(Value) =:= (get({Integer, '$class'})):intValue(Integer)) of
                        true ->
                        throw({'$return', true});
                        false -> ok
                    end;
                    false -> ok
                end;
                false -> ok
            end,
            Loop();
        false -> ok end end)(),
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

setResources(This, Resources) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N67883) -> (get({Target_N67883, '$class'})):toString(Target_N67883) end)((fun(Target_N67890) -> (get({Target_N67890, '$class'})):append(Target_N67890, atom_to_list(get({Resources, '$class'}))) end)((fun(Target_N67897) -> (get({Target_N67897, '$class'})):append(Target_N67897, "Resource Loader: ") end)('StringMaker':new()))), This, "setResources"),
        put({This, resources}, Resources).

% throws Exception
getResourceAsStream(This, Resource) when (is_list(Resource) orelse Resource =:= undefined) ->
        try
        Integer = (get({get({This, hashMap}), '$class'})):get(get({This, hashMap}), Resource),
        Id = (get({Integer, '$class'})):intValue(Integer),
        Resources = (get({This, resources})),
        InputStream = (get({Resources, '$class'})):openRawResource(Resources, Id),
        case (InputStream =/= undefined) of
            true ->
            throw({'$return', InputStream});
            false -> ok
        end,
        InputStream
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

