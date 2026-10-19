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
% package org.allbinary.business.context.modules.storefront
% import java.util.Calendar
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import javax.servlet.http.HttpServletRequest
% import org.allbinary.business.context.configuration.ContextConfiguration
% import org.allbinary.business.context.configuration.ContextConfigurationDomDocumentMapping
% import org.allbinary.business.context.configuration.ContextConfigurationInterface
% import org.allbinary.business.context.configuration.ContextConfigurationInterfaceFactory
% import org.allbinary.business.entry.EntryData
% import org.allbinary.business.user.UserData
% import org.allbinary.data.tree.dom.document.DomDocumentHelper
% import org.allbinary.globals.FREEBLISKET_PATH_GLOBALS
% import org.allbinary.globals.URLGLOBALS
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.http.request.RequestParams
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.io.file.AbFile
% import org.allbinary.logic.io.file.FileUtil
% import org.allbinary.logic.io.file.directory.Directory
% import org.allbinary.logic.io.path.AbPath
% import org.allbinary.logic.io.path.AbPathData
% import org.allbinary.logic.io.path.AbPathUtil
% import org.allbinary.logic.string.SpecialCharacterUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.string.StringValidationUtil
% import org.allbinary.logic.string.regex.replace.Replace
% import org.allbinary.logic.string.tokens.Tokenizer
% import org.allbinary.string.CommonSeps
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.apache.commons.lang3.StringEscapeUtils
% import org.w3c.dom.Document

-module('StoreFront').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements StoreFrontInterface

static_init() ->
    put({?MODULE, 'RESOURCES'}, lists:concat([" Resources", get({'AbPathData':getInstance(), 'SEPARATOR'})])),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, directory}, 'Directory':getInstance()),
    put({This, stringUtil}, 'StringUtil':getInstance()),
    put({This, abPathUtil}, 'AbPathUtil':getInstance()),
    put({This, name}, get({get({This, stringUtil}), 'EMPTY_STRING'})),
    put({This, basketName}, get({get({This, stringUtil}), 'EMPTY_STRING'})),
    put({This, homeHostName}, get({get({This, stringUtil}), 'EMPTY_STRING'})),
    put({This, homeHostNamePath}, get({get({This, abPathUtil}), 'NO_ABPATH'})),
    put({This, hostName}, get({get({This, stringUtil}), 'EMPTY_STRING'})),
    put({This, hostNamePath}, get({get({This, abPathUtil}), 'NO_ABPATH'})),
    put({This, testHomeHostName}, get({get({This, stringUtil}), 'EMPTY_STRING'})),
    put({This, testHomeHostNamePath}, get({get({This, abPathUtil}), 'NO_ABPATH'})),
    put({This, testHostName}, get({get({This, stringUtil}), 'EMPTY_STRING'})),
    put({This, testHostNamePath}, get({get({This, abPathUtil}), 'NO_ABPATH'})),
    put({This, imagePath}, get({get({This, abPathUtil}), 'NO_ABPATH'})),
    put({This, staticPath}, get({get({This, abPathUtil}), 'NO_ABPATH'})),
    put({This, categoryPath}, get({get({This, abPathUtil}), 'NO_ABPATH'})),
    put({This, inventoryControl}, get({get({This, stringUtil}), 'EMPTY_STRING'})),
    put({This, contextConfigurationInterface}, undefined),
    put({This, subStores}, get({get({This, stringUtil}), 'EMPTY_STRING'})),
    put({This, tagLocation}, get({get({This, stringUtil}), 'EMPTY_STRING'})),
    put({This, packageLocation}, get({get({This, stringUtil}), 'EMPTY_STRING'})),
    put({This, ftp}, get({get({This, stringUtil}), 'EMPTY_STRING'})),
    put({This, ftpPath}, get({get({This, abPathUtil}), 'NO_ABPATH'})),
    put({This, ftpUserName}, get({get({This, stringUtil}), 'EMPTY_STRING'})),
    put({This, ftpPassword}, get({get({This, stringUtil}), 'EMPTY_STRING'})),
    put({This, testFtp}, get({get({This, stringUtil}), 'EMPTY_STRING'})),
    put({This, testFtpPath}, get({get({This, abPathUtil}), 'NO_ABPATH'})),
    put({This, testFtpUserName}, get({get({This, stringUtil}), 'EMPTY_STRING'})),
    put({This, testFtpPassword}, get({get({This, stringUtil}), 'EMPTY_STRING'})),
    put({This, timeCreated}, get({get({This, stringUtil}), 'EMPTY_STRING'})),
    put({This, lastModified}, get({get({This, stringUtil}), 'EMPTY_STRING'})),
    put({This, 'MINCHAR'}, 0),
    put({This, 'MINSTORENAMELENGTH'}, 1),
    put({This, 'MAXCHAR'}, 255),
    put({This, 'EMPTY_STRING'}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
    put({This, 'ONE_EMPTY_STRING_ARRAY'}, get({'StringUtil':getInstance(), 'ONE_EMPTY_STRING_ARRAY'})),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        put({This, contextConfigurationInterface}, 'ContextConfiguration':new()).

new(Request) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Request),
    This;
new(HashMap) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, HashMap),
    This.

init(This, Request) ->
    init_fields(This),
        (get({This, '$class'})):getFormData(This, (fun(Target_N68648) -> (get({Target_N68648, '$class'})):toHashMap(Target_N68648) end)('RequestParams':new(Request))),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'EMAILLOGGING'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "TWB- needs update for adding and updating context configuration - currently defaults to admin context config", This, "StoreFront");
            false -> ok
        end,
        (get({This, '$class'})):setContextConfigurationInterface(This, (fun(Target_N68908) -> (get({Target_N68908, '$class'})):getInstance(Target_N68908, "Admin") end)('ContextConfigurationInterfaceFactory':getInstance()));
init(This, HashMap) ->
    init_fields(This),
        (get({This, '$class'})):getFormData(This, HashMap),
        DomDocumentString = (get({HashMap, '$class'})):get(HashMap, get({'StoreFrontData':getInstance(), 'CONFIGURATION'})),
        case (DomDocumentString =:= undefined) of
            true ->
            Document = 'DomDocumentHelper':create(DomDocumentString),
            (get({This, '$class'})):setContextConfigurationInterface(This, (fun(Target_N69221) -> (get({Target_N69221, '$class'})):getInstance(Target_N69221, Document) end)('ContextConfigurationInterfaceFactory':getInstance()));
            false -> ok
        end.


isColumn(This, ColumnName) when (is_list(ColumnName) orelse ColumnName =:= undefined) ->
        try
        case (((get({ColumnName, '$class'})):compareTo(ColumnName, get({'StoreFrontData':getInstance(), 'NAME'})) =:= 0) orelse ((get({ColumnName, '$class'})):compareTo(ColumnName, get({'UserData', 'MAINEMAIL'})) =:= 0)) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
createPath(This, Key, HashMap) when (is_list(Key) orelse Key =:= undefined) ->
        'AbPath':new((get({This, '$class'})):create(This, get({This, 'EMPTY_STRING'}), Key, HashMap), get({'StringUtil':getInstance(), 'EMPTY_STRING'})).

