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
% package org.allbinary.logic.visual.transform.info
% import java.util.Calendar
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.context.modules.storefront.StoreFrontData
% import org.allbinary.business.entry.EntryData
% import org.allbinary.data.tree.dom.document.DomDocumentHelper
% import org.allbinary.data.tree.dom.document.XmlDocumentHelper
% import org.allbinary.globals.FREEBLISKET_PATH_GLOBALS
% import org.allbinary.globals.URLGLOBALS
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.control.crypt.Encoder
% import org.allbinary.logic.control.crypt.file.CryptFileReader
% import org.allbinary.logic.io.OutputTypeData
% import org.allbinary.logic.io.path.AbFilePath
% import org.allbinary.logic.io.path.AbPath
% import org.allbinary.logic.io.path.AbPathData
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.string.StringValidationUtil
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory
% import org.allbinary.logic.visual.transform.info.data.TransformInfoDataData
% import org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfig
% import org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigAndManipulatorFactory
% import org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigInterface
% import org.allbinary.logic.visual.transform.info.template.TransformInfoTemplateData
% import org.allbinary.logic.visual.transform.info.viewObject.TransformInfoObjectData
% import org.allbinary.string.CommonSeps
% import org.allbinary.string.CommonStrings
% import org.w3c.dom.Document

