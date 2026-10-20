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
% import org.allbinary.data.tree.dom.DomNodeInterface
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('CategoriesView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements DomNodeInterface

init_fields(This) ->
    put({This, categoryInterface}, undefined),
    ok.


new(CategoryInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, CategoryInterface),
    This.

'$init'(This, CategoryInterface) ->
    init_fields(This),
        put({This, categoryInterface}, CategoryInterface).

% throws Exception
toXmlNode(This, Document) ->
        Node = (fun(Target_N65798) -> (get({Target_N65798, '$class'})):toXmlNode(Target_N65798, Document) end)('CategoryView':new(get({This, categoryInterface}))),
        ChildArray = (fun(Target_N65870) -> (get({Target_N65870, '$class'})):toArray(Target_N65870) end)((get({get({This, categoryInterface}), '$class'})):getChildNodes(get({This, categoryInterface}))),
        Size = array:size(ChildArray),
        lists:foreach(fun(I) ->
            ChildCategoryInterface = array:get(I, ChildArray),
            ChildCategoryNode = (fun(Target_N66035) -> (get({Target_N66035, '$class'})):toXmlNode(Target_N66035, Document) end)('CategoriesView':new(ChildCategoryInterface)),
            (get({Node, '$class'})):appendChild(Node, ChildCategoryNode)
        end, lists:seq(0, Size - 1)),
        Node.

