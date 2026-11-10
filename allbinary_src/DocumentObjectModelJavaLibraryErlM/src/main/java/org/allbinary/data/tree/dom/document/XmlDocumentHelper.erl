% 
% AllBinary Open License Version 1 
% Copyright (c) 2022 AllBinary 
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
% package org.allbinary.data.tree.dom.document
% import java.io.ByteArrayOutputStream
% import java.io.StringReader
% import java.io.StringWriter
% import java.io.Writer
% import javax.xml.parsers.DocumentBuilderFactory
% import javax.xml.transform.OutputKeys
% import javax.xml.transform.Transformer
% import javax.xml.transform.TransformerConfigurationException
% import javax.xml.transform.TransformerFactory
% import javax.xml.transform.dom.DOMSource
% import javax.xml.transform.stream.StreamResult
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.java.bool.BooleanFactory
% import org.allbinary.logic.java.characters.CharacterSetData
% import org.w3c.dom.Document
% import org.xml.sax.InputSource

-module('XmlDocumentHelper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'XmlDocumentHelper':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, 'INDENT_NUMBER'}, "indent-number"),
    put({This, indent}, 0),
    put({This, ignoreDeclaration}, false),
    ok.


getInstance() ->
        get({'XmlDocumentHelper', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        (get({This, '$class'})):init(This, 4, true).

init(This, Indent, IgnoreDeclaration) when is_integer(Indent), is_boolean(IgnoreDeclaration) ->
        put({This, indent}, Indent),
        put({This, ignoreDeclaration}, IgnoreDeclaration).

% throws TransformerConfigurationException
createTransformer(This, Indent, IgnoreDeclaration) when is_integer(Indent), is_boolean(IgnoreDeclaration) ->
        BooleanFactory = 'BooleanFactory':getInstance(),
        TransformerFactory = 'TransformerFactory':newInstance(),
        (get({TransformerFactory, '$class'})):setAttribute(TransformerFactory, get({This, 'INDENT_NUMBER'}), Indent),
        Transformer = (get({TransformerFactory, '$class'})):newTransformer(TransformerFactory),
        (get({Transformer, '$class'})):setOutputProperty(Transformer, get({'OutputKeys', 'ENCODING'}), get({'CharacterSetData':getInstance(), 'UTF_8'})),
        (get({Transformer, '$class'})):setOutputProperty(Transformer, get({'OutputKeys', 'OMIT_XML_DECLARATION'}), case IgnoreDeclaration of true -> get({BooleanFactory, 'YES'}); false -> get({BooleanFactory, 'NO'}) end),
        (get({Transformer, '$class'})):setOutputProperty(Transformer, get({'OutputKeys', 'INDENT'}), get({BooleanFactory, 'YES'})),
        Transformer.

% throws TransformerConfigurationException
createTransformer(This) ->
        put({local, currentIndent}, 0),
        put({local, currentIgnoreDeclaration}, false),
        begin % synchronized
            put({local, currentIndent}, get({This, indent})),
            put({local, currentIgnoreDeclaration}, get({This, ignoreDeclaration}))
        end,
        (get({This, '$class'})):createTransformer(This, get({local, currentIndent}), get({local, currentIgnoreDeclaration})).

% throws Exception
format(This, XmlString) when (is_list(XmlString) orelse XmlString =:= undefined) ->
        (get({This, '$class'})):formatWithTransformer(This, XmlString, (get({This, '$class'})):createTransformer(This)).

% throws Exception
formatWithTransformer(This, XmlString, Transformer) when (is_list(XmlString) orelse XmlString =:= undefined) ->
        Src = 'InputSource':new('StringReader':new(XmlString)),
        Document = (fun(Target_N67338) -> (get({Target_N67338, '$class'})):parse(Target_N67338, Src) end)((fun(Target_N67345) -> (get({Target_N67345, '$class'})):newDocumentBuilder(Target_N67345) end)('DocumentBuilderFactory':newInstance())),
        Out = 'StringWriter':new(),
        (get({Transformer, '$class'})):transform(Transformer, 'DOMSource':new(Document), 'StreamResult':new(Out)),
        (get({Out, '$class'})):toString(Out).

% throws Exception
toString(Document) ->
        try
            DomSource = 'DOMSource':new(Document),
            ByteArrayOutputStream = 'ByteArrayOutputStream':new(),
            StreamResult = 'StreamResult':new(ByteArrayOutputStream),
            CopyTransformerFactory = 'TransformerFactory':newInstance(),
            CopyTransformer = (get({CopyTransformerFactory, '$class'})):newTransformer(CopyTransformerFactory),
            (get({CopyTransformer, '$class'})):transform(CopyTransformer, DomSource, StreamResult),
            (get({ByteArrayOutputStream, '$class'})):toString(ByteArrayOutputStream)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        end.