-module('TransformInfo').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements TransformInfoInterface

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, abeClientInformation}, 'ServiceClientInformationInterfaceFactory':getInstance()),
    put({This, isChild}, false),
    put({This, name}, undefined),
    put({This, storeName}, undefined),
    put({This, objectFileName}, undefined),
    put({This, anyType}, undefined),
    put({This, objectConfigFileName}, undefined),
    put({This, objectConfigInterface}, undefined),
    put({This, template}, undefined),
    put({This, templateFileName}, undefined),
    put({This, dataFileName}, undefined),
    put({This, data}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

new(Name) when (is_list(Name) orelse Name =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Name),
    This.

init(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
    init_fields(This),
        (get({This, '$class'})):setName(This, Name).

new(Name, ObjectFileName, ObjectConfigFileName, TemplateFileName, DataFileName) when (is_list(Name) orelse Name =:= undefined), (is_list(ObjectFileName) orelse ObjectFileName =:= undefined), (is_list(ObjectConfigFileName) orelse ObjectConfigFileName =:= undefined), (is_list(TemplateFileName) orelse TemplateFileName =:= undefined), (is_list(DataFileName) orelse DataFileName =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Name, ObjectFileName, ObjectConfigFileName, TemplateFileName, DataFileName),
    This.

init(This, Name, ObjectFileName, ObjectConfigFileName, TemplateFileName, DataFileName) when (is_list(Name) orelse Name =:= undefined), (is_list(ObjectFileName) orelse ObjectFileName =:= undefined), (is_list(ObjectConfigFileName) orelse ObjectConfigFileName =:= undefined), (is_list(TemplateFileName) orelse TemplateFileName =:= undefined), (is_list(DataFileName) orelse DataFileName =:= undefined) ->
    init_fields(This),
        (get({This, '$class'})):setName(This, Name),
        (get({This, '$class'})):setObjectFile(This, ObjectFileName),
        (get({This, '$class'})):setObjectConfigFile(This, ObjectConfigFileName),
        (get({This, '$class'})):setTemplateFile(This, TemplateFileName),
        (get({This, '$class'})):setDataFile(This, DataFileName).

% throws Exception
override(This, HashMap) ->
        TransformInfoData = 'TransformInfoData':getInstance(),
        StringValidationUtil = 'StringValidationUtil':getInstance(),
        AName = (get({HashMap, '$class'})):get(HashMap, get({TransformInfoData, 'NAME'})),
        case (not (get({StringValidationUtil, '$class'})):isEmpty(StringValidationUtil, AName)) of
            true ->
            put({This, name}, AName);
            false -> ok
        end,
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            put({local, stringBuffer}, 'StringMaker':new()),
            (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), "TransformInfo properties overridden for: "),
            (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), (get({This, '$class'})):getName(This)),
            (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), "\n properties: "),
            (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), (get({HashMap, '$class'})):toString(HashMap)),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({get({local, stringBuffer}), '$class'})):toString(get({local, stringBuffer})), This, "override(HashMap hashMap)");
            false -> ok
        end,
        AStoreName = (get({HashMap, '$class'})):get(HashMap, get({'StoreFrontData':getInstance(), 'NAME'})),
        case (not (get({StringValidationUtil, '$class'})):isEmpty(StringValidationUtil, AStoreName)) of
            true ->
            put({This, storeName}, AStoreName);
            false -> ok
        end,
        AObjectFileName = (get({HashMap, '$class'})):get(HashMap, get({TransformInfoData, 'OBJECTFILENAME'})),
        case (not (get({StringValidationUtil, '$class'})):isEmpty(StringValidationUtil, AObjectFileName)) of
            true ->
            put({This, objectFileName}, AObjectFileName);
            false -> ok
        end,
        put({local, stringBuffer}, 'StringMaker':new()),
        (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), (get({get({'TransformInfo', 'URLGLOBALS'}), '$class'})):getMainPath(get({'TransformInfo', 'URLGLOBALS'}))),
        (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), get({(get({get({'TransformInfo', 'FREEBLISKET_PATH_GLOBALS'}), '$class'})):getInstance(get({'TransformInfo', 'FREEBLISKET_PATH_GLOBALS'})), 'XSLPATH'})),
        (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), get({This, storeName})),
        (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), get({'AbPathData':getInstance(), 'SEPARATOR'})),
        FileAbPath = 'AbPath':new((get({get({local, stringBuffer}), '$class'})):toString(get({local, stringBuffer})), get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
        AObject = (get({HashMap, '$class'})):get(HashMap, get({TransformInfoData, 'OBJECT'})),
        case (not (get({StringValidationUtil, '$class'})):isEmpty(StringValidationUtil, AObject)) of
            true ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["TransformInfo override view Object for: ", (get({This, '$class'})):getName(This)]), This, "override(HashMap hashMap)");
                false -> ok
            end,
            put({local, fileDataString}, (fun(Target_N69112) -> (get({Target_N69112, '$class'})):get(Target_N69112, 'AbPath':new((get({FileAbPath, '$class'})):toString(FileAbPath), AObject)) end)('CryptFileReader':new(get({'TransformInfoObjectData':getInstance(), 'UNCRYPTED_EXTENSION'}), get({'TransformInfoObjectData':getInstance(), 'ENCRYPTED_EXTENSION'})))),
            case (get({local, fileDataString}) =/= undefined) of
                true ->
                put({This, anyType}, get({local, fileDataString}));
                false -> ok
            end;
            false -> ok
        end,
        case (not (get({StringValidationUtil, '$class'})):isEmpty(StringValidationUtil, (get({HashMap, '$class'})):get(HashMap, get({TransformInfoData, 'OBJECTCONFIG'})))) of
            true ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["TransformInfo override ObjectConfig for: ", (get({This, '$class'})):getName(This)]), This, "override(HashMap hashMap)");
                false -> ok
            end,
            (get({This, '$class'})):setObjectConfig(This, (get({HashMap, '$class'})):get(HashMap, get({TransformInfoData, 'OBJECTCONFIG'})));
            false -> ok
        end,
        ObjectConfigFileName = (get({HashMap, '$class'})):get(HashMap, get({TransformInfoData, 'OBJECTCONFIGFILENAME'})),
        case (not (get({StringValidationUtil, '$class'})):isEmpty(StringValidationUtil, ObjectConfigFileName)) of
            true ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["TransformInfo override ObjectConfig File for: ", (get({This, '$class'})):getName(This)]), This, "override(HashMap hashMap)");
                false -> ok
            end,
            (get({This, '$class'})):setObjectConfigFile(This, ObjectConfigFileName);
            false -> ok
        end,
        Type = (get({HashMap, '$class'})):get(HashMap, get({'OutputTypeData':getInstance(), 'NAME'})),
        case (not (get({StringValidationUtil, '$class'})):isEmpty(StringValidationUtil, Type)) of
            true ->
            case ((get({This, '$class'})):getObjectConfigInterface(This) =:= undefined) of
                true ->
                (get({This, '$class'})):setObjectConfigInterface(This, 'TransformInfoObjectConfig':new(This));
                false -> ok
            end,
            (fun(Target_N70238) -> (get({Target_N70238, '$class'})):setOutputTypeName(Target_N70238, Type) end)((get({This, '$class'})):getObjectConfigInterface(This));
            false -> ok
        end,
        ATemplateFileName = (get({HashMap, '$class'})):get(HashMap, get({TransformInfoData, 'TEMPLATEFILENAME'})),
        case (not (get({StringValidationUtil, '$class'})):isEmpty(StringValidationUtil, ATemplateFileName)) of
            true ->
            put({This, templateFileName}, ATemplateFileName);
            false -> ok
        end,
        ATemplate = (get({HashMap, '$class'})):get(HashMap, get({TransformInfoData, 'TEMPLATE'})),
        case (not (get({StringValidationUtil, '$class'})):isEmpty(StringValidationUtil, ATemplate)) of
            true ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["TransformInfo override Template for: ", (get({This, '$class'})):getName(This)]), This, "override(HashMap hashMap)");
                false -> ok
            end,
            put({local, fileDataString}, (fun(Target_N70769) -> (get({Target_N70769, '$class'})):get(Target_N70769, 'AbPath':new((get({FileAbPath, '$class'})):toString(FileAbPath), ATemplate)) end)('CryptFileReader':new(get({'TransformInfoTemplateData':getInstance(), 'UNCRYPTED_EXTENSION'}), get({'TransformInfoTemplateData':getInstance(), 'ENCRYPTED_EXTENSION'})))),
            case (not (get({StringValidationUtil, '$class'})):isEmpty(StringValidationUtil, get({local, fileDataString}))) of
                true ->
                put({This, template}, get({local, fileDataString}));
                false -> ok
            end;
            false -> ok
        end,
        ADataFileName = (get({HashMap, '$class'})):get(HashMap, get({TransformInfoData, 'DATAFILENAME'})),
        case (not (get({StringValidationUtil, '$class'})):isEmpty(StringValidationUtil, ADataFileName)) of
            true ->
            put({This, dataFileName}, ADataFileName);
            false -> ok
        end,
        AData = (get({HashMap, '$class'})):get(HashMap, get({TransformInfoData, 'DATA'})),
        case (not (get({StringValidationUtil, '$class'})):isEmpty(StringValidationUtil, AData)) of
            true ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["TransformInfo override Data for: ", (get({This, '$class'})):getName(This)]), This, "override(HashMap hashMap)");
                false -> ok
            end,
            put({local, fileDataString}, (fun(Target_N71469) -> (get({Target_N71469, '$class'})):get(Target_N71469, 'AbPath':new((get({FileAbPath, '$class'})):toString(FileAbPath), AData)) end)('CryptFileReader':new(get({'TransformInfoDataData':getInstance(), 'UNCRYPTED_EXTENSION'}), get({'TransformInfoDataData':getInstance(), 'ENCRYPTED_EXTENSION'})))),
            case (not (get({StringValidationUtil, '$class'})):isEmpty(StringValidationUtil, get({local, fileDataString}))) of
                true ->
                put({This, data}, get({local, fileDataString}));
                false -> ok
            end;
            false -> ok
        end,
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            put({local, stringBuffer}, 'StringMaker':new()),
            (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), "Name: "),
            (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), AName),
            (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), "\nTemp Object File: "),
            (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), AObject),
            (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), "\nTemp Object Config File: "),
            (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), (fun(Target_N72035) -> (get({Target_N72035, '$class'})):toString(Target_N72035) end)((get({This, '$class'})):getObjectConfigFilePath(This))),
            (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), "\nTemp Template File: "),
            (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), ATemplate),
            (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), "\nTemp Data File: "),
            (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), AData),
            (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), "\nStore Name: "),
            (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), AStoreName),
            (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), "\nObjectFile: "),
            (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), (get({This, '$class'})):getObjectFile(This)),
            (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), "->TransformInfo"),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({get({local, stringBuffer}), '$class'})):toString(get({local, stringBuffer})), This, "TransformInfoInterface(HashMap)");
            false -> ok
        end,
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPERFACTORY'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({This, '$class'})):log(This), This, "override");
            false -> ok
        end.

