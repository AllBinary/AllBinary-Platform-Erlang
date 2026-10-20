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
% import java.util.HashMap
% import org.allbinary.business.category.CategoryData
% import org.allbinary.business.category.CategoryInterface
% import org.allbinary.business.category.CategoryUtil
% import org.allbinary.business.category.hierarchy.CategoryHierarchyInterface
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.sql.AbSqlData
% import org.allbinary.logic.io.path.AbPath
% import org.allbinary.logic.io.path.AbPathData
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.string.StringValidationUtil
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('CategoryProperties').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements CategoryPropertiesInterface

static_init() ->
    put({?MODULE, 'MAXDEPTH'}, 100),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, category}, undefined),
    ok.


new(Name) when (is_list(Name) orelse Name =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Name),
    This;
new(Node) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Node),
    This;
new(CategoryPropertiesHashMap) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, CategoryPropertiesHashMap),
    This.

'$init'(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
    init_fields(This),
        put({This, category}, Name);
'$init'(This, Node) ->
    init_fields(This),
        put({This, category}, 'CategoryUtil':getNameFromNode(Node));
'$init'(This, CategoryPropertiesHashMap) ->
    init_fields(This),
        put({This, category}, allbinary_java:to_string((get({CategoryPropertiesHashMap, '$class'})):get(CategoryPropertiesHashMap, get({'CategoryData':getInstance(), 'NAME'})))).



isRealRoot(This) ->
        false.

isRoot(This) ->
        false.

getKey(This) ->
        (get({This, '$class'})):getValue(This).

getValue(This) ->
        get({This, category}).

% throws Exception
getPath(This, CategoryHierarchyInterface) ->
        AbPathData = 'AbPathData':getInstance(),
        PathStringBuffer = 'StringMaker':new(),
        List = 'BasicArrayListD':new(),
        put({local, nextParentCategoryInterface}, (get({CategoryHierarchyInterface, '$class'})):getParent(CategoryHierarchyInterface)),
        case (This =/= (get({get({local, nextParentCategoryInterface}), '$class'})):getProperties(get({local, nextParentCategoryInterface}))) of
            true ->
            put({local, depthIndex}, 0),
            (fun Loop() -> case (get({local, nextParentCategoryInterface}) =/= undefined) of true ->
                case (fun(Target_N66945) -> (get({Target_N66945, '$class'})):isRealRoot(Target_N66945) end)((get({get({local, nextParentCategoryInterface}), '$class'})):getProperties(get({local, nextParentCategoryInterface}))) of
                    true ->
                    throw('$break');
                    false -> ok
                end,
                case (fun(Target_N66987) -> (get({Target_N66987, '$class'})):isRoot(Target_N66987) end)((get({get({local, nextParentCategoryInterface}), '$class'})):getProperties(get({local, nextParentCategoryInterface}))) of
                    true ->
                    (get({List, '$class'})):addAt(List, 0, (fun(Target_N67195) -> (get({Target_N67195, '$class'})):toString(Target_N67195) end)((get({get({local, nextParentCategoryInterface}), '$class'})):getPath(get({local, nextParentCategoryInterface}))));
                    false ->
                    (get({PathStringBuffer, '$class'})):delete(PathStringBuffer, 0, (get({PathStringBuffer, '$class'})):length(PathStringBuffer)),
                    (get({List, '$class'})):addAt(List, 0, (fun(Target_N67083) -> (get({Target_N67083, '$class'})):toString(Target_N67083) end)((fun(Target_N67090) -> (get({Target_N67090, '$class'})):append(Target_N67090, (fun(Target_N67134) -> (get({Target_N67134, '$class'})):getValue(Target_N67134) end)((get({get({local, nextParentCategoryInterface}), '$class'})):getProperties(get({local, nextParentCategoryInterface})))) end)((get({PathStringBuffer, '$class'})):append(PathStringBuffer, get({AbPathData, 'SEPARATOR'})))))
                end,
                case (get({local, nextParentCategoryInterface}) =:= (fun(Target_N67244) -> (get({Target_N67244, '$class'})):getParent(Target_N67244) end)((get({get({local, nextParentCategoryInterface}), '$class'})):getHierarchy(get({local, nextParentCategoryInterface})))) of
                    true ->
                    throw('$break');
                    false -> ok
                end,
                put({local, nextParentCategoryInterface}, (fun(Target_N67299) -> (get({Target_N67299, '$class'})):getParent(Target_N67299) end)((get({get({local, nextParentCategoryInterface}), '$class'})):getHierarchy(get({local, nextParentCategoryInterface})))),
                put({local, depthIndex}, get({local, depthIndex}) + 1),
                case (get({local, depthIndex}) > get({'CategoryProperties', 'MAXDEPTH'})) of
                    true ->
                    erlang:error({'Exception', "Probably Major Error"});
                    false -> ok
                end,
                Loop();
            false -> ok end end)();
            false -> ok
        end,
        (get({PathStringBuffer, '$class'})):delete(PathStringBuffer, 0, (get({PathStringBuffer, '$class'})):length(PathStringBuffer)),
        (fun(Target_N67481) -> (get({Target_N67481, '$class'})):append(Target_N67481, (get({This, '$class'})):getValue(This)) end)((get({PathStringBuffer, '$class'})):append(PathStringBuffer, get({AbPathData, 'SEPARATOR'}))),
        Size = (get({List, '$class'})):size(List),
        lists:foreach(fun(Index) ->
            (get({PathStringBuffer, '$class'})):append(PathStringBuffer, (get({List, '$class'})):get(List, Index))
        end, lists:seq(0, Size - 1)),
        (get({PathStringBuffer, '$class'})):append(PathStringBuffer, get({AbPathData, 'SEPARATOR'})),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'CATEGORY'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["path = ", (get({PathStringBuffer, '$class'})):toString(PathStringBuffer)]), This, "getPath");
            false -> ok
        end,
        'AbPath':new((get({PathStringBuffer, '$class'})):toString(PathStringBuffer), get({'StringUtil':getInstance(), 'EMPTY_STRING'})).

getFileName(This) ->
        (((get({This, '$class'})):getValue(This) + get({'AbPathData':getInstance(), 'EXTENSION_SEP'})) + get({'CategoryData':getInstance(), 'UNCRYPTED_EXTENSION'})).

% throws Exception
getWebAppPath(This) ->
        erlang:error({'Exception', "Not Root"}).

setValue(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, category}, Value).

isValid(This) ->
        put({local, returnBoolean}, false),
        case (fun(Target_N68402) -> (get({Target_N68402, '$class'})):isValidRequired(Target_N68402, get({This, category}), 1, get({'AbSqlData', 'MAXSTRING'})) end)('StringValidationUtil':getInstance()) of
            true ->
            put({local, returnBoolean}, true);
            false -> ok
        end,
        get({local, returnBoolean}).

toHashMap(This) ->
        CategoryHashMap = (fun(Target_N68554) -> (get({Target_N68554, '$class'})):createHashMap(Target_N68554) end)('StdUtil':getInstance()),
        (get({CategoryHashMap, '$class'})):put(CategoryHashMap, get({'CategoryData':getInstance(), 'NAME'}), get({This, category})),
        CategoryHashMap.

toVector(This) ->
        CategoryVector = 'BasicArrayListD':new(),
        (get({CategoryVector, '$class'})):add(CategoryVector, get({This, category})),
        CategoryVector.

% throws Exception
toValidationInfoDoc(This) ->
        undefined.

% throws Exception
toValidationInfoNode(This, Document) ->
        undefined.

% throws Exception
validationInfo(This) ->
        undefined.

