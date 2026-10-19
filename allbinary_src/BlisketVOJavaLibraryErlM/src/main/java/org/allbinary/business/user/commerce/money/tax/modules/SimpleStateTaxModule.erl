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
% package org.allbinary.business.user.commerce.money.tax.modules
% import org.allbinary.business.context.modules.storefront.StoreFrontInterface
% import org.allbinary.business.user.address.StreetAddress
% import org.allbinary.business.user.address.StreetAddressData
% import org.allbinary.business.user.commerce.money.tax.components.TaxData
% import org.allbinary.data.tree.dom.DomNodeHelper
% import org.allbinary.data.tree.dom.DomSearchHelper
% import org.allbinary.data.tree.dom.document.DomDocumentHelper
% import org.allbinary.data.tree.dom.document.XmlDocumentHelper
% import org.allbinary.globals.FREEBLISKET_PATH_GLOBALS
% import org.allbinary.globals.URLGLOBALS
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.control.crypt.file.CryptFileReader
% import org.allbinary.logic.io.path.AbPath
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringValidationUtil
% import org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigData
% import org.allbinary.string.CommonPhoneStrings
% import org.allbinary.string.CommonStrings
% import org.w3c.dom.Document
% import org.w3c.dom.Node
% import org.w3c.dom.NodeList