% throws Exception
createPath(This, Append, Key, HashMap) when (is_list(Append) orelse Append =:= undefined), (is_list(Key) orelse Key =:= undefined) ->
        'AbPath':new((get({This, '$class'})):create(This, Append, Key, HashMap), get({'StringUtil':getInstance(), 'EMPTY_STRING'})).

get(This, Key, HashMap) when (is_list(Key) orelse Key =:= undefined) ->
        (get({This, '$class'})):create(This, get({This, 'EMPTY_STRING'}), Key, HashMap).

create(This, Append, Key, HashMap) when (is_list(Append) orelse Append =:= undefined), (is_list(Key) orelse Key =:= undefined) ->
        try
        Path = (get({HashMap, '$class'})):get(HashMap, Key),
        case (fun(Target_N70030) -> (get({Target_N70030, '$class'})):isEmpty(Target_N70030, Path) end)('StringValidationUtil':getInstance()) of
            true ->
            throw({'$return', get({This, 'EMPTY_STRING'})});
            false ->
            case (get({This, '$class'})):isColumn(This, Path) of
                true ->
                throw({'$return', lists:concat([(get({HashMap, '$class'})):get(HashMap, Path), Append])});
                false ->
                throw({'$return', Path})
            end
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
getFormData(This, StoreHashMap) ->
        StoreFrontData = 'StoreFrontData':getInstance(),
        put({This, name}, (get({StoreHashMap, '$class'})):get(StoreHashMap, get({StoreFrontData, 'NAME'}))),
        put({This, basketName}, (get({StoreHashMap, '$class'})):get(StoreHashMap, get({StoreFrontData, 'NAME'}))),
        put({This, homeHostName}, (get({StoreHashMap, '$class'})):get(StoreHashMap, get({StoreFrontData, 'HOMEHOSTNAME'}))),
        put({This, homeHostNamePath}, (get({This, '$class'})):createPath(This, get({StoreFrontData, 'HOMEHOSTNAMEPATH'}), StoreHashMap)),
        put({This, hostName}, (get({StoreHashMap, '$class'})):get(StoreHashMap, get({StoreFrontData, 'HOSTNAME'}))),
        put({This, hostNamePath}, (get({This, '$class'})):createPath(This, get({StoreFrontData, 'HOSTNAMEPATH'}), StoreHashMap)),
        put({This, testHomeHostName}, (get({StoreHashMap, '$class'})):get(StoreHashMap, get({StoreFrontData, 'TESTHOMEHOSTNAME'}))),
        put({This, testHomeHostNamePath}, (get({This, '$class'})):createPath(This, get({StoreFrontData, 'TESTHOMEHOSTNAMEPATH'}), StoreHashMap)),
        put({This, testHostName}, (get({StoreHashMap, '$class'})):get(StoreHashMap, get({StoreFrontData, 'TESTHOSTNAME'}))),
        put({This, testHostNamePath}, (get({This, '$class'})):createPath(This, get({StoreFrontData, 'TESTHOSTNAMEPATH'}), StoreHashMap)),
        put({This, imagePath}, (get({This, '$class'})):createPath(This, get({'StoreFront', 'RESOURCES'}), get({StoreFrontData, 'IMAGEPATH'}), StoreHashMap)),
        put({This, staticPath}, (get({This, '$class'})):createPath(This, lists:concat([" Products", get({'AbPathData':getInstance(), 'SEPARATOR'})]), get({StoreFrontData, 'STATICPATH'}), StoreHashMap)),
        put({This, categoryPath}, (get({This, '$class'})):createPath(This, get({'StoreFront', 'RESOURCES'}), get({StoreFrontData, 'CATEGORYPATH'}), StoreHashMap)),
        put({This, inventoryControl}, (get({StoreHashMap, '$class'})):get(StoreHashMap, get({StoreFrontData, 'INVENTORYCONTROL'}))),
        put({This, subStores}, (get({StoreHashMap, '$class'})):get(StoreHashMap, get({StoreFrontData, 'SUBSTORES'}))),
        put({This, tagLocation}, (get({StoreHashMap, '$class'})):get(StoreHashMap, get({StoreFrontData, 'TAGLOCATION'}))),
        put({This, packageLocation}, (get({StoreHashMap, '$class'})):get(StoreHashMap, get({StoreFrontData, 'PACKAGELOCATION'}))),
        put({This, ftp}, (get({StoreHashMap, '$class'})):get(StoreHashMap, get({StoreFrontData, 'FTP'}))),
        put({This, ftpPath}, (get({This, '$class'})):createPath(This, get({StoreFrontData, 'FTPPATH'}), StoreHashMap)),
        put({This, ftpUserName}, (get({StoreHashMap, '$class'})):get(StoreHashMap, get({StoreFrontData, 'FTPUSERNAME'}))),
        put({This, ftpPassword}, (get({StoreHashMap, '$class'})):get(StoreHashMap, get({StoreFrontData, 'FTPPASSWORD'}))),
        put({This, testFtp}, (get({StoreHashMap, '$class'})):get(StoreHashMap, get({StoreFrontData, 'TESTFTP'}))),
        put({This, testFtpPath}, (get({This, '$class'})):createPath(This, get({StoreFrontData, 'TESTFTPPATH'}), StoreHashMap)),
        put({This, testFtpUserName}, (get({StoreHashMap, '$class'})):get(StoreHashMap, get({StoreFrontData, 'TESTFTPUSERNAME'}))),
        put({This, testFtpPassword}, (get({StoreHashMap, '$class'})):get(StoreHashMap, get({StoreFrontData, 'TESTFTPPASSWORD'}))),
        put({This, timeCreated}, (get({StoreHashMap, '$class'})):get(StoreHashMap, get({'EntryData':getInstance(), 'TIMECREATED'}))),
        put({This, lastModified}, (get({StoreHashMap, '$class'})):get(StoreHashMap, get({'EntryData':getInstance(), 'LASTMODIFIED'}))).

