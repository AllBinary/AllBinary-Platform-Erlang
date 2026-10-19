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
% package views.admin.inventory.listings

-module('ProductListingInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface


% throws Exception
generateAll(This) ->
    erlang:error({abstract_method, generateAll}).

% throws Exception
generateAll(This, StoreName) when (is_list(StoreName) orelse StoreName =:= undefined) ->
    erlang:error({abstract_method, generateAll}).

