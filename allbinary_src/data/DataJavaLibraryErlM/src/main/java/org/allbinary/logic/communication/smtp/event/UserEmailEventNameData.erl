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
% package org.allbinary.logic.communication.smtp.event
% import java.util.HashMap
% import org.allbinary.business.user.commerce.inventory.order.OrderHistoryData
% import org.allbinary.logic.StdUtil

-module('UserEmailEventNameData').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, userNameEvenNameHashMap}, (fun(Target_N65702) -> (get({Target_N65702, '$class'})):createHashMap(Target_N65702) end)('StdUtil':getInstance())),
    put({?MODULE, nextId}, 0),
    put({?MODULE, 'INSTALLER'}, 'UserEmailEventNameData':new("Installer")),
    put({?MODULE, 'EXCEPTION'}, 'UserEmailEventNameData':new("Exception")),
    put({?MODULE, 'LOGGEDEXCEPTION'}, 'UserEmailEventNameData':new("Logged Exception")),
    put({?MODULE, 'ERROR'}, 'UserEmailEventNameData':new("Error")),
    put({?MODULE, 'OUTOFMEMORY'}, 'UserEmailEventNameData':new("Out Of Memory Error")),
    put({?MODULE, 'ADMINGENERATINGSTATICPAGES'}, 'UserEmailEventNameData':new("Admin Generating Static Pages")),
    put({?MODULE, 'STOREERROROCCURRED'}, 'UserEmailEventNameData':new("Store Error Occurred")),
    put({?MODULE, 'STOREOUTOFMEMORY'}, 'UserEmailEventNameData':new("Store Out Of Memory Error")),
    put({?MODULE, 'STORECREATED'}, 'UserEmailEventNameData':new("Store Created")),
    put({?MODULE, 'STOREOPENED'}, 'UserEmailEventNameData':new("Store Opened")),
    put({?MODULE, 'STORECLOSED'}, 'UserEmailEventNameData':new("Store Closed")),
    put({?MODULE, 'STOREGENERATINGSTATICPAGES'}, 'UserEmailEventNameData':new("Store Generating Static Pages")),
    put({?MODULE, 'PRODUCTISOUT'}, 'UserEmailEventNameData':new("Product Is Out")),
    put({?MODULE, 'PRODUCTISAVAILABLE'}, 'UserEmailEventNameData':new("Product Is Available")),
    put({?MODULE, 'PRODUCTISOLD'}, 'UserEmailEventNameData':new("Product Is Old")),
    put({?MODULE, 'PRODUCTISONSALE'}, 'UserEmailEventNameData':new("Product Is On Sale")),
    put({?MODULE, 'PRODUCTSALEISOVER'}, 'UserEmailEventNameData':new("Product Sale Is Over")),
    put({?MODULE, 'ORDERPREPROCESSING'}, 'UserEmailEventNameData':new(get({'OrderHistoryData', 'PREPROCESSING'}))),
    put({?MODULE, 'ORDERPROCESSING'}, 'UserEmailEventNameData':new(get({'OrderHistoryData', 'PROCESSING'}))),
    put({?MODULE, 'ORDERCANCELLED'}, 'UserEmailEventNameData':new(get({'OrderHistoryData', 'CANCELLED'}))),
    put({?MODULE, 'ORDERPARTIALLYSHIPPED'}, 'UserEmailEventNameData':new(get({'OrderHistoryData', 'PARTIALLYSHIPPED'}))),
    put({?MODULE, 'ORDERSHIPPED'}, 'UserEmailEventNameData':new(get({'OrderHistoryData', 'SHIPPED'}))),
    put({?MODULE, 'QUOTEREQUEST'}, 'UserEmailEventNameData':new("Quote Request")),
    put({?MODULE, 'NEWPASSWORD'}, 'UserEmailEventNameData':new("New Password")),
    ok.

init_fields(This) ->
    put({This, eventNameId}, 0),
    put({This, eventHandlerName}, undefined),
    ok.


new(EventHandlerName) when (is_list(EventHandlerName) orelse EventHandlerName =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, EventHandlerName),
    This.

init(This, EventHandlerName) when (is_list(EventHandlerName) orelse EventHandlerName =:= undefined) ->
    init_fields(This),
        put({This, eventHandlerName}, EventHandlerName),
        (get({This, '$class'})):initNextId(This),
        (get({get({'UserEmailEventNameData', userNameEvenNameHashMap}), '$class'})):put(get({'UserEmailEventNameData', userNameEvenNameHashMap}), get({This, eventHandlerName}), This).

initNextId(This) ->
        put({This, eventNameId}, get({'UserEmailEventNameData', nextId})),
        put({'UserEmailEventNameData', nextId}, get({'UserEmailEventNameData', nextId}) + 1).

isEvent(This, UserEmailEventNameString) when (is_list(UserEmailEventNameString) orelse UserEmailEventNameString =:= undefined) ->
        (get({get({'UserEmailEventNameData', userNameEvenNameHashMap}), '$class'})):containsKey(get({'UserEmailEventNameData', userNameEvenNameHashMap}), UserEmailEventNameString).

% throws Exception
getInstance(UserEmailEventNameString) when (is_list(UserEmailEventNameString) orelse UserEmailEventNameString =:= undefined) ->
        try
        UserEmailEventNameData = (get({get({'UserEmailEventNameData', userNameEvenNameHashMap}), '$class'})):get(get({'UserEmailEventNameData', userNameEvenNameHashMap}), UserEmailEventNameString),
        case (UserEmailEventNameData =:= undefined) of
            true ->
            erlang:error({'Exception'});
            false ->
            throw({'$return', UserEmailEventNameData})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

toString(This) ->
        get({This, eventHandlerName}).

