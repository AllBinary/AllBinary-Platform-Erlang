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
% import org.allbinary.logic.control.validate.ValidationInterface
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('StoreThemeCategoryValidationView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ValidationInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('StoreThemeCategoryView', Function, Arguments).

init_fields(This) ->
    ok.


new(CategoryInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, CategoryInterface),
    This.

'$init'(This, CategoryInterface) ->
        'StoreThemeCategoryView':'$init'(This, CategoryInterface).

% throws Exception
isValid(This) ->
        true.

% throws Exception
toValidationInfoDoc(This) ->
        undefined.

% throws Exception
toValidationInfoNode(This, Document) ->
        undefined.

% throws Exception
validationInfo(This) ->
        "Error".

