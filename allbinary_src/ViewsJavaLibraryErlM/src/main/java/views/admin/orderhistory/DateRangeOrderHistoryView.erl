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
% package views.admin.orderhistory
% import java.util.Calendar
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import javax.servlet.http.HttpServletRequest
% import org.allbinary.business.user.commerce.inventory.order.OrderData
% import org.allbinary.business.user.commerce.inventory.order.OrderHistory
% import org.allbinary.business.user.commerce.inventory.order.OrderHistoryData
% import org.allbinary.data.tables.user.commerce.inventory.order.OrderHistoryEntityFactory
% import org.allbinary.data.tree.dom.DomNodeInterface
% import org.allbinary.data.tree.dom.ModDomHelper
% import org.allbinary.globals.GLOBALS2
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.control.validate.ValidationComponentInterface
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.string.StringValidationUtil
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.allbinary.time.TimeUtil
% import org.w3c.dom.Document
% import org.w3c.dom.Node
% import views.business.context.modules.storefront.HttpStoreComponentView

-module('DateRangeOrderHistoryView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ValidationComponentInterface
% implements DomNodeInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('HttpStoreComponentView', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, 'VIEWALLORDERS'}, "View All"),
    put({This, 'VIEWORDERSINLASTHOUR'}, "Last Hour"),
    put({This, 'VIEWORDERSINLASTDAY'}, "Last Day"),
    put({This, 'VIEWORDERSINLASTWEEK'}, "Last Week"),
    put({This, 'VIEWORDERSINLAST30DAYS'}, "30 Days"),
    put({This, request}, undefined),
    put({This, shipped}, undefined),
    put({This, partiallyShipped}, undefined),
    put({This, processing}, undefined),
    put({This, preprocessing}, undefined),
    put({This, cancelled}, undefined),
    put({This, dateType}, undefined),
    put({This, toDate}, undefined),
    put({This, fromDate}, undefined),
    put({This, fromYear}, undefined),
    put({This, fromMonth}, undefined),
    put({This, fromDay}, undefined),
    put({This, fromHour}, undefined),
    put({This, toYear}, undefined),
    put({This, toMonth}, undefined),
    put({This, toDay}, undefined),
    put({This, toHour}, undefined),
    put({This, command}, undefined),
    put({This, 'ON'}, "on"),
    put({This, 'MAXLEN'}, 15),
    ok.


new(TransformInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, TransformInfoInterface),
    This.

'$init'(This, TransformInfoInterface) ->
        'HttpStoreComponentView':'$init'(This, TransformInfoInterface),
        init_fields(This),
        put({This, request}, (fun(Target_N67198) -> (get({Target_N67198, '$class'})):getRequest(Target_N67198) end)((get({This, '$class'})):getPageContext(This))),
        (get({This, '$class'})):getFormData(This).

getFormData(This) ->
        put({This, dateType}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'OrderHistoryData', 'DATETYPE'}))),
        put({This, preprocessing}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'OrderHistoryData', 'PREPROCESSINGNAME'}))),
        put({This, shipped}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'OrderHistoryData', 'SHIPPEDNAME'}))),
        put({This, partiallyShipped}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'OrderHistoryData', 'PARTIALLYSHIPPEDNAME'}))),
        put({This, processing}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'OrderHistoryData', 'PROCESSINGNAME'}))),
        put({This, cancelled}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'OrderHistoryData', 'CANCELLEDNAME'}))),
        put({This, fromYear}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'OrderHistoryData', 'FROMYEAR'}))),
        put({This, fromMonth}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'OrderHistoryData', 'FROMMONTH'}))),
        put({This, fromDay}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'OrderHistoryData', 'FROMDAY'}))),
        put({This, fromHour}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'OrderHistoryData', 'FROMHOUR'}))),
        put({This, toYear}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'OrderHistoryData', 'TOYEAR'}))),
        put({This, toMonth}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'OrderHistoryData', 'TOMONTH'}))),
        put({This, toDay}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'OrderHistoryData', 'TODAY'}))),
        put({This, toHour}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'OrderHistoryData', 'TOHOUR'}))),
        put({This, command}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({get({'DateRangeOrderHistoryView', 'GLOBALS2'}), 'ADMINCOMMAND'}))).

