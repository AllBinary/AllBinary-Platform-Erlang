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
% import bundle.input.automation.robot.InputAutomationRobotServiceInterface
% import org.allbinary.input.automation.robot.InputRobotFactory
% import org.allbinary.input.automation.robot.InputRobotInterface
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.osgi.OSGIServiceInterface
% import org.allbinary.osgi.OSGIServiceVisitorInterface
% import org.allbinary.string.CommonStrings

-module('InputAutomationRobotOSGIServiceVisitor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements OSGIServiceVisitorInterface

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

visit(This, AnyType) ->
        (get({This, '$class'})):visit(This, AnyType)
% unreachable Java overload visit(OSGIServiceInterface osgiServiceInterface) has the same guards as an earlier clause
.


