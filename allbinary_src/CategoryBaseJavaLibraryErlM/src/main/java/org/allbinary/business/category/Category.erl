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
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.category.hierarchy.CategoryHierarchy
% import org.allbinary.business.category.hierarchy.CategoryHierarchyInterface
% import org.allbinary.business.category.properties.CategoryPropertiesFactoryInterface
% import org.allbinary.business.category.properties.CategoryPropertiesInterface
% import org.allbinary.business.category.properties.root.RootCategoryPropertiesInterface
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.io.path.AbPath
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.string.CommonStrings
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('Category').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements CategoryInterface

static_init() ->
    put({?MODULE, 'NOT_ROOT'}, "This is not the root so it has no file path."),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, categoryHierarchyInterface}, undefined),
    put({This, categoryPropertiesInterface}, undefined),
    put({This, childCategoryVector}, 'BasicArrayListD':new()),
    put({This, typeVector}, 'BasicArrayListD':new()),
    put({This, 'PROPERTIES'}, 1),
    put({This, 'CATEGORY'}, 0),
    ok.


new(CategoryPropertiesFactoryInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, CategoryPropertiesFactoryInterface),
    This.

'$init'(This, CategoryPropertiesFactoryInterface) ->
    init_fields(This),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'CATEGORY'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'CONSTRUCTOR'}), This, "Category(CategoryPropertiesFactoryInterface)");
            false -> ok
        end,
        put({This, categoryPropertiesInterface}, (get({CategoryPropertiesFactoryInterface, '$class'})):getInstance(CategoryPropertiesFactoryInterface)),
        put({This, categoryHierarchyInterface}, 'CategoryHierarchy':new(This, This)),
        (get({This, '$class'})):log(This).

new(CategoryPropertiesFactoryInterface, Level) when is_integer(Level) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, CategoryPropertiesFactoryInterface, Level),
    This.

'$init'(This, CategoryPropertiesFactoryInterface, Level) when is_integer(Level) ->
    init_fields(This),
        put({This, categoryPropertiesInterface}, (get({CategoryPropertiesFactoryInterface, '$class'})):getInstance(CategoryPropertiesFactoryInterface)),
        put({This, categoryHierarchyInterface}, 'CategoryHierarchy':new(This, This, Level)),
        (get({This, '$class'})):log(This).

new(RootCategoryInterface, ParentCategoryInterface, CategoryPropertiesFactoryInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, RootCategoryInterface, ParentCategoryInterface, CategoryPropertiesFactoryInterface),
    This.

'$init'(This, RootCategoryInterface, ParentCategoryInterface, CategoryPropertiesFactoryInterface) ->
    init_fields(This),
        put({This, categoryPropertiesInterface}, (get({CategoryPropertiesFactoryInterface, '$class'})):getInstance(CategoryPropertiesFactoryInterface)),
        put({This, categoryHierarchyInterface}, 'CategoryHierarchy':new(RootCategoryInterface, ParentCategoryInterface)),
        (get({This, '$class'})):log(This).

% throws Exception
getKey(This) ->
        (get({get({This, categoryPropertiesInterface}), '$class'})):getKey(get({This, categoryPropertiesInterface})).

% throws Exception
getRootFilePath(This) ->
        put({local, rootAbPath}, 'AbPath':new(get({'Category', 'NOT_ROOT'}), get({'StringUtil':getInstance(), 'EMPTY_STRING'}))),
        CategoryInterface = (get({get({This, categoryHierarchyInterface}), '$class'})):getRoot(get({This, categoryHierarchyInterface})),
        case (fun(Target_N67455) -> (get({Target_N67455, '$class'})):isRoot(Target_N67455) end)((get({CategoryInterface, '$class'})):getProperties(CategoryInterface)) of
            true ->
            RootCategoryPropertiesInterface = (get({CategoryInterface, '$class'})):getProperties(CategoryInterface),
            put({local, rootAbPath}, (get({RootCategoryPropertiesInterface, '$class'})):getRootFilePath(RootCategoryPropertiesInterface));
            false -> ok
        end,
        get({local, rootAbPath}).

