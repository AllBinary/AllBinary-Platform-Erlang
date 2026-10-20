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
% package org.allbinary.business.user.commerce.money.payment.types
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.entry.EntryData
% import org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewaysData
% import org.allbinary.data.tree.dom.DomNodeHelper
% import org.allbinary.data.tree.dom.DomSearchHelper
% import org.allbinary.data.tree.dom.document.DomDocumentHelper
% import org.allbinary.globals.FREEBLISKET_PATH_GLOBALS
% import org.allbinary.globals.URLGLOBALS
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.control.crypt.file.CryptFileReader
% import org.allbinary.logic.io.path.AbPath
% import org.allbinary.logic.io.path.AbPathData
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringValidationUtil
% import org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigData
% import org.allbinary.string.CommonStrings
% import org.w3c.dom.Document
% import org.w3c.dom.Node
% import org.w3c.dom.NodeList

-module('PaymentTypeUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'PaymentTypeUtil':new()),
        ok,
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, 'PAYMENTGATEWAYFILEPATHSTRING'}, undefined),
    put({This, 'SHIPPINGMETHODSFILENAME'}, "paymentGatewayTypes.xml"),
    put({This, defaultName}, undefined),
    put({This, paymentTypeVector}, 'BasicArrayListD':new()),
    ok.



getInstance() ->
        get({'PaymentTypeUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        StringBuffer = 'StringMaker':new(),
        Sep = get({'AbPathData':getInstance(), 'SEPARATOR'}),
        (get({StringBuffer, '$class'})):append(StringBuffer, Sep),
        (get({StringBuffer, '$class'})):append(StringBuffer, "generic"),
        (get({StringBuffer, '$class'})):append(StringBuffer, Sep),
        (get({StringBuffer, '$class'})):append(StringBuffer, "user"),
        (get({StringBuffer, '$class'})):append(StringBuffer, Sep),
        (get({StringBuffer, '$class'})):append(StringBuffer, "commerce"),
        (get({StringBuffer, '$class'})):append(StringBuffer, Sep),
        (get({StringBuffer, '$class'})):append(StringBuffer, "money"),
        (get({StringBuffer, '$class'})):append(StringBuffer, Sep),
        (get({StringBuffer, '$class'})):append(StringBuffer, "payment"),
        (get({StringBuffer, '$class'})):append(StringBuffer, Sep),
        (get({StringBuffer, '$class'})):append(StringBuffer, "gateway"),
        (get({StringBuffer, '$class'})):append(StringBuffer, Sep),
        put({This, 'PAYMENTGATEWAYFILEPATHSTRING'}, (get({StringBuffer, '$class'})):toString(StringBuffer)).

add(This, PaymentType) ->
        (get({get({This, paymentTypeVector}), '$class'})):add(get({This, paymentTypeVector}), PaymentType).

% throws Exception
get(This, PaymentTypeString) when (is_list(PaymentTypeString) orelse PaymentTypeString =:= undefined) ->
        try
        Size = (get({get({This, paymentTypeVector}), '$class'})):size(get({This, paymentTypeVector})),
        lists:foreach(fun(I) ->
            PaymentType = (get({get({This, paymentTypeVector}), '$class'})):get(get({This, paymentTypeVector}), I),
            case ((fun(Target_N67389) -> (get({Target_N67389, '$class'})):compareTo(Target_N67389, PaymentTypeString) end)((fun(Target_N67396) -> (get({Target_N67396, '$class'})):getName(Target_N67396) end)((get({PaymentType, '$class'})):getBasicPaymentType(PaymentType))) =:= 0) of
                true ->
                throw({'$return', PaymentType});
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        erlang:error({'Exception', lists:concat(["Unknown PaymentType: ", PaymentTypeString])})
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
initDefault(This, StoreName) when (is_list(StoreName) orelse StoreName =:= undefined) ->
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'PAYMENT'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["initDefault Payment: ", get({This, defaultName})]), This, "initDefault");
            false -> ok
        end,
        case (fun(Target_N67850) -> (get({Target_N67850, '$class'})):isEmpty(Target_N67850, get({This, defaultName})) end)('StringValidationUtil':getInstance()) of
            true ->
            StringBuffer = 'StringMaker':new(),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({'PaymentTypeUtil', 'URLGLOBALS'}), '$class'})):getMainPath(get({'PaymentTypeUtil', 'URLGLOBALS'}))),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({(get({get({'PaymentTypeUtil', 'FREEBLISKET_PATH_GLOBALS'}), '$class'})):getInstance(get({'PaymentTypeUtil', 'FREEBLISKET_PATH_GLOBALS'})), 'XSLPATH'})),
            (get({StringBuffer, '$class'})):append(StringBuffer, StoreName),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({'AbPathData':getInstance(), 'SEPARATOR'})),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'PAYMENTGATEWAYFILEPATHSTRING'})),
            AbPath = 'AbPath':new((get({StringBuffer, '$class'})):toString(StringBuffer), get({This, 'SHIPPINGMETHODSFILENAME'})),
            Data = (fun(Target_N68222) -> (get({Target_N68222, '$class'})):get(Target_N68222, AbPath) end)('CryptFileReader':new(get({'TransformInfoObjectConfigData':getInstance(), 'UNCRYPTED_EXTENSION'}), get({'TransformInfoObjectConfigData':getInstance(), 'ENCRYPTED_EXTENSION'}))),
            Document = 'DomDocumentHelper':create(Data),
            NodeList = (get({Document, '$class'})):getElementsByTagName(Document, get({'PaymentGatewaysData', 'NAME'})),
            lists:foreach(fun(Index) ->
                Node = (get({NodeList, '$class'})):item(NodeList, Index),
                DefaultPaymentGatewayNode = 'DomSearchHelper':getNode(get({'EntryData':getInstance(), 'DEFAULT'}), (get({Node, '$class'})):getChildNodes(Node)),
                DefaultPaymentGatewayNodeValue = 'DomNodeHelper':getTextNodeValue(DefaultPaymentGatewayNode),
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'PAYMENT'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["DefaultPaymentGatewayNodeValue: ", DefaultPaymentGatewayNodeValue]), This, "initDefault");
                    false -> ok
                end,
                case (not (fun(Target_N68877) -> (get({Target_N68877, '$class'})):isEmpty(Target_N68877, DefaultPaymentGatewayNodeValue) end)('StringValidationUtil':getInstance())) of
                    true ->
                    put({This, defaultName}, DefaultPaymentGatewayNodeValue);
                    false -> ok
                end
            end, lists:seq(0, (get({NodeList, '$class'})):getLength(NodeList) - 1));
            false -> ok
        end.

