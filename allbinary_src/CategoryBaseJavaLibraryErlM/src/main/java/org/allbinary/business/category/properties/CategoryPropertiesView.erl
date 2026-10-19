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
% package org.allbinary.business.category.properties
% import org.allbinary.business.category.CategoryData
% import org.allbinary.data.tree.dom.DomNodeInterface
% import org.w3c.dom.Document
% import org.w3c.dom.Element
% import org.w3c.dom.Node

-module('CategoryPropertiesView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements DomNodeInterface

init_fields(This) ->
    put({This, categoryPropertiesInterface}, undefined),
    ok.


new(CategoryPropertiesInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, CategoryPropertiesInterface),
    This.

init(This, CategoryPropertiesInterface) ->
    init_fields(This),
        put({This, categoryPropertiesInterface}, CategoryPropertiesInterface).

% throws Exception
toXmlNode(This, Document) ->
        CategoryNode = (get({Document, '$class'})):createElement(Document, get({'CategoryData':getInstance(), 'NAME'})),
        NewCategoryNode = CategoryNode,
        (get({NewCategoryNode, '$class'})):setAttribute(NewCategoryNode, get({'CategoryData':getInstance(), 'LABEL'}), (get({get({This, categoryPropertiesInterface}), '$class'})):getValue(get({This, categoryPropertiesInterface}))),
        CategoryNode.

