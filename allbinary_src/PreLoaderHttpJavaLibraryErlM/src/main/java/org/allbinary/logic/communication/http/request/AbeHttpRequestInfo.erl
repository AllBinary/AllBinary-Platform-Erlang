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
% import java.util.Enumeration
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import javax.servlet.http.HttpServletRequest
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.string.CommonSeps

-module('AbeHttpRequestInfo').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, 'NAME'}, "AbeHttpRequestInfo"),
    put({This, abeHttpRequestInfoData}, 'AbeHttpRequestInfoData':getInstance()),
    put({This, commonSeps}, 'CommonSeps':getInstance()),
    put({This, httpUserAgent}, undefined),
    put({This, remoteAddress}, undefined),
    put({This, remoteHost}, undefined),
    put({This, remoteHostByAddr}, undefined),
    put({This, remotePort}, undefined),
    put({This, requestedFilePath}, undefined),
    ok.


new(HashMap) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, HashMap),
    This;
new(HttpServletRequest) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, HttpServletRequest),
    This.

'$init'(This, HashMap) ->
    init_fields(This),
        StringUtil = 'StringUtil':getInstance(),
        put({This, httpUserAgent}, (get({StringUtil, '$class'})):getNonNull(StringUtil, (get({HashMap, '$class'})):get(HashMap, get({get({This, abeHttpRequestInfoData}), 'HTTP_USER_AGENT'})))),
        put({This, remoteAddress}, (get({StringUtil, '$class'})):getNonNull(StringUtil, (get({HashMap, '$class'})):get(HashMap, get({get({This, abeHttpRequestInfoData}), 'REMOTE_ADDRESS'})))),
        put({This, remoteHost}, (get({StringUtil, '$class'})):getNonNull(StringUtil, (get({HashMap, '$class'})):get(HashMap, get({get({This, abeHttpRequestInfoData}), 'REMOTE_HOST'})))),
        put({This, remoteHostByAddr}, (get({StringUtil, '$class'})):getNonNull(StringUtil, (get({HashMap, '$class'})):get(HashMap, get({get({This, abeHttpRequestInfoData}), 'REMOTE_HOST_BY_ADDRESS'})))),
        put({This, remotePort}, (get({StringUtil, '$class'})):getNonNull(StringUtil, (get({HashMap, '$class'})):get(HashMap, get({get({This, abeHttpRequestInfoData}), 'REMOTE_PORT'})))),
        put({This, requestedFilePath}, (get({StringUtil, '$class'})):getNonNull(StringUtil, (get({HashMap, '$class'})):get(HashMap, get({get({This, abeHttpRequestInfoData}), 'REQUEST_FILE_PATH'}))));
'$init'(This, HttpServletRequest) ->
    init_fields(This),
        StringUtil = 'StringUtil':getInstance(),
        put({This, httpUserAgent}, get({StringUtil, 'EMPTY_STRING'})),
        Enumuration = (get({HttpServletRequest, '$class'})):getHeaderNames(HttpServletRequest),
        (fun Loop() -> case (get({Enumuration, '$class'})):hasMoreElements(Enumuration) of true ->
            Key = (get({Enumuration, '$class'})):nextElement(Enumuration),
            Value = (get({HttpServletRequest, '$class'})):getHeader(HttpServletRequest, Key),
            case (allbinary_java:index_of(Key, "user") >= 0) of
                true ->
                put({This, httpUserAgent}, lists:concat([lists:concat([lists:concat(["key: ", Key]), " value: "]), Value]));
                false -> ok
            end,
            Loop();
        false -> ok end end)(),
        put({This, remoteHostByAddr}, get({StringUtil, 'EMPTY_STRING'})),
        put({This, remoteAddress}, (get({HttpServletRequest, '$class'})):getRemoteAddr(HttpServletRequest)),
        put({This, remoteHost}, (get({HttpServletRequest, '$class'})):getRemoteHost(HttpServletRequest)),
        put({This, requestedFilePath}, (get({HttpServletRequest, '$class'})):getServletPath(HttpServletRequest)),
        put({This, remotePort}, allbinary_java:to_string((get({HttpServletRequest, '$class'})):getRemotePort(HttpServletRequest))).


toHashMap(This) ->
        HashMap = (fun(Target_N67383) -> (get({Target_N67383, '$class'})):createHashMap(Target_N67383) end)('StdUtil':getInstance()),
        (get({HashMap, '$class'})):put(HashMap, get({get({This, abeHttpRequestInfoData}), 'HTTP_USER_AGENT'}), get({This, httpUserAgent})),
        (get({HashMap, '$class'})):put(HashMap, get({get({This, abeHttpRequestInfoData}), 'REMOTE_ADDRESS'}), get({This, remoteAddress})),
        (get({HashMap, '$class'})):put(HashMap, get({get({This, abeHttpRequestInfoData}), 'REMOTE_HOST'}), get({This, remoteHost})),
        (get({HashMap, '$class'})):put(HashMap, get({get({This, abeHttpRequestInfoData}), 'REMOTE_HOST_BY_ADDRESS'}), get({This, remoteHostByAddr})),
        (get({HashMap, '$class'})):put(HashMap, get({get({This, abeHttpRequestInfoData}), 'REMOTE_PORT'}), get({This, remotePort})),
        (get({HashMap, '$class'})):put(HashMap, get({get({This, abeHttpRequestInfoData}), 'REQUEST_FILE_PATH'}), get({This, requestedFilePath})),
        HashMap.

