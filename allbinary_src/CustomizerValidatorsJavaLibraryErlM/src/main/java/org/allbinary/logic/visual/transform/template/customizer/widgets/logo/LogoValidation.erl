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
% package org.allbinary.logic.visual.transform.template.customizer.widgets.logo
% import java.util.HashMap
% import org.allbinary.data.tree.dom.DomNodeInterface
% import org.allbinary.data.tree.dom.DomSearchHelper
% import org.allbinary.data.tree.dom.ModDomHelper
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.http.request.HttpRequestUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.control.validate.Validation
% import org.allbinary.logic.io.file.FileData
% import org.allbinary.logic.io.path.AbPath
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.string.StringValidationUtil
% import org.apache.commons.fileupload.FileItem
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('LogoValidation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements DomNodeInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('Validation', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, logoFileItem}, undefined),
    put({This, logoAbPath}, undefined),
    put({This, logoFile}, undefined),
    put({This, isFile}, false),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'Validation':init(This),
    init_fields(This),
        put({This, isFile}, false),
        put({This, logoAbPath}, undefined),
        put({This, logoFile}, undefined).

new(Node) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Node),
    This;
new(HashMap) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, HashMap),
    This.

init(This, Node) ->
    'Validation':init(This),
    init_fields(This),
        put({This, isFile}, false),
        put({This, logoAbPath}, 'AbPath':new((fun(Target_N66451) -> (get({Target_N66451, '$class'})):getNodeValue(Target_N66451) end)('DomSearchHelper':getNode(get({'LogoData':getInstance(), 'IMAGEPATH'}), (get({Node, '$class'})):getChildNodes(Node))), get({'StringUtil':getInstance(), 'EMPTY_STRING'}))),
        put({This, logoFile}, (fun(Target_N66564) -> (get({Target_N66564, '$class'})):getNodeValue(Target_N66564) end)('DomSearchHelper':getNode(get({'LogoData':getInstance(), 'IMAGEFILENAME'}), (get({Node, '$class'})):getChildNodes(Node))));
init(This, HashMap) ->
    'Validation':init(This),
    init_fields(This),
        put({This, isFile}, true),
        (get({This, '$class'})):getFormData(This, HashMap).


% throws Exception
getFormData(This, HashMap) ->
        put({This, logoFileItem}, (get({HashMap, '$class'})):get(HashMap, get({'LogoData':getInstance(), 'IMAGE'}))),
        put({This, logoAbPath}, 'AbPath':new((get({HashMap, '$class'})):get(HashMap, get({'LogoData':getInstance(), 'IMAGEPATH'})), get({'StringUtil':getInstance(), 'EMPTY_STRING'}))),
        case (get({This, logoFileItem}) =/= undefined) of
            true ->
            put({This, logoFile}, (fun(Target_N67023) -> (get({Target_N67023, '$class'})):generateFileName(Target_N67023, (get({get({This, logoFileItem}), '$class'})):getName(get({This, logoFileItem}))) end)('HttpRequestUtil':getInstance()));
            false -> ok
        end,
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            StringBuffer = 'StringMaker':new(),
            (get({StringBuffer, '$class'})):append(StringBuffer, "HashMap: "),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({HashMap, '$class'})):toString(HashMap)),
            (get({StringBuffer, '$class'})):append(StringBuffer, "\nLogoFileName: "),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({This, logoFile})),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "getFormData()");
            false -> ok
        end.