% throws Exception
getFilePath(This) ->
        'AbPath':new(lists:concat([(fun(Target_N67648) -> (get({Target_N67648, '$class'})):toString(Target_N67648) end)((get({This, '$class'})):getRootFilePath(This)), (fun(Target_N67667) -> (get({Target_N67667, '$class'})):toString(Target_N67667) end)((fun(Target_N67674) -> (get({Target_N67674, '$class'})):getPath(Target_N67674, (get({This, '$class'})):getHierarchy(This)) end)((get({This, '$class'})):getProperties(This)))]), (fun(Target_N67709) -> (get({Target_N67709, '$class'})):getFileName(Target_N67709) end)((get({This, '$class'})):getProperties(This))).

% throws Exception
getWebAppPath(This) ->
        CategoryInterface = (get({get({This, categoryHierarchyInterface}), '$class'})):getRoot(get({This, categoryHierarchyInterface})),
        (fun(Target_N67821) -> (get({Target_N67821, '$class'})):getWebAppPath(Target_N67821) end)((get({CategoryInterface, '$class'})):getProperties(CategoryInterface)).

% throws Exception
getPath(This) ->
        (get({get({This, categoryPropertiesInterface}), '$class'})):getPath(get({This, categoryPropertiesInterface}), get({This, categoryHierarchyInterface})).

addChildProperty(This, CategoryPropertiesInterface) ->
        (get({get({This, typeVector}), '$class'})):add(get({This, typeVector}), get({This, 'PROPERTIES'})),
        (get({get({This, childCategoryVector}), '$class'})):add(get({This, childCategoryVector}), CategoryPropertiesInterface).

addChild(This, CategoryInterface) ->
        (get({This, '$class'})):removeDuplicateChild(This, CategoryInterface),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'CATEGORY'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "adding", This, "addChild");
            false -> ok
        end,
        ChildCategoryHierarchyInterface = (get({CategoryInterface, '$class'})):getHierarchy(CategoryInterface),
        (get({ChildCategoryHierarchyInterface, '$class'})):setParent(ChildCategoryHierarchyInterface, This),
        (get({ChildCategoryHierarchyInterface, '$class'})):setRoot(ChildCategoryHierarchyInterface, (fun(Target_N68420) -> (get({Target_N68420, '$class'})):getRoot(Target_N68420) end)((get({This, '$class'})):getHierarchy(This))),
        (get({CategoryInterface, '$class'})):setHierarchy(CategoryInterface, ChildCategoryHierarchyInterface),
        (get({get({This, typeVector}), '$class'})):add(get({This, typeVector}), get({This, 'CATEGORY'})),
        (get({get({This, childCategoryVector}), '$class'})):add(get({This, childCategoryVector}), CategoryInterface).

getChildNodes(This) ->
        get({This, childCategoryVector}).