toVector(This) ->
        Vector = 'BasicArrayListD':new(),
        (get({Vector, '$class'})):add(Vector, get({This, httpUserAgent})),
        (get({Vector, '$class'})):add(Vector, get({This, remoteAddress})),
        (get({Vector, '$class'})):add(Vector, get({This, remoteHost})),
        (get({Vector, '$class'})):add(Vector, get({This, remoteHostByAddr})),
        (get({Vector, '$class'})):add(Vector, get({This, remotePort})),
        (get({Vector, '$class'})):add(Vector, get({This, requestedFilePath})),
        Vector.

toString(This) ->
        (fun(Target_N68053) -> (get({Target_N68053, '$class'})):toString(Target_N68053) end)((fun(Target_N68060) -> (get({Target_N68060, '$class'})):append(Target_N68060, get({This, requestedFilePath})) end)((fun(Target_N68067) -> (get({Target_N68067, '$class'})):append(Target_N68067, get({get({This, commonSeps}), 'COLON_SEP'})) end)((fun(Target_N68074) -> (get({Target_N68074, '$class'})):append(Target_N68074, get({get({This, abeHttpRequestInfoData}), 'REQUEST_FILE_PATH'})) end)((fun(Target_N68081) -> (get({Target_N68081, '$class'})):append(Target_N68081, get({get({This, commonSeps}), 'SPACE'})) end)((fun(Target_N68088) -> (get({Target_N68088, '$class'})):append(Target_N68088, get({This, remotePort})) end)((fun(Target_N68095) -> (get({Target_N68095, '$class'})):append(Target_N68095, get({get({This, commonSeps}), 'COLON_SEP'})) end)((fun(Target_N68102) -> (get({Target_N68102, '$class'})):append(Target_N68102, get({get({This, abeHttpRequestInfoData}), 'REMOTE_PORT'})) end)((fun(Target_N68109) -> (get({Target_N68109, '$class'})):append(Target_N68109, get({get({This, commonSeps}), 'SPACE'})) end)((fun(Target_N68116) -> (get({Target_N68116, '$class'})):append(Target_N68116, get({This, remoteHostByAddr})) end)((fun(Target_N68123) -> (get({Target_N68123, '$class'})):append(Target_N68123, get({get({This, commonSeps}), 'COLON_SEP'})) end)((fun(Target_N68130) -> (get({Target_N68130, '$class'})):append(Target_N68130, get({get({This, abeHttpRequestInfoData}), 'REMOTE_HOST_BY_ADDRESS'})) end)((fun(Target_N68137) -> (get({Target_N68137, '$class'})):append(Target_N68137, get({get({This, commonSeps}), 'SPACE'})) end)((fun(Target_N68144) -> (get({Target_N68144, '$class'})):append(Target_N68144, get({This, remoteHost})) end)((fun(Target_N68151) -> (get({Target_N68151, '$class'})):append(Target_N68151, get({get({This, commonSeps}), 'COLON_SEP'})) end)((fun(Target_N68158) -> (get({Target_N68158, '$class'})):append(Target_N68158, get({get({This, abeHttpRequestInfoData}), 'REMOTE_HOST'})) end)((fun(Target_N68165) -> (get({Target_N68165, '$class'})):append(Target_N68165, get({get({This, commonSeps}), 'SPACE'})) end)((fun(Target_N68172) -> (get({Target_N68172, '$class'})):append(Target_N68172, get({This, remoteAddress})) end)((fun(Target_N68179) -> (get({Target_N68179, '$class'})):append(Target_N68179, get({get({This, commonSeps}), 'COLON_SEP'})) end)((fun(Target_N68186) -> (get({Target_N68186, '$class'})):append(Target_N68186, get({get({This, abeHttpRequestInfoData}), 'REMOTE_ADDRESS'})) end)((fun(Target_N68193) -> (get({Target_N68193, '$class'})):append(Target_N68193, get({get({This, commonSeps}), 'SPACE'})) end)((fun(Target_N68200) -> (get({Target_N68200, '$class'})):append(Target_N68200, get({This, httpUserAgent})) end)((fun(Target_N68207) -> (get({Target_N68207, '$class'})):append(Target_N68207, get({get({This, commonSeps}), 'COLON_SEP'})) end)((fun(Target_N68214) -> (get({Target_N68214, '$class'})):append(Target_N68214, get({get({This, abeHttpRequestInfoData}), 'HTTP_USER_AGENT'})) end)((fun(Target_N68221) -> (get({Target_N68221, '$class'})):append(Target_N68221, get({get({This, commonSeps}), 'COLON_SEP'})) end)((fun(Target_N68228) -> (get({Target_N68228, '$class'})):append(Target_N68228, get({This, 'NAME'})) end)('StringMaker':new())))))))))))))))))))))))))).