isNameValid(This) ->
        try
        case (not (fun(Target_N72206) -> (get({Target_N72206, '$class'})):isValidRequired(Target_N72206, get({This, name}), get({This, 'MINSTORENAMELENGTH'}), get({This, 'MAXCHAR'})) end)('StringValidationUtil':getInstance())) of
            true ->
            throw({'$return', false});
            false ->
            put({local, isEscapedCharactersContained}, false),
            StoreNameEscaped = 'StringEscapeUtils':escapeHtml3(get({This, name})),
            case ((get({get({This, name}), '$class'})):compareTo(get({This, name}), StoreNameEscaped) =/= 0) of
                true ->
                put({local, isEscapedCharactersContained}, true);
                false -> ok
            end,
            StringValidationUtil = 'StringValidationUtil':getInstance(),
            put({local, isSpacesContained}, false),
            case (get({StringValidationUtil, '$class'})):containsSpaces(StringValidationUtil, get({This, name})) of
                true ->
                put({local, isSpacesContained}, true);
                false -> ok
            end,
            case (get({local, isSpacesContained}) orelse get({local, isEscapedCharactersContained})) of
                true ->
                HashMap = 'SpecialCharacterUtil':getHashMap(),
                (get({HashMap, '$class'})):put(HashMap, array:from_list([get({'CommonSeps':getInstance(), 'SPACE'})]), get({This, 'ONE_EMPTY_STRING_ARRAY'})),
                put({This, name}, (fun(Target_N72757) -> (get({Target_N72757, '$class'})):all(Target_N72757, get({This, name})) end)('Replace':new(HashMap)));
                false -> ok
            end
        end,
        true
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isValid(This) ->
        try
        put({local, valid}, true),
        put({local, valid}, (get({This, '$class'})):isNameValid(This)),
        StringValidationUtil = 'StringValidationUtil':getInstance(),
        case (not (get({StringValidationUtil, '$class'})):isValidRequired(StringValidationUtil, get({This, basketName}), get({This, 'MINCHAR'}), get({This, 'MAXCHAR'}))) of
            true ->
            put({local, valid}, false);
            false -> ok
        end,
        case (not (get({StringValidationUtil, '$class'})):isValidRequired(StringValidationUtil, get({This, homeHostName}), get({This, 'MINCHAR'}), get({This, 'MAXCHAR'}))) of
            true ->
            put({local, valid}, false);
            false -> ok
        end,
        case (not (get({StringValidationUtil, '$class'})):isValidNotRequired(StringValidationUtil, (get({get({This, homeHostNamePath}), '$class'})):toString(get({This, homeHostNamePath})), get({This, 'MINCHAR'}), get({This, 'MAXCHAR'}))) of
            true ->
            put({local, valid}, false);
            false -> ok
        end,
        case (not (get({StringValidationUtil, '$class'})):isValidRequired(StringValidationUtil, get({This, hostName}), get({This, 'MINCHAR'}), get({This, 'MAXCHAR'}))) of
            true ->
            put({local, valid}, false);
            false -> ok
        end,
        case (not (get({StringValidationUtil, '$class'})):isValidRequired(StringValidationUtil, (get({get({This, hostNamePath}), '$class'})):toString(get({This, hostNamePath})), get({This, 'MINCHAR'}), get({This, 'MAXCHAR'}))) of
            true ->
            put({local, valid}, false);
            false -> ok
        end,
        case (not (get({StringValidationUtil, '$class'})):isValidNotRequired(StringValidationUtil, get({This, testHomeHostName}), get({This, 'MINCHAR'}), get({This, 'MAXCHAR'}))) of
            true ->
            put({local, valid}, false);
            false -> ok
        end,
        case (not (get({StringValidationUtil, '$class'})):isValidNotRequired(StringValidationUtil, (get({get({This, testHomeHostNamePath}), '$class'})):toString(get({This, testHomeHostNamePath})), get({This, 'MINCHAR'}), get({This, 'MAXCHAR'}))) of
            true ->
            put({local, valid}, false);
            false -> ok
        end,
        case (not (get({StringValidationUtil, '$class'})):isValidNotRequired(StringValidationUtil, get({This, testHostName}), get({This, 'MINCHAR'}), get({This, 'MAXCHAR'}))) of
            true ->
            put({local, valid}, false);
            false -> ok
        end,
        case (not (get({StringValidationUtil, '$class'})):isValidNotRequired(StringValidationUtil, (get({get({This, testHostNamePath}), '$class'})):toString(get({This, testHostNamePath})), get({This, 'MINCHAR'}), get({This, 'MAXCHAR'}))) of
            true ->
            put({local, valid}, false);
            false -> ok
        end,
        case (not (get({StringValidationUtil, '$class'})):isValidRequired(StringValidationUtil, (get({get({This, imagePath}), '$class'})):toString(get({This, imagePath})), get({This, 'MINCHAR'}), get({This, 'MAXCHAR'}))) of
            true ->
            put({local, valid}, false);
            false -> ok
        end,
        case (not (get({StringValidationUtil, '$class'})):isValidRequired(StringValidationUtil, (get({get({This, staticPath}), '$class'})):toString(get({This, staticPath})), get({This, 'MINCHAR'}), get({This, 'MAXCHAR'}))) of
            true ->
            put({local, valid}, false);
            false -> ok
        end,
        case (not (get({StringValidationUtil, '$class'})):isValidRequired(StringValidationUtil, (get({get({This, categoryPath}), '$class'})):toString(get({This, categoryPath})), get({This, 'MINCHAR'}), get({This, 'MAXCHAR'}))) of
            true ->
            put({local, valid}, false);
            false -> ok
        end,
        case (not (get({StringValidationUtil, '$class'})):isValidRequired(StringValidationUtil, get({This, inventoryControl}), get({This, 'MINCHAR'}), get({This, 'MAXCHAR'}))) of
            true ->
            put({local, valid}, false);
            false -> ok
        end,
        case (not (get({StringValidationUtil, '$class'})):isValidNotRequired(StringValidationUtil, get({This, subStores}), get({This, 'MINCHAR'}), get({This, 'MAXCHAR'}))) of
            true ->
            put({local, valid}, false);
            false -> ok
        end,
        case (not (get({StringValidationUtil, '$class'})):isValidNotRequired(StringValidationUtil, get({This, tagLocation}), get({This, 'MINCHAR'}), get({This, 'MAXCHAR'}))) of
            true ->
            put({local, valid}, false);
            false -> ok
        end,
        case (not (get({StringValidationUtil, '$class'})):isValidRequired(StringValidationUtil, get({This, packageLocation}), get({This, 'MINCHAR'}), get({This, 'MAXCHAR'}))) of
            true ->
            put({local, valid}, false);
            false -> ok
        end,
        case (not (get({StringValidationUtil, '$class'})):isValidNotRequired(StringValidationUtil, get({This, ftp}), get({This, 'MINCHAR'}), get({This, 'MAXCHAR'}))) of
            true ->
            put({local, valid}, false);
            false -> ok
        end,
        case (not (get({StringValidationUtil, '$class'})):isValidNotRequired(StringValidationUtil, (get({get({This, ftpPath}), '$class'})):toString(get({This, ftpPath})), get({This, 'MINCHAR'}), get({This, 'MAXCHAR'}))) of
            true ->
            put({local, valid}, false);
            false -> ok
        end,
        case (not (get({StringValidationUtil, '$class'})):isValidNotRequired(StringValidationUtil, get({This, ftpUserName}), get({This, 'MINCHAR'}), get({This, 'MAXCHAR'}))) of
            true ->
            put({local, valid}, false);
            false -> ok
        end,
        case (not (get({StringValidationUtil, '$class'})):isValidNotRequired(StringValidationUtil, get({This, ftpPassword}), get({This, 'MINCHAR'}), get({This, 'MAXCHAR'}))) of
            true ->
            put({local, valid}, false);
            false -> ok
        end,
        case (not (get({StringValidationUtil, '$class'})):isValidNotRequired(StringValidationUtil, get({This, testFtp}), get({This, 'MINCHAR'}), get({This, 'MAXCHAR'}))) of
            true ->
            put({local, valid}, false);
            false -> ok
        end,
        case (not (get({StringValidationUtil, '$class'})):isValidNotRequired(StringValidationUtil, (get({get({This, testFtpPath}), '$class'})):toString(get({This, testFtpPath})), get({This, 'MINCHAR'}), get({This, 'MAXCHAR'}))) of
            true ->
            put({local, valid}, false);
            false -> ok
        end,
        case (not (get({StringValidationUtil, '$class'})):isValidNotRequired(StringValidationUtil, get({This, testFtpUserName}), get({This, 'MINCHAR'}), get({This, 'MAXCHAR'}))) of
            true ->
            put({local, valid}, false);
            false -> ok
        end,
        case (not (get({StringValidationUtil, '$class'})):isValidNotRequired(StringValidationUtil, get({This, testFtpPassword}), get({This, 'MINCHAR'}), get({This, 'MAXCHAR'}))) of
            true ->
            put({local, valid}, false);
            false -> ok
        end,
        case ((get({get({local, valid}), '$class'})):booleanValue(get({local, valid})) =:= true) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

