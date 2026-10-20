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
% package org.allbinary.business.user.modules.customer.wholesale
% import java.util.HashMap
% import org.allbinary.business.user.modules.User
% import org.allbinary.logic.communication.http.request.session.WeblisketSessionInterface

-module('WholesaleUser').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('User', Function, Arguments).

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
        'User':'$init'(This).

new(UserHashMap) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, UserHashMap),
    This.

'$init'(This, UserHashMap) ->
        'User':'$init'(This, UserHashMap).

validateSession(This, WeblisketSession) ->
        'User':validateSession(This, WeblisketSession),
        (get({This, '$class'})):updateSession(This, WeblisketSession).

updateSession(This, WeblisketSession) ->
        (get({WeblisketSession, '$class'})):setStoreName(WeblisketSession, (get({This, '$class'})):getPermissions(This)).

