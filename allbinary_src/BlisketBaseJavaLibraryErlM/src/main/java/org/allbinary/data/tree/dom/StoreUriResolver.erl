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
% package org.allbinary.data.tree.dom
% import javax.xml.transform.Source
% import javax.xml.transform.TransformerException
% import javax.xml.transform.URIResolver
% import javax.xml.transform.stream.StreamSource
% import org.allbinary.globals.FREEBLISKET_PATH_GLOBALS
% import org.allbinary.globals.URLGLOBALS
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.control.crypt.file.CryptFileReader
% import org.allbinary.logic.io.path.AbFilePath
% import org.allbinary.logic.io.path.AbPath
% import org.allbinary.logic.io.path.AbPathData
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.visual.transform.info.TransformInfoHttpStoreInterface
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.allbinary.logic.visual.transform.info.template.TransformInfoTemplateData

-module('StoreUriResolver').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements URIResolver

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, uriResolverStrings}, 'URIResolverStrings':getInstance()),
    put({This, basicURIResolver}, undefined),
    put({This, parentTransformInfoInterface}, undefined),
    ok.


new(ParentTransformInfoInterface, BasicURIResolver) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, ParentTransformInfoInterface, BasicURIResolver),
    This.

init(This, ParentTransformInfoInterface, BasicURIResolver) ->
    init_fields(This),
        put({This, parentTransformInfoInterface}, ParentTransformInfoInterface),
        put({This, basicURIResolver}, BasicURIResolver).

% throws TransformerException
resolve(This, Href, Base) when (is_list(Href) orelse Href =:= undefined), (is_list(Base) orelse Base =:= undefined) ->
        try
            StringBuffer = 'StringMaker':new(),
            TransformInfoHttpStoreInterface = get({This, parentTransformInfoInterface}),
            (fun(Target_N66486) -> (get({Target_N66486, '$class'})):append(Target_N66486, Href) end)((fun(Target_N66493) -> (get({Target_N66493, '$class'})):append(Target_N66493, get({'AbPathData':getInstance(), 'SEPARATOR'})) end)((fun(Target_N66500) -> (get({Target_N66500, '$class'})):append(Target_N66500, (get({TransformInfoHttpStoreInterface, '$class'})):getStoreName(TransformInfoHttpStoreInterface)) end)((fun(Target_N66507) -> (get({Target_N66507, '$class'})):append(Target_N66507, get({(get({get({'StoreUriResolver', 'FREEBLISKET_PATH_GLOBALS'}), '$class'})):getInstance(get({'StoreUriResolver', 'FREEBLISKET_PATH_GLOBALS'})), 'XSLPATH'})) end)((get({StringBuffer, '$class'})):append(StringBuffer, (get({get({'StoreUriResolver', 'URLGLOBALS'}), '$class'})):getMainPath(get({'StoreUriResolver', 'URLGLOBALS'}))))))),
            FileAbPath = 'AbFilePath':new((get({StringBuffer, '$class'})):toString(StringBuffer)),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'XMLLOGGING'})) of
                true ->
                (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, uriResolverStrings}), 'ATTEMPT'})),
                (get({StringBuffer, '$class'})):append(StringBuffer, Href),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, uriResolverStrings}), 'BASE'})),
                (get({StringBuffer, '$class'})):append(StringBuffer, Base),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, uriResolverStrings}), 'NEW_PATH'})),
                (get({StringBuffer, '$class'})):append(StringBuffer, (get({FileAbPath, '$class'})):toString(FileAbPath)),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, uriResolverStrings}), 'NOTE'})),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({(get({get({'StoreUriResolver', 'FREEBLISKET_PATH_GLOBALS'}), '$class'})):getInstance(get({'StoreUriResolver', 'FREEBLISKET_PATH_GLOBALS'})), 'XSLPATH'})),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, uriResolverStrings}), 'URL_GLOBAL'})),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, uriResolverStrings}), 'REQUIRED_EXTENSION'})),
                (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, basicURIResolver}), '$class'})):getExtension(get({This, basicURIResolver}))),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, get({get({This, uriResolverStrings}), 'RESOLVE'}));
                false -> ok
            end,
            'StreamSource':new((fun(Target_N67454) -> (get({Target_N67454, '$class'})):getInputStream(Target_N67454, FileAbPath) end)('CryptFileReader':new(get({'TransformInfoTemplateData':getInstance(), 'UNCRYPTED_EXTENSION'}), get({'TransformInfoTemplateData':getInstance(), 'ENCRYPTED_EXTENSION'}))))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        end.

toString(This) ->
        try
            lists:concat([((get({get({'StoreUriResolver', 'URLGLOBALS'}), '$class'})):getMainPath(get({'StoreUriResolver', 'URLGLOBALS'})) + get({(get({get({'StoreUriResolver', 'FREEBLISKET_PATH_GLOBALS'}), '$class'})):getInstance(get({'StoreUriResolver', 'FREEBLISKET_PATH_GLOBALS'})), 'XSLPATH'})), "{Store Name if Any}/{import url}"])
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            "StoreUriResolver - Does not work without webapp path should be changed"
        end.

