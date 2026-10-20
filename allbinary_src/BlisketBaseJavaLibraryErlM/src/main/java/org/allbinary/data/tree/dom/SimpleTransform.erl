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
% import java.io.StringBufferInputStream
% import javax.xml.transform.stream.StreamSource
% import org.allbinary.data.tree.dom.document.DomDocumentHelper
% import org.allbinary.data.tree.dom.document.XmlDocumentHelper
% import org.allbinary.logic.io.AbFileLocalInputStream
% import org.allbinary.logic.io.file.AbFile
% import org.allbinary.logic.io.path.AbPath
% import org.w3c.dom.Document

-module('SimpleTransform').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, xsltFilePath}, undefined),
    put({This, dataFilePath}, undefined),
    ok.


new(XsltFilePath, DataFilePath) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, XsltFilePath, DataFilePath),
    This.

'$init'(This, XsltFilePath, DataFilePath) ->
    init_fields(This),
        put({This, xsltFilePath}, XsltFilePath),
        put({This, dataFilePath}, DataFilePath).

% throws Exception
transform(This) ->
        InputStream = 'AbFileLocalInputStream':new('AbFile':createAbFileFromAbPath(get({This, xsltFilePath}))),
        Document = 'DomDocumentHelper':create('AbFileLocalInputStream':new('AbFile':createAbFileFromAbPath(get({This, dataFilePath})))),
        Result = (fun(Target_N66229) -> (get({Target_N66229, '$class'})):translate(Target_N66229, 'StreamSource':new(InputStream), 'StreamSource':new('StringBufferInputStream':new('XmlDocumentHelper':toString(Document)))) end)('XslHelper':getInstance()),
        Result.

