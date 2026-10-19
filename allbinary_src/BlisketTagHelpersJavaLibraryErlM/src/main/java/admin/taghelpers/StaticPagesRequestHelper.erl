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
% import javax.servlet.http.HttpServletRequest
% import javax.servlet.jsp.PageContext
% import org.allbinary.business.context.AbContext
% import org.allbinary.business.context.modules.storefront.StoreFrontData
% import org.allbinary.business.context.modules.storefront.StoreFrontFactory
% import org.allbinary.business.context.modules.storefront.StoreFrontInterface
% import org.allbinary.globals.URLGLOBALS
% import org.allbinary.logic.communication.http.AcceptableResponseGenerator
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.smtp.event.UserEmailEventNameData
% import org.allbinary.logic.communication.smtp.event.handler.UserEmailEventHandler
% import org.allbinary.logic.communication.smtp.event.handler.factory.AdminUserEmailEventHandlerSingletons
% import org.allbinary.logic.communication.smtp.event.handler.factory.StoreAdminUserEmailEventHandlerSingletons
% import org.allbinary.logic.communication.smtp.info.AdminEmailInfo
% import org.allbinary.logic.communication.smtp.info.BasicEmailInfo
% import org.allbinary.logic.communication.smtp.info.EmailInfo
% import org.allbinary.logic.communication.smtp.info.StoreEmailInfo
% import org.allbinary.logic.control.search.SearchParams
% import org.allbinary.logic.control.search.SearchRequest
% import org.allbinary.logic.io.file.FileUtil
% import org.allbinary.logic.io.path.AbPath
% import org.allbinary.logic.io.path.AbPathData
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory
% import org.allbinary.logic.visual.transform.info.TransformInfoData
% import views.admin.inventory.listings.ProductListingFactory

-module('StaticPagesRequestHelper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements TagHelperInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('AbContext', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, abeClientInformation}, 'ServiceClientInformationInterfaceFactory':getInstance()),
    put({This, request}, undefined),
    put({This, storeName}, undefined),
    put({This, searchParams}, undefined),
    put({This, xslFile}, undefined),
    ok.


new(PropertiesHashMap, PageContext) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, PropertiesHashMap, PageContext),
    This.

init(This, PropertiesHashMap, PageContext) ->
        'AbContext':init(This, PropertiesHashMap, PageContext),
        init_fields(This),
        put({This, request}, (get({PageContext, '$class'})):getRequest(PageContext)),
        put({This, xslFile}, (get({PropertiesHashMap, '$class'})):get(PropertiesHashMap, get({'TransformInfoData':getInstance(), 'TEMPLATEFILENAME'}))),
        (get({This, '$class'})):getFormData(This).

getFormData(This) ->
        put({This, storeName}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'StoreFrontData':getInstance(), 'NAME'}))),
        put({This, searchParams}, 'SearchParams':new(get({This, request}))).

% throws Exception
email(This) ->
        try
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'EMAILLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Generated Static Pages Notification Email", This, "email");
                false -> ok
            end,
            StoreFrontInterface = 'StoreFrontFactory':getInstance(get({This, storeName})),
            AdminEmailSubject = "Generated Static Pages Email Notification",
            AdminEmailTextBody = lists:concat(["Generated static pages for store: ", get({This, storeName})]),
            AdminBasicEmailInfo = 'AdminEmailInfo':new(AdminEmailSubject, AdminEmailTextBody),
            StoreAdminBasicEmailInfo = 'StoreEmailInfo':new(StoreFrontInterface, AdminEmailSubject, AdminEmailTextBody),
            StoreAdminEmailInfo = 'EmailInfo':new(StoreAdminBasicEmailInfo),
            AdminEmailInfo = 'EmailInfo':new(AdminBasicEmailInfo),
            AdminUserEmailEventHandler = (fun(Target_N67813) -> (get({Target_N67813, '$class'})):getInstance(Target_N67813, get({This, abeClientInformation}), get({'UserEmailEventNameData', 'STOREGENERATINGSTATICPAGES'})) end)('AdminUserEmailEventHandlerSingletons':getInstance()),
            StoreAdminUserEmailEventHandler = (fun(Target_N67898) -> (get({Target_N67898, '$class'})):getInstance(Target_N67898, get({'UserEmailEventNameData', 'STOREGENERATINGSTATICPAGES'}), get({This, abeClientInformation}), StoreFrontInterface) end)('StoreAdminUserEmailEventHandlerSingletons':getInstance()),
            (get({StoreAdminUserEmailEventHandler, '$class'})):receiveEmailInfo(StoreAdminUserEmailEventHandler, get({'UserEmailEventNameData', 'STOREGENERATINGSTATICPAGES'}), StoreAdminEmailInfo),
            (get({AdminUserEmailEventHandler, '$class'})):receiveEmailInfo(AdminUserEmailEventHandler, get({'UserEmailEventNameData', 'STOREGENERATINGSTATICPAGES'}), AdminEmailInfo)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'EMAILLOGGINGERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, "email", E);
                false -> ok
            end
        end.

generateStaticPages(This) ->
        try
            ContentType = (fun(Target_N68393) -> (get({Target_N68393, '$class'})):get(Target_N68393, get({This, request})) end)('AcceptableResponseGenerator':getInstance()),
            SearchRequest = 'SearchRequest':new(undefined, get({This, searchParams}), get({This, xslFile}), ContentType, (get({This, '$class'})):getPropertiesHashMap(This), (get({This, '$class'})):getPageContext(This)),
            Success = (fun(Target_N68559) -> (get({Target_N68559, '$class'})):generateAll(Target_N68559, get({This, storeName})) end)('ProductListingFactory':getInstance(SearchRequest)),
            (get({This, '$class'})):email(This),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGS'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), Success, This, "generateStaticPages()");
                false -> ok
            end,
            Success
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            Error = "Failed to generate staticpages table",
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "generateStaticPages()", E);
                false -> ok
            end,
            Error
        end.

makePublic(This) ->
        try
            StoreFrontInterface = 'StoreFrontFactory':getInstance(get({This, storeName})),
            FromAbPath = 'AbPath':new(((get({StoreFrontInterface, '$class'})):getTestHtmlPath(StoreFrontInterface) + (get({StoreFrontInterface, '$class'})):getStaticPath(StoreFrontInterface)), get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
            ToAbPath = 'AbPath':new(lists:concat([lists:concat([lists:concat([(get({get({'StaticPagesRequestHelper', 'URLGLOBALS'}), '$class'})):getWebappPath(get({'StaticPagesRequestHelper', 'URLGLOBALS'})), (get({StoreFrontInterface, '$class'})):getName(StoreFrontInterface)]), get({'AbPathData':getInstance(), 'SEPARATOR'})]), (get({StoreFrontInterface, '$class'})):getStaticPath(StoreFrontInterface)]), get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
            (fun(Target_N69531) -> (get({Target_N69531, '$class'})):copy(Target_N69531, FromAbPath, ToAbPath) end)('FileUtil':getInstance()),
            Success = "Made Public",
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGS'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), Success, This, "makePublic()");
                false -> ok
            end,
            Success
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            Error = "Failed to makePublic",
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "makePublic()", E);
                false -> ok
            end,
            Error
        end.

