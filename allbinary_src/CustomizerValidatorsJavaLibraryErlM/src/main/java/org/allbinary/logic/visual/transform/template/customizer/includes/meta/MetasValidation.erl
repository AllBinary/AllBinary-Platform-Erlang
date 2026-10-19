%
% AllBinary Open License Version 1
% Copyright (c) 2011 AllBinary
% 
% By agreeing to this license you and any business entity you represent are
% legally bound to the AllBinary Open License Version 1 legal agreement.
% 
% You may obtain the AllBinary Open License Version 1 legal agreement from
% AllBinary or the root directory of AllBinary's AllBinary Platform repository.
% II
% Created By: Travis Berthelot
%  
% Generated Code Do Not Modify
% package org.allbinary.logic.visual.transform.template.customizer.includes.meta
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.context.modules.storefront.StoreFrontFactory
% import org.allbinary.business.context.modules.storefront.StoreFrontInterface
% import org.allbinary.data.tree.dom.DomNodeInterface
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.control.validate.Validation
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.visual.dhtml.html.head.meta.HtmlMetaAttributeDataFactory
% import org.allbinary.logic.visual.dhtml.html.head.meta.HtmlMetaAttributeValuesData
% import org.allbinary.logic.visual.dhtml.html.head.meta.HtmlMetasData
% import org.allbinary.string.CommonStrings
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('MetasValidation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements DomNodeInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('Validation', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, storeFrontInterface}, undefined),
    put({This, metaValidationVector}, undefined),
    ok.


new(StoreName) when (is_list(StoreName) orelse StoreName =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, StoreName),
    This;
new(Document) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Document),
    This.

init(This, StoreName) when (is_list(StoreName) orelse StoreName =:= undefined) ->
    'Validation':init(This),
    init_fields(This),
        put({This, storeFrontInterface}, 'StoreFrontFactory':getInstance(StoreName)),
        put({This, metaValidationVector}, 'BasicArrayListD':new()),
        ContentValue = lists:concat([(get({get({This, storeFrontInterface}), '$class'})):getName(get({This, storeFrontInterface})), " E-Commerce Site"]),
        KeywordsMetaValidation = 'MetaValidation':new(get({'HtmlMetaAttributeDataFactory':getInstance(), 'NAME'}), "Keywords", get({'HtmlMetaAttributeValuesData':getInstance(), 'KEYWORDS'}), ContentValue),
        AbstractMetaValidation = 'MetaValidation':new(get({'HtmlMetaAttributeDataFactory':getInstance(), 'NAME'}), "Abstract", get({'HtmlMetaAttributeValuesData':getInstance(), 'ABSTRACT'}), ContentValue),
        DescriptionMetaValidation = 'MetaValidation':new(get({'HtmlMetaAttributeDataFactory':getInstance(), 'NAME'}), "Description", get({'HtmlMetaAttributeValuesData':getInstance(), 'DESCRIPTION'}), ContentValue),
        (get({get({This, metaValidationVector}), '$class'})):add(get({This, metaValidationVector}), KeywordsMetaValidation),
        (get({get({This, metaValidationVector}), '$class'})):add(get({This, metaValidationVector}), AbstractMetaValidation),
        (get({get({This, metaValidationVector}), '$class'})):add(get({This, metaValidationVector}), DescriptionMetaValidation);
init(This, Document) ->
    'Validation':init(This),
    init_fields(This),
        erlang:error({'Exception', get({'CommonStrings':getInstance(), 'NOT_IMPLEMENTED'})}).


isValid(This) ->
        try
            Valid = true,
            Valid
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Failed to validate form", This, get({get({This, commonStrings}), 'IS_VALID'}), E);
                false -> ok
            end,
            false
        end.

validationInfo(This) ->
        try
            StringBuffer = 'StringMaker':new(),
            (get({StringBuffer, '$class'})):toString(StringBuffer)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
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

% throws Exception
toXmlNode(This, Document) ->
        Node = (get({Document, '$class'})):createElement(Document, get({'HtmlMetasData':getInstance(), 'NAME'})),
        MetaArray = (get({get({This, metaValidationVector}), '$class'})):toArrayType(get({This, metaValidationVector}), array:new((get({get({This, metaValidationVector}), '$class'})):size(get({This, metaValidationVector})), {default, undefined})),
        Size = array:size(MetaArray),
        lists:foreach(fun(I) ->
            MetaValidation = array:get(I, MetaArray),
            (get({Node, '$class'})):appendChild(Node, (get({MetaValidation, '$class'})):toXmlNode(MetaValidation, Document))
        end, lists:seq(0, Size - 1)),
        Node.

