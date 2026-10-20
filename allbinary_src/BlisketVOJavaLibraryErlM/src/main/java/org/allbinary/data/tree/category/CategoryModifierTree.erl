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
% package org.allbinary.data.tree.category
% import org.allbinary.business.category.CategoryFactoryInterface
% import org.allbinary.business.category.CategoryInterface
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.io.file.directory.Directory
% import org.allbinary.logic.io.path.AbPath
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.string.CommonStrings

-module('CategoryModifierTree').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements CategoryModifierTreeInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('CategoryPrivateTree', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, directory}, 'Directory':getInstance()),
    ok.


new(CategoryFactoryInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, CategoryFactoryInterface),
    This.

'$init'(This, CategoryFactoryInterface) ->
        'CategoryPrivateTree':'$init'(This, CategoryFactoryInterface),
        init_fields(This),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'CATEGORY'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "CategoryModifierTree(CategoryFactoryInterface categoryFactoryInterface)");
            false -> ok
        end.

insert(This, ParentCategoryInterface, NewChildCategoryInterface) ->
        try
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'CATEGORY'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Inserting", This, "insert()");
                false -> ok
            end,
            case (fun(Target_N66499) -> (get({Target_N66499, '$class'})):booleanValue(Target_N66499) end)((get({ParentCategoryInterface, '$class'})):isValid(ParentCategoryInterface)) of
                true ->
                (get({ParentCategoryInterface, '$class'})):addChild(ParentCategoryInterface, NewChildCategoryInterface),
                DirectoryToBeCreatedAbPath = 'AbPath':new(lists:concat([(fun(Target_N66614) -> (get({Target_N66614, '$class'})):toString(Target_N66614) end)((get({NewChildCategoryInterface, '$class'})):getRootFilePath(NewChildCategoryInterface)), (fun(Target_N66638) -> (get({Target_N66638, '$class'})):toString(Target_N66638) end)((get({NewChildCategoryInterface, '$class'})):getPath(NewChildCategoryInterface))]), get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
                (get({get({This, directory}), '$class'})):create(get({This, directory}), DirectoryToBeCreatedAbPath),
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'CATEGORY'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Saving", This, "insert()");
                    false -> ok
                end,
                (get({This, '$class'})):save(This, ParentCategoryInterface),
                (get({This, '$class'})):save(This, NewChildCategoryInterface);
                false ->
                erlang:error({'Exception', "Will Not Add Null Category"})
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, "insert", E);
                false -> ok
            end
        end.

delete(This, ParentCategoryInterface, ExistingChildCategoryInterface) ->
        try
            case (fun(Target_N67354) -> (get({Target_N67354, '$class'})):booleanValue(Target_N67354) end)((get({ParentCategoryInterface, '$class'})):isValid(ParentCategoryInterface)) of
                true ->
                (get({ParentCategoryInterface, '$class'})):addChild(ParentCategoryInterface, ExistingChildCategoryInterface),
                DirectoryToBeDeletedAbPath = 'AbPath':new(lists:concat([(fun(Target_N67465) -> (get({Target_N67465, '$class'})):toString(Target_N67465) end)((get({ExistingChildCategoryInterface, '$class'})):getRootFilePath(ExistingChildCategoryInterface)), (fun(Target_N67489) -> (get({Target_N67489, '$class'})):toString(Target_N67489) end)((get({ExistingChildCategoryInterface, '$class'})):getPath(ExistingChildCategoryInterface))]), get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
                (get({This, '$class'})):delete(This, ExistingChildCategoryInterface),
                (get({ParentCategoryInterface, '$class'})):removeChild(ParentCategoryInterface, ExistingChildCategoryInterface),
                (get({This, '$class'})):save(This, ParentCategoryInterface),
                (get({get({This, directory}), '$class'})):remove(get({This, directory}), DirectoryToBeDeletedAbPath);
                false ->
                erlang:error({'Exception', "Will Not Add Null Category"})
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, get({get({This, commonStrings}), delete}), E);
                false -> ok
            end
        end.

