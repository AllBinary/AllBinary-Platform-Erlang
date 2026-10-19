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
% package org.allbinary.business.category.store.theme
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.category.CategoryInterface
% import org.allbinary.data.tables.TableMappingInterface
% import org.allbinary.logic.control.validate.ValidationInterface
% import org.allbinary.logic.visual.theme.ThemeValidation
% import org.allbinary.logic.visual.transform.info.CompositeTransformInfoInterface

-module('StoreThemeCategoryInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface

'$handle_undefined_function'(Function, Arguments) ->
    apply('CategoryInterface', Function, Arguments).


addTheme(This, ThemeValidation) ->
    erlang:error({abstract_method, addTheme}).

getThemes(This) ->
    erlang:error({abstract_method, getThemes}).

