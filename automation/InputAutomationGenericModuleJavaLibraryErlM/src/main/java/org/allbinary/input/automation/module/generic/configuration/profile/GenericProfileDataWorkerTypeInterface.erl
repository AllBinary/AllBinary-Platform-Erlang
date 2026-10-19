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
% package org.allbinary.input.automation.module.generic.configuration.profile
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('GenericProfileDataWorkerTypeInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface


getName(This) ->
    erlang:error({abstract_method, getName}).

setName(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
    erlang:error({abstract_method, setName}).

toString(This) ->
    erlang:error({abstract_method, toString}).

% throws Exception
toXmlNode(This, Document) ->
    erlang:error({abstract_method, toXmlNode}).

