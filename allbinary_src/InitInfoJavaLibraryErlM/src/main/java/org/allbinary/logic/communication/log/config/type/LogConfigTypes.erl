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
% package org.allbinary.logic.communication.log.config.type
% import org.allbinary.data.tree.dom.DomNodeHelper
% import org.allbinary.data.tree.dom.DomSearchHelper
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.logic.communication.log.config.LoggingInitInfo
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.w3c.dom.Node

-module('LogConfigTypes').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'JSP_ERROR_NO_FUNCTION'}, "in JSP Not In Function"),
    put({?MODULE, 'LOGGING'}, 'BasicArrayListD':new()),
        'LogConfigTypes':init(),
    ok.

init_fields(This) ->
    ok.



new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

init() ->
        try
            'PreLogUtil':put("Initialize LogconfigTypes", "LogConfigTypes", "init()"),
            'LogConfigTypeFactory':getInstance(),
            LoggingInitInfo = 'LoggingInitInfo':new(),
            LogConfigTypeVector = (get({LoggingInitInfo, '$class'})):getTypeList(LoggingInitInfo),
            'PreLogUtil':put(lists:concat(["Number Of Log Configs: ", (get({LoggingInitInfo, '$class'})):getNumberOfLogConfigs(LoggingInitInfo)]), "LogConfigTypes", "init()"),
            'PreLogUtil':put(lists:concat(["Number Of Log Config Type Names: ", (get({LogConfigTypeVector, '$class'})):size(LogConfigTypeVector)]), "LogConfigTypes", "init()"),
            (get({get({'LogConfigTypes', 'LOGGING'}), '$class'})):addAllList(get({'LogConfigTypes', 'LOGGING'}), LogConfigTypeVector),
            (get({get({'LogConfigTypes', 'LOGGING'}), '$class'})):add(get({'LogConfigTypes', 'LOGGING'}), get({'LogConfigTypeFactory':getInstance(), 'NETBEANS_MODULE'}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            'PreLogUtil':putSE("Unable to initialize LogConfigTypes", "LogConfigTypes", "init()", E)
        end.

% throws Exception
getInstance(Node) ->
        try
        NameValueNode = 'DomSearchHelper':getNode(get({'LogConfigTypeData':getInstance(), 'NAME'}), (get({Node, '$class'})):getChildNodes(Node)),
        Name = 'DomNodeHelper':getTextNodeValue(NameValueNode),
        DescriptionValueNode = 'DomSearchHelper':getNodeNoThrow(get({'LogConfigTypeData':getInstance(), 'DESCRIPTION'}), (get({Node, '$class'})):getChildNodes(Node)),
        case (DescriptionValueNode =/= undefined) of
            true ->
            Description = 'DomNodeHelper':getTextNodeValue(DescriptionValueNode);
            false -> ok
        end,
        AvailableLogConfigTypes = get({'LogConfigType', availableLogConfigTypes}),
        Size = (get({AvailableLogConfigTypes, '$class'})):size(AvailableLogConfigTypes),
        put({local, logConfigType}, undefined),
        lists:foreach(fun(Index) ->
            put({local, logConfigType}, (get({AvailableLogConfigTypes, '$class'})):get(AvailableLogConfigTypes, Index)),
            case ((fun(Target_N66988) -> (get({Target_N66988, '$class'})):compareTo(Target_N66988, Name) end)((get({get({local, logConfigType}), '$class'})):getName(get({local, logConfigType}))) =:= 0) of
                true ->
                throw({'$return', get({local, logConfigType})});
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        erlang:error({'Exception', lists:concat(["No Such LogConfigType: ", Name])})
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

