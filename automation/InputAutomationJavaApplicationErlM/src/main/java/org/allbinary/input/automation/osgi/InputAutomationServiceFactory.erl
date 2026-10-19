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
% package org.allbinary.input.automation.osgi
% import org.osgi.framework.Bundle
% import org.osgi.framework.ServiceFactory
% import org.osgi.framework.ServiceRegistration
% import org.allbinary.input.automation.InputAutomationJFrame
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings

-module('InputAutomationServiceFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements ServiceFactory

static_init() ->
    put({?MODULE, inputAutomationServiceFactory}, 'InputAutomationServiceFactory':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

getInstance() ->
        get({'InputAutomationServiceFactory', inputAutomationServiceFactory}).

getService(This, Bundle, Registration) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "getService"),
        'InputAutomationJFrame':getInstance().

ungetService(This, Bundle, Registration, Service) ->
        ok.

