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
% package org.allbinary.business.init
% import org.allbinary.logic.io.path.AbPath

-module('InitInfoInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface


isTesting(This) ->
    erlang:error({abstract_method, isTesting}).

getTesting(This) ->
    erlang:error({abstract_method, getTesting}).

getTestHtmlPath(This) ->
    erlang:error({abstract_method, getTestHtmlPath}).

getMainPath(This) ->
    erlang:error({abstract_method, getMainPath}).

setTesting(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setTesting}).

setTestHtmlPath(This, Value) ->
    erlang:error({abstract_method, setTestHtmlPath}).

setMainPath(This, Value) ->
    erlang:error({abstract_method, setMainPath}).

% throws Exception
isTestingValid(This, Testing) when (is_list(Testing) orelse Testing =:= undefined) ->
    erlang:error({abstract_method, isTestingValid}).

isTestHtmlPathValid(This, Value) ->
    erlang:error({abstract_method, isTestHtmlPathValid}).

isMainPathValid(This, Value) ->
    erlang:error({abstract_method, isMainPathValid}).

