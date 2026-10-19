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
% package org.allbinary.business.category
% import java.util.HashMap
% import org.allbinary.logic.io.path.AbPath
% import org.w3c.dom.Node

-module('CategoryFactoryInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface


getRootInstance(This) ->
    erlang:error({abstract_method, getRootInstance}).

getRootInstance(This, CategoryPath) ->
    erlang:error({abstract_method, getRootInstance}).

getRootInstanceFromNode(This, Node) ->
    erlang:error({abstract_method, getRootInstanceFromNode}).

getInstance(This, RootCategoryInterface, ParentCategoryInterface, Name) when (is_list(Name) orelse Name =:= undefined) ->
    erlang:error({abstract_method, getInstance});
getInstance(This, RootCategoryInterface, ParentCategoryInterface, Node) ->
    erlang:error({abstract_method, getInstance});
getInstance(This, RootCategoryInterface, ParentCategoryInterface, CategoryPropertiesHashMap) ->
    erlang:error({abstract_method, getInstance}).