isValid(This) ->
        try
        try
            Valid = true,
            FileData = 'FileData':getInstance(),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "LogoValidation", This, get({get({This, commonStrings}), 'IS_VALID'}));
                false -> ok
            end,
            case (not (fun(Target_N67846) -> (get({Target_N67846, '$class'})):isValidRequired(Target_N67846, (get({get({This, logoAbPath}), '$class'})):toString(get({This, logoAbPath})), 0, 512) end)('StringValidationUtil':getInstance())) of
                true ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["logoPath is invalid: ", (get({get({This, logoAbPath}), '$class'})):toString(get({This, logoAbPath}))]), This, get({get({This, commonStrings}), 'IS_VALID'}));
                    false -> ok
                end,
                throw({'$return', false});
                false -> ok
            end,
            case (not (fun(Target_N68186) -> (get({Target_N68186, '$class'})):isValidRequired(Target_N68186, get({This, logoFile}), get({FileData, 'MINLEN'}), get({FileData, 'MAXLEN'})) end)('StringValidationUtil':getInstance())) of
                true ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["logoFile is invalid: ", get({This, logoFile})]), This, get({get({This, commonStrings}), 'IS_VALID'}));
                    false -> ok
                end,
                throw({'$return', false});
                false -> ok
            end,
            case get({This, isFile}) of
                true ->
                case (get({This, logoFileItem}) =:= undefined) of
                    true ->
                    throw({'$return', false});
                    false -> ok
                end,
                case (((get({get({This, logoFileItem}), '$class'})):getSize(get({This, logoFileItem})) > get({FileData, 'MAXIMAGEFILESIZE'})) orelse ((get({get({This, logoFileItem}), '$class'})):getSize(get({This, logoFileItem})) < get({FileData, 'MINIMAGEFILESIZE'}))) of
                    true ->
                    case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                        true ->
                        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([lists:concat([lists:concat(["Image File Is Not The Right Size. ", get({FileData, 'MINIMAGEFILESIZE'})]), "< > "]), get({FileData, 'MAXIMAGEFILESIZE'})]), This, get({get({This, commonStrings}), 'IS_VALID'}));
                        false -> ok
                    end,
                    throw({'$return', false});
                    false -> ok
                end;
                false -> ok
            end,
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Logo Validation: ", Valid]), This, get({get({This, commonStrings}), 'IS_VALID'}));
                false -> ok
            end,
            Valid
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
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
            (get({StringBuffer, '$class'})):append(StringBuffer, "Logo is not valid."),
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

toHashMap(This) ->
        StringUtil = 'StringUtil':getInstance(),
        HashMap = (fun(Target_N70112) -> (get({Target_N70112, '$class'})):createHashMap(Target_N70112) end)('StdUtil':getInstance()),
        (get({HashMap, '$class'})):put(HashMap, get({'LogoData':getInstance(), 'IMAGE'}), get({StringUtil, 'EMPTY_STRING'})),
        case (get({This, logoFile}) =/= undefined) of
            true ->
            (get({HashMap, '$class'})):put(HashMap, get({'LogoData':getInstance(), 'IMAGEPATH'}), (get({get({This, logoAbPath}), '$class'})):toString(get({This, logoAbPath}))),
            (get({HashMap, '$class'})):put(HashMap, get({'LogoData':getInstance(), 'IMAGEFILENAME'}), get({This, logoFile}));
            false ->
            (get({HashMap, '$class'})):put(HashMap, get({'LogoData':getInstance(), 'IMAGEPATH'}), undefined),
            (get({HashMap, '$class'})):put(HashMap, get({'LogoData':getInstance(), 'IMAGEFILENAME'}), get({This, logoFile}))
        end,
        HashMap.

% throws Exception
toXmlNode(This, Document) ->
        HashMap = (get({This, '$class'})):toHashMap(This),
        'ModDomHelper':createNameValueNodes(Document, get({'LogoData':getInstance(), 'NAME'}), HashMap).

% throws Exception
processLogoFile(This) ->
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            StringBuffer = 'StringMaker':new(),
            (get({StringBuffer, '$class'})):append(StringBuffer, "Processing logoFile: "),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, logoAbPath}), '$class'})):toString(get({This, logoAbPath}))),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({This, logoFile})),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "processLogoFile()");
            false -> ok
        end,
        (fun(Target_N71056) -> (get({Target_N71056, '$class'})):saveFiles(Target_N71056, get({This, logoFileItem})) end)('LogoImageFileUtil':new(get({This, logoAbPath}), get({This, logoFile}))).

