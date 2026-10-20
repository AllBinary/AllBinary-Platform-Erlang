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
% import jsinterop.annotations.JsType
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
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

put(SpecialMessage, AnyType, FunctionName) when (is_list(SpecialMessage) orelse SpecialMessage =:= undefined), (is_list(FunctionName) orelse FunctionName =:= undefined) ->
        put({local, className}, 'PreLogUtil':getClassName(AnyType)),
        case (get({local, className}) =:= undefined) of
            true ->
            put({local, className}, get({'CommonStrings':getInstance(), 'EMPTY'}));
            false -> ok
        end,
        put({local, className}, (fun(Target_N65913) -> (get({Target_N65913, '$class'})):toString(Target_N65913) end)((fun(Target_N65920) -> (get({Target_N65920, '$class'})):append(Target_N65920, (fun(Target_N65995) -> (get({Target_N65995, '$class'})):toString(Target_N65995, AnyType) end)('StringUtil':getInstance())) end)((fun(Target_N65927) -> (get({Target_N65927, '$class'})):append(Target_N65927, get({'CommonSeps':getInstance(), 'FORWARD_SLASH'})) end)((fun(Target_N65934) -> (get({Target_N65934, '$class'})):append(Target_N65934, get({local, className})) end)('StringMaker':new()))))),
        Message = (fun(Target_N66053) -> (get({Target_N66053, '$class'})):getS(Target_N66053, get({local, className}), FunctionName, SpecialMessage) end)('LogFormatUtil':getInstance()),
        (fun(Target_N66123) -> (get({Target_N66123, '$class'})):debug(Target_N66123, lists:concat([get({'PreLogUtil', 'LOG_SUCCESS'}), Message])) end)((fun(Target_N66130) -> (get({Target_N66130, '$class'})):log(Target_N66130) end)('PlayN':getInstance())).

putOE(SpecialMessage, AnyType, FunctionName, Exception) when (is_list(SpecialMessage) orelse SpecialMessage =:= undefined), (is_list(FunctionName) orelse FunctionName =:= undefined) ->
        put({local, className}, 'PreLogUtil':getClassName(AnyType)),
        case (get({local, className}) =:= undefined) of
            true ->
            put({local, className}, get({'CommonStrings':getInstance(), 'EMPTY'}));
            false -> ok
        end,
        put({local, className}, (fun(Target_N66479) -> (get({Target_N66479, '$class'})):toString(Target_N66479) end)((fun(Target_N66486) -> (get({Target_N66486, '$class'})):append(Target_N66486, (fun(Target_N66561) -> (get({Target_N66561, '$class'})):toString(Target_N66561, AnyType) end)('StringUtil':getInstance())) end)((fun(Target_N66493) -> (get({Target_N66493, '$class'})):append(Target_N66493, get({'CommonSeps':getInstance(), 'FORWARD_SLASH'})) end)((fun(Target_N66500) -> (get({Target_N66500, '$class'})):append(Target_N66500, get({local, className})) end)('StringMaker':new()))))),
        Message = (fun(Target_N66619) -> (get({Target_N66619, '$class'})):get(Target_N66619, get({local, className}), FunctionName, SpecialMessage, Exception) end)('LogFormatUtil':getInstance()),
        (fun(Target_N66697) -> (get({Target_N66697, '$class'})):error(Target_N66697, lists:concat([get({'PreLogUtil', 'LOG_SUCCESS'}), Message]), Exception) end)((fun(Target_N66704) -> (get({Target_N66704, '$class'})):log(Target_N66704) end)('PlayN':getInstance())).

putS(SpecialMessage, ClassName, FunctionName) when (is_list(SpecialMessage) orelse SpecialMessage =:= undefined), (is_list(ClassName) orelse ClassName =:= undefined), (is_list(FunctionName) orelse FunctionName =:= undefined) ->
        Message = (fun(Target_N66932) -> (get({Target_N66932, '$class'})):getS(Target_N66932, ClassName, FunctionName, SpecialMessage) end)('LogFormatUtil':getInstance()),
        (fun(Target_N67002) -> (get({Target_N67002, '$class'})):debug(Target_N67002, lists:concat([get({'PreLogUtil', 'LOG_SUCCESS'}), Message])) end)((fun(Target_N67009) -> (get({Target_N67009, '$class'})):log(Target_N67009) end)('PlayN':getInstance())).

putSE(SpecialMessage, ClassName, FunctionName, Exception) when (is_list(SpecialMessage) orelse SpecialMessage =:= undefined), (is_list(ClassName) orelse ClassName =:= undefined), (is_list(FunctionName) orelse FunctionName =:= undefined) ->
        Message = (fun(Target_N67193) -> (get({Target_N67193, '$class'})):get(Target_N67193, ClassName, FunctionName, SpecialMessage, Exception) end)('LogFormatUtil':getInstance()),
        (fun(Target_N67271) -> (get({Target_N67271, '$class'})):error(Target_N67271, lists:concat([get({'PreLogUtil', 'LOG_SUCCESS'}), Message]), Exception) end)((fun(Target_N67278) -> (get({Target_N67278, '$class'})):log(Target_N67278) end)('PlayN':getInstance())).

getClassName(AnyType) ->
    erlang:error({abstract_method, getClassName}).

