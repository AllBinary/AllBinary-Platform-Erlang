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
% import javax.xml.transform.Transformer
% import javax.xml.transform.TransformerFactory
% import javax.xml.transform.dom.DOMSource
% import javax.xml.transform.stream.StreamResult
% import org.allbinary.logic.io.AbDataOutputStream
% import org.allbinary.logic.io.AbFileInputStream
% import org.allbinary.logic.io.DataOutputStreamFactory
% import org.allbinary.logic.io.StreamUtil
% import org.allbinary.logic.io.file.AbFile
% import org.w3c.dom.Document

-module('DomDocumentFileHelper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

% throws Exception
createDocument(XmlFile) ->
        try
            'DomDocumentHelper':create('AbFileInputStream':new(XmlFile))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        end.

% throws Exception
save(File, Document) ->
        put({local, dataOutputStream}, undefined),
        try
            CopyTransformerFactory = 'TransformerFactory':newInstance(),
            CopyTransformer = (get({CopyTransformerFactory, '$class'})):newTransformer(CopyTransformerFactory),
            DomSource = 'DOMSource':new(Document),
            case (get({File, '$class'})):isFile(File) of
                true ->
                (get({File, '$class'})):delete(File);
                false -> ok
            end,
            (get({File, '$class'})):createNewFile(File),
            put({local, dataOutputStream}, (fun(Target_N66388) -> (get({Target_N66388, '$class'})):getInstanceForAbFile(Target_N66388, File) end)('DataOutputStreamFactory':getInstance())),
            StreamResult = 'StreamResult':new(get({local, dataOutputStream})),
            (get({CopyTransformer, '$class'})):transform(CopyTransformer, DomSource, StreamResult),
            (get({get({local, dataOutputStream}), '$class'})):flush(get({local, dataOutputStream}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        after
            (fun(Target_N66127) -> (get({Target_N66127, '$class'})):close(Target_N66127, get({local, dataOutputStream})) end)('StreamUtil':getInstance())
        end.

