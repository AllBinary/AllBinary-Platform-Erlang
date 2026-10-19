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
% package org.allbinary.business.user.commerce.inventory.item.group

-module('BasicGroupItemData').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'ITEM_ONE'}, "BASICGROUPITEM_ONE"),
    put({?MODULE, 'ITEM_TWO'}, "BASICGROUPITEM_TWO"),
    put({?MODULE, 'ITEM_THREE'}, "BASICGROUPITEM_THREE"),
    put({?MODULE, 'ITEM_FOUR'}, "BASICGROUPITEM_FOUR"),
    put({?MODULE, 'ITEM_FIVE'}, "BASICGROUPITEM_FIVE"),
    put({?MODULE, 'ITEM_SIX'}, "BASICGROUPITEM_SIX"),
    put({?MODULE, 'ITEM_SEVEN'}, "BASICGROUPITEM_SEVEN"),
    put({?MODULE, 'ITEM_EIGHT'}, "BASICGROUPITEM_EIGHT"),
    put({?MODULE, 'ITEM_NINE'}, "BASICGROUPITEM_NINE"),
    put({?MODULE, 'ITEM_TEN'}, "BASICGROUPITEM_TEN"),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


