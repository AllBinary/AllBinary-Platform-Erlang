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
% package org.allbinary.data.tree.dom.document
% import java.io.InputStream
% import java.io.StringBufferInputStream
% import javax.xml.parsers.DocumentBuilder
% import javax.xml.parsers.DocumentBuilderFactory
% import org.w3c.dom.Document

-module('DomDocumentHelper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

init() ->
        'System':setProperty("jdk.xml.maxElementDepth", "0"),
        'System':setProperty("jdk.xml.xpathExprOpLimit", "0"),
        'System':setProperty("jdk.xml.xpathTotalOpLimit", "0"),
        LIMIT = "500000",
        'System':setProperty("jdk.xml.maxGeneralEntitySizeLimit", LIMIT),
        'System':setProperty("jdk.xml.totalEntitySizeLimit", LIMIT).

create() ->
        try
            Factory = 'DocumentBuilderFactory':newInstance(),
            Builder = (get({Factory, '$class'})):newDocumentBuilder(Factory),
            Document = (get({Builder, '$class'})):newDocument(Builder),
            Document
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            undefined
        end.

% throws Exception
create(XmlString) when (is_list(XmlString) orelse XmlString =:= undefined) ->
        try
            Factory = 'DocumentBuilderFactory':newInstance(),
            Builder = (get({Factory, '$class'})):newDocumentBuilder(Factory),
            Document = (get({Builder, '$class'})):parse(Builder, 'StringBufferInputStream':new(XmlString)),
            Document
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        end;
% throws Exception
create(InputStream) ->
        try
            Factory = 'DocumentBuilderFactory':newInstance(),
            Builder = (get({Factory, '$class'})):newDocumentBuilder(Factory),
            Document = (get({Builder, '$class'})):parse(Builder, InputStream),
            Document
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        end.