log(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "Name: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, name})),
        (get({StringBuffer, '$class'})):append(StringBuffer, "\nObject File: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, objectFileName})),
        (get({StringBuffer, '$class'})):append(StringBuffer, "\nObject Config File Path: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getObjectConfigFile(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, "\nTemplate File: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, templateFileName})),
        (get({StringBuffer, '$class'})):append(StringBuffer, "\nData File: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, dataFileName})),
        (get({StringBuffer, '$class'})):append(StringBuffer, "\nStore Name: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, storeName})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'CommonSeps':getInstance(), 'NEW_LINE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getObjectFile(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, "->TransformInfo"),
        (get({StringBuffer, '$class'})):append(StringBuffer, "TransformInfoInterface(HashMap)"),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

setName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, name}, Value).

setStoreName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, storeName}, Value).

getStoreName(This) ->
        get({This, storeName}).

setObject(This, AnyType) ->
        put({This, anyType}, AnyType).

setObjectFile(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, objectFileName}, Value).

setTemplate(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, template}, Value).

setTemplateFile(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, templateFileName}, Value).

% throws Exception
setObjectConfigFileName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, objectConfigFileName}, Value).

% throws Exception
setObjectConfigFile(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, objectConfigFileName}, Value),
        (get({This, '$class'})):setObjectConfigInterface(This, (fun(Target_N73845) -> (get({Target_N73845, '$class'})):getInstance(Target_N73845, get({This, abeClientInformation}), This, (get({This, '$class'})):getObjectConfigFilePath(This)) end)('TransformInfoObjectConfigAndManipulatorFactory':getInstance())).

