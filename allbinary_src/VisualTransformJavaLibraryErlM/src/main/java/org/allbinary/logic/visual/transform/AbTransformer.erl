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
% package org.allbinary.logic.visual.transform
% import java.io.InputStream
% import java.io.StringBufferInputStream
% import javax.xml.transform.URIResolver
% import javax.xml.transform.stream.StreamSource
% import org.allbinary.data.tree.dom.XslHelper
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.allbinary.logic.visual.transform.info.objectConfig.generator.TransformInfoObjectConfigGenerator
% import org.allbinary.logic.visual.transform.info.objectConfig.generator.TransformInfoObjectConfigGeneratorFactory
% import org.allbinary.string.CommonStrings

-module('AbTransformer').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements BasicTransformerInterface

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, transformInfoInterface}, undefined),
    put({This, inputStream}, undefined),
    put({This, uriResolver}, undefined),
    ok.


new(TransformInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, TransformInfoInterface),
    This.

init(This, TransformInfoInterface) ->
    init_fields(This),
        put({This, transformInfoInterface}, TransformInfoInterface).

getTransformInfoInterface(This) ->
        get({This, transformInfoInterface}).

setInputStream(This, InputStream) ->
        put({This, inputStream}, InputStream).

setURIResolver(This, UriResolver) ->
        put({This, uriResolver}, UriResolver).

getInputStream(This) ->
        get({This, inputStream}).

getURIResolver(This) ->
        get({This, uriResolver}).

getStreamSource(This) ->
        'StreamSource':new((get({This, '$class'})):getInputStream(This)).

% throws Exception
translate(This, XmlDocumentStr) when (is_list(XmlDocumentStr) orelse XmlDocumentStr =:= undefined) ->
        try
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'XMLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["xml: \n", XmlDocumentStr]), This, "translate(String xmlDocumentStr)");
                false -> ok
            end,
            case ((get({This, '$class'})):getURIResolver(This) =:= undefined) of
                true ->
                erlang:error({'Exception', "No URIResolver"});
                false -> ok
            end,
            Result = (fun(Target_N66849) -> (get({Target_N66849, '$class'})):translate(Target_N66849, (get({This, '$class'})):getURIResolver(This), 'StreamSource':new((get({This, '$class'})):getInputStream(This)), 'StreamSource':new('StringBufferInputStream':new(XmlDocumentStr))) end)('XslHelper':getInstance()),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'XSLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["translated xml: ", Result]), This, "translate(String xmlDocumentStr)");
                false -> ok
            end,
            TransformInfoObjectConfigGeneratorInterface = (fun(Target_N67202) -> (get({Target_N67202, '$class'})):getInstance(Target_N67202, (get({This, '$class'})):getTransformInfoInterface(This)) end)('TransformInfoObjectConfigGeneratorFactory':getInstance()),
            (get({TransformInfoObjectConfigGeneratorInterface, '$class'})):process(TransformInfoObjectConfigGeneratorInterface, Result)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEWERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), (get({get({This, transformInfoInterface}), '$class'})):log(get({This, transformInfoInterface})), This, "translate(document)", E);
                false -> ok
            end,
            erlang:error(E)
        end.

