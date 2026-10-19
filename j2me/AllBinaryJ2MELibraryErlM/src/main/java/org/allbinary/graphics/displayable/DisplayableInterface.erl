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
% package org.allbinary.graphics.displayable
% import javax.microedition.lcdui.Command
% import javax.microedition.lcdui.CommandListener

-module('DisplayableInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface


addCommand(This, Cmd) ->
    erlang:error({abstract_method, addCommand}).

getHeight(This) ->
    erlang:error({abstract_method, getHeight}).

getWidth(This) ->
    erlang:error({abstract_method, getWidth}).

removeCommand(This, Cmd) ->
    erlang:error({abstract_method, removeCommand}).

setCommandListener(This, L) ->
    erlang:error({abstract_method, setCommandListener}).

