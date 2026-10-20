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
% package org.allbinary.logic.visual.transform.info.objectConfig.generator
% import java.io.ByteArrayInputStream
% import java.io.InputStream
% import java.util.HashMap
% import org.allbinary.globals.URLGLOBALS
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.http.request.session.WeblisketSession
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.io.InputOutputTypeData
% import org.allbinary.logic.io.file.AbFile
% import org.allbinary.logic.io.file.FileUtil
% import org.allbinary.logic.io.path.AbPath
% import org.allbinary.logic.io.path.AbPathData
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.string.StringValidationUtil
% import org.allbinary.logic.string.regex.replace.Replace
% import org.allbinary.logic.visual.transform.info.TransformInfoHttpInterface
% import org.allbinary.logic.visual.transform.info.TransformInfoHttpStoreInterface
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.allbinary.logic.visual.transform.info.TransformInfosData
% import org.allbinary.string.CommonSeps
% import org.allbinary.string.CommonStrings

-module('StoreFileGenerator').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('TransformInfoObjectConfigGenerator', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, output}, undefined),
    put({This, fileAbPath}, undefined),
    put({This, file}, undefined),
    ok.


new(TransformInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, TransformInfoInterface),
    This.

'$init'(This, TransformInfoInterface) ->
    'TransformInfoObjectConfigGenerator':'$init'(This),
    init_fields(This),
        HttpTransformInfoInterface = TransformInfoInterface,
        WeblisketSession = 'WeblisketSession':new((get({HttpTransformInfoInterface, '$class'})):getPropertiesHashMap(HttpTransformInfoInterface), (get({HttpTransformInfoInterface, '$class'})):getPageContext(HttpTransformInfoInterface)),
        put({local, stringBuffer}, 'StringMaker':new()),
        (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), (get({get({'StoreFileGenerator', 'URLGLOBALS'}), '$class'})):getWebappPath(get({'StoreFileGenerator', 'URLGLOBALS'}))),
        (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), (get({WeblisketSession, '$class'})):getStoreName(WeblisketSession)),
        (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), get({'AbPathData':getInstance(), 'SEPARATOR'})),
        put({local, abPath}, 'AbPath':new((get({get({local, stringBuffer}), '$class'})):toString(get({local, stringBuffer})), get({'StringUtil':getInstance(), 'EMPTY_STRING'}))),
        put({local, fileName}, (fun(Target_N66909) -> (get({Target_N66909, '$class'})):get(Target_N66909, get({'InputOutputTypeData':getInstance(), 'FILE'})) end)((get({HttpTransformInfoInterface, '$class'})):getPropertiesHashMap(HttpTransformInfoInterface))),
        StringValidationUtil = 'StringValidationUtil':getInstance(),
        case (get({StringValidationUtil, '$class'})):isEmpty(StringValidationUtil, get({local, fileName})) of
            true ->
            TransformInfoHttpStoreInterface = TransformInfoInterface,
            put({local, fileName}, (fun(Target_N67133) -> (get({Target_N67133, '$class'})):substring(Target_N67133, ((fun(Target_N67162) -> (get({Target_N67162, '$class'})):length(Target_N67162) end)((get({TransformInfoHttpStoreInterface, '$class'})):getStoreName(TransformInfoHttpStoreInterface)) + 1)) end)((get({TransformInfoInterface, '$class'})):getName(TransformInfoInterface))),
            OutputMappingHashMap = (fun(Target_N67210) -> (get({Target_N67210, '$class'})):createHashMap(Target_N67210) end)('StdUtil':getInstance()),
            (get({OutputMappingHashMap, '$class'})):put(OutputMappingHashMap, get({'TransformInfosData':getInstance(), 'PREVIEW'}), "Preview"),
            (get({OutputMappingHashMap, '$class'})):put(OutputMappingHashMap, get({'TransformInfosData':getInstance(), 'SMALL_PREVIEW'}), "SmallPreview"),
            (get({OutputMappingHashMap, '$class'})):put(OutputMappingHashMap, get({'CommonSeps':getInstance(), 'SPACE'}), get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
            Replace = 'Replace':new(OutputMappingHashMap),
            put({local, fileName}, (get({Replace, '$class'})):all(Replace, get({local, fileName})));
            false -> ok
        end,
        case (get({StringValidationUtil, '$class'})):isEmpty(StringValidationUtil, get({local, fileName})) of
            true ->
            erlang:error({'Exception', "TransformInfoObjectConfigGenerator FileName Not Specified"});
            false -> ok
        end,
        put({local, tempOutput}, (fun(Target_N67599) -> (get({Target_N67599, '$class'})):get(Target_N67599, get({'InputOutputTypeData':getInstance(), 'NAME'})) end)((get({HttpTransformInfoInterface, '$class'})):getPropertiesHashMap(HttpTransformInfoInterface))),
        case (get({StringValidationUtil, '$class'})):isEmpty(StringValidationUtil, get({local, tempOutput})) of
            true ->
            put({local, tempOutput}, get({'InputOutputTypeData':getInstance(), 'DEFAULT'}));
            false -> ok
        end,
        put({This, output}, get({local, tempOutput})),
        case (get({StringValidationUtil, '$class'})):isEmpty(StringValidationUtil, get({This, output})) of
            true ->
            erlang:error({'Exception', "TransformInfoObjectConfigGenerator Output=extension Not Specified"});
            false -> ok
        end,
        put({local, stringBuffer}, 'StringMaker':new()),
        (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), get({local, fileName})),
        (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), get({'AbPathData':getInstance(), 'EXTENSION_SEP'})),
        (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), get({This, output})),
        put({local, abPath}, 'AbPath':new((get({get({local, abPath}), '$class'})):toString(get({local, abPath})), (get({get({local, stringBuffer}), '$class'})):toString(get({local, stringBuffer})))),
        put({This, fileAbPath}, get({local, abPath})),
        put({This, file}, 'AbFile':createAbFileFromAbPath(get({This, fileAbPath}))),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["File: ", (get({get({This, fileAbPath}), '$class'})):toString(get({This, fileAbPath}))]), This, get({get({This, commonStrings}), 'CONSTRUCTOR'}));
            false -> ok
        end.

% throws Exception
process(This, Input) when (is_list(Input) orelse Input =:= undefined) ->
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Processing", This, get({get({This, commonStrings}), 'PROCESS'}));
            false -> ok
        end,
        case (not (get({get({This, file}), '$class'})):exists(get({This, file}))) of
            true ->
            (get({get({This, file}), '$class'})):createNewFile(get({This, file}));
            false -> ok
        end,
        case (get({get({This, file}), '$class'})):exists(get({This, file})) of
            true ->
            InputStream = 'ByteArrayInputStream':new((get({Input, '$class'})):getBytes(Input)),
            (fun(Target_N68862) -> (get({Target_N68862, '$class'})):write(Target_N68862, InputStream, get({This, file})) end)('FileUtil':getInstance());
            false ->
            erlang:error({'Exception', lists:concat(["Could Not Create: ", (get({get({This, fileAbPath}), '$class'})):toString(get({This, fileAbPath}))])})
        end,
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Processed", This, get({get({This, commonStrings}), 'PROCESS'}));
            false -> ok
        end,
        get({'StringUtil':getInstance(), 'EMPTY_STRING'}).