removeChild(This, CategoryInterface) ->
        RemovalVector = 'BasicArrayListD':new(),
        put({local, bool_return}, false),
        Size = (get({get({This, childCategoryVector}), '$class'})):size(get({This, childCategoryVector})),
        lists:foreach(fun(Index) ->
            case (get({This, 'CATEGORY'}) =:= (get({get({This, typeVector}), '$class'})):get(get({This, typeVector}), Index)) of
                true ->
                AnyType = (get({get({This, childCategoryVector}), '$class'})):get(get({This, childCategoryVector}), Index),
                CurrentCategoryInterface = AnyType,
                case ((fun(Target_N68934) -> (get({Target_N68934, '$class'})):compareTo(Target_N68934, (fun(Target_N68967) -> (get({Target_N68967, '$class'})):getValue(Target_N68967) end)((get({CategoryInterface, '$class'})):getProperties(CategoryInterface))) end)((fun(Target_N68941) -> (get({Target_N68941, '$class'})):getValue(Target_N68941) end)((get({CurrentCategoryInterface, '$class'})):getProperties(CurrentCategoryInterface))) =:= 0) of
                    true ->
                    (get({RemovalVector, '$class'})):add(RemovalVector, CurrentCategoryInterface),
                    put({local, bool_return}, true);
                    false -> ok
                end;
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        (get({This, '$class'})):removal(This, RemovalVector),
        get({local, bool_return}).

removal(This, RemovalVector) ->
        RemovalSize = (get({RemovalVector, '$class'})):size(RemovalVector),
        lists:foreach(fun(Index) ->
            AnyType = (get({RemovalVector, '$class'})):get(RemovalVector, Index),
            ObjectIndex = (get({get({This, childCategoryVector}), '$class'})):indexOf(get({This, childCategoryVector}), AnyType),
            (get({get({This, typeVector}), '$class'})):remove(get({This, typeVector}), ObjectIndex),
            (get({get({This, childCategoryVector}), '$class'})):remove(get({This, childCategoryVector}), ObjectIndex)
        end, lists:seq(0, RemovalSize - 1)).

removeDuplicateChild(This, CategoryInterface) ->
        RemovalVector = 'BasicArrayListD':new(),
        put({local, bool_return}, false),
        Size = (get({get({This, childCategoryVector}), '$class'})):size(get({This, childCategoryVector})),
        lists:foreach(fun(Index) ->
            AnyType = (get({get({This, childCategoryVector}), '$class'})):get(get({This, childCategoryVector}), Index),
            case (get({This, 'PROPERTIES'}) =:= (get({get({This, typeVector}), '$class'})):get(get({This, typeVector}), Index)) of
                true ->
                put({local, categoryPropertiesInterface}, AnyType),
                case ((fun(Target_N70131) -> (get({Target_N70131, '$class'})):compareTo(Target_N70131, (get({get({local, categoryPropertiesInterface}), '$class'})):getValue(get({local, categoryPropertiesInterface}))) end)((fun(Target_N70138) -> (get({Target_N70138, '$class'})):getValue(Target_N70138) end)((get({CategoryInterface, '$class'})):getProperties(CategoryInterface))) =:= 0) of
                    true ->
                    (get({RemovalVector, '$class'})):add(RemovalVector, get({local, categoryPropertiesInterface})),
                    put({local, bool_return}, true),
                    throw('$break');
                    false -> ok
                end;
                false ->
                case (get({This, 'CATEGORY'}) =:= (get({get({This, typeVector}), '$class'})):get(get({This, typeVector}), Index)) of
                true ->
                ExistingCategoryInterface = AnyType,
                put({local, categoryPropertiesInterface}, (get({ExistingCategoryInterface, '$class'})):getProperties(ExistingCategoryInterface)),
                case ((fun(Target_N69950) -> (get({Target_N69950, '$class'})):compareTo(Target_N69950, (get({get({local, categoryPropertiesInterface}), '$class'})):getValue(get({local, categoryPropertiesInterface}))) end)((fun(Target_N69957) -> (get({Target_N69957, '$class'})):getValue(Target_N69957) end)((get({CategoryInterface, '$class'})):getProperties(CategoryInterface))) =:= 0) of
                    true ->
                    (get({RemovalVector, '$class'})):add(RemovalVector, ExistingCategoryInterface),
                    put({local, bool_return}, true),
                    throw('$break');
                    false -> ok
                end;
                false -> ok
            end
            end
        end, lists:seq(0, Size - 1)),
        (get({This, '$class'})):removal(This, RemovalVector),
        get({local, bool_return}).

% throws Exception
isLeaf(This) ->
        try
        case (get({This, childCategoryVector}) =:= undefined) of
            true ->
            erlang:error({'Exception', "Category Error"});
            false -> ok
        end,
        case ((get({get({This, childCategoryVector}), '$class'})):size(get({This, childCategoryVector})) =:= 0) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getProperties(This) ->
        get({This, categoryPropertiesInterface}).

setProperties(This, CategoryPropertiesInterface) ->
        put({This, categoryPropertiesInterface}, CategoryPropertiesInterface).

getHierarchy(This) ->
        get({This, categoryHierarchyInterface}).

setHierarchy(This, CategoryHierarchyInterface) ->
        put({This, categoryHierarchyInterface}, CategoryHierarchyInterface).

% throws Exception
isValid(This) ->
        try
        case (not (fun(Target_N70802) -> (get({Target_N70802, '$class'})):booleanValue(Target_N70802) end)((get({get({This, categoryPropertiesInterface}), '$class'})):isValid(get({This, categoryPropertiesInterface})))) of
            true ->
            throw({'$return', false});
            false -> ok
        end,
        Size = (get({get({This, childCategoryVector}), '$class'})):size(get({This, childCategoryVector})),
        lists:foreach(fun(Index) ->
            AnyType = (get({get({This, childCategoryVector}), '$class'})):get(get({This, childCategoryVector}), Index),
            case (get({This, 'PROPERTIES'}) =:= (get({get({This, typeVector}), '$class'})):get(get({This, typeVector}), Index)) of
                true ->
                CategoryPropertiesInterface = AnyType,
                case (not (fun(Target_N71244) -> (get({Target_N71244, '$class'})):booleanValue(Target_N71244) end)((get({CategoryPropertiesInterface, '$class'})):isValid(CategoryPropertiesInterface))) of
                    true ->
                    throw({'$return', false});
                    false -> ok
                end;
                false ->
                case (get({This, 'CATEGORY'}) =:= (get({get({This, typeVector}), '$class'})):get(get({This, typeVector}), Index)) of
                true ->
                CategoryInterface = AnyType,
                case (not (fun(Target_N71129) -> (get({Target_N71129, '$class'})):booleanValue(Target_N71129) end)((get({CategoryInterface, '$class'})):isValid(CategoryInterface))) of
                    true ->
                    throw({'$return', false});
                    false -> ok
                end;
                false -> ok
            end
            end
        end, lists:seq(0, Size - 1)),
        true
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
toValidationInfoDoc(This) ->
        undefined.

% throws Exception
toValidationInfoNode(This, Document) ->
        undefined.

% throws Exception
validationInfo(This) ->
        undefined.

% throws Exception
toHashMap(This) ->
        CategoryHashMap = (get({get({This, categoryPropertiesInterface}), '$class'})):toHashMap(get({This, categoryPropertiesInterface})),
        CategoryHashMap.

% throws Exception
toVector(This) ->
        CategoryVector = (get({get({This, categoryPropertiesInterface}), '$class'})):toVector(get({This, categoryPropertiesInterface})),
        (get({CategoryVector, '$class'})):add(CategoryVector, get({This, childCategoryVector})),
        CategoryVector.

% throws Exception
log(This) ->
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'CATEGORY'})) of
            true ->
            StringBuffer = 'StringMaker':new(),
            (get({StringBuffer, '$class'})):append(StringBuffer, "Category Name: "),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, categoryPropertiesInterface}), '$class'})):getValue(get({This, categoryPropertiesInterface}))),
            (get({StringBuffer, '$class'})):append(StringBuffer, "\nPath = "),
            (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N72153) -> (get({Target_N72153, '$class'})):toString(Target_N72153) end)((get({This, '$class'})):getPath(This))),
            (get({StringBuffer, '$class'})):append(StringBuffer, "\nFile Path: "),
            (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N72222) -> (get({Target_N72222, '$class'})):toString(Target_N72222) end)((get({This, '$class'})):getFilePath(This))),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "log()");
            false -> ok
        end.

