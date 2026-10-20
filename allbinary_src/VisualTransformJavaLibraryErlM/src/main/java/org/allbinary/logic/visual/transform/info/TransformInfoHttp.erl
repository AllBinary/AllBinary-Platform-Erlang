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
% import java.util.HashMap
% import javax.servlet.http.HttpServletRequest
% import javax.servlet.jsp.PageContext
% import org.allbinary.business.context.AbContext
% import org.allbinary.business.context.modules.storefront.StoreFrontData
% import org.allbinary.globals.FREEBLISKET_PATH_GLOBALS
% import org.allbinary.globals.URLGLOBALS
% import org.allbinary.logic.communication.http.request.RequestParams
% import org.allbinary.logic.communication.http.request.session.WeblisketSessionInterface
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.sql.AbSqlData
% import org.allbinary.logic.io.path.AbPath
% import org.allbinary.logic.string.StringValidationUtil
% import org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfig

-module('TransformInfoHttp').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements TransformInfoHttpInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('TransformInfo', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, abContext}, undefined),
    ok.


new(PropertiesHashMap, PageContext, Crud) when is_boolean(Crud) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, PropertiesHashMap, PageContext, Crud),
    This;
new(Request, PropertiesHashMap, PageContext) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Request, PropertiesHashMap, PageContext),
    This;
new(DatabaseHashMap, PropertiesHashMap, PageContext) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, DatabaseHashMap, PropertiesHashMap, PageContext),
    This.

'$init'(This, PropertiesHashMap, PageContext, Crud) when is_boolean(Crud) ->
        'TransformInfo':'$init'(This),
        init_fields(This),
        put({This, abContext}, 'AbContext':new(PropertiesHashMap, PageContext)),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Properties HashMap: ", (get({PropertiesHashMap, '$class'})):toString(PropertiesHashMap)]), This, "Constructor(HashMap, PageContext, boolean)");
            false -> ok
        end,
        (get({This, '$class'})):override(This, PropertiesHashMap);
'$init'(This, Request, PropertiesHashMap, PageContext) ->
        'TransformInfo':'$init'(This),
        init_fields(This),
        put({This, abContext}, 'AbContext':new(PropertiesHashMap, PageContext)),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Properties HashMap: ", (get({PropertiesHashMap, '$class'})):toString(PropertiesHashMap)]), This, "Constructor(HttpServletRequest, HashMap, PageContext)");
            false -> ok
        end,
        (get({This, '$class'})):set(This, (fun(Target_N66864) -> (get({Target_N66864, '$class'})):toHashMap(Target_N66864) end)('RequestParams':new(Request))),
        (get({This, '$class'})):override(This, PropertiesHashMap);
'$init'(This, DatabaseHashMap, PropertiesHashMap, PageContext) ->
        'TransformInfo':'$init'(This),
        init_fields(This),
        put({This, abContext}, 'AbContext':new(PropertiesHashMap, PageContext)),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Properties HashMap: ", (get({PropertiesHashMap, '$class'})):toString(PropertiesHashMap)]), This, "Constructor(HashMap, HashMap, PageContext)");
            false -> ok
        end,
        (get({This, '$class'})):set(This, DatabaseHashMap).



new(PropertiesHashMap, PageContext) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, PropertiesHashMap, PageContext),
    This.

'$init'(This, PropertiesHashMap, PageContext) ->
        'TransformInfo':'$init'(This),
        init_fields(This),
        put({This, abContext}, 'AbContext':new(PropertiesHashMap, PageContext)),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Properties HashMap: ", (get({PropertiesHashMap, '$class'})):toString(PropertiesHashMap)]), This, "Constructor(HashMap, PageContext)");
            false -> ok
        end,
        (get({This, '$class'})):set(This, PropertiesHashMap).

new(ParentViewOfThisTransformInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, ParentViewOfThisTransformInfoInterface),
    This.

'$init'(This, ParentViewOfThisTransformInfoInterface) ->
        'TransformInfo':'$init'(This),
        init_fields(This),
        put({This, abContext}, 'AbContext':new((get({ParentViewOfThisTransformInfoInterface, '$class'})):getPropertiesHashMap(ParentViewOfThisTransformInfoInterface), (get({ParentViewOfThisTransformInfoInterface, '$class'})):getPageContext(ParentViewOfThisTransformInfoInterface))).

