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
% package org.allbinary.input.automation.actions.script.condition.processors.input

-module('KeyboardActionScriptInputInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface

'$handle_undefined_function'(Function, Arguments) ->
    apply('ProfileActionScriptInputInterface', Function, Arguments).


getDelayBetweenKeys(This) ->
    erlang:error({abstract_method, getDelayBetweenKeys}).

getKeyArray(This) ->
    erlang:error({abstract_method, getKeyArray}).

isPress(This) ->
    erlang:error({abstract_method, isPress}).

isRelease(This) ->
    erlang:error({abstract_method, isRelease}).

isNormal(This) ->
    erlang:error({abstract_method, isNormal}).

setPress(This, Press) when is_boolean(Press) ->
    erlang:error({abstract_method, setPress}).

setRelease(This, Release) when is_boolean(Release) ->
    erlang:error({abstract_method, setRelease}).

setNormal(This) ->
    erlang:error({abstract_method, setNormal}).

getText(This) ->
    erlang:error({abstract_method, getText}).

setText(This, Text) when (is_list(Text) orelse Text =:= undefined) ->
    erlang:error({abstract_method, setText}).

log(This) ->
    erlang:error({abstract_method, log}).

