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
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import javax.servlet.http.HttpServletRequest
% import javax.servlet.jsp.PageContext
% import org.allbinary.business.context.modules.storefront.StoreFront
% import org.allbinary.business.context.modules.storefront.StoreFrontInterface
% import org.allbinary.business.installer.Portion
% import org.allbinary.data.tables.context.module.storefronts.StoreFrontsEntityFactory
% import org.allbinary.logic.communication.http.request.session.WeblisketSession
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.smtp.event.UserEmailEventNameData
% import org.allbinary.logic.communication.smtp.event.handler.UserEmailEventHandler
% import org.allbinary.logic.communication.smtp.event.handler.factory.AdminUserEmailEventHandlerSingletons
% import org.allbinary.logic.communication.smtp.event.handler.factory.StoreAdminUserEmailEventHandlerSingletons
% import org.allbinary.logic.communication.smtp.info.AdminEmailInfo
% import org.allbinary.logic.communication.smtp.info.BasicEmailInfo
% import org.allbinary.logic.communication.smtp.info.EmailInfo
% import org.allbinary.logic.communication.smtp.info.StoreEmailInfo
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory

-module('StoreFrontsRequestHelper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ModifyTable', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, abeClientInformation}, 'ServiceClientInformationInterfaceFactory':getInstance()),
    put({This, pageContext}, undefined),
    put({This, request}, undefined),
    put({This, weblisketSession}, undefined),
    put({This, storeName}, undefined),
    put({This, modifyingStoreFrontInterface}, undefined),
    put({This, portion}, undefined),
    ok.


new(HashMap, PageContext) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, HashMap, PageContext),
    This.

init(This, HashMap, PageContext) ->
    'ModifyTable':init(This),
    init_fields(This),
        put({This, pageContext}, PageContext),
        put({This, request}, (get({PageContext, '$class'})):getRequest(PageContext)),
        put({This, weblisketSession}, 'WeblisketSession':new(HashMap, PageContext)),
        put({This, portion}, 'Portion':new(HashMap)),
        (get({This, '$class'})):getFormData(This).

% throws Exception
getFormData(This) ->
        put({This, storeName}, (get({get({This, weblisketSession}), '$class'})):getStoreName(get({This, weblisketSession}))),
        put({This, modifyingStoreFrontInterface}, 'StoreFront':new(get({This, request}))).

update(This) ->
        try
            Success = "Updated Successfully",
            HashMapData = (get({get({This, modifyingStoreFrontInterface}), '$class'})):toHashMap(get({This, modifyingStoreFrontInterface})),
            (fun(Target_N67182) -> (get({Target_N67182, '$class'})):update(Target_N67182, HashMapData) end)((fun(Target_N67189) -> (get({Target_N67189, '$class'})):getStoreFrontsEntityInstance(Target_N67189) end)('StoreFrontsEntityFactory':getInstance())),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGS'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), Success, This, "update()");
                false -> ok
            end,
            Success
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            Error = "Failed to update storefronts table",
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "update()", E);
                false -> ok
            end,
            Error
        end.

