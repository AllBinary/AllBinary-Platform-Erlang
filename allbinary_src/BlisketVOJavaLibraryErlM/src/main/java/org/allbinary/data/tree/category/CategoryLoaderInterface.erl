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
% package org.allbinary.data.tree.category
% import org.allbinary.business.category.CategoryInterface
% import org.w3c.dom.Document

-module('CategoryLoaderInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface

'$handle_undefined_function'(Function, Arguments) ->
    apply('CategoryModifierTreeInterface', Function, Arguments).


getDoc(This, CategoryInterface) ->
    erlang:error({abstract_method, getDoc}).

get(This, CategoryInterface) ->
    erlang:error({abstract_method, get}).

getAll(This, CategoryInterface) ->
    erlang:error({abstract_method, getAll}).

