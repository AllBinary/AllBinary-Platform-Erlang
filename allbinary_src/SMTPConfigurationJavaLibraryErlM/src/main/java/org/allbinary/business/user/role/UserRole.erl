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
% package org.allbinary.business.user.role
% import java.io.Serializable
% import org.allbinary.business.user.UserFactoryInterface

-module('UserRole').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements Serializable

init_fields(This) ->
    put({This, basicUserRole}, undefined),
    put({This, userFactoryInterface}, undefined),
    ok.


new(ABasicUserRole, AUserFactoryInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, ABasicUserRole, AUserFactoryInterface),
    This.

'$init'(This, ABasicUserRole, AUserFactoryInterface) ->
    init_fields(This),
        put({This, basicUserRole}, ABasicUserRole),
        put({This, userFactoryInterface}, AUserFactoryInterface).

toString(This) ->
        (get({get({This, basicUserRole}), '$class'})):toString(get({This, basicUserRole})).

getBasicUserRole(This) ->
        get({This, basicUserRole}).

% throws Exception
getUserFactory(This) ->
        get({This, userFactoryInterface}).

getSessionTimeout(This) ->
        (get({get({This, basicUserRole}), '$class'})):getSessionTimeout(get({This, basicUserRole})).

getSessionInactivityTimeout(This) ->
        (get({get({This, basicUserRole}), '$class'})):getSessionInactivityTimeout(get({This, basicUserRole})).