nameValidationInfo(This) ->
        try
        StringValidationUtil = 'StringValidationUtil':getInstance(),
        case (not (get({StringValidationUtil, '$class'})):isValidRequired(StringValidationUtil, get({This, name}), get({This, 'MINCHAR'}), get({This, 'MAXCHAR'}))) of
            true ->
            StringBuffer = 'StringMaker':new(),
            (get({StringBuffer, '$class'})):append(StringBuffer, "Name is invalid. Must be < "),
            (get({StringBuffer, '$class'})):appendint(StringBuffer, get({This, 'MAXCHAR'})),
            (get({StringBuffer, '$class'})):append(StringBuffer, " and > 0 characters.<br>"),
            throw({'$return', (get({StringBuffer, '$class'})):toString(StringBuffer)});
            false -> ok
        end,
        get({This, 'EMPTY_STRING'})
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

validationInfo(This) ->
        try
            StringValidationUtil = 'StringValidationUtil':getInstance(),
            StringBuffer = 'StringMaker':new(),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):nameValidationInfo(This)),
            case (not (get({StringValidationUtil, '$class'})):isValidRequired(StringValidationUtil, get({This, basketName}), get({This, 'MINCHAR'}), get({This, 'MAXCHAR'}))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, "Basket name is invalid. Must be < "),
                (get({StringBuffer, '$class'})):appendint(StringBuffer, get({This, 'MAXCHAR'})),
                (get({StringBuffer, '$class'})):append(StringBuffer, " and > 0 characters.<br>");
                false -> ok
            end,
            case (not (get({StringValidationUtil, '$class'})):isValidRequired(StringValidationUtil, get({This, homeHostName}), get({This, 'MINCHAR'}), get({This, 'MAXCHAR'}))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, "Home host name is invalid. Must be < "),
                (get({StringBuffer, '$class'})):appendint(StringBuffer, get({This, 'MAXCHAR'})),
                (get({StringBuffer, '$class'})):append(StringBuffer, " and > 0 characters.<br>");
                false -> ok
            end,
            case (not (get({StringValidationUtil, '$class'})):isValidNotRequired(StringValidationUtil, (get({get({This, homeHostNamePath}), '$class'})):toString(get({This, homeHostNamePath})), get({This, 'MINCHAR'}), get({This, 'MAXCHAR'}))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, "Home host name path is invalid. Must be < "),
                (get({StringBuffer, '$class'})):appendint(StringBuffer, get({This, 'MAXCHAR'})),
                (get({StringBuffer, '$class'})):append(StringBuffer, " and > 0 characters.<br>");
                false -> ok
            end,
            case (not (get({StringValidationUtil, '$class'})):isValidRequired(StringValidationUtil, get({This, hostName}), get({This, 'MINCHAR'}), get({This, 'MAXCHAR'}))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, "Host name is invalid. Must be < "),
                (get({StringBuffer, '$class'})):appendint(StringBuffer, get({This, 'MAXCHAR'})),
                (get({StringBuffer, '$class'})):append(StringBuffer, " and > 0 characters.<br>");
                false -> ok
            end,
            case (not (get({StringValidationUtil, '$class'})):isValidRequired(StringValidationUtil, (get({get({This, hostNamePath}), '$class'})):toString(get({This, hostNamePath})), get({This, 'MINCHAR'}), get({This, 'MAXCHAR'}))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, "Host name path is invalid. Must be < "),
                (get({StringBuffer, '$class'})):appendint(StringBuffer, get({This, 'MAXCHAR'})),
                (get({StringBuffer, '$class'})):append(StringBuffer, " and > 0 characters.<br>");
                false -> ok
            end,
            case (not (get({StringValidationUtil, '$class'})):isValidNotRequired(StringValidationUtil, get({This, testHomeHostName}), get({This, 'MINCHAR'}), get({This, 'MAXCHAR'}))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([lists:concat(["Test home host name is invalid. Must be < ", get({This, 'MAXCHAR'})]), " and > 0 characters.<br>"]));
                false -> ok
            end,
            case (not (get({StringValidationUtil, '$class'})):isValidNotRequired(StringValidationUtil, (get({get({This, testHomeHostNamePath}), '$class'})):toString(get({This, testHomeHostNamePath})), get({This, 'MINCHAR'}), get({This, 'MAXCHAR'}))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([lists:concat(["Test home host name path is invalid. Must be < ", get({This, 'MAXCHAR'})]), " and > 0 characters.<br>"]));
                false -> ok
            end,
            case (not (get({StringValidationUtil, '$class'})):isValidNotRequired(StringValidationUtil, get({This, testHostName}), get({This, 'MINCHAR'}), get({This, 'MAXCHAR'}))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([lists:concat(["Test host name is invalid. Must be < ", get({This, 'MAXCHAR'})]), " and > 0 characters.<br>"]));
                false -> ok
            end,
            case (not (get({StringValidationUtil, '$class'})):isValidNotRequired(StringValidationUtil, (get({get({This, testHostNamePath}), '$class'})):toString(get({This, testHostNamePath})), get({This, 'MINCHAR'}), get({This, 'MAXCHAR'}))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([lists:concat(["Test host name path is invalid. Must be < ", get({This, 'MAXCHAR'})]), " and > 0 characters.<br>"]));
                false -> ok
            end,
            case (not (get({StringValidationUtil, '$class'})):isValidRequired(StringValidationUtil, (get({get({This, imagePath}), '$class'})):toString(get({This, imagePath})), get({This, 'MINCHAR'}), get({This, 'MAXCHAR'}))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([lists:concat(["Image path is invalid. Must be < ", get({This, 'MAXCHAR'})]), " and > 0 characters.<br>"]));
                false -> ok
            end,
            case (not (get({StringValidationUtil, '$class'})):isValidRequired(StringValidationUtil, (get({get({This, staticPath}), '$class'})):toString(get({This, staticPath})), get({This, 'MINCHAR'}), get({This, 'MAXCHAR'}))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([lists:concat(["Static path is invalid. Must be < ", get({This, 'MAXCHAR'})]), " and > 0 characters.<br>"]));
                false -> ok
            end,
            case (not (get({StringValidationUtil, '$class'})):isValidRequired(StringValidationUtil, (get({get({This, categoryPath}), '$class'})):toString(get({This, categoryPath})), get({This, 'MINCHAR'}), get({This, 'MAXCHAR'}))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([lists:concat(["Category path is invalid. Must be < ", get({This, 'MAXCHAR'})]), " and > 0 characters.<br>"]));
                false -> ok
            end,
            case (not (get({StringValidationUtil, '$class'})):isValidRequired(StringValidationUtil, get({This, inventoryControl}), get({This, 'MINCHAR'}), get({This, 'MAXCHAR'}))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([lists:concat(["Inventory control is invalid. Must be < ", get({This, 'MAXCHAR'})]), " and > 0 characters.<br>"]));
                false -> ok
            end,
            case (not (get({StringValidationUtil, '$class'})):isValidNotRequired(StringValidationUtil, get({This, subStores}), get({This, 'MINCHAR'}), get({This, 'MAXCHAR'}))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([lists:concat(["Sub stores is invalid. Must be < ", get({This, 'MAXCHAR'})]), " and > 0 characters.<br>"]));
                false -> ok
            end,
            case (not (get({StringValidationUtil, '$class'})):isValidNotRequired(StringValidationUtil, get({This, tagLocation}), get({This, 'MINCHAR'}), get({This, 'MAXCHAR'}))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([lists:concat(["Tag location is invalid. Must be < ", get({This, 'MAXCHAR'})]), " and > 0 characters.<br>"]));
                false -> ok
            end,
            case (not (get({StringValidationUtil, '$class'})):isValidRequired(StringValidationUtil, get({This, packageLocation}), get({This, 'MINCHAR'}), get({This, 'MAXCHAR'}))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([lists:concat(["Package location is invalid. Must be < ", get({This, 'MAXCHAR'})]), " and > 0 characters.<br>"]));
                false -> ok
            end,
            case (not (get({StringValidationUtil, '$class'})):isValidNotRequired(StringValidationUtil, get({This, ftp}), get({This, 'MINCHAR'}), get({This, 'MAXCHAR'}))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([lists:concat(["Ftp is invalid. Must be < ", get({This, 'MAXCHAR'})]), " and > 0 characters.<br>"]));
                false -> ok
            end,
            case (not (get({StringValidationUtil, '$class'})):isValidNotRequired(StringValidationUtil, (get({get({This, ftpPath}), '$class'})):toString(get({This, ftpPath})), get({This, 'MINCHAR'}), get({This, 'MAXCHAR'}))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([lists:concat(["Ftp path is invalid. Must be < ", get({This, 'MAXCHAR'})]), " and > 0 characters.<br>"]));
                false -> ok
            end,
            case (not (get({StringValidationUtil, '$class'})):isValidNotRequired(StringValidationUtil, get({This, ftpUserName}), get({This, 'MINCHAR'}), get({This, 'MAXCHAR'}))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([lists:concat(["Ftp username is invalid. Must be < ", get({This, 'MAXCHAR'})]), " and > 0 characters.<br>"]));
                false -> ok
            end,
            case (not (get({StringValidationUtil, '$class'})):isValidNotRequired(StringValidationUtil, get({This, ftpPassword}), get({This, 'MINCHAR'}), get({This, 'MAXCHAR'}))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([lists:concat(["Ftp password is invalid. Must be < ", get({This, 'MAXCHAR'})]), " and > 0 characters.<br>"]));
                false -> ok
            end,
            case (not (get({StringValidationUtil, '$class'})):isValidNotRequired(StringValidationUtil, get({This, testFtp}), get({This, 'MINCHAR'}), get({This, 'MAXCHAR'}))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([lists:concat(["Test ftp is invalid. Must be < ", get({This, 'MAXCHAR'})]), " and > 0 characters.<br>"]));
                false -> ok
            end,
            case (not (get({StringValidationUtil, '$class'})):isValidNotRequired(StringValidationUtil, (get({get({This, testFtpPath}), '$class'})):toString(get({This, testFtpPath})), get({This, 'MINCHAR'}), get({This, 'MAXCHAR'}))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([lists:concat(["Test ftp Path is invalid. Must be < ", get({This, 'MAXCHAR'})]), " and > 0 characters.<br>"]));
                false -> ok
            end,
            case (not (get({StringValidationUtil, '$class'})):isValidNotRequired(StringValidationUtil, get({This, testFtpUserName}), get({This, 'MINCHAR'}), get({This, 'MAXCHAR'}))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([lists:concat(["Test ftp username is invalid. Must be < ", get({This, 'MAXCHAR'})]), " and > 0 characters.<br>"]));
                false -> ok
            end,
            case (not (get({StringValidationUtil, '$class'})):isValidNotRequired(StringValidationUtil, get({This, testFtpPassword}), get({This, 'MINCHAR'}), get({This, 'MAXCHAR'}))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([lists:concat(["Test ftp password is invalid. Must be < ", get({This, 'MAXCHAR'})]), " and > 0 characters.<br>"]));
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