% throws Exception
set(This, HashMap) ->
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Properties HashMap: ", (get({HashMap, '$class'})):toString(HashMap)]), This, "set()");
            false -> ok
        end,
        TransformInfoData = 'TransformInfoData':getInstance(),
        (get({This, '$class'})):setName(This, (get({HashMap, '$class'})):get(HashMap, get({TransformInfoData, 'NAME'}))),
        (get({This, '$class'})):setStoreName(This, (get({HashMap, '$class'})):get(HashMap, get({'StoreFrontData':getInstance(), 'NAME'}))),
        (get({This, '$class'})):setObjectFile(This, (get({HashMap, '$class'})):get(HashMap, get({TransformInfoData, 'OBJECTFILENAME'}))),
        (get({This, '$class'})):setObject(This, (get({HashMap, '$class'})):get(HashMap, get({TransformInfoData, 'OBJECT'}))),
        StringValidationUtil = 'StringValidationUtil':getInstance(),
        ObjectConfigString = (get({HashMap, '$class'})):get(HashMap, get({TransformInfoData, 'OBJECTCONFIG'})),
        case (get({StringValidationUtil, '$class'})):isValidRequired(StringValidationUtil, ObjectConfigString, 10, get({'AbSqlData', 'MAXBLOB'})) of
            true ->
            (get({This, '$class'})):setObjectConfig(This, ObjectConfigString);
            false ->
            (get({This, '$class'})):setObjectConfig(This, (fun(Target_N68668) -> (get({Target_N68668, '$class'})):toString(Target_N68668) end)('TransformInfoObjectConfig':new(This)))
        end,
        case (not (get({StringValidationUtil, '$class'})):isEmpty(StringValidationUtil, (get({HashMap, '$class'})):get(HashMap, get({TransformInfoData, 'OBJECTCONFIGFILENAME'})))) of
            true ->
            (get({This, '$class'})):setObjectConfigFile(This, (get({HashMap, '$class'})):get(HashMap, get({TransformInfoData, 'OBJECTCONFIGFILENAME'})));
            false -> ok
        end,
        (get({This, '$class'})):setTemplateFile(This, (get({HashMap, '$class'})):get(HashMap, get({TransformInfoData, 'TEMPLATEFILENAME'}))),
        (get({This, '$class'})):setTemplate(This, (get({HashMap, '$class'})):get(HashMap, get({TransformInfoData, 'TEMPLATE'}))),
        (get({This, '$class'})):setDataFile(This, (get({HashMap, '$class'})):get(HashMap, get({TransformInfoData, 'DATAFILENAME'}))),
        (get({This, '$class'})):setData(This, (get({HashMap, '$class'})):get(HashMap, get({TransformInfoData, 'DATA'}))),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPERFACTORY'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({This, '$class'})):log(This), This, "set()");
            false -> ok
        end.

getWeblisketSession(This) ->
        (get({get({This, abContext}), '$class'})):getWeblisketSession(get({This, abContext})).

getPageContext(This) ->
        (get({get({This, abContext}), '$class'})):getPageContext(get({This, abContext})).

getPropertiesHashMap(This) ->
        (get({get({This, abContext}), '$class'})):getPropertiesHashMap(get({This, abContext})).

% throws Exception
getTemplateFilePath(This) ->
        'AbPath':new(((get({get({'TransformInfoHttp', 'URLGLOBALS'}), '$class'})):getMainPath(get({'TransformInfoHttp', 'URLGLOBALS'})) + get({(get({get({'TransformInfoHttp', 'FREEBLISKET_PATH_GLOBALS'}), '$class'})):getInstance(get({'TransformInfoHttp', 'FREEBLISKET_PATH_GLOBALS'})), 'XSLPATH'})), (get({This, '$class'})):getTemplateFile(This)).

% throws Exception
getObjectConfigFilePath(This) ->
        'AbPath':new(((get({get({'TransformInfoHttp', 'URLGLOBALS'}), '$class'})):getMainPath(get({'TransformInfoHttp', 'URLGLOBALS'})) + get({(get({get({'TransformInfoHttp', 'FREEBLISKET_PATH_GLOBALS'}), '$class'})):getInstance(get({'TransformInfoHttp', 'FREEBLISKET_PATH_GLOBALS'})), 'XSLPATH'})), (get({This, '$class'})):getObjectConfigFile(This)).

% throws Exception
getDataFilePath(This) ->
        'AbPath':new(((get({get({'TransformInfoHttp', 'URLGLOBALS'}), '$class'})):getMainPath(get({'TransformInfoHttp', 'URLGLOBALS'})) + get({(get({get({'TransformInfoHttp', 'FREEBLISKET_PATH_GLOBALS'}), '$class'})):getInstance(get({'TransformInfoHttp', 'FREEBLISKET_PATH_GLOBALS'})), 'XSLPATH'})), (get({This, '$class'})):getDataFile(This)).

