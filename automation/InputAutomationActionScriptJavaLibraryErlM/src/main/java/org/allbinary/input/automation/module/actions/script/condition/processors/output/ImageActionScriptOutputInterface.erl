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
% package org.allbinary.input.automation.module.actions.script.condition.processors.output

-module('ImageActionScriptOutputInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface

'$handle_undefined_function'(Function, Arguments) ->
    apply('ProfileActionScriptOutputInterface', Function, Arguments).


getImageTypes(This) ->
    erlang:error({abstract_method, getImageTypes}).

setImageTypes(This, ImageTypes) ->
    erlang:error({abstract_method, setImageTypes}).

isSaved(This) ->
    erlang:error({abstract_method, isSaved}).

setSaved(This, Saved) when is_boolean(Saved) ->
    erlang:error({abstract_method, setSaved}).

isDisplay(This) ->
    erlang:error({abstract_method, isDisplay}).

setDisplay(This, Display) when is_boolean(Display) ->
    erlang:error({abstract_method, setDisplay}).

log(This) ->
    erlang:error({abstract_method, log}).

