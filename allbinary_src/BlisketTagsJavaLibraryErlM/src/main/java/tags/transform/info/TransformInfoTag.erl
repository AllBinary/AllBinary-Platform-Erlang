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
% package tags.transform.info
% import javax.servlet.jsp.JspTagException
% import admin.taghelpers.TagHelperFactoryInterface
% import org.allbinary.business.context.modules.storefront.StoreFrontData
% import org.allbinary.logic.communication.http.request.AbResponseHandler
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.io.OutputTypeData
% import org.allbinary.logic.visual.transform.info.TransformInfoData
% import taghelpers.transform.info.TransformInfoRequestHelperFactory
% import tags.ModifyTag

-module('TransformInfoTag').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ModifyTag', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, name}, undefined),
    put({This, storeName}, undefined),
    put({This, objectFile}, undefined),
    put({This, anyType}, undefined),
    put({This, objectConfigFile}, undefined),
    put({This, objectConfig}, undefined),
    put({This, templateFile}, undefined),
    put({This, template}, undefined),
    put({This, dataFile}, undefined),
    put({This, data}, undefined),
    put({This, type}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
        'ModifyTag':init(This, 'TransformInfoRequestHelperFactory':new()),
        init_fields(This).

new(TagHelperFactoryInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, TagHelperFactoryInterface),
    This.

init(This, TagHelperFactoryInterface) ->
        'ModifyTag':init(This, TagHelperFactoryInterface),
        init_fields(This).

setName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, name}, Value),
        (fun(Target_N66398) -> (get({Target_N66398, '$class'})):put(Target_N66398, get({'TransformInfoData':getInstance(), 'NAME'}), get({This, name})) end)((get({This, '$class'})):getPropertiesHashMap(This)).

setStoreName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, storeName}, Value),
        (fun(Target_N66532) -> (get({Target_N66532, '$class'})):put(Target_N66532, get({'StoreFrontData':getInstance(), 'NAME'}), get({This, storeName})) end)((get({This, '$class'})):getPropertiesHashMap(This)).

setObjectFile(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, objectFile}, Value),
        (fun(Target_N66666) -> (get({Target_N66666, '$class'})):put(Target_N66666, get({'TransformInfoData':getInstance(), 'OBJECTFILENAME'}), get({This, objectFile})) end)((get({This, '$class'})):getPropertiesHashMap(This)).

setObject(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, anyType}, Value),
        (fun(Target_N66800) -> (get({Target_N66800, '$class'})):put(Target_N66800, get({'TransformInfoData':getInstance(), 'OBJECT'}), get({This, anyType})) end)((get({This, '$class'})):getPropertiesHashMap(This)).

setTemplateFile(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, templateFile}, Value),
        (fun(Target_N66934) -> (get({Target_N66934, '$class'})):put(Target_N66934, get({'TransformInfoData':getInstance(), 'TEMPLATEFILENAME'}), get({This, templateFile})) end)((get({This, '$class'})):getPropertiesHashMap(This)).

setTemplate(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, template}, Value),
        (fun(Target_N67068) -> (get({Target_N67068, '$class'})):put(Target_N67068, get({'TransformInfoData':getInstance(), 'TEMPLATE'}), get({This, template})) end)((get({This, '$class'})):getPropertiesHashMap(This)).

setDataFile(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, dataFile}, Value),
        (fun(Target_N67202) -> (get({Target_N67202, '$class'})):put(Target_N67202, get({'TransformInfoData':getInstance(), 'DATAFILENAME'}), get({This, dataFile})) end)((get({This, '$class'})):getPropertiesHashMap(This)).

setData(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, data}, Value),
        (fun(Target_N67336) -> (get({Target_N67336, '$class'})):put(Target_N67336, get({'TransformInfoData':getInstance(), 'DATA'}), get({This, data})) end)((get({This, '$class'})):getPropertiesHashMap(This)).

setObjectConfigFile(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, objectConfigFile}, Value),
        (fun(Target_N67470) -> (get({Target_N67470, '$class'})):put(Target_N67470, get({'TransformInfoData':getInstance(), 'OBJECTCONFIGFILENAME'}), get({This, objectConfigFile})) end)((get({This, '$class'})):getPropertiesHashMap(This)).

setObjectConfig(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, objectConfig}, Value),
        (fun(Target_N67604) -> (get({Target_N67604, '$class'})):put(Target_N67604, get({'TransformInfoData':getInstance(), 'OBJECTCONFIG'}), get({This, objectConfig})) end)((get({This, '$class'})):getPropertiesHashMap(This)).

setType(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, type}, Value),
        (fun(Target_N67738) -> (get({Target_N67738, '$class'})):put(Target_N67738, get({'OutputTypeData':getInstance(), 'NAME'}), get({This, type})) end)((get({This, '$class'})):getPropertiesHashMap(This)),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'JSPTAG'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["TransformInfoTag type set: ", get({This, type})]), This, "setType");
            false -> ok
        end.

getName(This) ->
        get({This, name}).

getObjectFile(This) ->
        get({This, objectFile}).

% throws JspTagException
doStartTag(This) ->
        try
            'ModifyTag':doStartTag(This)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            'AbResponseHandler':sendJspTagRedirect(get({This, pageContext}), E),
            get({'TransformInfoTag', 'SKIP_BODY'})
        end.

