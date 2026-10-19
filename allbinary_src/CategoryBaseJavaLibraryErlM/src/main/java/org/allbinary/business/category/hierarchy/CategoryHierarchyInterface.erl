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
% package org.allbinary.business.category.hierarchy
% import org.allbinary.business.category.CategoryInterface

-module('CategoryHierarchyInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface


getLevel(This) ->
    erlang:error({abstract_method, getLevel}).

getLevelString(This) ->
    erlang:error({abstract_method, getLevelString}).

getRoot(This) ->
    erlang:error({abstract_method, getRoot}).

getParent(This) ->
    erlang:error({abstract_method, getParent}).

setLevel(This, Level) when is_integer(Level) ->
    erlang:error({abstract_method, setLevel}).

setRoot(This, CategoryInterface) ->
    erlang:error({abstract_method, setRoot}).

setParent(This, CategoryInterface) ->
    erlang:error({abstract_method, setParent}).

