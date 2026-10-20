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
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import javax.servlet.jsp.PageContext
% import org.allbinary.business.context.AbContext
% import org.allbinary.business.context.modules.storefront.StoreFrontInterface
% import org.allbinary.logic.io.path.AbPath
% import org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigInterface
% import org.w3c.dom.Document

-module('TransformInfoBasic').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements TransformInfoHttpInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('AbContext', Function, Arguments).

init_fields(This) ->
    put({This, storeFrontInterface}, undefined),
    ok.


new(StoreFrontInterface, PropertiesHashMap, PageContext) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, StoreFrontInterface, PropertiesHashMap, PageContext),
    This.

'$init'(This, StoreFrontInterface, PropertiesHashMap, PageContext) ->
        'AbContext':'$init'(This, PropertiesHashMap, PageContext),
        init_fields(This),
        put({This, storeFrontInterface}, StoreFrontInterface).

getStoreName(This) ->
        (get({get({This, storeFrontInterface}), '$class'})):getName(get({This, storeFrontInterface})).

log(This) ->
        get({get({This, commonStrings}), 'NOT_IMPLEMENTED'}).

override(This, HashMap) ->
        ok.

getName(This) ->
        undefined.

getObjectFile(This) ->
        undefined.

getObject(This) ->
        undefined.

getObjectConfigInterface(This) ->
        undefined.

setObjectConfigInterface(This, TransformInfoObjectConfigInterface) ->
        ok.

getTemplateFilePath(This) ->
        undefined.

getTemplateFile(This) ->
        undefined.

getTemplate(This) ->
        undefined.

getDataFilePath(This) ->
        undefined.

getDataFile(This) ->
        undefined.

% throws Exception
getDataDocument(This) ->
        erlang:error({'Exception', get({get({This, commonStrings}), 'NOT_IMPLEMENTED'})}).

setName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        ok.

setStoreName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        ok.

setObjectFile(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        ok.

setObject(This, AnyType) ->
        ok.

setObjectConfigFile(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        ok.

setTemplateFile(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        ok.

setTemplate(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        ok.

setDataFile(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        ok.

setData(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        ok.

setChild(This) ->
        ok.

isChild(This) ->
        true.

getImportUriPath(This) ->
        undefined.

setImportUriPath(This, ImportUriPath) when (is_list(ImportUriPath) orelse ImportUriPath =:= undefined) ->
        ok.

% throws Exception
getKey(This) ->
        undefined.

% throws Exception
toVector(This) ->
        undefined.

% throws Exception
toHashMap(This) ->
        undefined.