getTestHtmlPath(This) ->
        ((get({get({get({get({'org', allbinary}), globals}), 'URLGLOBALS'}), '$class'})):getTestHtmlPath(get({get({get({'org', allbinary}), globals}), 'URLGLOBALS'})) + (get({This, '$class'})):getCurrentHostNamePath(This)).

getCurrentHostName(This) ->
        put({local, location}, get({This, 'EMPTY_STRING'})),
        case (get({get({get({get({'org', allbinary}), globals}), 'URLGLOBALS'}), '$class'})):isTestingMode(get({get({get({'org', allbinary}), globals}), 'URLGLOBALS'})) of
            true ->
            put({local, location}, (get({This, '$class'})):getTestHostName(This));
            false ->
            put({local, location}, (get({This, '$class'})):getHostName(This))
        end,
        get({local, location}).

getCurrentHostNamePath(This) ->
        put({local, location}, get({This, 'EMPTY_STRING'})),
        case (get({get({get({get({'org', allbinary}), globals}), 'URLGLOBALS'}), '$class'})):isTestingMode(get({get({get({'org', allbinary}), globals}), 'URLGLOBALS'})) of
            true ->
            put({local, location}, (get({This, '$class'})):getTestHostNamePath(This));
            false ->
            put({local, location}, (get({This, '$class'})):getHostNamePath(This))
        end,
        get({local, location}).

getCurrentHomeHostName(This) ->
        put({local, location}, get({This, 'EMPTY_STRING'})),
        case (get({get({get({get({'org', allbinary}), globals}), 'URLGLOBALS'}), '$class'})):isTestingMode(get({get({get({'org', allbinary}), globals}), 'URLGLOBALS'})) of
            true ->
            put({local, location}, (get({This, '$class'})):getTestHomeHostName(This));
            false ->
            put({local, location}, (get({This, '$class'})):getHomeHostName(This))
        end,
        get({local, location}).

getCurrentHomeHostNamePath(This) ->
        put({local, location}, get({This, 'EMPTY_STRING'})),
        case (get({get({get({get({'org', allbinary}), globals}), 'URLGLOBALS'}), '$class'})):isTestingMode(get({get({get({'org', allbinary}), globals}), 'URLGLOBALS'})) of
            true ->
            put({local, location}, (get({This, '$class'})):getTestHomeHostNamePath(This));
            false ->
            put({local, location}, (get({This, '$class'})):getHomeHostNamePath(This))
        end,
        get({local, location}).

getName(This) ->
        get({This, name}).

getBasketName(This) ->
        get({This, basketName}).

getHomeHostName(This) ->
        get({This, homeHostName}).