% throws Exception
sendStoreCreatedEmails(This) ->
        StoreManagerEmailSubject = lists:concat(["Store Manager Nofification For Store: ", (get({get({This, modifyingStoreFrontInterface}), '$class'})):getName(get({This, modifyingStoreFrontInterface}))]),
        AdminEmailSubject = lists:concat(["Admin Notification For Store: ", (get({get({This, modifyingStoreFrontInterface}), '$class'})):getName(get({This, modifyingStoreFrontInterface}))]),
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "Store Created: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, modifyingStoreFrontInterface}), '$class'})):getName(get({This, modifyingStoreFrontInterface}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, "\n\n"),
        (get({StringBuffer, '$class'})):append(StringBuffer, "Click here for the Admin Interface:\n"),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, modifyingStoreFrontInterface}), '$class'})):getCurrentHomeHostName(get({This, modifyingStoreFrontInterface}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, "/admin/login.jsp\n\n"),
        (get({StringBuffer, '$class'})):append(StringBuffer, "Goto Your Store:\n"),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, modifyingStoreFrontInterface}), '$class'})):getCurrentHomeHostName(get({This, modifyingStoreFrontInterface}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, modifyingStoreFrontInterface}), '$class'})):getName(get({This, modifyingStoreFrontInterface}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, "/index.jsp"),
        (get({StringBuffer, '$class'})):append(StringBuffer, "\n\n"),
        (get({StringBuffer, '$class'})):append(StringBuffer, "UserName: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, weblisketSession}), '$class'})):getUserName(get({This, weblisketSession}))),
        AdminEmailTextBody = (get({StringBuffer, '$class'})):toString(StringBuffer),
        AdminBasicEmailInfo = 'AdminEmailInfo':new(AdminEmailSubject, AdminEmailTextBody),
        StoreAdminBasicEmailInfo = 'StoreEmailInfo':new(get({This, modifyingStoreFrontInterface}), StoreManagerEmailSubject, AdminEmailTextBody),
        StoreAdminEmailInfo = 'EmailInfo':new(StoreAdminBasicEmailInfo),
        AdminEmailInfo = 'EmailInfo':new(AdminBasicEmailInfo),
        AdminUserEmailEventHandler = (fun(Target_N68674) -> (get({Target_N68674, '$class'})):getInstance(Target_N68674, get({This, abeClientInformation}), get({'UserEmailEventNameData', 'STORECREATED'})) end)('AdminUserEmailEventHandlerSingletons':getInstance()),
        StoreAdminUserEmailEventHandler = (fun(Target_N68759) -> (get({Target_N68759, '$class'})):getInstance(Target_N68759, get({'UserEmailEventNameData', 'STORECREATED'}), get({This, abeClientInformation}), get({This, modifyingStoreFrontInterface})) end)('StoreAdminUserEmailEventHandlerSingletons':getInstance()),
        (get({StoreAdminUserEmailEventHandler, '$class'})):receiveEmailInfo(StoreAdminUserEmailEventHandler, get({'UserEmailEventNameData', 'STORECREATED'}), StoreAdminEmailInfo),
        (get({AdminUserEmailEventHandler, '$class'})):receiveEmailInfo(AdminUserEmailEventHandler, get({'UserEmailEventNameData', 'STORECREATED'}), AdminEmailInfo).

install(This) ->
        try
            StringBuffer = 'StringMaker':new(),
            (get({StringBuffer, '$class'})):append(StringBuffer, "Intall StoreFront Successfully: "),
            (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc((fun(Target_N69064) -> (get({Target_N69064, '$class'})):intValue(Target_N69064) end)((get({get({This, portion}), '$class'})):getCurrent(get({This, portion}))))),
            (get({StringBuffer, '$class'})):append(StringBuffer, " of "),
            (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc((fun(Target_N69141) -> (get({Target_N69141, '$class'})):intValue(Target_N69141) end)((get({get({This, portion}), '$class'})):getTotal(get({This, portion}))))),
            Success = (get({StringBuffer, '$class'})):toString(StringBuffer),
            (get({get({This, modifyingStoreFrontInterface}), '$class'})):install(get({This, modifyingStoreFrontInterface}), (fun(Target_N69237) -> (get({Target_N69237, '$class'})):intValue(Target_N69237) end)((get({get({This, portion}), '$class'})):getCurrent(get({This, portion}))), (fun(Target_N69264) -> (get({Target_N69264, '$class'})):intValue(Target_N69264) end)((get({get({This, portion}), '$class'})):getTotal(get({This, portion})))),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGS'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), Success, This, "install()");
                false -> ok
            end,
            Success
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            Error = "Failed to Install storefront",
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "install()", E);
                false -> ok
            end,
            Error
        end.

insert(This) ->
        try
            Success = "Added Successfully",
            Values = (get({get({This, modifyingStoreFrontInterface}), '$class'})):toVector(get({This, modifyingStoreFrontInterface})),
            (fun(Target_N69954) -> (get({Target_N69954, '$class'})):insert(Target_N69954, Values) end)((fun(Target_N69961) -> (get({Target_N69961, '$class'})):getStoreFrontsEntityInstance(Target_N69961) end)('StoreFrontsEntityFactory':getInstance())),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGS'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), Success, This, "insert()");
                false -> ok
            end,
            Success
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            Error = "Failed to add storefront",
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "insert()", E);
                false -> ok
            end,
            Error
        end.

delete(This) ->
        try
            Success = "Delete Successfully",
            (fun(Target_N70612) -> (get({Target_N70612, '$class'})):delete(Target_N70612, get({This, storeName})) end)((fun(Target_N70619) -> (get({Target_N70619, '$class'})):getStoreFrontsEntityInstance(Target_N70619) end)('StoreFrontsEntityFactory':getInstance())),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGS'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), Success, This, "delete()");
                false -> ok
            end,
            Success
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            Error = "Failed to delete storefronts table",
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "delete()", E);
                false -> ok
            end,
            Error
        end.

