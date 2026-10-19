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
% package views.generic.order
% import org.allbinary.business.user.commerce.inventory.order.OrderHistoryFactory
% import org.allbinary.data.tables.user.commerce.inventory.order.OrderItemsEntity
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.control.validate.ValidationComponentInterface
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('ValidationView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ValidationComponentInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('OrderView', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


new(TransformInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, TransformInfoInterface),
    This.

init(This, TransformInfoInterface) ->
        'OrderView':init(This, TransformInfoInterface),
        init_fields(This).

isValid(This) ->
        try
        try
            Valid = true,
            case ((get({get({This, order}), '$class'})):isIdValid(get({This, order})) =:= false) of
                true ->
                throw({'$return', false});
                false ->
                put({This, orderHistory}, 'OrderHistoryFactory':getInstance((get({get({This, order}), '$class'})):getId(get({This, order})))),
                case ((get({This, orderHistory}) =:= undefined) orelse ((get({get({This, orderHistory}), '$class'})):isValid(get({This, orderHistory})) =:= false)) of
                    true ->
                    throw({'$return', false});
                    false -> ok
                end,
                OrderItems = 'OrderItemsEntity':new(),
                put({This, basketReview}, (get({OrderItems, '$class'})):getBasketReview(OrderItems, (get({get({This, order}), '$class'})):getId(get({This, order})))),
                case ((get({This, basketReview}) =:= undefined) orelse ((get({get({This, basketReview}), '$class'})):isValid(get({This, basketReview})) =:= false)) of
                    true ->
                    throw({'$return', false});
                    false -> ok
                end
            end,
            Valid
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEWERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Failed to validate form", This, get({get({This, commonStrings}), 'IS_VALID'}), E);
                false -> ok
            end,
            false
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

validationInfo(This) ->
        try
            StringBuffer = 'StringMaker':new(),
            case ((get({get({This, order}), '$class'})):isIdValid(get({This, order})) =:= false) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, order}), '$class'})):getIdValidationInfo(get({This, order})));
                false ->
                put({This, orderHistory}, 'OrderHistoryFactory':getInstance((get({get({This, order}), '$class'})):getId(get({This, order})))),
                case ((get({This, orderHistory}) =:= undefined) orelse ((get({get({This, orderHistory}), '$class'})):isValid(get({This, orderHistory})) =:= false)) of
                    true ->
                    (get({StringBuffer, '$class'})):append(StringBuffer, "Order History data error for: "),
                    (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, order}), '$class'})):getId(get({This, order}))),
                    (get({StringBuffer, '$class'})):append(StringBuffer, "<br />");
                    false -> ok
                end,
                OrderItems = 'OrderItemsEntity':new(),
                put({This, basketReview}, (get({OrderItems, '$class'})):getBasketReview(OrderItems, (get({get({This, order}), '$class'})):getId(get({This, order})))),
                case (get({This, basketReview}) =:= undefined) of
                    true ->
                    (get({StringBuffer, '$class'})):append(StringBuffer, "Order Items data error - does not exist for: "),
                    (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, order}), '$class'})):getId(get({This, order}))),
                    (get({StringBuffer, '$class'})):append(StringBuffer, "<br />");
                    false ->
                    case ((get({get({This, basketReview}), '$class'})):isValid(get({This, basketReview})) =:= false) of
                    true ->
                    (get({StringBuffer, '$class'})):append(StringBuffer, "Order Items data error - not valid for: "),
                    (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, order}), '$class'})):getId(get({This, order}))),
                    (get({StringBuffer, '$class'})):append(StringBuffer, "<br />");
                    false -> ok
                end
                end
            end,
            (get({StringBuffer, '$class'})):toString(StringBuffer)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEWERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Failed to generate validation error info", This, "validationInfo()", E);
                false -> ok
            end,
            "Error Validating Form"
        end.

toValidationInfoDoc(This) ->
        undefined.

toValidationInfoNode(This, Document) ->
        undefined.