addDomNodeInterfaces(This) ->
        (get({This, '$class'})):addDomNodeInterface(This, This).

% throws Exception
view(This) ->
        try
            (get({This, '$class'})):addDomNodeInterfaces(This),
            'HttpStoreComponentView':view(This)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPERERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "view()", E);
                false -> ok
            end,
            erlang:error(E)
        end.

toXmlNode(This, Document) ->
        try
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                true ->
                StringBuffer = 'StringMaker':new(),
                (get({StringBuffer, '$class'})):append(StringBuffer, "Attempt to View orders in (fromDate="),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({This, fromDate})),
                (get({StringBuffer, '$class'})):append(StringBuffer, ",toDate="),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({This, toDate})),
                (get({StringBuffer, '$class'})):append(StringBuffer, ") and status"),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "view");
                false -> ok
            end,
            Node = (get({Document, '$class'})):createElement(Document, get({'OrderData', 'ORDERS'})),
            case ((get({This, preprocessing}) =/= undefined) andalso ((get({get({This, preprocessing}), '$class'})):compareTo(get({This, preprocessing}), get({This, 'ON'})) =:= 0)) of
                true ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Adding Preprocessing Orders", This, "toXmlNode");
                    false -> ok
                end,
                put({local, orderHistoryVector}, (fun(Target_N69385) -> (get({Target_N69385, '$class'})):getOrders(Target_N69385, get({'OrderHistoryData', 'PREPROCESSING'}), get({This, fromDate}), get({This, toDate})) end)('OrderHistoryEntityFactory':getInstance())),
                put({local, size}, (get({get({local, orderHistoryVector}), '$class'})):size(get({local, orderHistoryVector}))),
                lists:foreach(fun(Index) ->
                    put({local, orderHistory}, (get({get({local, orderHistoryVector}), '$class'})):get(get({local, orderHistoryVector}), Index)),
                    (get({Node, '$class'})):appendChild(Node, (get({get({local, orderHistory}), '$class'})):toXmlNode(get({local, orderHistory}), Document))
                end, lists:seq(0, get({local, size}) - 1));
                false -> ok
            end,
            case ((get({This, shipped}) =/= undefined) andalso ((get({get({This, shipped}), '$class'})):compareTo(get({This, shipped}), get({This, 'ON'})) =:= 0)) of
                true ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Adding Shipped Orders", This, "toXmlNode");
                    false -> ok
                end,
                put({local, orderHistoryVector}, (fun(Target_N69999) -> (get({Target_N69999, '$class'})):getOrders(Target_N69999, get({'OrderHistoryData', 'SHIPPED'}), get({This, fromDate}), get({This, toDate})) end)('OrderHistoryEntityFactory':getInstance())),
                put({local, size}, (get({get({local, orderHistoryVector}), '$class'})):size(get({local, orderHistoryVector}))),
                lists:foreach(fun(Index) ->
                    put({local, orderHistory}, (get({get({local, orderHistoryVector}), '$class'})):get(get({local, orderHistoryVector}), Index)),
                    (get({Node, '$class'})):appendChild(Node, (get({get({local, orderHistory}), '$class'})):toXmlNode(get({local, orderHistory}), Document))
                end, lists:seq(0, get({local, size}) - 1));
                false -> ok
            end,
            case ((get({This, partiallyShipped}) =/= undefined) andalso ((get({get({This, partiallyShipped}), '$class'})):compareTo(get({This, partiallyShipped}), get({This, 'ON'})) =:= 0)) of
                true ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Adding Partially Shipped Orders", This, "toDomNode");
                    false -> ok
                end,
                put({local, orderHistoryVector}, (fun(Target_N70609) -> (get({Target_N70609, '$class'})):getOrders(Target_N70609, get({'OrderHistoryData', 'PARTIALLYSHIPPED'}), get({This, fromDate}), get({This, toDate})) end)('OrderHistoryEntityFactory':getInstance())),
                put({local, size}, (get({get({local, orderHistoryVector}), '$class'})):size(get({local, orderHistoryVector}))),
                lists:foreach(fun(Index) ->
                    put({local, orderHistory}, (get({get({local, orderHistoryVector}), '$class'})):get(get({local, orderHistoryVector}), Index)),
                    (get({Node, '$class'})):appendChild(Node, (get({get({local, orderHistory}), '$class'})):toXmlNode(get({local, orderHistory}), Document))
                end, lists:seq(0, get({local, size}) - 1));
                false -> ok
            end,
            case ((get({This, processing}) =/= undefined) andalso ((get({get({This, processing}), '$class'})):compareTo(get({This, processing}), get({This, 'ON'})) =:= 0)) of
                true ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Adding Processing Orders", This, "toXmlNode");
                    false -> ok
                end,
                put({local, orderHistoryVector}, (fun(Target_N71219) -> (get({Target_N71219, '$class'})):getOrders(Target_N71219, get({'OrderHistoryData', 'PROCESSING'}), get({This, fromDate}), get({This, toDate})) end)('OrderHistoryEntityFactory':getInstance())),
                put({local, size}, (get({get({local, orderHistoryVector}), '$class'})):size(get({local, orderHistoryVector}))),
                lists:foreach(fun(Index) ->
                    put({local, orderHistory}, (get({get({local, orderHistoryVector}), '$class'})):get(get({local, orderHistoryVector}), Index)),
                    (get({Node, '$class'})):appendChild(Node, (get({get({local, orderHistory}), '$class'})):toXmlNode(get({local, orderHistory}), Document))
                end, lists:seq(0, get({local, size}) - 1));
                false -> ok
            end,
            case ((get({This, cancelled}) =/= undefined) andalso ((get({get({This, cancelled}), '$class'})):compareTo(get({This, cancelled}), get({This, 'ON'})) =:= 0)) of
                true ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Adding Cancelled Orders", This, "view");
                    false -> ok
                end,
                put({local, orderHistoryVector}, (fun(Target_N71829) -> (get({Target_N71829, '$class'})):getOrders(Target_N71829, get({'OrderHistoryData', 'CANCELLED'}), get({This, fromDate}), get({This, toDate})) end)('OrderHistoryEntityFactory':getInstance())),
                put({local, size}, (get({get({local, orderHistoryVector}), '$class'})):size(get({local, orderHistoryVector}))),
                lists:foreach(fun(Index) ->
                    put({local, orderHistory}, (get({get({local, orderHistoryVector}), '$class'})):get(get({local, orderHistoryVector}), Index)),
                    (get({Node, '$class'})):appendChild(Node, (get({get({local, orderHistory}), '$class'})):toXmlNode(get({local, orderHistory}), Document))
                end, lists:seq(0, get({local, size}) - 1));
                false -> ok
            end,
            (get({Node, '$class'})):appendChild(Node, 'ModDomHelper':createNameValueNodes(Document, get({'OrderHistoryData', 'PREPROCESSINGNAME'}), get({'OrderHistoryData', 'PREPROCESSING'}))),
            (get({Node, '$class'})):appendChild(Node, 'ModDomHelper':createNameValueNodes(Document, get({'OrderHistoryData', 'PROCESSINGNAME'}), get({'OrderHistoryData', 'PROCESSING'}))),
            (get({Node, '$class'})):appendChild(Node, 'ModDomHelper':createNameValueNodes(Document, get({'OrderHistoryData', 'CANCELLEDNAME'}), get({'OrderHistoryData', 'CANCELLED'}))),
            (get({Node, '$class'})):appendChild(Node, 'ModDomHelper':createNameValueNodes(Document, get({'OrderHistoryData', 'PARTIALLYSHIPPEDNAME'}), get({'OrderHistoryData', 'PARTIALLYSHIPPED'}))),
            (get({Node, '$class'})):appendChild(Node, 'ModDomHelper':createNameValueNodes(Document, get({'OrderHistoryData', 'SHIPPEDNAME'}), get({'OrderHistoryData', 'SHIPPED'}))),
            (get({Node, '$class'})):appendChild(Node, 'ModDomHelper':createNameValueNodes(Document, get({get({'DateRangeOrderHistoryView', 'GLOBALS2'}), 'VIEWNAME'}), get({get({'DateRangeOrderHistoryView', 'GLOBALS2'}), 'VIEW'}))),
            Node
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'XSLLOGGINGERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, "toXmlNode", E);
                false -> ok
            end,
            undefined
        end.

