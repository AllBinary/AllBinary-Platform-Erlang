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
% package org.allbinary.business.user.commerce.shipping.modules
% import org.allbinary.business.user.commerce.shipping.ShippingMethodData
% import org.allbinary.data.tree.dom.DomNodeInterface
% import org.allbinary.data.tree.dom.ModDomHelper
% import org.allbinary.logic.communication.log.LogUtil
% import org.w3c.dom.Node

-module('NoShippingModuleView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements DomNodeInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('NoShippingModule', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'NoShippingModule':'$init'(This),
    init_fields(This),
        ok.

isValid(This) ->
        undefined.

toValidationInfoDoc(This) ->
        undefined.

toValidationInfoNode(This, Document) ->
        undefined.

toXmlDoc(This) ->
        undefined.

toXmlNode(This, Document) ->
        try
            ShippingMethodNode = (get({Document, '$class'})):createElement(Document, get({'ShippingMethodData', 'NAME'})),
            (get({ShippingMethodNode, '$class'})):appendChild(ShippingMethodNode, 'ModDomHelper':createNameValueNodes(Document, get({'ShippingMethodData', 'NAME'}), (get({This, '$class'})):getName(This))),
            (get({ShippingMethodNode, '$class'})):appendChild(ShippingMethodNode, 'ModDomHelper':createNameValueNodes(Document, get({'ShippingMethodData', 'DESCRIPTION'}), (get({This, '$class'})):getDescription(This))),
            ShippingMethodNode
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "toXmlNode", E);
                false -> ok
            end,
            undefined
        end.

validationInfo(This) ->
        undefined.

view(This) ->
        undefined.

