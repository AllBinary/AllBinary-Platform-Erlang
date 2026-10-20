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
% package org.allbinary.business.advertisement.search.category

-module('BasicAdvertisementCategory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements AdvertisementCategoryInterface

init_fields(This) ->
    put({This, categoryId}, undefined),
    ok.


new(CategoryId) when (is_list(CategoryId) orelse CategoryId =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, CategoryId),
    This.

'$init'(This, CategoryId) when (is_list(CategoryId) orelse CategoryId =:= undefined) ->
    init_fields(This),
        put({This, categoryId}, CategoryId).

toString(This) ->
        get({This, categoryId}).

