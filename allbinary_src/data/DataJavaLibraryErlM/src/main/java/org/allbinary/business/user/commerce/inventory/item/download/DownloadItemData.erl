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
% package org.allbinary.business.user.commerce.inventory.item.download

-module('DownloadItemData').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'NAME'}, "DOWNLOADITEM_NAME"),
    put({?MODULE, 'ID'}, "DOWNLOADITEM_ID"),
    put({?MODULE, 'SYSTEM'}, "DOWNLOADITEM_SYSTEM"),
    put({?MODULE, 'PLATFORM'}, "DOWNLOADITEM_PLATFORM"),
    put({?MODULE, 'SPECIAL_NAME'}, "DOWNLOADITEM_SPECIAL_NAME"),
    put({?MODULE, 'VERSION'}, "DOWNLOADITEM_VERSION"),
    put({?MODULE, 'CHANGES'}, "DOWNLOADITEM_CHANGES"),
    put({?MODULE, 'LICENSE_FILE'}, "DOWNLOADITEM_LICENSE_FILE"),
    put({?MODULE, 'FILE'}, "DOWNLOADITEM_FILE"),
    put({?MODULE, 'EXTRA_FILES'}, "DOWNLOADITEM_EXTRA_FILES"),
    put({?MODULE, 'SIZE'}, "DOWNLOADITEM_SIZE"),
    put({?MODULE, 'VALID_TIME'}, "DOWNLOADITEM_VALID_TIME"),
    put({?MODULE, 'VALID_TIME_YEARS'}, "DOWNLOADITEM_VALID_TIME_YEAR"),
    put({?MODULE, 'VALID_TIME_MONTHS'}, "DOWNLOADITEM_VALID_TIME_MONTH"),
    put({?MODULE, 'VALID_TIME_DAYS'}, "DOWNLOADITEM_VALID_TIME_DAY"),
    put({?MODULE, 'VALID_TIME_HOURS'}, "DOWNLOADITEM_VALID_TIME_HOUR"),
    put({?MODULE, 'VALID_TIME_MINUTES'}, "DOWNLOADITEM_VALID_TIME_MINUTES"),
    put({?MODULE, 'VALID_TIME_SECONDS'}, "DOWNLOADITEM_VALID_TIME_SECONDS"),
    put({?MODULE, 'RETRIES'}, "DOWNLOADITEM_RETRIES"),
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


