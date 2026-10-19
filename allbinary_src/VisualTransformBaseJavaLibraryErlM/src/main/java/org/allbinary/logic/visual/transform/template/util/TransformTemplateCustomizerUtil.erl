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
% package org.allbinary.logic.visual.transform.template.util
% import java.util.HashMap
% import org.allbinary.globals.GLOBALS2
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.string.regex.replace.Replace
% import org.allbinary.logic.visual.transform.info.CustomizerTransformInfoData
% import org.allbinary.logic.visual.transform.template.customizer.bodies.BodyData
% import org.allbinary.logic.visual.transform.template.customizer.widgets.title.TitleData
% import org.allbinary.string.CommonSeps
% import org.allbinary.string.CommonStrings

-module('TransformTemplateCustomizerUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'TransformTemplateCustomizerUtil':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, 'CUSTOMIZER_NAME'}, undefined),
    put({This, 'BODY_VIEWNAMEKEY'}, undefined),
    put({This, 'TITLE_VIEWNAMEKEY'}, undefined),
    put({This, 'GLOBALS_NEW'}, undefined),
    put({This, 'GLOBALS_INSERT'}, undefined),
    put({This, 'GLOBALS_DELETE'}, undefined),
    put({This, 'GLOBALS_EDIT'}, undefined),
    put({This, 'GLOBALS_UPDATE'}, undefined),
    ok.


getInstance() ->
        get({'TransformTemplateCustomizerUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        CommonStrings = 'CommonStrings':getInstance(),
        SPACE = get({'CommonSeps':getInstance(), 'SPACE'}),
        put({This, 'CUSTOMIZER_NAME'}, lists:concat([SPACE, get({'CustomizerTransformInfoData', 'NAME'})])),
        put({This, 'BODY_VIEWNAMEKEY'}, lists:concat([SPACE, get({'BodyData':getInstance(), 'VIEWNAMEKEY'})])),
        put({This, 'TITLE_VIEWNAMEKEY'}, lists:concat([SPACE, get({'TitleData':getInstance(), 'VIEWNAMEKEY'})])),
        put({This, 'GLOBALS_NEW'}, lists:concat([get({get({'TransformTemplateCustomizerUtil', 'GLOBALS2'}), 'NEW'}), SPACE])),
        put({This, 'GLOBALS_INSERT'}, lists:concat([get({CommonStrings, 'INSERT'}), SPACE])),
        put({This, 'GLOBALS_DELETE'}, lists:concat([get({CommonStrings, 'DELETE'}), SPACE])),
        put({This, 'GLOBALS_EDIT'}, lists:concat([get({get({'TransformTemplateCustomizerUtil', 'GLOBALS2'}), 'EDIT'}), SPACE])),
        put({This, 'GLOBALS_UPDATE'}, lists:concat([get({CommonStrings, 'UPDATE'}), SPACE])).

getPageNameHack(This, ViewName, StoreName) when (is_list(ViewName) orelse ViewName =:= undefined), (is_list(StoreName) orelse StoreName =:= undefined) ->
        SPACE = get({'CommonSeps':getInstance(), 'SPACE'}),
        ONE_EMPTY_STRING_ARRAY = get({'StringUtil':getInstance(), 'ONE_EMPTY_STRING_ARRAY'}),
        HashMap = (fun(Target_N67076) -> (get({Target_N67076, '$class'})):createHashMap(Target_N67076) end)('StdUtil':getInstance()),
        (get({HashMap, '$class'})):put(HashMap, array:from_list([lists:concat([ViewName, SPACE])]), ONE_EMPTY_STRING_ARRAY),
        (get({HashMap, '$class'})):put(HashMap, array:from_list([lists:concat([StoreName, SPACE])]), ONE_EMPTY_STRING_ARRAY),
        (get({HashMap, '$class'})):put(HashMap, array:from_list([get({This, 'CUSTOMIZER_NAME'})]), ONE_EMPTY_STRING_ARRAY),
        (get({HashMap, '$class'})):put(HashMap, array:from_list([get({This, 'BODY_VIEWNAMEKEY'})]), ONE_EMPTY_STRING_ARRAY),
        (get({HashMap, '$class'})):put(HashMap, array:from_list([get({This, 'TITLE_VIEWNAMEKEY'})]), ONE_EMPTY_STRING_ARRAY),
        (get({HashMap, '$class'})):put(HashMap, array:from_list([get({This, 'GLOBALS_NEW'})]), ONE_EMPTY_STRING_ARRAY),
        (get({HashMap, '$class'})):put(HashMap, array:from_list([get({This, 'GLOBALS_INSERT'})]), ONE_EMPTY_STRING_ARRAY),
        (get({HashMap, '$class'})):put(HashMap, array:from_list([get({This, 'GLOBALS_DELETE'})]), ONE_EMPTY_STRING_ARRAY),
        (get({HashMap, '$class'})):put(HashMap, array:from_list([get({This, 'GLOBALS_EDIT'})]), ONE_EMPTY_STRING_ARRAY),
        (get({HashMap, '$class'})):put(HashMap, array:from_list([get({This, 'GLOBALS_UPDATE'})]), ONE_EMPTY_STRING_ARRAY),
        Replace = undefined,
        RootViewName = (get({Replace, '$class'})):all(Replace, ViewName),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["RootViewName for ObjectConfig: ", RootViewName]), This, "getPageNameHack");
            false -> ok
        end,
        RootViewName.

