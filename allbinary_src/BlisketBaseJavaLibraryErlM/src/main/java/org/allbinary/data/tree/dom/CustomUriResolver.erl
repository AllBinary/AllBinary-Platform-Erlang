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
% import org.allbinary.logic.visual.transform.info.template.TransformInfoTemplateData

-module('CustomUriResolver').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements URIResolver

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, uriResolverStrings}, 'URIResolverStrings':getInstance()),
    put({This, path}, undefined),
    put({This, basicURIResolver}, undefined),
    ok.


new(Path, BasicURIResolver) when (is_list(Path) orelse Path =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Path, BasicURIResolver),
    This.

'$init'(This, Path, BasicURIResolver) when (is_list(Path) orelse Path =:= undefined) ->
    init_fields(This),
        put({This, path}, Path),
        put({This, basicURIResolver}, BasicURIResolver).

% throws TransformerException
resolve(This, Href, Base) when (is_list(Href) orelse Href =:= undefined), (is_list(Base) orelse Base =:= undefined) ->
        try
            StringBuffer = 'StringMaker':new(),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({This, path})),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({'AbPathData':getInstance(), 'SEPARATOR'})),
            (get({StringBuffer, '$class'})):append(StringBuffer, Href),
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
                (get({StringBuffer, '$class'})):append(StringBuffer, get({(get({get({'CustomUriResolver', 'FREEBLISKET_PATH_GLOBALS'}), '$class'})):getInstance(get({'CustomUriResolver', 'FREEBLISKET_PATH_GLOBALS'})), 'XSLPATH'})),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, uriResolverStrings}), 'URL_GLOBAL'})),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, uriResolverStrings}), 'REQUIRED_EXTENSION'})),
                (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, basicURIResolver}), '$class'})):getExtension(get({This, basicURIResolver})));
                false -> ok
            end,
            'StreamSource':new((fun(Target_N67210) -> (get({Target_N67210, '$class'})):getInputStream(Target_N67210, FileAbPath) end)('CryptFileReader':new(get({'TransformInfoTemplateData':getInstance(), 'UNCRYPTED_EXTENSION'}), get({'TransformInfoTemplateData':getInstance(), 'ENCRYPTED_EXTENSION'}))))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        end.

toString(This) ->
        get({This, path}).

