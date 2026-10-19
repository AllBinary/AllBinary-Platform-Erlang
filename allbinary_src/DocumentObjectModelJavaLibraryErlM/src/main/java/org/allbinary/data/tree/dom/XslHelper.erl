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
% import java.io.ByteArrayOutputStream
% import java.io.File
% import java.io.OutputStream
% import java.io.StringBufferInputStream
% import javax.xml.transform.Transformer
% import javax.xml.transform.TransformerFactory
% import javax.xml.transform.URIResolver
% import javax.xml.transform.stream.StreamResult
% import javax.xml.transform.stream.StreamSource
% import org.allbinary.data.tree.dom.document.XmlDocumentHelper
% import org.w3c.dom.Document

-module('XslHelper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'XslHelper':new()),
    ok.

init_fields(This) ->
    ok.


getInstance() ->
        get({'XslHelper', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

% throws Exception
translate(This, XsltStreamSource, XmlStreamSource, StreamResult) ->
        try
            TransformerFactory = 'TransformerFactory':newInstance(),
            Transformer = (get({TransformerFactory, '$class'})):newTransformer(TransformerFactory, XsltStreamSource),
            (get({Transformer, '$class'})):transform(Transformer, XmlStreamSource, StreamResult),
            (get({StreamResult, '$class'})):getOutputStream(StreamResult)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        end;
% throws Exception
translate(This, Resolver, XsltStreamSource, XmlStreamSource) ->
        try
            OutputStream = 'ByteArrayOutputStream':new(),
            (fun(Target_N67391) -> (get({Target_N67391, '$class'})):toString(Target_N67391) end)((get({This, '$class'})):translate(This, Resolver, XsltStreamSource, XmlStreamSource, 'StreamResult':new(OutputStream)))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        end.

% throws Exception
translate(This, Resolver, XsltStreamSource, XmlStreamSource, StreamResult) ->
        try
            TFactory = 'TransformerFactory':newInstance(),
            (get({TFactory, '$class'})):setURIResolver(TFactory, Resolver),
            Transformer = (get({TFactory, '$class'})):newTransformer(TFactory, XsltStreamSource),
            (get({Transformer, '$class'})):transform(Transformer, XmlStreamSource, StreamResult),
            (get({StreamResult, '$class'})):getOutputStream(StreamResult)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        end.

% throws Exception
translate(This, XsltStreamSource, XmlDocument) ->
        try
            OutputStream = 'ByteArrayOutputStream':new(),
            (fun(Target_N66828) -> (get({Target_N66828, '$class'})):toString(Target_N66828) end)((get({This, '$class'})):translate(This, XsltStreamSource, 'StreamSource':new('StringBufferInputStream':new('XmlDocumentHelper':toString(XmlDocument))), 'StreamResult':new(OutputStream)))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        end;
% throws Exception
translate(This, XsltStreamSource, XmlStreamSource) ->
        try
            OutputStream = 'ByteArrayOutputStream':new(),
            (fun(Target_N67134) -> (get({Target_N67134, '$class'})):toString(Target_N67134) end)((get({This, '$class'})):translate(This, XsltStreamSource, XmlStreamSource, 'StreamResult':new(OutputStream)))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        end.



% throws Exception
export(This, OutputFile, XsltFilePath, XmlDocument) when (is_list(XsltFilePath) orelse XsltFilePath =:= undefined) ->
        try
            (get({OutputFile, '$class'})):createNewFile(OutputFile),
            (get({This, '$class'})):translate(This, 'StreamSource':new(XsltFilePath), 'StreamSource':new('StringBufferInputStream':new('XmlDocumentHelper':toString(XmlDocument))), 'StreamResult':new(OutputFile))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        end.

