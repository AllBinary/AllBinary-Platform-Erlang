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
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.java.exception.ExceptionUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.string.CommonLabels
% import org.allbinary.string.CommonSeps
% import org.allbinary.time.TimeStampUtil

-module('LogFormatUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'LogFormatUtil':new()),
    ok.

init_fields(This) ->
    ok.


getInstance() ->
        get({'LogFormatUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

get(This, ClassName, FunctionName, SpecialMessage, Exception) when (is_list(ClassName) orelse ClassName =:= undefined), (is_list(FunctionName) orelse FunctionName =:= undefined), (is_list(SpecialMessage) orelse SpecialMessage =:= undefined) ->
        erlang:error({'RuntimeException'}).

getS(This, ClassName, FunctionName, SpecialMessage) when (is_list(ClassName) orelse ClassName =:= undefined), (is_list(FunctionName) orelse FunctionName =:= undefined), (is_list(SpecialMessage) orelse SpecialMessage =:= undefined) ->
        erlang:error({'RuntimeException'}).

getO(This, Exception) ->
        erlang:error({'RuntimeException'}).

