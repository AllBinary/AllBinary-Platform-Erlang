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
% package admin.taghelpers
% import java.util.HashMap
% import javax.servlet.jsp.PageContext
% import org.allbinary.logic.communication.smtp.event.UserEmailEventNameData
% import org.allbinary.logic.communication.smtp.event.handler.UserEmailEventHandler
% import org.allbinary.logic.communication.smtp.event.handler.factory.AdminUserEmailEventHandlerSingletons
% import org.allbinary.logic.communication.smtp.info.AdminEmailInfo
% import org.allbinary.logic.communication.smtp.info.BasicEmailInfo
% import org.allbinary.logic.communication.smtp.info.EmailInfo
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory

-module('BasicTextEmailHelper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('TagHelper', Function, Arguments).

init_fields(This) ->
    put({This, abeClientInformation}, 'ServiceClientInformationInterfaceFactory':getInstance()),
    put({This, hashMap}, undefined),
    put({This, pageContext}, undefined),
    ok.


new(HashMap, PageContext) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, HashMap, PageContext),
    This.

'$init'(This, HashMap, PageContext) ->
    'TagHelper':'$init'(This),
    init_fields(This),
        put({This, pageContext}, PageContext),
        put({This, hashMap}, HashMap).

% throws Exception
send(This) ->
        AdminEmailSubject = (get({get({This, hashMap}), '$class'})):get(get({This, hashMap}), "Subject"),
        AdminEmailTextBody = (get({get({This, hashMap}), '$class'})):get(get({This, hashMap}), "Body"),
        AdminBasicEmailInfo = 'AdminEmailInfo':new(AdminEmailSubject, AdminEmailTextBody),
        AdminEmailInfo = 'EmailInfo':new(AdminBasicEmailInfo),
        AdminUserEmailEventHandler = (fun(Target_N66469) -> (get({Target_N66469, '$class'})):getInstance(Target_N66469, get({This, abeClientInformation}), get({'UserEmailEventNameData', 'INSTALLER'})) end)('AdminUserEmailEventHandlerSingletons':getInstance()),
        (get({AdminUserEmailEventHandler, '$class'})):receiveEmailInfo(AdminUserEmailEventHandler, get({'UserEmailEventNameData', 'INSTALLER'}), AdminEmailInfo).

