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
% package org.allbinary.logic.communication.http.request.session

-module('WeblisketSessionData').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'INVALIDATESESSION'}, "SESSION_INVALIDATE_SESSION"),
    put({?MODULE, 'ATTEMPTS'}, "SESSION_ATTEMPTS"),
    put({?MODULE, 'TIMEOUT'}, "SESSION_TIMEOUT"),
    put({?MODULE, 'REMOVABLEUSERNAME'}, "SESSION_REMOVABLE_USER_NAME"),
    put({?MODULE, 'REMOVABLEPASSWORD'}, "SESSION_REMOVABLE_PASSWORD"),
    put({?MODULE, 'REMOVABLENEWPASSWORD'}, "SESSION_REMOVABLE_NEW_PASSWORD"),
    put({?MODULE, 'REMOVABLEREENTERNEWPASSWORD'}, "SESSION_REMOVABLE_REENTER_NEW_PASSWORD"),
    put({?MODULE, 'AUTHENTICATED'}, "SESSION_AUTHENTICATED"),
    ok.

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

