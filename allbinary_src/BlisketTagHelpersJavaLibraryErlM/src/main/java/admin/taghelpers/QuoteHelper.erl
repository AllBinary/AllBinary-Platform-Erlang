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
% import javax.servlet.jsp.PageContext
% import org.allbinary.business.context.modules.storefront.StoreFront
% import org.allbinary.business.context.modules.storefront.StoreFrontData
% import org.allbinary.business.context.modules.storefront.StoreFrontFactory
% import org.allbinary.business.context.modules.storefront.StoreFrontInterface
% import org.allbinary.business.installer.Portion
% import org.allbinary.business.user.UserInterface
% import org.allbinary.business.user.quoterequest.QuoteRequest
% import org.allbinary.data.tables.user.UserEntityFactory
% import org.allbinary.data.tables.user.quoterequest.QuoteRequestEntity
% import org.allbinary.data.tables.user.quoterequest.QuoteRequestEntityFactory
% import org.allbinary.logic.communication.http.request.session.WeblisketSession
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.smtp.event.UserEmailEventNameData
% import org.allbinary.logic.communication.smtp.event.handler.UserEmailEventHandler
% import org.allbinary.logic.communication.smtp.event.handler.factory.AdminUserEmailEventHandlerSingletons
% import org.allbinary.logic.communication.smtp.event.handler.factory.StoreAdminUserEmailEventHandlerSingletons
% import org.allbinary.logic.communication.smtp.event.handler.factory.UserEmailEventHandlerSingletons
% import org.allbinary.logic.communication.smtp.info.BasicEmailInfo
% import org.allbinary.logic.communication.smtp.info.EmailInfo
% import org.allbinary.logic.communication.smtp.info.StoreEmailInfo
% import org.allbinary.logic.communication.sql.AbSqlTableUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory

-module('QuoteHelper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicTable', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, abeClientInformation}, 'ServiceClientInformationInterfaceFactory':getInstance()),
    put({This, weblisketSession}, undefined),
    put({This, storeFrontInterface}, undefined),
    put({This, portion}, undefined),
    ok.


new(HashMap, PageContext) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, HashMap, PageContext),
    This.

'$init'(This, HashMap, PageContext) ->
    'BasicTable':'$init'(This),
    init_fields(This),
        StoreName = (get({HashMap, '$class'})):get(HashMap, get({'StoreFrontData':getInstance(), 'NAME'})),
        case (StoreName =/= undefined) of
            true ->
            put({This, storeFrontInterface}, 'StoreFrontFactory':getInstance(StoreName));
            false ->
            put({This, storeFrontInterface}, 'StoreFront':new())
        end,
        put({This, weblisketSession}, 'WeblisketSession':new(HashMap, PageContext)),
        put({This, portion}, 'Portion':new(HashMap)).

% throws Exception
emailUser(This, QuoteRequest) ->
        User = (fun(Target_N67198) -> (get({Target_N67198, '$class'})):getUser(Target_N67198, (get({QuoteRequest, '$class'})):getUserName(QuoteRequest)) end)('UserEntityFactory':getInstance()),
        UserEmailSubject = "Quote Request Receipt",
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "This is just a verification email. "),
        (get({StringBuffer, '$class'})):append(StringBuffer, "We usually respond to quote request within 24 hours."),
        (get({StringBuffer, '$class'})):append(StringBuffer, "\n\nThank You For Your Business."),
        UserEmailTextBody = (get({StringBuffer, '$class'})):toString(StringBuffer),
        BasicEmailInfo = 'StoreEmailInfo':new(get({This, storeFrontInterface}), UserEmailSubject, UserEmailTextBody),
        EmailInfo = 'EmailInfo':new(BasicEmailInfo),
        UserEmailEventHandler = (fun(Target_N67593) -> (get({Target_N67593, '$class'})):getInstance(Target_N67593, get({This, abeClientInformation}), get({'UserEmailEventNameData', 'QUOTEREQUEST'}), User) end)('UserEmailEventHandlerSingletons':getInstance()),
        (get({UserEmailEventHandler, '$class'})):receiveEmailInfo(UserEmailEventHandler, get({'UserEmailEventNameData', 'QUOTEREQUEST'}), EmailInfo).

