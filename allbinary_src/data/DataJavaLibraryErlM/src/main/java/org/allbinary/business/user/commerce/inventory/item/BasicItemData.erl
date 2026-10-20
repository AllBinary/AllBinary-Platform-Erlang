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
% package org.allbinary.business.user.commerce.inventory.item

-module('BasicItemData').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'BasicItemData':new()),
    ok.

init_fields(This) ->
    put({This, 'ITEM'}, "BASICITEM"),
    put({This, 'TOTAL'}, "BASICITEM_TOTAL"),
    put({This, 'ID'}, "BASICITEM_ID"),
    put({This, 'NUMBER'}, "BASICITEM_NUMBER"),
    put({This, 'INBASKETS'}, "BASICITEM_IN_BASKETS"),
    put({This, 'WEIGHT'}, "BASICITEM_WEIGHT"),
    put({This, 'NEWORUSED'}, "BASICITEM_NEW_OR_USED"),
    put({This, 'SUMMARY'}, "BASICITEM_SUMMARY"),
    put({This, 'DISTRIBUTOR'}, "BASICITEM_DISTRIBUTOR"),
    put({This, 'IDUSEDBYDISTRIBUTOR'}, "BASICITEM_IDUSEDBYDISTRIBUTOR"),
    put({This, 'PRODUCEDBY'}, "BASICITEM_PRODUCEDBY"),
    put({This, 'PRODUCTIONDATE'}, "BASICITEM_PRODUCTIONDATE"),
    put({This, 'STARTPRODUCTIONDATE'}, "BASICITEM_STARTPRODUCTIONDATE"),
    put({This, 'DESCRIPTION'}, "BASICITEM_DESCRIPTION"),
    put({This, 'KEYWORDS'}, "BASICITEM_KEYWORDS"),
    put({This, 'CATEGORY'}, "BASICITEM_CATEGORY"),
    put({This, 'TYPE'}, "BASICITEM_TYPE"),
    put({This, 'IMAGE'}, "BASICITEM_IMG"),
    put({This, 'SMALLIMAGE'}, "BASICITEM_SMALL_IMG"),
    put({This, 'MEDIUMIMAGE'}, "BASICITEM_MEDIUM_IMG"),
    put({This, 'LARGEIMAGE'}, "BASICITEM_LARGE_IMG"),
    put({This, 'PRICE'}, "BASICITEM_PRICE"),
    put({This, 'COMMENT'}, "BASICITEM_COMMENT"),
    put({This, 'CUSTOMS'}, "BASICITEM_CUSTOMS"),
    put({This, 'DOWNLOADS'}, "BASICITEM_DOWNLOADS"),
    put({This, 'GROUPS'}, "BASICITEM_GROUPS"),
    put({This, 'OPTIONS'}, "BASICITEM_OPTIONS"),
    put({This, 'PERMISSIONS'}, "BASICITEM_PERMISSIONS"),
    put({This, 'SPECIALS'}, "BASICITEM_SPECIALS"),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'BasicItemData', instance}).