% throws Exception
setObjectConfig(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        Document = 'DomDocumentHelper':create(Value),
        (get({This, '$class'})):setObjectConfigInterface(This, (fun(Target_N74025) -> (get({Target_N74025, '$class'})):getInstance(Target_N74025, get({This, abeClientInformation}), This, Document) end)('TransformInfoObjectConfigAndManipulatorFactory':getInstance())).

setDataFile(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, dataFileName}, Value).

setData(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, data}, Value).

getName(This) ->
        get({This, name}).

getObject(This) ->
        get({This, anyType}).

getObjectFile(This) ->
        get({This, objectFileName}).

getTemplate(This) ->
        get({This, template}).

getTemplateFile(This) ->
        get({This, templateFileName}).

% throws Exception
getTemplateFilePath(This) ->
        'AbFilePath':new((get({This, '$class'})):getTemplateFile(This)).

% throws Exception
getObjectConfigFilePath(This) ->
        'AbFilePath':new((get({This, '$class'})):getObjectConfigFile(This)).

% throws Exception
getDataFilePath(This) ->
        'AbFilePath':new((get({This, '$class'})):getDataFile(This)).

getObjectConfigFile(This) ->
        get({This, objectConfigFileName}).

getData(This) ->
        StringValidationUtil = 'StringValidationUtil':getInstance(),
        DataFileString = (get({This, '$class'})):getDataFile(This),
        case (not (get({StringValidationUtil, '$class'})):isEmpty(StringValidationUtil, DataFileString)) of
            true ->
            try
                FileData = (fun(Target_N74914) -> (get({Target_N74914, '$class'})):get(Target_N74914, (get({This, '$class'})):getDataFilePath(This)) end)('CryptFileReader':new(get({'TransformInfoDataData':getInstance(), 'UNCRYPTED_EXTENSION'}), get({'TransformInfoDataData':getInstance(), 'ENCRYPTED_EXTENSION'}))),
                case (not (get({StringValidationUtil, '$class'})):isEmpty(StringValidationUtil, get({This, data}))) of
                    true ->
                    case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                        true ->
                        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Data File overriding existing data: ", (get({This, '$class'})):getDataFilePath(This)]), This, "getData()");
                        false -> ok
                    end;
                    false -> ok
                end,
                put({This, data}, FileData)
            catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEWERROR'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), lists:concat(["Could Not Load Data from: ", (get({This, '$class'})):getDataFile(This)]), This, "getData()", E);
                    false -> ok
                end
            end;
            false -> ok
        end,
        try
            case (not (get({StringValidationUtil, '$class'})):isEmpty(StringValidationUtil, get({This, data}))) of
                true ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEWERROR'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Data: ", 'XmlDocumentHelper':toString('DomDocumentHelper':create(get({This, data})))]), This, "getData()");
                    false -> ok
                end;
                false ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEWERROR'})) of
                    true ->
                    StringBuffer = 'StringMaker':new(),
                    (get({StringBuffer, '$class'})):append(StringBuffer, "Name: "),
                    (get({StringBuffer, '$class'})):append(StringBuffer, get({This, name})),
                    (get({StringBuffer, '$class'})):append(StringBuffer, "\nEmpty Data For: "),
                    (get({StringBuffer, '$class'})):append(StringBuffer, DataFileString),
                    (get({StringBuffer, '$class'})):append(StringBuffer, "\nPath: "),
                    (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N76015) -> (get({Target_N76015, '$class'})):toFileSystemString(Target_N76015) end)((get({This, '$class'})):getDataFilePath(This))),
                    case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEWERROR'})) of
                        true ->
                        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "getData()");
                        false -> ok
                    end;
                    false -> ok
                end
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEWERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), lists:concat(["Could Not Preview Data: ", get({This, data})]), This, "getData()", E);
                false -> ok
            end
        end,
        get({This, data}).

% throws Exception
getDataDocument(This) ->
        try
        LocalData = (get({This, '$class'})):getData(This),
        StringValidationUtil = 'StringValidationUtil':getInstance(),
        case (get({StringValidationUtil, '$class'})):isEmpty(StringValidationUtil, LocalData) of
            true ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEWERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "No Data So Creating New Document", This, "getDataDocument()");
                false -> ok
            end,
            throw({'$return', 'DomDocumentHelper':create()});
            false ->
            Document = 'DomDocumentHelper':create(LocalData),
            throw({'$return', Document})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getDataFile(This) ->
        get({This, dataFileName}).

