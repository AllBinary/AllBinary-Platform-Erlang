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
% package org.allbinary.logic.communication.log
% import org.allbinary.string.CommonSeps
% import org.allbinary.string.CommonStrings
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import playn.core.PlayN

-module('PreLogUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'LOG_SUCCESS'}, "org.allbinary: "),
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

put(SpecialMessage, AnyType, FunctionName) when (is_list(SpecialMessage) orelse SpecialMessage =:= undefined), (is_list(FunctionName) orelse FunctionName =:= undefined) ->
        put({local, className}, 'PreLogUtil':getClassName(AnyType)),
        case (get({local, className}) =:= undefined) of
            true ->
            put({local, className}, get({'CommonStrings':getInstance(), 'EMPTY'}));
            false -> ok
        end,
        put({local, className}, (fun(Target_N65893) -> (get({Target_N65893, '$class'})):toString(Target_N65893) end)((fun(Target_N65900) -> (get({Target_N65900, '$class'})):append(Target_N65900, (fun(Target_N65975) -> (get({Target_N65975, '$class'})):toString(Target_N65975, AnyType) end)('StringUtil':getInstance())) end)((fun(Target_N65907) -> (get({Target_N65907, '$class'})):append(Target_N65907, get({'CommonSeps':getInstance(), 'FORWARD_SLASH'})) end)((fun(Target_N65914) -> (get({Target_N65914, '$class'})):append(Target_N65914, get({local, className})) end)('StringMaker':new()))))),
        Message = (fun(Target_N66033) -> (get({Target_N66033, '$class'})):getS(Target_N66033, get({local, className}), FunctionName, SpecialMessage) end)('LogFormatUtil':getInstance()),
        (fun(Target_N66103) -> (get({Target_N66103, '$class'})):debug(Target_N66103, lists:concat([get({'PreLogUtil', 'LOG_SUCCESS'}), Message])) end)('PlayN':log()).

putOE(SpecialMessage, AnyType, FunctionName, Exception) when (is_list(SpecialMessage) orelse SpecialMessage =:= undefined), (is_list(FunctionName) orelse FunctionName =:= undefined) ->
        put({local, className}, 'PreLogUtil':getClassName(AnyType)),
        case (get({local, className}) =:= undefined) of
            true ->
            put({local, className}, get({'CommonStrings':getInstance(), 'EMPTY'}));
            false -> ok
        end,
        put({local, className}, (fun(Target_N66451) -> (get({Target_N66451, '$class'})):toString(Target_N66451) end)((fun(Target_N66458) -> (get({Target_N66458, '$class'})):append(Target_N66458, (fun(Target_N66533) -> (get({Target_N66533, '$class'})):toString(Target_N66533, AnyType) end)('StringUtil':getInstance())) end)((fun(Target_N66465) -> (get({Target_N66465, '$class'})):append(Target_N66465, get({'CommonSeps':getInstance(), 'FORWARD_SLASH'})) end)((fun(Target_N66472) -> (get({Target_N66472, '$class'})):append(Target_N66472, get({local, className})) end)('StringMaker':new()))))),
        Message = (fun(Target_N66591) -> (get({Target_N66591, '$class'})):get(Target_N66591, get({local, className}), FunctionName, SpecialMessage, Exception) end)('LogFormatUtil':getInstance()),
        (fun(Target_N66669) -> (get({Target_N66669, '$class'})):error(Target_N66669, lists:concat([get({'PreLogUtil', 'LOG_SUCCESS'}), Message]), Exception) end)('PlayN':log()).

putS(SpecialMessage, ClassName, FunctionName) when (is_list(SpecialMessage) orelse SpecialMessage =:= undefined), (is_list(ClassName) orelse ClassName =:= undefined), (is_list(FunctionName) orelse FunctionName =:= undefined) ->
        Message = (fun(Target_N66896) -> (get({Target_N66896, '$class'})):getS(Target_N66896, ClassName, FunctionName, SpecialMessage) end)('LogFormatUtil':getInstance()),
        (fun(Target_N66966) -> (get({Target_N66966, '$class'})):debug(Target_N66966, lists:concat([get({'PreLogUtil', 'LOG_SUCCESS'}), Message])) end)('PlayN':log()).

putSE(SpecialMessage, ClassName, FunctionName, Exception) when (is_list(SpecialMessage) orelse SpecialMessage =:= undefined), (is_list(ClassName) orelse ClassName =:= undefined), (is_list(FunctionName) orelse FunctionName =:= undefined) ->
        Message = (fun(Target_N67149) -> (get({Target_N67149, '$class'})):get(Target_N67149, ClassName, FunctionName, SpecialMessage, Exception) end)('LogFormatUtil':getInstance()),
        (fun(Target_N67227) -> (get({Target_N67227, '$class'})):error(Target_N67227, lists:concat([get({'PreLogUtil', 'LOG_SUCCESS'}), Message]), Exception) end)('PlayN':log()).

getClassName(AnyType) ->
    erlang:error({abstract_method, getClassName}).

