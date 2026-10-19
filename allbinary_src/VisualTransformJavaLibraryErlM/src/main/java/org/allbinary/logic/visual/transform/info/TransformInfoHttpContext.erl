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
% import javax.servlet.jsp.PageContext
% import org.allbinary.globals.FREEBLISKET_PATH_GLOBALS
% import org.allbinary.globals.URLGLOBALS
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.io.path.AbPath
% import org.allbinary.logic.io.path.AbPathData
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil

-module('TransformInfoHttpContext').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('TransformInfoHttp', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


new(DatabaseHashMap, PropertiesHashMap, PageContext) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, DatabaseHashMap, PropertiesHashMap, PageContext),
    This.

init(This, DatabaseHashMap, PropertiesHashMap, PageContext) ->
        'TransformInfoHttp':init(This, DatabaseHashMap, PropertiesHashMap, PageContext),
        init_fields(This),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            StringBuffer = 'StringMaker':new(),
            (get({StringBuffer, '$class'})):append(StringBuffer, "Database HashMap: "),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({DatabaseHashMap, '$class'})):toString(DatabaseHashMap)),
            (get({StringBuffer, '$class'})):append(StringBuffer, "\nProperties HashMap: "),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({PropertiesHashMap, '$class'})):toString(PropertiesHashMap)),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, get({get({This, commonStrings}), 'CONSTRUCTOR'}));
            false -> ok
        end,
        (get({This, '$class'})):setStoreName(This, get({'StringUtil':getInstance(), 'EMPTY_STRING'})).

new(PropertiesHashMap, PageContext) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, PropertiesHashMap, PageContext),
    This.

init(This, PropertiesHashMap, PageContext) ->
        'TransformInfoHttp':init(This, PropertiesHashMap, PageContext),
        init_fields(This),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Properties HashMap: ", (get({PropertiesHashMap, '$class'})):toString(PropertiesHashMap)]), This, get({get({This, commonStrings}), 'CONSTRUCTOR'}));
            false -> ok
        end,
        (get({This, '$class'})):setStoreName(This, get({'StringUtil':getInstance(), 'EMPTY_STRING'})).

% throws Exception
getPath(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({'TransformInfoHttpContext', 'URLGLOBALS'}), '$class'})):getMainPath(get({'TransformInfoHttpContext', 'URLGLOBALS'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({(get({get({'TransformInfoHttpContext', 'FREEBLISKET_PATH_GLOBALS'}), '$class'})):getInstance(get({'TransformInfoHttpContext', 'FREEBLISKET_PATH_GLOBALS'})), 'XSLPATH'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({(get({get({'TransformInfoHttpContext', 'FREEBLISKET_PATH_GLOBALS'}), '$class'})):getInstance(get({'TransformInfoHttpContext', 'FREEBLISKET_PATH_GLOBALS'})), 'INSTALLPATH'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getStoreName(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'AbPathData':getInstance(), 'SEPARATOR'})),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

% throws Exception
getTemplateFilePath(This) ->
        'AbPath':new((get({This, '$class'})):getPath(This), (get({This, '$class'})):getTemplateFile(This)).

% throws Exception
getObjectConfigFilePath(This) ->
        'AbPath':new((get({This, '$class'})):getPath(This), (get({This, '$class'})):getObjectConfigFile(This)).

% throws Exception
getDataFilePath(This) ->
        'AbPath':new((get({This, '$class'})):getPath(This), (get({This, '$class'})):getDataFile(This)).

