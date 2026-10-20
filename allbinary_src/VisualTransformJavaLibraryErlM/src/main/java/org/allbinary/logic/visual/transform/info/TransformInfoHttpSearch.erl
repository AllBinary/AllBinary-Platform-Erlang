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
% import org.allbinary.globals.FREEBLISKET_PATH_GLOBALS
% import org.allbinary.globals.URLGLOBALS
% import org.allbinary.logic.control.search.SearchRequest
% import org.allbinary.logic.io.path.AbPath
% import org.allbinary.logic.io.path.AbPathData
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil

-module('TransformInfoHttpSearch').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('TransformInfoHttp', Function, Arguments).

init_fields(This) ->
    ok.


new(SearchRequest) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, SearchRequest),
    This.

'$init'(This, SearchRequest) ->
        'TransformInfoHttp':'$init'(This, (get({SearchRequest, '$class'})):getPropertiesHashMap(SearchRequest), (get({SearchRequest, '$class'})):getPageContext(SearchRequest)),
        case ((fun(Target_N65874) -> (get({Target_N65874, '$class'})):getName(Target_N65874) end)((get({SearchRequest, '$class'})):getStoreFront(SearchRequest)) =/= undefined) of
            true ->
            (get({This, '$class'})):setStoreName(This, (fun(Target_N65971) -> (get({Target_N65971, '$class'})):getName(Target_N65971) end)((get({SearchRequest, '$class'})):getStoreFront(SearchRequest)));
            false ->
            (get({This, '$class'})):setStoreName(This, get({'StringUtil':getInstance(), 'EMPTY_STRING'}))
        end,
        DataFileName = (get({SearchRequest, '$class'})):getXslFile(SearchRequest),
        (get({This, '$class'})):setTemplateFile(This, DataFileName).

% throws Exception
getPath(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({'TransformInfoHttpSearch', 'URLGLOBALS'}), '$class'})):getMainPath(get({'TransformInfoHttpSearch', 'URLGLOBALS'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({(get({get({'TransformInfoHttpSearch', 'FREEBLISKET_PATH_GLOBALS'}), '$class'})):getInstance(get({'TransformInfoHttpSearch', 'FREEBLISKET_PATH_GLOBALS'})), 'XSLPATH'})),
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

