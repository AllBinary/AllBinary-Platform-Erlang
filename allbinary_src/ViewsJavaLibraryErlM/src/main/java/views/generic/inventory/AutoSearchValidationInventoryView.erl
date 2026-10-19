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
% package views.generic.inventory
% import org.allbinary.logic.control.search.SearchRequest
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('AutoSearchValidationInventoryView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('InventorySearch', Function, Arguments).

init_fields(This) ->
    ok.


new(SearchRequest) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, SearchRequest),
    This.

init(This, SearchRequest) ->
        'InventorySearch':init(This, SearchRequest).

isValid(This) ->
        true.

toValidationInfoDoc(This) ->
        undefined.

toValidationInfoNode(This, Document) ->
        undefined.

validationInfo(This) ->
        undefined.