toHashMap(This) ->
        TransformInfoData = 'TransformInfoData':getInstance(),
        HashMap = (fun(Target_N77416) -> (get({Target_N77416, '$class'})):createHashMap(Target_N77416) end)('StdUtil':getInstance()),
        (get({HashMap, '$class'})):put(HashMap, get({TransformInfoData, 'NAME'}), get({This, name})),
        (get({HashMap, '$class'})):put(HashMap, get({'StoreFrontData':getInstance(), 'NAME'}), get({This, storeName})),
        (get({HashMap, '$class'})):put(HashMap, get({TransformInfoData, 'OBJECTFILENAME'}), get({This, objectFileName})),
        (get({HashMap, '$class'})):put(HashMap, get({TransformInfoData, 'OBJECT'}), get({This, anyType})),
        (get({HashMap, '$class'})):put(HashMap, get({TransformInfoData, 'OBJECTCONFIGFILENAME'}), (get({This, '$class'})):getObjectConfigFile(This)),
        (get({HashMap, '$class'})):put(HashMap, get({TransformInfoData, 'OBJECTCONFIG'}), 'Encoder':encode((fun(Target_N77767) -> (get({Target_N77767, '$class'})):getBytes(Target_N77767) end)((fun(Target_N77774) -> (get({Target_N77774, '$class'})):toString(Target_N77774) end)((get({This, '$class'})):getObjectConfigInterface(This))))),
        (get({HashMap, '$class'})):put(HashMap, get({TransformInfoData, 'TEMPLATEFILENAME'}), get({This, templateFileName})),
        (get({HashMap, '$class'})):put(HashMap, get({TransformInfoData, 'TEMPLATE'}), get({This, template})),
        (get({HashMap, '$class'})):put(HashMap, get({TransformInfoData, 'DATAFILENAME'}), get({This, dataFileName})),
        (get({HashMap, '$class'})):put(HashMap, get({TransformInfoData, 'DATA'}), 'Encoder':encode((get({get({This, data}), '$class'})):getBytes(get({This, data})))),
        Calendar = 'Calendar':getInstance(),
        Time = allbinary_java:to_string((fun(Target_N78097) -> (get({Target_N78097, '$class'})):toString(Target_N78097) end)((get({Calendar, '$class'})):getTimeInMillis(Calendar))),
        (get({HashMap, '$class'})):put(HashMap, get({'EntryData':getInstance(), 'LASTMODIFIED'}), Time),
        HashMap.

toVector(This) ->
        Vector = 'BasicArrayListD':new(),
        (get({Vector, '$class'})):add(Vector, get({This, name})),
        (get({Vector, '$class'})):add(Vector, get({This, storeName})),
        (get({Vector, '$class'})):add(Vector, get({This, objectFileName})),
        (get({Vector, '$class'})):add(Vector, get({This, anyType})),
        (get({Vector, '$class'})):add(Vector, (get({This, '$class'})):getObjectConfigFile(This)),
        (get({Vector, '$class'})):add(Vector, 'Encoder':encode((fun(Target_N78501) -> (get({Target_N78501, '$class'})):getBytes(Target_N78501) end)((fun(Target_N78508) -> (get({Target_N78508, '$class'})):toString(Target_N78508) end)((get({This, '$class'})):getObjectConfigInterface(This))))),
        (get({Vector, '$class'})):add(Vector, get({This, templateFileName})),
        (get({Vector, '$class'})):add(Vector, get({This, template})),
        (get({Vector, '$class'})):add(Vector, get({This, dataFileName})),
        (get({Vector, '$class'})):add(Vector, 'Encoder':encode((get({get({This, data}), '$class'})):getBytes(get({This, data})))),
        Calendar = 'Calendar':getInstance(),
        Time = allbinary_java:to_string((fun(Target_N78767) -> (get({Target_N78767, '$class'})):toString(Target_N78767) end)((get({Calendar, '$class'})):getTimeInMillis(Calendar))),
        (get({Vector, '$class'})):add(Vector, Time),
        (get({Vector, '$class'})):add(Vector, Time),
        Vector.

getKey(This) ->
        (get({This, '$class'})):getName(This).

setChild(This) ->
        put({This, isChild}, true).

isChild(This) ->
        get({This, isChild}).

getObjectConfigInterface(This) ->
        get({This, objectConfigInterface}).

setObjectConfigInterface(This, ObjectConfigInterface) ->
        put({This, objectConfigInterface}, ObjectConfigInterface).

