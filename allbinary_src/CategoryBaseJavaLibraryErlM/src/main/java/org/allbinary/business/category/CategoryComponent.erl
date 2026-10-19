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
% package org.allbinary.business.category
% import org.allbinary.data.tree.dom.document.DomDocumentHelper
% import org.allbinary.logic.visual.transform.TransformInterface
% import org.allbinary.logic.visual.transform.data.TransformDocumentInterface
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.w3c.dom.Document

-module('CategoryComponent').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements TransformInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('CategoryView', Function, Arguments).

init_fields(This) ->
    put({This, 'NO_TYPE'}, 0),
    ok.


new(CategoryInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, CategoryInterface),
    This.

init(This, CategoryInterface) ->
        'CategoryView':init(This, CategoryInterface),
        init_fields(This).

getTypeId(This) ->
        get({This, 'NO_TYPE'}).

getTransformDocumentInterface(This) ->
        undefined.

% throws Exception
getTransformInfoInterface(This) ->
        undefined.

setTransformDocumentInterface(This, ViewDocumentInterface) ->
        ok.

% throws Exception
toXmlDoc(This) ->
        Document = 'DomDocumentHelper':create(),
        (get({Document, '$class'})):appendChild(Document, (fun(Target_N66111) -> (get({Target_N66111, '$class'})):toXmlNode(Target_N66111, Document) end)('CategoryView':new((get({This, '$class'})):getCategoryInterface(This)))),
        Document.

% throws Exception
view(This) ->
        undefined.

