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
% import org.allbinary.business.context.modules.storefront.StoreFrontData
% import org.allbinary.business.context.modules.storefront.StoreFrontFactory
% import org.allbinary.business.context.modules.storefront.StoreFrontInterface
% import org.allbinary.business.user.quoterequest.QuoteRequest
% import org.allbinary.data.tables.user.quoterequest.QuoteRequestEntityFactory
% import org.allbinary.logic.communication.http.request.session.WeblisketSession
% import org.allbinary.logic.communication.log.LogUtil

-module('QuoteRequestHelper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ModifyTable', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, weblisketSession}, undefined),
    put({This, storeFrontInterface}, undefined),
    put({This, quoteRequest}, undefined),
    ok.


new(HashMap, PageContext) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, HashMap, PageContext),
    This.

'$init'(This, HashMap, PageContext) ->
    'ModifyTable':'$init'(This),
    init_fields(This),
        Request = (get({PageContext, '$class'})):getRequest(PageContext),
        put({This, weblisketSession}, 'WeblisketSession':new(HashMap, PageContext)),
        put({This, quoteRequest}, 'QuoteRequest':new((get({get({This, weblisketSession}), '$class'})):getUserName(get({This, weblisketSession})), Request)),
        StoreName = (get({HashMap, '$class'})):get(HashMap, get({'StoreFrontData':getInstance(), 'NAME'})),
        case (StoreName =/= undefined) of
            true ->
            put({This, storeFrontInterface}, 'StoreFrontFactory':getInstance(StoreName));
            false -> ok
        end.

isValid(This) ->
        (get({get({This, quoteRequest}), '$class'})):isValid(get({This, quoteRequest})).

validationInfo(This) ->
        (get({get({This, quoteRequest}), '$class'})):validationInfo(get({This, quoteRequest})).

insert(This) ->
        try
            Values = (get({get({This, quoteRequest}), '$class'})):toVector(get({This, quoteRequest})),
            (fun(Target_N66692) -> (get({Target_N66692, '$class'})):insert(Target_N66692, Values) end)((fun(Target_N66699) -> (get({Target_N66699, '$class'})):getQuoteRequestEntityInstance(Target_N66699) end)('QuoteRequestEntityFactory':getInstance())),
            Success = "New QuoteRequest Successfully added to the QuoteRequest Table",
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGS'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), Success, This, "add()");
                false -> ok
            end,
            Success
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            Error = "Failed to add QuoteRequest",
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "add()", E);
                false -> ok
            end,
            Error
        end.

update(This) ->
        try
            Values = (get({get({This, quoteRequest}), '$class'})):toHashMap(get({This, quoteRequest})),
            (fun(Target_N67392) -> (get({Target_N67392, '$class'})):update(Target_N67392, (get({get({This, quoteRequest}), '$class'})):getUserName(get({This, quoteRequest})), Values) end)((fun(Target_N67399) -> (get({Target_N67399, '$class'})):getQuoteRequestEntityInstance(Target_N67399) end)('QuoteRequestEntityFactory':getInstance())),
            Success = "New QuoteRequest Successfully updated",
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGS'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), Success, This, "update()");
                false -> ok
            end,
            Success
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            Error = "Failed to update QuoteRequest",
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "update()", E);
                false -> ok
            end,
            Error
        end.

delete(This) ->
        get({get({This, commonStrings}), 'NOT_IMPLEMENTED'}).