isValid(This) ->
        try
            put({local, isValid}, true),
            case ((get({This, dateType}) =:= undefined) orelse ((((get({get({This, dateType}), '$class'})):compareTo(get({This, dateType}), get({'OrderHistoryData', 'TYPELONG'})) =/= 0) andalso ((get({get({This, dateType}), '$class'})):compareTo(get({This, dateType}), get({'OrderHistoryData', 'TYPECAESAR'})) =/= 0)))) of
                true ->
                put({local, isValid}, false);
                false -> ok
            end,
            case (get({This, dateType}) =/= undefined) of
                true ->
                case ((get({get({This, dateType}), '$class'})):compareTo(get({This, dateType}), get({'OrderHistoryData', 'TYPELONG'})) =:= 0) of
                    true ->
                    put({local, calendar}, 'Calendar':getInstance()),
                    CurrentTime = (get({get({local, calendar}), '$class'})):getTimeInMillis(get({local, calendar})),
                    put({local, rangeDate}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
                    case ((get({get({This, command}), '$class'})):compareTo(get({This, command}), get({This, 'VIEWORDERSINLASTHOUR'})) =:= 0) of
                        true ->
                        OneHour = ((60 * 60) * 1000),
                        put({local, rangeDate}, (get({OneHour, '$class'})):toString(OneHour));
                        false ->
                        case ((get({get({This, command}), '$class'})):compareTo(get({This, command}), get({This, 'VIEWORDERSINLASTDAY'})) =:= 0) of
                        true ->
                        OneDay = (((24 * 60) * 60) * 1000),
                        put({local, rangeDate}, (get({OneDay, '$class'})):toString(OneDay));
                        false ->
                        case ((get({get({This, command}), '$class'})):compareTo(get({This, command}), get({This, 'VIEWORDERSINLASTWEEK'})) =:= 0) of
                        true ->
                        OneWeek = ((((7 * 24) * 60) * 60) * 1000),
                        put({local, rangeDate}, (get({OneWeek, '$class'})):toString(OneWeek));
                        false ->
                        case ((get({get({This, command}), '$class'})):compareTo(get({This, command}), get({This, 'VIEWORDERSINLAST30DAYS'})) =:= 0) of
                        true ->
                        ThirtyDays = ((((30 * 24) * 60) * 60) * 1000),
                        put({local, rangeDate}, (get({ThirtyDays, '$class'})):toString(ThirtyDays));
                        false ->
                        case ((get({get({This, command}), '$class'})):compareTo(get({This, command}), get({This, 'VIEWALLORDERS'})) =:= 0) of
                        true ->
                        put({local, rangeDate}, (get({CurrentTime, '$class'})):toString(CurrentTime));
                        false -> ok
                    end
                    end
                    end
                    end
                    end,
                    RangeDateLong = (get({get({local, rangeDate}), '$class'})):longValue(get({local, rangeDate})),
                    put({This, fromDate}, (get({(CurrentTime - RangeDateLong), '$class'})):toString((CurrentTime - RangeDateLong))),
                    Time = allbinary_java:to_string((get({CurrentTime, '$class'})):toString(CurrentTime)),
                    put({This, toDate}, Time);
                    false ->
                    case ((get({get({This, dateType}), '$class'})):compareTo(get({This, dateType}), get({'OrderHistoryData', 'TYPECAESAR'})) =:= 0) of
                    true ->
                    put({local, calendar}, 'Calendar':getInstance()),
                    (fun(Target_N73372) -> (get({Target_N73372, '$class'})):setCalendar(Target_N73372, get({local, calendar}), get({This, fromYear}), get({This, fromMonth}), get({This, fromDay}), get({This, fromHour})) end)('TimeUtil':getInstance()),
                    put({This, fromDate}, (fun(Target_N73470) -> (get({Target_N73470, '$class'})):toString(Target_N73470) end)((get({get({local, calendar}), '$class'})):getTimeInMillis(get({local, calendar})))),
                    (fun(Target_N73514) -> (get({Target_N73514, '$class'})):setCalendar(Target_N73514, get({local, calendar}), get({This, toYear}), get({This, toMonth}), get({This, toDay}), get({This, toHour})) end)('TimeUtil':getInstance()),
                    put({This, toDate}, (fun(Target_N73612) -> (get({Target_N73612, '$class'})):toString(Target_N73612) end)((get({get({local, calendar}), '$class'})):getTimeInMillis(get({local, calendar}))));
                    false -> ok
                end
                end,
                case ((fun(Target_N74789) -> (get({Target_N74789, '$class'})):isEmpty(Target_N74789, get({This, toDate})) end)('StringValidationUtil':getInstance()) orelse (string:length(get({This, toDate})) > get({This, 'MAXLEN'}))) of
                    true ->
                    put({local, isValid}, false);
                    false -> ok
                end,
                case ((fun(Target_N74911) -> (get({Target_N74911, '$class'})):isEmpty(Target_N74911, get({This, fromDate})) end)('StringValidationUtil':getInstance()) orelse (string:length(get({This, fromDate})) > get({This, 'MAXLEN'}))) of
                    true ->
                    put({local, isValid}, false);
                    false -> ok
                end;
                false -> ok
            end,
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                true ->
                StringBuffer = 'StringMaker':new(),
                (get({StringBuffer, '$class'})):append(StringBuffer, "Attempt to View orders in (fromDate="),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({This, fromDate})),
                (get({StringBuffer, '$class'})):append(StringBuffer, ",toDate="),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({This, toDate})),
                (get({StringBuffer, '$class'})):append(StringBuffer, ")"),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, get({get({This, commonStrings}), 'IS_VALID'}));
                false -> ok
            end,
            get({local, isValid})
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Exception in validation", This, get({get({This, commonStrings}), 'IS_VALID'}), E);
                false -> ok
            end,
            false
        end.

