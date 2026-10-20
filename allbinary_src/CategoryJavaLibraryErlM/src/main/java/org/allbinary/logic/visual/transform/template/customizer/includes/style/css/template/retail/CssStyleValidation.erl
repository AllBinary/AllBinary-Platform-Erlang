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
% package org.allbinary.logic.visual.transform.template.customizer.includes.style.css.template.retail
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.data.tree.dom.DomNodeInterface
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.control.validate.Validation
% import org.allbinary.logic.control.validate.ValidationInterface
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.visual.dhtml.style.StyleData
% import org.allbinary.logic.visual.dhtml.style.StylesData
% import org.allbinary.logic.visual.dhtml.style.StylesValidationFactory
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('CssStyleValidation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements DomNodeInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('Validation', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, cssStyleElementVector}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'Validation':'$init'(This),
    init_fields(This),
        put({This, cssStyleElementVector}, 'BasicArrayListD':new()).

new(Document) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Document),
    This;
new(HashMap) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, HashMap),
    This.

'$init'(This, Document) ->
    'Validation':'$init'(This),
    init_fields(This),
        put({This, cssStyleElementVector}, (fun(Target_N66240) -> (get({Target_N66240, '$class'})):getInstance(Target_N66240, Document) end)('StylesValidationFactory':getInstance()));
'$init'(This, HashMap) ->
    'Validation':'$init'(This),
    init_fields(This),
        put({This, cssStyleElementVector}, 'StylesValidationFactory':getInstance(HashMap)).


isValid(This) ->
        try
            put({local, isValid}, true),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'IS_VALID'}));
                false -> ok
            end,
            Size = (get({get({This, cssStyleElementVector}), '$class'})):size(get({This, cssStyleElementVector})),
            lists:foreach(fun(I) ->
                StyleValidationInterface = (get({get({This, cssStyleElementVector}), '$class'})):get(get({This, cssStyleElementVector}), I),
                case (not (fun(Target_N66848) -> (get({Target_N66848, '$class'})):booleanValue(Target_N66848) end)((get({StyleValidationInterface, '$class'})):isValid(StyleValidationInterface))) of
                    true ->
                    put({local, isValid}, false);
                    false -> ok
                end
            end, lists:seq(0, Size - 1)),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["End: ", get({local, isValid})]), This, get({get({This, commonStrings}), 'IS_VALID'}));
                false -> ok
            end,
            get({local, isValid})
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

% throws Exception
toXmlNode(This, Document) ->
        Node = (get({Document, '$class'})):createElement(Document, get({'StylesData':getInstance(), 'NAME'})),
        StyleNode = (get({Document, '$class'})):createElement(Document, get({'StyleData':getInstance(), 'NAME'})),
        (get({Node, '$class'})):appendChild(Node, StyleNode),
        Size = (get({get({This, cssStyleElementVector}), '$class'})):size(get({This, cssStyleElementVector})),
        lists:foreach(fun(I) ->
            StyleDomNodeInterface = (get({get({This, cssStyleElementVector}), '$class'})):get(get({This, cssStyleElementVector}), I),
            (get({StyleNode, '$class'})):appendChild(StyleNode, (get({StyleDomNodeInterface, '$class'})):toXmlNode(StyleDomNodeInterface, Document))
        end, lists:seq(0, Size - 1)),
        Node.

