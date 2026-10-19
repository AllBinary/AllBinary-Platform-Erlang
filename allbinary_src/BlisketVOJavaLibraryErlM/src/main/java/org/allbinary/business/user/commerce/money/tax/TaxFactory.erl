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
% package org.allbinary.business.user.commerce.money.tax
% import org.allbinary.business.DynamicObjectData
% import org.allbinary.business.context.modules.storefront.StoreFrontInterface
% import org.allbinary.business.user.commerce.money.tax.components.TaxData
% import org.allbinary.business.user.commerce.money.tax.modules.SimpleStateTaxModule
% import org.allbinary.business.user.commerce.money.tax.modules.TaxModuleInterface
% import org.allbinary.data.tree.dom.DomNodeHelper
% import org.allbinary.data.tree.dom.DomSearchHelper
% import org.allbinary.data.tree.dom.document.DomDocumentHelper
% import org.allbinary.globals.FREEBLISKET_PATH_GLOBALS
% import org.allbinary.globals.URLGLOBALS
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.control.crypt.file.CryptFileReader
% import org.allbinary.logic.io.path.AbPath
% import org.allbinary.logic.io.path.AbPathData
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.system.loader.AbeFactory
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigData
% import org.allbinary.string.CommonStrings
% import org.w3c.dom.Document
% import org.w3c.dom.Node
% import org.w3c.dom.NodeList

-module('TaxFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'TaxFactory':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, 'TAXATIONFILENAME'}, "taxationMethod.xml"),
    ok.


getInstance() ->
        get({'TaxFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

% throws Exception
getInstance(This, AbeClientInformation, StoreFrontInterface) ->
        try
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({'TaxFactory', 'URLGLOBALS'}), '$class'})):getMainPath(get({'TaxFactory', 'URLGLOBALS'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({(get({get({'TaxFactory', 'FREEBLISKET_PATH_GLOBALS'}), '$class'})):getInstance(get({'TaxFactory', 'FREEBLISKET_PATH_GLOBALS'})), 'XSLPATH'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({StoreFrontInterface, '$class'})):getName(StoreFrontInterface)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'AbPathData':getInstance(), 'SEPARATOR'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, "generic"),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'AbPathData':getInstance(), 'SEPARATOR'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, "taxes"),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'AbPathData':getInstance(), 'SEPARATOR'})),
        AbPath = 'AbPath':new((get({StringBuffer, '$class'})):toString(StringBuffer), get({This, 'TAXATIONFILENAME'})),
        TransformInfoObjectConfigData = 'TransformInfoObjectConfigData':getInstance(),
        Data = (fun(Target_N67143) -> (get({Target_N67143, '$class'})):get(Target_N67143, AbPath) end)('CryptFileReader':new(get({TransformInfoObjectConfigData, 'UNCRYPTED_EXTENSION'}), get({TransformInfoObjectConfigData, 'ENCRYPTED_EXTENSION'}))),
        Document = 'DomDocumentHelper':create(Data),
        TaxNameNodeList = (get({Document, '$class'})):getElementsByTagName(Document, get({'TaxData', 'NAME'})),
        lists:foreach(fun(Index) ->
            Node = (get({TaxNameNodeList, '$class'})):item(TaxNameNodeList, Index),
            NodeList = (get({Node, '$class'})):getChildNodes(Node),
            case (NodeList =/= undefined) of
                true ->
                ClassNameNode = 'DomSearchHelper':getNode(get({'DynamicObjectData', 'NAME'}), NodeList),
                case (ClassNameNode =/= undefined) of
                    true ->
                    ClassName = 'DomNodeHelper':getTextNodeValue(ClassNameNode),
                    throw({'$return', (fun(Target_N68136) -> (get({Target_N68136, '$class'})):getInstance(Target_N68136, AbeClientInformation, ClassName) end)('AbeFactory':getInstance())});
                    false ->
                    case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAX'})) of
                        true ->
                        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Class Node Null", This, get({get({This, commonStrings}), 'GET_INSTANCE'}));
                        false -> ok
                    end
                end;
                false ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAX'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Tax Name Node Node Children", This, get({get({This, commonStrings}), 'GET_INSTANCE'}));
                    false -> ok
                end
            end
        end, lists:seq(0, (get({TaxNameNodeList, '$class'})):getLength(TaxNameNodeList) - 1)),
        'SimpleStateTaxModule':new()
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

