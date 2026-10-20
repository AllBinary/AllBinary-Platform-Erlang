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
% package org.allbinary.logic.visual.transform.template.customizer.hedges.heading
% import java.util.HashMap
% import org.allbinary.data.tree.dom.DomNodeInterface
% import org.allbinary.data.tree.dom.DomSearchHelper
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.control.validate.Validation
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.visual.transform.template.customizer.widgets.logo.LogoData
% import org.allbinary.logic.visual.transform.template.customizer.widgets.logo.LogoValidation
% import org.allbinary.logic.visual.transform.template.customizer.widgets.title.TitleData
% import org.allbinary.logic.visual.transform.template.customizer.widgets.title.TitleValidation
% import org.w3c.dom.Document
% import org.w3c.dom.Node
% import org.w3c.dom.NodeList

-module('HeadingValidation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements DomNodeInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('Validation', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, title}, undefined),
    put({This, logo}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'Validation':'$init'(This),
    init_fields(This),
        put({This, title}, 'TitleValidation':new()),
        put({This, logo}, 'LogoValidation':new()).

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
        HeadingNodeList = (get({Document, '$class'})):getElementsByTagName(Document, get({'HeadingData', 'NAME'})),
        TitleNode = 'DomSearchHelper':getNode(get({'TitleData':getInstance(), 'NAME'}), (fun(Target_N66433) -> (get({Target_N66433, '$class'})):getChildNodes(Target_N66433) end)((get({HeadingNodeList, '$class'})):item(HeadingNodeList, 0))),
        LogoNode = 'DomSearchHelper':getNode(get({'LogoData':getInstance(), 'NAME'}), (fun(Target_N66534) -> (get({Target_N66534, '$class'})):getChildNodes(Target_N66534) end)((get({HeadingNodeList, '$class'})):item(HeadingNodeList, 0))),
        put({This, title}, 'TitleValidation':new(TitleNode)),
        put({This, logo}, 'LogoValidation':new(LogoNode));
'$init'(This, HashMap) ->
    'Validation':'$init'(This),
    init_fields(This),
        (get({This, '$class'})):getFormData(This, HashMap).


% throws Exception
getFormData(This, HashMap) ->
        put({This, title}, 'TitleValidation':new(HashMap)),
        put({This, logo}, 'LogoValidation':new(HashMap)).

isValid(This) ->
        try
            put({local, valid}, true),
            put({local, titleValid}, true),
            put({local, logoValid}, true),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'IS_VALID'}));
                false -> ok
            end,
            case (not (fun(Target_N67328) -> (get({Target_N67328, '$class'})):booleanValue(Target_N67328) end)((get({get({This, title}), '$class'})):isValid(get({This, title})))) of
                true ->
                put({local, titleValid}, false);
                false -> ok
            end,
            case (not (fun(Target_N67404) -> (get({Target_N67404, '$class'})):booleanValue(Target_N67404) end)((get({get({This, logo}), '$class'})):isValid(get({This, logo})))) of
                true ->
                put({local, logoValid}, false);
                false ->
                (get({get({This, logo}), '$class'})):processLogoFile(get({This, logo}))
            end,
            case ((not (get({get({local, titleValid}), '$class'})):booleanValue(get({local, titleValid}))) andalso (not (get({get({local, logoValid}), '$class'})):booleanValue(get({local, logoValid})))) of
                true ->
                put({local, valid}, false);
                false -> ok
            end,
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["HeadingValidation: ", get({local, valid})]), This, get({get({This, commonStrings}), 'IS_VALID'}));
                false -> ok
            end,
            get({local, valid})
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
            put({local, valid}, true),
            put({local, titleValid}, true),
            put({local, logoValid}, true),
            StringBuffer = 'StringMaker':new(),
            case (not (fun(Target_N68346) -> (get({Target_N68346, '$class'})):booleanValue(Target_N68346) end)((get({get({This, title}), '$class'})):isValid(get({This, title})))) of
                true ->
                put({local, titleValid}, false);
                false -> ok
            end,
            case (not (fun(Target_N68422) -> (get({Target_N68422, '$class'})):booleanValue(Target_N68422) end)((get({get({This, logo}), '$class'})):isValid(get({This, logo})))) of
                true ->
                put({local, logoValid}, false);
                false -> ok
            end,
            case ((not (get({get({local, titleValid}), '$class'})):booleanValue(get({local, titleValid}))) andalso (not (get({get({local, logoValid}), '$class'})):booleanValue(get({local, logoValid})))) of
                true ->
                put({local, valid}, false);
                false -> ok
            end,
            case (not (get({get({local, valid}), '$class'})):booleanValue(get({local, valid}))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, "Include a title and/or logo for the header.");
                false -> ok
            end,
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
        Node = (get({Document, '$class'})):createElement(Document, get({'HeadingData', 'NAME'})),
        (get({Node, '$class'})):appendChild(Node, (get({get({This, logo}), '$class'})):toXmlNode(get({This, logo}), Document)),
        (get({Node, '$class'})):appendChild(Node, (get({get({This, title}), '$class'})):toXmlNode(get({This, title}), Document)),
        Node.

