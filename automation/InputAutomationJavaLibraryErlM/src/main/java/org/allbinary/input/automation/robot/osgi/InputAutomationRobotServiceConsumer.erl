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
% package org.allbinary.input.automation.robot.osgi
% import org.osgi.framework.BundleContext
% import bundle.input.automation.robot.InputAutomationRobotServiceInterface
% import org.allbinary.osgi.service.InputAutomationServiceConsumer

-module('InputAutomationRobotServiceConsumer').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('InputAutomationServiceConsumer', Function, Arguments).

init_fields(This) ->
    ok.


new(BundleContext) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, BundleContext),
    This.

'$init'(This, BundleContext) ->
        'InputAutomationServiceConsumer':'$init'(This, (get({'InputAutomationRobotServiceInterface', '$class'})):getName('InputAutomationRobotServiceInterface'), BundleContext, 'InputAutomationRobotOSGIServiceVisitor':new()).

