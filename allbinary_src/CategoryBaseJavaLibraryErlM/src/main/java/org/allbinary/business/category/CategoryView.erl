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
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.category.properties.CategoryPropertiesInterface
% import org.allbinary.business.category.properties.CategoryPropertiesView
% import org.allbinary.data.tree.dom.DomNodeInterface
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.java.anyType.InterfaceUtil
% import org.allbinary.string.CommonSeps
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('CategoryView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements DomNodeInterface

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, categoryInterface}, undefined),
    ok.


new(CategoryInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, CategoryInterface),
    This.

init(This, CategoryInterface) ->
    init_fields(This),
        put({This, categoryInterface}, CategoryInterface).

getCategoryInterface(This) ->
        get({This, categoryInterface}).

% throws Exception
toXmlNode(This, Document) ->
        Node = (get({Document, '$class'})):createElement(Document, get({'CategoryData':getInstance(), 'NAME'})),
        ChildCategoryVector = (get({get({This, categoryInterface}), '$class'})):getChildNodes(get({This, categoryInterface})),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'CATEGORY'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Number Of Children: ", (get({ChildCategoryVector, '$class'})):size(ChildCategoryVector)]), This, "toXmlNode");
            false -> ok
        end,
        Size = (get({ChildCategoryVector, '$class'})):size(ChildCategoryVector),
        lists:foreach(fun(I) ->
            AnyType = (get({ChildCategoryVector, '$class'})):get(ChildCategoryVector, I),
            put({local, categoryPropertiesInterface}, undefined),
            case 'InterfaceUtil':isImplemented("CategoryPropertiesInterface", AnyType) of
                true ->
                put({local, categoryPropertiesInterface}, AnyType);
                false ->
                case 'InterfaceUtil':isImplemented("CategoryInterface", AnyType) of
                true ->
                CategoryInterface = AnyType,
                put({local, categoryPropertiesInterface}, (get({CategoryInterface, '$class'})):getProperties(CategoryInterface));
                false ->
                IsImpl = 'InterfaceUtil':viewAll(get({AnyType, '$class'}), get({'CommonSeps':getInstance(), 'NEW_LINE'})),
                erlang:error({'Exception', lists:concat([lists:concat(["CategoryView found unknown object.\n", "Show Testing:"]), IsImpl])})
            end
            end,
            ChildCategoryNode = (fun(Target_N66934) -> (get({Target_N66934, '$class'})):toXmlNode(Target_N66934, Document) end)('CategoryPropertiesView':new(get({local, categoryPropertiesInterface}))),
            (get({Node, '$class'})):appendChild(Node, ChildCategoryNode)
        end, lists:seq(0, Size - 1)),
        Node.