% throws Exception
getDefault(This, StoreName) when (is_list(StoreName) orelse StoreName =:= undefined) ->
        try
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'PAYMENT'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "getDefault");
            false -> ok
        end,
        (get({This, '$class'})):initDefault(This, StoreName),
        case (not (fun(Target_N69341) -> (get({Target_N69341, '$class'})):isEmpty(Target_N69341, get({This, defaultName})) end)('StringValidationUtil':getInstance())) of
            true ->
            throw({'$return', (get({This, '$class'})):get(This, get({This, defaultName}))});
            false -> ok
        end,
        erlang:error({'Exception', lists:concat(["No Default: ", get({This, defaultName})])})
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isContain(This, PaymentType) ->
        (get({get({This, paymentTypeVector}), '$class'})):contains(get({This, paymentTypeVector}), PaymentType).

difference(This, A_PaymentTypeVector) ->
        Diff = 'BasicArrayListD':new(),
        Size = (get({get({This, paymentTypeVector}), '$class'})):size(get({This, paymentTypeVector})),
        lists:foreach(fun(I) ->
            PaymentType = (get({get({This, paymentTypeVector}), '$class'})):get(get({This, paymentTypeVector}), I),
            case (not (get({A_PaymentTypeVector, '$class'})):contains(A_PaymentTypeVector, PaymentType)) of
                true ->
                (get({Diff, '$class'})):add(Diff, PaymentType);
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        Diff.

