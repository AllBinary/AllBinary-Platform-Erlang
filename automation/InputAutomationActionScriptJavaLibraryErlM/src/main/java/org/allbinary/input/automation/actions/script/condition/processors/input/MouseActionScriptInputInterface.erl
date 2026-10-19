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
% import java.awt

-module('MouseActionScriptInputInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface

'$handle_undefined_function'(Function, Arguments) ->
    apply('ProfileActionScriptInputInterface', Function, Arguments).


setPoint(This, Point) ->
    erlang:error({abstract_method, setPoint}).

getPoint(This) ->
    erlang:error({abstract_method, getPoint}).

getButtonClicks(This) ->
    erlang:error({abstract_method, getButtonClicks}).

setButtonClicks(This, Buttons) when is_integer(Buttons) ->
    erlang:error({abstract_method, setButtonClicks}).

log(This) ->
    erlang:error({abstract_method, log}).

