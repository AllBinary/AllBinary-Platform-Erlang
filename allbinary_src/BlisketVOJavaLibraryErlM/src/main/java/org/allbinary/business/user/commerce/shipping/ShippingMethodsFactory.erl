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
% package org.allbinary.business.user.commerce.shipping
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.DynamicObjectData
% import org.allbinary.business.context.modules.storefront.StoreFrontInterface
% import org.allbinary.business.user.commerce.shipping.modules.BasicWeightShippingModuleView
% import org.allbinary.business.user.commerce.shipping.modules.NoShippingModuleView
% import org.allbinary.business.user.commerce.shipping.modules.ShippingInterface
% import org.allbinary.data.tree.dom.DomNodeHelper
% import org.allbinary.data.tree.dom.DomSearchHelper
% import org.allbinary.data.tree.dom.document.DomDocumentHelper
% import org.allbinary.globals.FREEBLISKET_PATH_GLOBALS
% import org.allbinary.globals.URLGLOBALS
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.control.crypt.file.CryptFileReader
% import org.allbinary.logic.io.path.AbPath
% import org.allbinary.logic.io.path.AbPathData
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.system.loader.AbeFactory
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigData
% import org.w3c.dom.Document
% import org.w3c.dom.Node
% import org.w3c.dom.NodeList

-module('ShippingMethodsFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'SHIPPINGMETHODSFILEPATHSTRING'}, undefined),
    put({?MODULE, 'SHIPPINGMETHODSFILENAME'}, "shippingMethods.xml"),
        StringBuffer = 'StringMaker':new(),
        Sep = get({'AbPathData':getInstance(), 'SEPARATOR'}),
        (get({StringBuffer, '$class'})):append(StringBuffer, Sep),
        (get({StringBuffer, '$class'})):append(StringBuffer, "generic"),
        (get({StringBuffer, '$class'})):append(StringBuffer, Sep),
        (get({StringBuffer, '$class'})):append(StringBuffer, "shipping"),
        (get({StringBuffer, '$class'})):append(StringBuffer, Sep),
        put({'ShippingMethodsFactory', 'SHIPPINGMETHODSFILEPATHSTRING'}, (get({StringBuffer, '$class'})):toString(StringBuffer)),
    ok.

init_fields(This) ->
    put({This, defaultShippingMethodInterface}, undefined),
    put({This, document}, undefined),
    put({This, shippingVector}, undefined),
    ok.



new(AbeClientInformation, StoreFrontInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, AbeClientInformation, StoreFrontInterface),
    This.

init(This, AbeClientInformation, StoreFrontInterface) ->
    init_fields(This),
        StringBuffer = 'StringMaker':new(),
        Sep = get({'AbPathData':getInstance(), 'SEPARATOR'}),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({'ShippingMethodsFactory', 'URLGLOBALS'}), '$class'})):getMainPath(get({'ShippingMethodsFactory', 'URLGLOBALS'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({(get({get({'ShippingMethodsFactory', 'FREEBLISKET_PATH_GLOBALS'}), '$class'})):getInstance(get({'ShippingMethodsFactory', 'FREEBLISKET_PATH_GLOBALS'})), 'XSLPATH'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({StoreFrontInterface, '$class'})):getName(StoreFrontInterface)),
        (get({StringBuffer, '$class'})):append(StringBuffer, Sep),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'ShippingMethodsFactory', 'SHIPPINGMETHODSFILEPATHSTRING'})),
        AbPath = 'AbPath':new((get({StringBuffer, '$class'})):toString(StringBuffer), get({?MODULE, 'SHIPPINGMETHODSFILENAME'})),
        Data = (fun(Target_N67246) -> (get({Target_N67246, '$class'})):get(Target_N67246, AbPath) end)('CryptFileReader':new(get({'TransformInfoObjectConfigData':getInstance(), 'UNCRYPTED_EXTENSION'}), get({'TransformInfoObjectConfigData':getInstance(), 'ENCRYPTED_EXTENSION'}))),
        put({This, document}, 'DomDocumentHelper':create(Data)),
        put({This, shippingVector}, 'BasicArrayListD':new()),
        NodeList = (get({get({This, document}), '$class'})):getElementsByTagName(get({This, document}), get({'ShippingMethodsData', 'NAME'})),
        lists:foreach(fun(Index) ->
            Node = (get({NodeList, '$class'})):item(NodeList, Index),
            ShippingMethodNodeChildren = (get({Node, '$class'})):getChildNodes(Node),
            ShippingMethodNameNode = 'DomSearchHelper':getNode(get({'ShippingMethodData', 'NAME'}), ShippingMethodNodeChildren),
            ClassNameNode = 'DomSearchHelper':getNode(get({'DynamicObjectData', 'NAME'}), (get({ShippingMethodNameNode, '$class'})):getChildNodes(ShippingMethodNameNode)),
            ShippingMethodClassName = 'DomNodeHelper':getTextNodeValue(ClassNameNode),
            ShippingMethodInterface = (fun(Target_N67858) -> (get({Target_N67858, '$class'})):getInstance(Target_N67858, AbeClientInformation, ShippingMethodClassName) end)('AbeFactory':getInstance()),
            (get({get({This, shippingVector}), '$class'})):add(get({This, shippingVector}), ShippingMethodInterface),
            DefaultShippingMethodNameNode = 'DomSearchHelper':getNode(get({'ShippingMethodData', 'DEFAULT'}), (get({ShippingMethodNameNode, '$class'})):getChildNodes(ShippingMethodNameNode)),
            DefaultShippingMethodNameNodeValue = 'DomNodeHelper':getTextNodeValue(DefaultShippingMethodNameNode),
            case ((DefaultShippingMethodNameNodeValue =/= undefined) andalso ((get({DefaultShippingMethodNameNodeValue, '$class'})):compareTo(DefaultShippingMethodNameNodeValue, get({'ShippingMethodData', 'DEFAULT'})) =:= 0)) of
                true ->
                put({This, defaultShippingMethodInterface}, ShippingMethodInterface);
                false -> ok
            end
        end, lists:seq(0, (get({NodeList, '$class'})):getLength(NodeList) - 1)),
        case ((get({get({This, shippingVector}), '$class'})):size(get({This, shippingVector})) < 1) of
            true ->
            put({This, defaultShippingMethodInterface}, 'BasicWeightShippingModuleView':new()),
            (get({get({This, shippingVector}), '$class'})):add(get({This, shippingVector}), get({This, defaultShippingMethodInterface})),
            (get({get({This, shippingVector}), '$class'})):add(get({This, shippingVector}), 'NoShippingModuleView':new());
            false -> ok
        end.

% throws Exception
getInstance(This) ->
        get({This, shippingVector}).

getDefaultInstance(This) ->
        get({This, defaultShippingMethodInterface}).

