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
% package org.allbinary.business.user.commerce.inventory.order.status
% import org.allbinary.business.context.modules.storefront.StoreFrontFactory
% import org.allbinary.business.context.modules.storefront.StoreFrontInterface
% import org.allbinary.business.user.UserInterface
% import org.allbinary.business.user.commerce.inventory.order.OrderHistory
% import org.allbinary.data.tables.user.UserEntityFactory
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.smtp.event.UserEmailEventNameData
% import org.allbinary.logic.communication.smtp.event.handler.UserEmailEventHandler
% import org.allbinary.logic.communication.smtp.event.handler.factory.AdminUserEmailEventHandlerSingletons
% import org.allbinary.logic.communication.smtp.event.handler.factory.StoreAdminUserEmailEventHandlerSingletons
% import org.allbinary.logic.communication.smtp.event.handler.factory.UserEmailEventHandlerSingletons
% import org.allbinary.logic.communication.smtp.info.AdminEmailInfo
% import org.allbinary.logic.communication.smtp.info.BasicEmailInfo
% import org.allbinary.logic.communication.smtp.info.EmailInfo
% import org.allbinary.logic.communication.smtp.info.StoreEmailInfo
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.string.CommonStrings

-module('OrderStatusEmail').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, abeClientInformation}, undefined),
    put({This, orderHistory}, undefined),
    put({This, storeFrontInterface}, undefined),
    put({This, user}, undefined),
    ok.


new(AbeClientInformation, OrderHistory) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, AbeClientInformation, OrderHistory),
    This.

init(This, AbeClientInformation, OrderHistory) ->
    init_fields(This),
        put({This, abeClientInformation}, AbeClientInformation),
        put({This, orderHistory}, OrderHistory),
        StoreName = (get({OrderHistory, '$class'})):getStoreName(OrderHistory),
        put({This, storeFrontInterface}, 'StoreFrontFactory':getInstance(StoreName)),
        put({This, user}, (fun(Target_N66684) -> (get({Target_N66684, '$class'})):getUser(Target_N66684, (get({OrderHistory, '$class'})):getUserName(OrderHistory)) end)('UserEntityFactory':getInstance())).

% throws Exception
process(This) ->
        (get({This, '$class'})):notifyStoreAdmin(This),
        (get({This, '$class'})):notifyUser(This).

% throws Exception
notifyStoreAdmin(This) ->
        try
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'EMAILLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Order Email", This, "emailStoreAdmin");
                false -> ok
            end,
            AdminEmailSubject = lists:concat([lists:concat(["Order ", (get({get({This, orderHistory}), '$class'})):getStatus(get({This, orderHistory}))]), " Attempt"]),
            AdminEmailTextBody = lists:concat([lists:concat([lists:concat(["Order attempt: ", (get({get({This, orderHistory}), '$class'})):getId(get({This, orderHistory}))]), " Preprocessing by: "]), (get({get({This, user}), '$class'})):getUserName(get({This, user}))]),
            AdminBasicEmailInfo = 'AdminEmailInfo':new(AdminEmailSubject, AdminEmailTextBody),
            StoreAdminBasicEmailInfo = 'StoreEmailInfo':new(get({This, storeFrontInterface}), AdminEmailSubject, AdminEmailTextBody),
            StoreAdminEmailInfo = 'EmailInfo':new(StoreAdminBasicEmailInfo),
            AdminEmailInfo = 'EmailInfo':new(AdminBasicEmailInfo),
            UserEmailEventNameData = 'UserEmailEventNameData':getInstance((get({get({This, orderHistory}), '$class'})):getStatus(get({This, orderHistory}))),
            AdminUserEmailEventHandler = (fun(Target_N67581) -> (get({Target_N67581, '$class'})):getInstance(Target_N67581, get({This, abeClientInformation}), UserEmailEventNameData) end)('AdminUserEmailEventHandlerSingletons':getInstance()),
            StoreAdminUserEmailEventHandler = (fun(Target_N67658) -> (get({Target_N67658, '$class'})):getInstance(Target_N67658, UserEmailEventNameData, get({This, abeClientInformation}), get({This, storeFrontInterface})) end)('StoreAdminUserEmailEventHandlerSingletons':getInstance()),
            (get({StoreAdminUserEmailEventHandler, '$class'})):receiveEmailInfo(StoreAdminUserEmailEventHandler, UserEmailEventNameData, StoreAdminEmailInfo),
            (get({AdminUserEmailEventHandler, '$class'})):receiveEmailInfo(AdminUserEmailEventHandler, UserEmailEventNameData, AdminEmailInfo)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'EMAILLOGGINGERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "emailAdmin", E);
                false -> ok
            end
        end.

% throws Exception
notifyUser(This) ->
        try
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'EMAILLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Email User", This, "notifyUser()");
                false -> ok
            end,
            Subject = lists:concat([lists:concat(["Order ", (get({get({This, orderHistory}), '$class'})):getStatus(get({This, orderHistory}))]), " Attempt"]),
            TextBody = lists:concat([lists:concat([lists:concat(["Order attempt: ", (get({get({This, orderHistory}), '$class'})):getId(get({This, orderHistory}))]), " Preprocessing by: "]), (get({get({This, user}), '$class'})):getUserName(get({This, user}))]),
            BasicEmailInfo = 'StoreEmailInfo':new(get({This, storeFrontInterface}), Subject, TextBody),
            EmailInfo = 'EmailInfo':new(BasicEmailInfo),
            UserEmailEventNameData = 'UserEmailEventNameData':getInstance((get({get({This, orderHistory}), '$class'})):getStatus(get({This, orderHistory}))),
            UserEmailEventHandler = (fun(Target_N68691) -> (get({Target_N68691, '$class'})):getInstance(Target_N68691, get({This, abeClientInformation}), UserEmailEventNameData, get({This, user})) end)('UserEmailEventHandlerSingletons':getInstance()),
            (get({UserEmailEventHandler, '$class'})):receiveEmailInfo(UserEmailEventHandler, UserEmailEventNameData, EmailInfo)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'EMAILLOGGINGERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "notifyUser", E);
                false -> ok
            end,
            erlang:error(E)
        end.