% throws Exception
emailAdmins(This, QuoteRequest) ->
        AdminEmailSubject = "Quote Request",
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "\nUserName: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({QuoteRequest, '$class'})):getUserName(QuoteRequest)),
        (get({StringBuffer, '$class'})):append(StringBuffer, "\nProject Info: \n"),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({QuoteRequest, '$class'})):getProjectInfo(QuoteRequest)),
        (get({StringBuffer, '$class'})):append(StringBuffer, "\nUser Comments: \n"),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({QuoteRequest, '$class'})):getUserComments(QuoteRequest)),
        (get({StringBuffer, '$class'})):append(StringBuffer, "\nBudget: \n"),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({QuoteRequest, '$class'})):getBudget(QuoteRequest)),
        (get({StringBuffer, '$class'})):append(StringBuffer, "\nTime Frame: \n"),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({QuoteRequest, '$class'})):getTimeFrame(QuoteRequest)),
        (get({StringBuffer, '$class'})):append(StringBuffer, "\nComments: \n"),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({QuoteRequest, '$class'})):getComments(QuoteRequest)),
        AdminEmailTextBody = (get({StringBuffer, '$class'})):toString(StringBuffer),
        BasicEmailInfo = 'StoreEmailInfo':new(get({This, storeFrontInterface}), AdminEmailSubject, AdminEmailTextBody),
        EmailInfo = 'EmailInfo':new(BasicEmailInfo),
        StoreAdminUserEmailEventHandler = (fun(Target_N68429) -> (get({Target_N68429, '$class'})):getInstance(Target_N68429, get({This, abeClientInformation}), get({'UserEmailEventNameData', 'QUOTEREQUEST'})) end)('AdminUserEmailEventHandlerSingletons':getInstance()),
        AdminUserEmailEventHandler = (fun(Target_N68514) -> (get({Target_N68514, '$class'})):getInstance(Target_N68514, get({'UserEmailEventNameData', 'QUOTEREQUEST'}), get({This, abeClientInformation}), get({This, storeFrontInterface})) end)('StoreAdminUserEmailEventHandlerSingletons':getInstance()),
        (get({StoreAdminUserEmailEventHandler, '$class'})):receiveEmailInfo(StoreAdminUserEmailEventHandler, get({'UserEmailEventNameData', 'QUOTEREQUEST'}), EmailInfo),
        (get({AdminUserEmailEventHandler, '$class'})):receiveEmailInfo(AdminUserEmailEventHandler, get({'UserEmailEventNameData', 'QUOTEREQUEST'}), EmailInfo).

% throws Exception
email(This) ->
        try
        try
            QuoteRequestEntity = (fun(Target_N68771) -> (get({Target_N68771, '$class'})):getQuoteRequestEntityInstance(Target_N68771) end)('QuoteRequestEntityFactory':getInstance()),
            UserName = (get({get({This, weblisketSession}), '$class'})):getUserName(get({This, weblisketSession})),
            Vector = (get({QuoteRequestEntity, '$class'})):getIds(QuoteRequestEntity, UserName),
            put({local, id}, 0),
            Size = (get({Vector, '$class'})):size(Vector),
            lists:foreach(fun(Index) ->
                NextId = (fun(Target_N69021) -> (get({Target_N69021, '$class'})):intValue(Target_N69021) end)(((get({Vector, '$class'})):get(Vector, Index))),
                case (get({local, id}) < NextId) of
                    true ->
                    put({local, id}, NextId);
                    false -> ok
                end
            end, lists:seq(0, Size - 1)),
            QuoteRequest = (get({QuoteRequestEntity, '$class'})):get(QuoteRequestEntity, UserName, get({local, id})),
            case (QuoteRequest =/= undefined) of
                true ->
                (get({This, '$class'})):emailUser(This, QuoteRequest),
                (get({This, '$class'})):emailAdmins(This, QuoteRequest),
                throw({'$return', "Thank You For Your Business.<p/>"});
                false ->
                erlang:error({'Exception', "No Quote Request"})
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'EMAILLOGGINGERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, "email", E);
                false -> ok
            end,
            "Thank You For Your Business.<p>"
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

drop(This) ->
        try
            Success = (fun(Target_N69722) -> (get({Target_N69722, '$class'})):dropTable(Target_N69722) end)((fun(Target_N69729) -> (get({Target_N69729, '$class'})):getQuoteRequestEntityInstance(Target_N69729) end)('QuoteRequestEntityFactory':getInstance())),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGS'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), Success, This, get({get({This, commonStrings}), 'DROP'}));
                false -> ok
            end,
            Success
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            Error = "Failed to drop QuoteRequest table",
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'DROP'}), E);
                false -> ok
            end,
            Error
        end.

create(This) ->
        try
            Success = (fun(Target_N70387) -> (get({Target_N70387, '$class'})):createTable(Target_N70387) end)((fun(Target_N70394) -> (get({Target_N70394, '$class'})):getQuoteRequestEntityInstance(Target_N70394) end)('QuoteRequestEntityFactory':getInstance())),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGS'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), Success, This, "create()");
                false -> ok
            end,
            Success
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            Error = "Failed to create new QuoteRequest table",
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "create()", E);
                false -> ok
            end,
            Error
        end.

restore(This) ->
        try
            Success = "Restore Successful",
            Result = (fun(Target_N71067) -> (get({Target_N71067, '$class'})):restoreTable(Target_N71067, (fun(Target_N71092) -> (get({Target_N71092, '$class'})):getQuoteRequestEntityInstance(Target_N71092) end)('QuoteRequestEntityFactory':getInstance()), get({This, portion})) end)('AbSqlTableUtil':getInstance()),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGS'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), Success, This, "restore()");
                false -> ok
            end,
            Result
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            Error = "Failed to restore backup",
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "restore()", E);
                false -> ok
            end,
            Error
        end.

backup(This) ->
        try
            Success = "Restore Successful",
            Result = (fun(Target_N71774) -> (get({Target_N71774, '$class'})):backupTable(Target_N71774, (fun(Target_N71799) -> (get({Target_N71799, '$class'})):getQuoteRequestEntityInstance(Target_N71799) end)('QuoteRequestEntityFactory':getInstance())) end)('AbSqlTableUtil':getInstance()),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGS'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), Success, This, "backup()");
                false -> ok
            end,
            Result
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            Error = "Failed to make backup",
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "backup()", E);
                false -> ok
            end,
            Error
        end.

