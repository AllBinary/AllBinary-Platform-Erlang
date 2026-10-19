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
% package org.allbinary.logic.system.os
% import org.allbinary.logic.java.character.CharacterSet

-module('OperatingSystemInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface


getName(This) ->
    erlang:error({abstract_method, getName}).

getVersion(This) ->
    erlang:error({abstract_method, getVersion}).

getArch(This) ->
    erlang:error({abstract_method, getArch}).

getCharacterSet(This) ->
    erlang:error({abstract_method, getCharacterSet}).

isOverScan(This) ->
    erlang:error({abstract_method, isOverScan}).

getOverScanXPercent(This) ->
    erlang:error({abstract_method, getOverScanXPercent}).

getOverScanYPercent(This) ->
    erlang:error({abstract_method, getOverScanYPercent}).

isScalable(This) ->
    erlang:error({abstract_method, isScalable}).

isAutoHide(This) ->
    erlang:error({abstract_method, isAutoHide}).

toString(This) ->
    erlang:error({abstract_method, toString}).

