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
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonSeps
% import org.allbinary.string.CommonStrings

-module('ResourceUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
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
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

setLoadingPaths(This, Path, Ext) when (is_list(Path) orelse Path =:= undefined), (is_list(Ext) orelse Ext =:= undefined) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({'CommonStrings':getInstance(), 'NOT_IMPLEMENTED'}), This, "setLoadingPaths").

% throws Exception
getResourceAsStream(This, Resource) when (is_list(Resource) orelse Resource =:= undefined) ->
        put({local, inputStream}, (get({get({Resource, '$class'}), '$class'})):getResourceAsStream(get({Resource, '$class'}), Resource)),
        case (get({local, inputStream}) =:= undefined) of
            true ->
            put({local, inputStream}, (get({This, '$class'})):getResourceAsStreamAtStart(This, Resource, 2)),
            case (get({local, inputStream}) =:= undefined) of
                true ->
                put({local, inputStream}, (get({This, '$class'})):getResourceAsStreamAtStart(This, Resource, 1)),
                case (get({local, inputStream}) =:= undefined) of
                    true ->
                    StringMaker = 'StringMaker':new(),
                    Index = (get({Resource, '$class'})):lastIndexOf(Resource, $/),
                    put({local, resourcePath}, string:slice(Resource, (Index + 1))),
                    put({local, inputStream}, (get({get({Resource, '$class'}), '$class'})):getResourceAsStream(get({Resource, '$class'}), get({local, resourcePath}))),
                    case (get({local, inputStream}) =:= undefined) of
                        true ->
                        put({local, resourcePath}, string:slice(Resource, Index)),
                        put({local, inputStream}, (get({get({Resource, '$class'}), '$class'})):getResourceAsStream(get({Resource, '$class'}), get({local, resourcePath}))),
                        case (get({local, inputStream}) =:= undefined) of
                            true ->
                            RES = "res",
                            put({local, resourcePath}, (fun(Target_N66656) -> (get({Target_N66656, '$class'})):toString(Target_N66656) end)((fun(Target_N66663) -> (get({Target_N66663, '$class'})):append(Target_N66663, string:slice(Resource, Index)) end)((get({StringMaker, '$class'})):append(StringMaker, RES)))),
                            put({local, inputStream}, (get({get({Resource, '$class'}), '$class'})):getResourceAsStream(get({Resource, '$class'}), get({local, resourcePath}))),
                            case (get({local, inputStream}) =:= undefined) of
                                true ->
                                (get({StringMaker, '$class'})):delete(StringMaker, 0, (get({StringMaker, '$class'})):length(StringMaker)),
                                put({local, resourcePath}, (fun(Target_N66869) -> (get({Target_N66869, '$class'})):toString(Target_N66869) end)((fun(Target_N66876) -> (get({Target_N66876, '$class'})):append(Target_N66876, string:slice(Resource, Index)) end)((fun(Target_N66883) -> (get({Target_N66883, '$class'})):append(Target_N66883, RES) end)((get({StringMaker, '$class'})):append(StringMaker, "/"))))),
                                put({local, inputStream}, (get({get({Resource, '$class'}), '$class'})):getResourceAsStream(get({Resource, '$class'}), get({local, resourcePath}))),
                                COLON = get({'CommonSeps':getInstance(), 'COLON'}),
                                case (get({local, inputStream}) =:= undefined) of
                                    true ->
                                    (get({StringMaker, '$class'})):delete(StringMaker, 0, (get({StringMaker, '$class'})):length(StringMaker)),
                                    put({local, resourcePath}, (fun(Target_N67155) -> (get({Target_N67155, '$class'})):toString(Target_N67155) end)((fun(Target_N67162) -> (get({Target_N67162, '$class'})):append(Target_N67162, string:slice(Resource, Index)) end)((fun(Target_N67169) -> (get({Target_N67169, '$class'})):append(Target_N67169, COLON) end)((get({StringMaker, '$class'})):append(StringMaker, RES))))),
                                    put({local, inputStream}, (get({get({Resource, '$class'}), '$class'})):getResourceAsStream(get({Resource, '$class'}), get({local, resourcePath}))),
                                    case (get({local, inputStream}) =:= undefined) of
                                        true ->
                                        (get({StringMaker, '$class'})):delete(StringMaker, 0, (get({StringMaker, '$class'})):length(StringMaker)),
                                        put({local, resourcePath}, (fun(Target_N67387) -> (get({Target_N67387, '$class'})):toString(Target_N67387) end)((fun(Target_N67394) -> (get({Target_N67394, '$class'})):append(Target_N67394, string:slice(Resource, (Index + 1))) end)((fun(Target_N67401) -> (get({Target_N67401, '$class'})):append(Target_N67401, COLON) end)((get({StringMaker, '$class'})):append(StringMaker, RES))))),
                                        put({local, inputStream}, (get({get({Resource, '$class'}), '$class'})):getResourceAsStream(get({Resource, '$class'}), get({local, resourcePath}))),
                                        case (get({local, inputStream}) =:= undefined) of
                                            true ->
                                            RESOURCE_STRING = "resource",
                                            (get({StringMaker, '$class'})):delete(StringMaker, 0, (get({StringMaker, '$class'})):length(StringMaker)),
                                            put({local, resourcePath}, (fun(Target_N67666) -> (get({Target_N67666, '$class'})):toString(Target_N67666) end)((fun(Target_N67673) -> (get({Target_N67673, '$class'})):append(Target_N67673, string:slice(Resource, Index)) end)((fun(Target_N67680) -> (get({Target_N67680, '$class'})):append(Target_N67680, COLON) end)((get({StringMaker, '$class'})):append(StringMaker, RESOURCE_STRING))))),
                                            put({local, inputStream}, (get({get({Resource, '$class'}), '$class'})):getResourceAsStream(get({Resource, '$class'}), get({local, resourcePath}))),
                                            case (get({local, inputStream}) =:= undefined) of
                                                true ->
                                                (get({StringMaker, '$class'})):delete(StringMaker, 0, (get({StringMaker, '$class'})):length(StringMaker)),
                                                put({local, resourcePath}, (fun(Target_N67898) -> (get({Target_N67898, '$class'})):toString(Target_N67898) end)((fun(Target_N67905) -> (get({Target_N67905, '$class'})):append(Target_N67905, string:slice(Resource, (Index + 1))) end)((fun(Target_N67912) -> (get({Target_N67912, '$class'})):append(Target_N67912, COLON) end)((get({StringMaker, '$class'})):append(StringMaker, RESOURCE_STRING))))),
                                                put({local, inputStream}, (get({get({Resource, '$class'}), '$class'})):getResourceAsStream(get({Resource, '$class'}), get({local, resourcePath}))),
                                                case (get({local, inputStream}) =:= undefined) of
                                                    true ->
                                                    (get({StringMaker, '$class'})):delete(StringMaker, 0, (get({StringMaker, '$class'})):length(StringMaker)),
                                                    erlang:error({'Exception', (fun(Target_N68140) -> (get({Target_N68140, '$class'})):toString(Target_N68140) end)((fun(Target_N68147) -> (get({Target_N68147, '$class'})):append(Target_N68147, Resource) end)((get({StringMaker, '$class'})):append(StringMaker, "Unable to obtain: ")))});
                                                    false -> ok
                                                end;
                                                false -> ok
                                            end;
                                            false -> ok
                                        end;
                                        false -> ok
                                    end;
                                    false -> ok
                                end;
                                false -> ok
                            end;
                            false -> ok
                        end;
                        false -> ok
                    end;
                    false -> ok
                end;
                false -> ok
            end;
            false -> ok
        end,
        get({local, inputStream}).

% throws Exception
getResourceAsStreamAtStart(This, Resource, StartIndex) when (is_list(Resource) orelse Resource =:= undefined), is_integer(StartIndex) ->
        try
        StringMaker = 'StringMaker':new(),
        Index = allbinary_java:index_of(Resource, get({'CommonSeps':getInstance(), 'COLON'})),
        ResourcePath = string:slice(Resource, (Index + StartIndex)),
        InputStream = (get({get({Resource, '$class'}), '$class'})):getResourceAsStream(get({Resource, '$class'}), ResourcePath),
        case (InputStream =/= undefined) of
            true ->
            throw({'$return', InputStream});
            false -> ok
        end,
        InputStream
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

addResource(This, Resource, Value) when (is_list(Resource) orelse Resource =:= undefined) ->
        ok.

