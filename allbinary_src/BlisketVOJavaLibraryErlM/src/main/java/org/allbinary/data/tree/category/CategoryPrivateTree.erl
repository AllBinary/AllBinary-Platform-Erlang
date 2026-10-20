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
% import org.allbinary.business.category.CategoryComponent
% import org.allbinary.business.category.CategoryData
% import org.allbinary.business.category.CategoryFactoryInterface
% import org.allbinary.business.category.CategoryInterface
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.control.crypt.file.CryptFileWriter
% import org.allbinary.logic.io.file.AbFile
% import org.allbinary.string.CommonStrings
% import org.w3c.dom.Document

-module('CategoryPrivateTree').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, categoryFactoryInterface}, undefined),
    ok.


new(CategoryFactoryInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, CategoryFactoryInterface),
    This.

'$init'(This, CategoryFactoryInterface) ->
    init_fields(This),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'CATEGORY'})) of
            true ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({CommonStrings, 'START'}), This, "CategoryPrivateTree(CategoryFactoryInterface categoryFactoryInterface)");
            false -> ok
        end,
        put({This, categoryFactoryInterface}, CategoryFactoryInterface).

% throws Exception
save(This, CategoryInterface) ->
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Saving Category File: ", (get({CategoryInterface, '$class'})):getFilePath(CategoryInterface)]), This, "save()");
            false -> ok
        end,
        Document = (fun(Target_N66542) -> (get({Target_N66542, '$class'})):toXmlDoc(Target_N66542) end)('CategoryComponent':new(CategoryInterface)),
        CryptFileWriter = 'CryptFileWriter':new(get({'CategoryData':getInstance(), 'UNCRYPTED_EXTENSION'}), get({'CategoryData':getInstance(), 'ENCRYPTED_EXTENSION'})),
        (get({CryptFileWriter, '$class'})):write(CryptFileWriter, (get({CategoryInterface, '$class'})):getFilePath(CategoryInterface), Document),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "end", This, "save()");
            false -> ok
        end.

% throws Exception
delete(This, CategoryInterface) ->
        case (get({CategoryInterface, '$class'})):isLeaf(CategoryInterface) of
            true ->
            CategoryFile = 'AbFile':createAbFileFromAbPath((get({CategoryInterface, '$class'})):getFilePath(CategoryInterface)),
            case (get({CategoryFile, '$class'})):delete(CategoryFile) of
                true ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Removed: ", (get({CategoryInterface, '$class'})):getFilePath(CategoryInterface)]), This, "delete(CategoryInterface)");
                    false -> ok
                end;
                false -> ok
            end;
            false ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Not a leaf unable to remove", This, "delete(CategoryInterface)");
                false -> ok
            end
        end.

