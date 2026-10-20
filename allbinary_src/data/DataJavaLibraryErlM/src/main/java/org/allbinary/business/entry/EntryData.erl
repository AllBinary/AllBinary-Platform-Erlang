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
% package org.allbinary.business.entry

-module('EntryData').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'EntryData':new()),
    ok.

init_fields(This) ->
    put({This, 'ID'}, "ENTRY_ID"),
    put({This, 'ENCRYPTION'}, "ENTRY_ENCRYPTION"),
    put({This, 'TIMECREATED'}, "ENTRY_TIMECREATED"),
    put({This, 'LASTMODIFIED'}, "ENTRY_LASTMODIFIED"),
    put({This, 'DEFAULT'}, "ENTRY_DEFAULT"),
    put({This, 'SPECIAL'}, "ENTRY_SPECIAL"),
    put({This, 'ENABLE'}, "ENTRY_ENABLE"),
    put({This, 'YES'}, "Yes"),
    put({This, 'NO'}, "No"),
    ok.


getInstance() ->
        get({'EntryData', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