getHomeHostNamePath(This) ->
        (get({get({This, homeHostNamePath}), '$class'})):toString(get({This, homeHostNamePath})).

getHostName(This) ->
        get({This, hostName}).

getHostNamePath(This) ->
        (get({get({This, hostNamePath}), '$class'})):toString(get({This, hostNamePath})).

getTestHomeHostName(This) ->
        get({This, testHomeHostName}).

getTestHomeHostNamePath(This) ->
        (get({get({This, testHomeHostNamePath}), '$class'})):toString(get({This, testHomeHostNamePath})).

getTestHostName(This) ->
        get({This, testHostName}).

getTestHostNamePath(This) ->
        (get({get({This, testHostNamePath}), '$class'})):toString(get({This, testHostNamePath})).

getStaticPath(This) ->
        (get({get({This, staticPath}), '$class'})):toString(get({This, staticPath})).

getCategoryPath(This) ->
        (get({get({This, categoryPath}), '$class'})):toString(get({This, categoryPath})).

getInventoryControl(This) ->
        get({This, inventoryControl}).

% throws Exception
getSubStores(This) ->
        try
            Tokenizer = 'Tokenizer':new(get({'CommonSeps':getInstance(), 'SEMICOLON'})),
            SubStoreVector = (get({Tokenizer, '$class'})):getTokensFromString(Tokenizer, get({This, subStores}), 'BasicArrayListD':new()),
            SubStoreVector
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        end.

getTagLocation(This) ->
        get({This, tagLocation}).

getPackageLocation(This) ->
        get({This, packageLocation}).

getFtp(This) ->
        get({This, ftp}).

getFtpUserName(This) ->
        get({This, ftpUserName}).

getFtpPassword(This) ->
        get({This, ftpPassword}).

getTestFtp(This) ->
        get({This, testFtp}).

getTestFtpUserName(This) ->
        get({This, testFtpUserName}).

getTestFtpPassword(This) ->
        get({This, testFtpPassword}).

getFtpPath(This) ->
        (get({get({This, ftpPath}), '$class'})):toString(get({This, ftpPath})).

getTestFtpPath(This) ->
        (get({get({This, testFtpPath}), '$class'})):toString(get({This, testFtpPath})).

getTimeCreated(This) ->
        get({This, timeCreated}).

getLastModified(This) ->
        get({This, lastModified}).

setName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, name}, Value).

setBasketName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, basketName}, Value).

setHomeHostName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, homeHostName}, Value).

% throws Exception
setHomeHostNamePath(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, homeHostNamePath}, 'AbPath':new(Value, get({'StringUtil':getInstance(), 'EMPTY_STRING'}))).

setHostName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, hostName}, Value).

% throws Exception
setHostNamePath(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, hostNamePath}, 'AbPath':new(Value, get({'StringUtil':getInstance(), 'EMPTY_STRING'}))).

setTestHomeHostName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, testHomeHostName}, Value).

% throws Exception
setTestHomeHostNamePath(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, testHomeHostNamePath}, 'AbPath':new(Value, get({'StringUtil':getInstance(), 'EMPTY_STRING'}))).

setTestHostName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, testHostName}, Value).

% throws Exception
setTestHostNamePath(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, testHostNamePath}, 'AbPath':new(Value, get({'StringUtil':getInstance(), 'EMPTY_STRING'}))).

% throws Exception
setImagePath(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, imagePath}, 'AbPath':new(Value, get({'StringUtil':getInstance(), 'EMPTY_STRING'}))).

% throws Exception
setStaticPath(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, staticPath}, 'AbPath':new(Value, get({'StringUtil':getInstance(), 'EMPTY_STRING'}))).

% throws Exception
setCategoryPath(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, categoryPath}, 'AbPath':new(Value, get({'StringUtil':getInstance(), 'EMPTY_STRING'}))).

setSubStores(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, subStores}, Value).

setTagLocation(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, tagLocation}, Value).

setPackageLocation(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, packageLocation}, Value).

setInventoryControl(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, inventoryControl}, Value).

getPackageLocation(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, packageLocation}, Value).

setFtp(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, ftp}, Value).

setFtpUserName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, ftpUserName}, Value).

setFtpPassword(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, ftpPassword}, Value).

setTestFtp(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, testFtp}, Value).

setTestFtpUserName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, testFtpUserName}, Value).

setTestFtpPassword(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, testFtpPassword}, Value).

setTimeCreated(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, timeCreated}, Value).

setLastModified(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, lastModified}, Value).

% throws Exception
setFtpPath(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, ftpPath}, 'AbPath':new(Value, get({'StringUtil':getInstance(), 'EMPTY_STRING'}))).

% throws Exception
setTestFtpPath(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, testFtpPath}, 'AbPath':new(Value, get({'StringUtil':getInstance(), 'EMPTY_STRING'}))).