-module('SimpleStateTaxModule').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements TaxModuleInterface

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, streetAddress}, undefined),
    put({This, storeFrontInterface}, undefined),
    put({This, 'ALL'}, get({'CommonPhoneStrings':getInstance(), 'STAR'})),
    put({This, 'STATETAXPATH'}, "/generic/taxes/"),
    put({This, 'STATETAXFILE'}, "stateTaxation.xml"),
    put({This, document}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

% throws Exception
getTaxRate(This, StreetAddress, StoreFrontInterface) ->
        try
        put({This, streetAddress}, StreetAddress),
        put({This, storeFrontInterface}, StoreFrontInterface),
        FileAbPath = 'AbPath':new(lists:concat([lists:concat([((get({get({'SimpleStateTaxModule', 'URLGLOBALS'}), '$class'})):getMainPath(get({'SimpleStateTaxModule', 'URLGLOBALS'})) + get({(get({get({'SimpleStateTaxModule', 'FREEBLISKET_PATH_GLOBALS'}), '$class'})):getInstance(get({'SimpleStateTaxModule', 'FREEBLISKET_PATH_GLOBALS'})), 'XSLPATH'})), (get({get({This, storeFrontInterface}), '$class'})):getName(get({This, storeFrontInterface}))]), get({This, 'STATETAXPATH'})]), get({This, 'STATETAXFILE'})),
        Data = (fun(Target_N66874) -> (get({Target_N66874, '$class'})):get(Target_N66874, FileAbPath) end)('CryptFileReader':new(get({'TransformInfoObjectConfigData':getInstance(), 'UNCRYPTED_EXTENSION'}), get({'TransformInfoObjectConfigData':getInstance(), 'ENCRYPTED_EXTENSION'}))),
        put({This, document}, 'DomDocumentHelper':create(Data)),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAX'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Tax Doc: ", 'XmlDocumentHelper':toString(get({This, document}))]), This, "getTaxRate");
            false -> ok
        end,
        put({local, state}, (get({get({This, streetAddress}), '$class'})):getState(get({This, streetAddress}))),
        Country = (get({get({This, streetAddress}), '$class'})):getCountry(get({This, streetAddress})),
        put({local, state}, string:uppercase(get({local, state}))),
        NodeList = (get({get({This, document}), '$class'})):getElementsByTagName(get({This, document}), get({'TaxData', 'NAME'})),
        lists:foreach(fun(Index) ->
            Node = (get({NodeList, '$class'})):item(NodeList, Index),
            TaxNodeChildren = (get({Node, '$class'})):getChildNodes(Node),
            StreetAddressNode = 'DomSearchHelper':getNode(get({'StreetAddressData', 'NAME'}), TaxNodeChildren),
            TaxableStreetAddress = 'StreetAddress':new(StreetAddressNode),
            StringValidationUtil = 'StringValidationUtil':getInstance(),
            case (((not (get({StringValidationUtil, '$class'})):isEmpty(StringValidationUtil, Country)) andalso (not (get({StringValidationUtil, '$class'})):isEmpty(StringValidationUtil, (get({TaxableStreetAddress, '$class'})):getCountry(TaxableStreetAddress)))) andalso ((get({Country, '$class'})):compareTo(Country, (get({TaxableStreetAddress, '$class'})):getCountry(TaxableStreetAddress)) =:= 0)) of
                true ->
                case (((get({local, state}) =/= undefined) andalso ((get({TaxableStreetAddress, '$class'})):getState(TaxableStreetAddress) =/= undefined)) andalso ((get({get({local, state}), '$class'})):compareTo(get({local, state}), (get({TaxableStreetAddress, '$class'})):getState(TaxableStreetAddress)) =:= 0)) of
                    true ->
                    RateNode = 'DomSearchHelper':getNode(get({'TaxData', 'RATE'}), TaxNodeChildren),
                    TaxRate = 'DomNodeHelper':getTextNodeValue(RateNode),
                    TaxRateFloat = ((get({TaxRate, '$class'})):floatValue(TaxRate) * 0.01),
                    throw({'$return', TaxRateFloat});
                    false -> ok
                end;
                false -> ok
            end
        end, lists:seq(0, (get({NodeList, '$class'})):getLength(NodeList) - 1)),
        0
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isValid(This, StreetAddress, StoreFrontInterface) ->
        try
        try
            put({This, streetAddress}, StreetAddress),
            put({This, storeFrontInterface}, StoreFrontInterface),
            FileAbPath = 'AbPath':new(lists:concat([lists:concat([((get({get({'SimpleStateTaxModule', 'URLGLOBALS'}), '$class'})):getMainPath(get({'SimpleStateTaxModule', 'URLGLOBALS'})) + get({(get({get({'SimpleStateTaxModule', 'FREEBLISKET_PATH_GLOBALS'}), '$class'})):getInstance(get({'SimpleStateTaxModule', 'FREEBLISKET_PATH_GLOBALS'})), 'XSLPATH'})), (get({get({This, storeFrontInterface}), '$class'})):getName(get({This, storeFrontInterface}))]), get({This, 'STATETAXPATH'})]), get({This, 'STATETAXFILE'})),
            Data = (fun(Target_N68575) -> (get({Target_N68575, '$class'})):get(Target_N68575, FileAbPath) end)('CryptFileReader':new(get({'TransformInfoObjectConfigData':getInstance(), 'UNCRYPTED_EXTENSION'}), get({'TransformInfoObjectConfigData':getInstance(), 'ENCRYPTED_EXTENSION'}))),
            put({This, document}, 'DomDocumentHelper':create(Data)),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAX'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Tax Doc: ", 'XmlDocumentHelper':toString(get({This, document}))]), This, get({get({This, commonStrings}), 'IS_VALID'}));
                false -> ok
            end,
            Country = (get({get({This, streetAddress}), '$class'})):getCountry(get({This, streetAddress})),
            RootNode = (fun(Target_N69038) -> (get({Target_N69038, '$class'})):item(Target_N69038, 0) end)((get({get({This, document}), '$class'})):getElementsByTagName(get({This, document}), get({'TransformInfoObjectConfigData':getInstance(), 'NAME'}))),
            NodeList = (get({get({This, document}), '$class'})):getElementsByTagName(get({This, document}), get({'TaxData', 'NAME'})),
            lists:foreach(fun(Index) ->
                Node = (get({NodeList, '$class'})):item(NodeList, Index),
                TaxNodeChildren = (get({Node, '$class'})):getChildNodes(Node),
                StreetAddressNode = 'DomSearchHelper':getNode(get({'StreetAddressData', 'NAME'}), TaxNodeChildren),
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAX'})) of
                    true ->
                    StringBuffer = 'StringMaker':new(),
                    (get({StringBuffer, '$class'})):append(StringBuffer, "StreetAddress Node: "),
                    (get({StringBuffer, '$class'})):append(StringBuffer, (get({StreetAddressNode, '$class'})):getNodeName(StreetAddressNode)),
                    (get({StringBuffer, '$class'})):append(StringBuffer, " Value: "),
                    (get({StringBuffer, '$class'})):append(StringBuffer, (get({StreetAddressNode, '$class'})):getNodeValue(StreetAddressNode)),
                    (get({StringBuffer, '$class'})):append(StringBuffer, " Number Of Children: "),
                    (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc((fun(Target_N69763) -> (get({Target_N69763, '$class'})):getLength(Target_N69763) end)((get({StreetAddressNode, '$class'})):getChildNodes(StreetAddressNode)))),
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, get({get({This, commonStrings}), 'IS_VALID'}));
                    false -> ok
                end,
                TaxableStreetAddress = 'StreetAddress':new(StreetAddressNode),
                StringValidationUtil = 'StringValidationUtil':getInstance(),
                case (((not (get({StringValidationUtil, '$class'})):isEmpty(StringValidationUtil, Country)) andalso (not (get({StringValidationUtil, '$class'})):isEmpty(StringValidationUtil, (get({TaxableStreetAddress, '$class'})):getCountry(TaxableStreetAddress)))) andalso ((fun(Target_N70038) -> (get({Target_N70038, '$class'})):compareTo(Target_N70038, get({This, 'ALL'})) end)((get({TaxableStreetAddress, '$class'})):getCountry(TaxableStreetAddress)) =:= 0)) of
                    true ->
                    throw({'$return', true});
                    false -> ok
                end,
                case (((not (get({StringValidationUtil, '$class'})):isEmpty(StringValidationUtil, Country)) andalso (not (get({StringValidationUtil, '$class'})):isEmpty(StringValidationUtil, (get({TaxableStreetAddress, '$class'})):getCountry(TaxableStreetAddress)))) andalso ((get({Country, '$class'})):compareTo(Country, (get({TaxableStreetAddress, '$class'})):getCountry(TaxableStreetAddress)) =:= 0)) of
                    true ->
                    State = (get({get({This, streetAddress}), '$class'})):getState(get({This, streetAddress})),
                    case (State =/= undefined) of
                        true ->
                        throw({'$return', true});
                        false -> ok
                    end;
                    false -> ok
                end
            end, lists:seq(0, (get({NodeList, '$class'})):getLength(NodeList) - 1)),
            false
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEWERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Failed to validate", This, get({get({This, commonStrings}), 'IS_VALID'}), E);
                false -> ok
            end,
            false
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