toValidationInfoDoc(This) ->
        undefined.

toValidationInfoNode(This, Document) ->
        undefined.

% throws Exception
validationInfo(This) ->
        try
            Result = 'StringMaker':new(),
            case ((get({This, dateType}) =:= undefined) orelse ((((get({get({This, dateType}), '$class'})):compareTo(get({This, dateType}), get({'OrderHistoryData', 'TYPELONG'})) =/= 0) andalso ((get({get({This, dateType}), '$class'})):compareTo(get({This, dateType}), get({'OrderHistoryData', 'TYPECAESAR'})) =/= 0)))) of
                true ->
                (get({Result, '$class'})):append(Result, "DATETYPE not recognized");
                false -> ok
            end,
            case ((fun(Target_N76098) -> (get({Target_N76098, '$class'})):isEmpty(Target_N76098, get({This, toDate})) end)('StringValidationUtil':getInstance()) orelse (string:length(get({This, toDate})) > get({This, 'MAXLEN'}))) of
                true ->
                (get({Result, '$class'})):append(Result, "Invalid To Date");
                false -> ok
            end,
            case ((fun(Target_N76214) -> (get({Target_N76214, '$class'})):isEmpty(Target_N76214, get({This, fromDate})) end)('StringValidationUtil':getInstance()) orelse (string:length(get({This, fromDate})) > get({This, 'MAXLEN'}))) of
                true ->
                (get({Result, '$class'})):append(Result, "Invalid From Date");
                false -> ok
            end,
            (get({Result, '$class'})):toString(Result)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEWERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Failed to generate validation error info", This, "validationInfo()", E);
                false -> ok
            end,
            "Error Getting Validation Info"
        end.