% throws Exception
createDirectories(This) ->
        try
        StoreAbPath = 'AbPath':new(((get({get({'StoreFront', 'URLGLOBALS'}), '$class'})):getWebappPath(get({'StoreFront', 'URLGLOBALS'})) + (get({This, '$class'})):getCurrentHomeHostNamePath(This)), get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
        case (not (get({get({This, directory}), '$class'})):create(get({This, directory}), StoreAbPath)) of
            true ->
            throw({'$return', false});
            false -> ok
        end,
        case (not (get({get({This, directory}), '$class'})):create(get({This, directory}), 'AbPath':new((StoreAbPath + (get({This, '$class'})):getCategoryPath(This)), get({'StringUtil':getInstance(), 'EMPTY_STRING'})))) of
            true ->
            throw({'$return', false});
            false -> ok
        end,
        case (not (get({get({This, directory}), '$class'})):create(get({This, directory}), 'AbPath':new((StoreAbPath + (get({This, '$class'})):getStaticPath(This)), get({'StringUtil':getInstance(), 'EMPTY_STRING'})))) of
            true ->
            throw({'$return', false});
            false -> ok
        end,
        true
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
install(This, Current, Total) when is_integer(Current), is_integer(Total) ->
        try
            case (not (get({This, '$class'})):createDirectories(This)) of
                true ->
                erlang:error({'Exception', "Unable to create store directories"});
                false -> ok
            end,
            StringBuffer = 'StringMaker':new(),
            (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({'StoreFront', 'URLGLOBALS'}), '$class'})):getMainPath(get({'StoreFront', 'URLGLOBALS'}))),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({(get({get({'StoreFront', 'FREEBLISKET_PATH_GLOBALS'}), '$class'})):getInstance(get({'StoreFront', 'FREEBLISKET_PATH_GLOBALS'})), 'XSLPATH'})),
            ViewPath = (get({StringBuffer, '$class'})):toString(StringBuffer),
            (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
            (get({StringBuffer, '$class'})):append(StringBuffer, ViewPath),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({(get({get({'StoreFront', 'FREEBLISKET_PATH_GLOBALS'}), '$class'})):getInstance(get({'StoreFront', 'FREEBLISKET_PATH_GLOBALS'})), 'INSTALLPATH'})),
            FromDirectoryAbPath = 'AbPath':new((get({StringBuffer, '$class'})):toString(StringBuffer), get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
            (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
            (get({StringBuffer, '$class'})):append(StringBuffer, ViewPath),
            (get({StringBuffer, '$class'})):append(StringBuffer, "special"),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({'AbPathData':getInstance(), 'SEPARATOR'})),
            FromSpecialDirectoryAbPath = 'AbPath':new((get({StringBuffer, '$class'})):toString(StringBuffer), get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
            (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
            (get({StringBuffer, '$class'})):append(StringBuffer, ViewPath),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getName(This)),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({'AbPathData':getInstance(), 'SEPARATOR'})),
            ToDirectoryAbPath = 'AbPath':new((get({StringBuffer, '$class'})):toString(StringBuffer), get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
            case (Current =:= 0) of
                true ->
                case (not (get({get({This, directory}), '$class'})):create(get({This, directory}), ToDirectoryAbPath)) of
                    true ->
                    erlang:error({'Exception', lists:concat(["Unable to create store view directory: ", (get({ToDirectoryAbPath, '$class'})):toString(ToDirectoryAbPath)])});
                    false -> ok
                end;
                false -> ok
            end,
            ViewTotal = (((Total * 85)) div 100),
            InstallTotal = (((Total * 93)) div 100),
            case (Current < ViewTotal) of
                true ->
                File = 'AbFile':createAbFileFromAbPath(FromSpecialDirectoryAbPath),
                case (get({File, '$class'})):isDirectory(File) of
                    true ->
                    HalfViewTotal = (ViewTotal div 2),
                    case (Current < HalfViewTotal) of
                        true ->
                        (get({This, '$class'})):installViews(This, FromSpecialDirectoryAbPath, ToDirectoryAbPath, Current, HalfViewTotal);
                        false ->
                        case (Current < ViewTotal) of
                        true ->
                        (get({This, '$class'})):installViews(This, FromDirectoryAbPath, ToDirectoryAbPath, (Current - HalfViewTotal), (ViewTotal - HalfViewTotal));
                        false -> ok
                    end
                    end;
                    false ->
                    (get({This, '$class'})):installViews(This, FromDirectoryAbPath, ToDirectoryAbPath, Current, ViewTotal)
                end;
                false ->
                case (Current < InstallTotal) of
                true ->
                (get({This, '$class'})):installResources(This, FromDirectoryAbPath, (Current - ViewTotal), (InstallTotal - ViewTotal));
                false ->
                (get({This, '$class'})):installMedia(This, FromDirectoryAbPath, (Current - InstallTotal), (Total - InstallTotal))
            end
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "install()", E);
                false -> ok
            end,
            erlang:error(E)
        end.

% throws Exception
installViews(This, FromDirectoryAbPath, ToDirectoryAbPath, Current, Total) when is_integer(Current), is_integer(Total) ->
        (fun(Target_N86973) -> (get({Target_N86973, '$class'})):copyDirectoryPortion(Target_N86973, FromDirectoryAbPath, ToDirectoryAbPath, true, false, Current, Total) end)('FileUtil':getInstance()).

% throws Exception
installResources(This, FromDirectoryAbPath, Current, Total) when is_integer(Current), is_integer(Total) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({FromDirectoryAbPath, '$class'})):toString(FromDirectoryAbPath)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'AbPathData':getInstance(), 'SEPARATOR'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, "Resources"),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'AbPathData':getInstance(), 'SEPARATOR'})),
        InstallCategoryAbPath = 'AbPath':new((get({StringBuffer, '$class'})):toString(StringBuffer), get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
        (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({'StoreFront', 'URLGLOBALS'}), '$class'})):getMainPath(get({'StoreFront', 'URLGLOBALS'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getCurrentHomeHostNamePath(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'AbPathData':getInstance(), 'SEPARATOR'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getCategoryPath(This)),
        CategoryAbPath = 'AbPath':new((get({StringBuffer, '$class'})):toString(StringBuffer), get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
        (fun(Target_N87760) -> (get({Target_N87760, '$class'})):copyDirectoryPortion(Target_N87760, InstallCategoryAbPath, CategoryAbPath, true, false, Current, Total) end)('FileUtil':getInstance()).

% throws Exception
installMedia(This, FromDirectoryAbPath, Current, Total) when is_integer(Current), is_integer(Total) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({FromDirectoryAbPath, '$class'})):toString(FromDirectoryAbPath)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'AbPathData':getInstance(), 'SEPARATOR'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({(get({get({'StoreFront', 'FREEBLISKET_PATH_GLOBALS'}), '$class'})):getInstance(get({'StoreFront', 'FREEBLISKET_PATH_GLOBALS'})), 'TEMPLATEPATH'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, "images"),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'AbPathData':getInstance(), 'SEPARATOR'})),
        ViewStoreImagesDirectoryAbPath = 'AbPath':new((get({StringBuffer, '$class'})):toString(StringBuffer), get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
        StoreAbPath = 'AbPath':new(((get({get({'StoreFront', 'URLGLOBALS'}), '$class'})):getWebappPath(get({'StoreFront', 'URLGLOBALS'})) + (get({This, '$class'})):getCurrentHomeHostNamePath(This)), get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
        (fun(Target_N88385) -> (get({Target_N88385, '$class'})):copyDirectoryPortion(Target_N88385, ViewStoreImagesDirectoryAbPath, StoreAbPath, true, false, Current, Total) end)('FileUtil':getInstance()).

% throws Exception
toVector(This) ->
        DataVector = 'BasicArrayListD':new(),
        (get({DataVector, '$class'})):add(DataVector, get({This, name})),
        (get({DataVector, '$class'})):add(DataVector, get({This, homeHostName})),
        (get({DataVector, '$class'})):add(DataVector, (get({get({This, homeHostNamePath}), '$class'})):toString(get({This, homeHostNamePath}))),
        (get({DataVector, '$class'})):add(DataVector, get({This, hostName})),
        (get({DataVector, '$class'})):add(DataVector, (get({get({This, hostNamePath}), '$class'})):toString(get({This, hostNamePath}))),
        (get({DataVector, '$class'})):add(DataVector, get({This, testHomeHostName})),
        (get({DataVector, '$class'})):add(DataVector, (get({get({This, testHomeHostNamePath}), '$class'})):toString(get({This, testHomeHostNamePath}))),
        (get({DataVector, '$class'})):add(DataVector, get({This, testHostName})),
        (get({DataVector, '$class'})):add(DataVector, (get({get({This, testHostNamePath}), '$class'})):toString(get({This, testHostNamePath}))),
        (get({DataVector, '$class'})):add(DataVector, (get({get({This, imagePath}), '$class'})):toString(get({This, imagePath}))),
        (get({DataVector, '$class'})):add(DataVector, (get({get({This, staticPath}), '$class'})):toString(get({This, staticPath}))),
        (get({DataVector, '$class'})):add(DataVector, (get({get({This, categoryPath}), '$class'})):toString(get({This, categoryPath}))),
        (get({DataVector, '$class'})):add(DataVector, get({This, inventoryControl})),
        ContextConfigurationDomDocumentMapping = 'ContextConfigurationDomDocumentMapping':new((get({This, '$class'})):getContextConfigurationInterface(This)),
        (get({DataVector, '$class'})):add(DataVector, (get({ContextConfigurationDomDocumentMapping, '$class'})):toDomDocumentString(ContextConfigurationDomDocumentMapping)),
        (get({DataVector, '$class'})):add(DataVector, get({This, subStores})),
        (get({DataVector, '$class'})):add(DataVector, get({This, tagLocation})),
        (get({DataVector, '$class'})):add(DataVector, get({This, packageLocation})),
        (get({DataVector, '$class'})):add(DataVector, get({This, ftp})),
        (get({DataVector, '$class'})):add(DataVector, (get({get({This, ftpPath}), '$class'})):toString(get({This, ftpPath}))),
        (get({DataVector, '$class'})):add(DataVector, get({This, ftpUserName})),
        (get({DataVector, '$class'})):add(DataVector, get({This, ftpPassword})),
        (get({DataVector, '$class'})):add(DataVector, get({This, testFtp})),
        (get({DataVector, '$class'})):add(DataVector, (get({get({This, testFtpPath}), '$class'})):toString(get({This, testFtpPath}))),
        (get({DataVector, '$class'})):add(DataVector, get({This, testFtpUserName})),
        (get({DataVector, '$class'})):add(DataVector, get({This, testFtpPassword})),
        Calendar = 'Calendar':getInstance(),
        Time = allbinary_java:to_string((fun(Target_N89656) -> (get({Target_N89656, '$class'})):toString(Target_N89656) end)((get({Calendar, '$class'})):getTimeInMillis(Calendar))),
        (get({DataVector, '$class'})):add(DataVector, Time),
        (get({DataVector, '$class'})):add(DataVector, Time),
        DataVector.

% throws Exception
toHashMap(This) ->
        StoreFrontData = 'StoreFrontData':getInstance(),
        DataHashMap = (fun(Target_N89896) -> (get({Target_N89896, '$class'})):createHashMap(Target_N89896) end)('StdUtil':getInstance()),
        (get({DataHashMap, '$class'})):put(DataHashMap, get({StoreFrontData, 'NAME'}), get({This, name})),
        (get({DataHashMap, '$class'})):put(DataHashMap, get({StoreFrontData, 'HOMEHOSTNAME'}), get({This, homeHostName})),
        (get({DataHashMap, '$class'})):put(DataHashMap, get({StoreFrontData, 'HOMEHOSTNAMEPATH'}), (get({get({This, homeHostNamePath}), '$class'})):toString(get({This, homeHostNamePath}))),
        (get({DataHashMap, '$class'})):put(DataHashMap, get({StoreFrontData, 'HOSTNAME'}), get({This, hostName})),
        (get({DataHashMap, '$class'})):put(DataHashMap, get({StoreFrontData, 'HOSTNAMEPATH'}), (get({get({This, hostNamePath}), '$class'})):toString(get({This, hostNamePath}))),
        (get({DataHashMap, '$class'})):put(DataHashMap, get({StoreFrontData, 'TESTHOMEHOSTNAME'}), get({This, testHomeHostName})),
        (get({DataHashMap, '$class'})):put(DataHashMap, get({StoreFrontData, 'TESTHOMEHOSTNAMEPATH'}), (get({get({This, testHomeHostNamePath}), '$class'})):toString(get({This, testHomeHostNamePath}))),
        (get({DataHashMap, '$class'})):put(DataHashMap, get({StoreFrontData, 'TESTHOSTNAME'}), get({This, testHostName})),
        (get({DataHashMap, '$class'})):put(DataHashMap, get({StoreFrontData, 'TESTHOSTNAMEPATH'}), (get({get({This, testHostNamePath}), '$class'})):toString(get({This, testHostNamePath}))),
        (get({DataHashMap, '$class'})):put(DataHashMap, get({StoreFrontData, 'IMAGEPATH'}), (get({get({This, imagePath}), '$class'})):toString(get({This, imagePath}))),
        (get({DataHashMap, '$class'})):put(DataHashMap, get({StoreFrontData, 'STATICPATH'}), (get({get({This, staticPath}), '$class'})):toString(get({This, staticPath}))),
        (get({DataHashMap, '$class'})):put(DataHashMap, get({StoreFrontData, 'CATEGORYPATH'}), (get({get({This, categoryPath}), '$class'})):toString(get({This, categoryPath}))),
        (get({DataHashMap, '$class'})):put(DataHashMap, get({StoreFrontData, 'INVENTORYCONTROL'}), get({This, inventoryControl})),
        ContextConfigurationDomDocumentMapping = 'ContextConfigurationDomDocumentMapping':new((get({This, '$class'})):getContextConfigurationInterface(This)),
        (get({DataHashMap, '$class'})):put(DataHashMap, get({StoreFrontData, 'CONFIGURATION'}), (get({ContextConfigurationDomDocumentMapping, '$class'})):toDomDocumentString(ContextConfigurationDomDocumentMapping)),
        (get({DataHashMap, '$class'})):put(DataHashMap, get({StoreFrontData, 'SUBSTORES'}), get({This, subStores})),
        (get({DataHashMap, '$class'})):put(DataHashMap, get({StoreFrontData, 'TAGLOCATION'}), get({This, tagLocation})),
        (get({DataHashMap, '$class'})):put(DataHashMap, get({StoreFrontData, 'PACKAGELOCATION'}), get({This, packageLocation})),
        (get({DataHashMap, '$class'})):put(DataHashMap, get({StoreFrontData, 'FTP'}), get({This, ftp})),
        (get({DataHashMap, '$class'})):put(DataHashMap, get({StoreFrontData, 'FTPPATH'}), (get({get({This, ftpPath}), '$class'})):toString(get({This, ftpPath}))),
        (get({DataHashMap, '$class'})):put(DataHashMap, get({StoreFrontData, 'FTPUSERNAME'}), get({This, ftpUserName})),
        (get({DataHashMap, '$class'})):put(DataHashMap, get({StoreFrontData, 'FTPPASSWORD'}), get({This, ftpPassword})),
        (get({DataHashMap, '$class'})):put(DataHashMap, get({StoreFrontData, 'TESTFTP'}), get({This, testFtp})),
        (get({DataHashMap, '$class'})):put(DataHashMap, get({StoreFrontData, 'TESTFTPPATH'}), (get({get({This, testFtpPath}), '$class'})):toString(get({This, testFtpPath}))),
        (get({DataHashMap, '$class'})):put(DataHashMap, get({StoreFrontData, 'TESTFTPUSERNAME'}), get({This, testFtpUserName})),
        (get({DataHashMap, '$class'})):put(DataHashMap, get({StoreFrontData, 'TESTFTPPASSWORD'}), get({This, testFtpPassword})),
        Calendar = 'Calendar':getInstance(),
        Time = allbinary_java:to_string((fun(Target_N91397) -> (get({Target_N91397, '$class'})):toString(Target_N91397) end)((get({Calendar, '$class'})):getTimeInMillis(Calendar))),
        (get({DataHashMap, '$class'})):put(DataHashMap, get({'EntryData':getInstance(), 'LASTMODIFIED'}), Time),
        DataHashMap.

getKey(This) ->
        (get({This, '$class'})):getName(This).

getContextConfigurationInterface(This) ->
        get({This, contextConfigurationInterface}).

setContextConfigurationInterface(This, ContextConfigurationInterface) ->
        put({This, contextConfigurationInterface}, ContextConfigurationInterface).

