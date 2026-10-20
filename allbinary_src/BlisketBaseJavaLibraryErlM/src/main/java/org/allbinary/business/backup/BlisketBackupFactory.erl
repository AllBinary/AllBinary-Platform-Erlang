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
% package org.allbinary.business.backup
% import org.allbinary.business.context.modules.storefront.StoreFrontInterface
% import org.allbinary.data.tables.context.module.storefronts.StoreFrontsEntity
% import org.allbinary.data.tables.context.module.storefronts.StoreFrontsEntityFactory
% import org.allbinary.globals.PATH_GLOBALS
% import org.allbinary.globals.URLGLOBALS
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.logic.io.file.AbFile
% import org.allbinary.logic.io.file.directory.Directory
% import org.allbinary.logic.io.file.zip.ZipFileUtil
% import org.allbinary.logic.io.path.AbPath
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('BlisketBackupFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'BlisketBackupFactory':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, stringUtil}, 'StringUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, directory}, 'Directory':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'BlisketBackupFactory', instance}).

% throws Exception
getFileBasicArrayList(This, PathString) when (is_list(PathString) orelse PathString =:= undefined) ->
        Path = 'AbPath':new(PathString, get({get({This, stringUtil}), 'EMPTY_STRING'})),
        File = 'AbFile':createAbFileFromAbPath(Path),
        (get({get({This, directory}), '$class'})):search(get({This, directory}), File, true).

backup(This) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "backup()"),
            StringBuffer = 'StringMaker':new(),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({'BlisketBackupFactory', 'URLGLOBALS'}), '$class'})):getWebappPath(get({'BlisketBackupFactory', 'URLGLOBALS'}))),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({(get({get({'BlisketBackupFactory', 'PATH_GLOBALS'}), '$class'})):getInstance(get({'BlisketBackupFactory', 'PATH_GLOBALS'})), 'BACKUP_PATH'})),
            BackupPath = (get({StringBuffer, '$class'})):toString(StringBuffer),
            Path = 'AbPath':new(BackupPath, get({get({This, stringUtil}), 'EMPTY_STRING'})),
            FileBasicArrayList = (get({This, '$class'})):getFileBasicArrayList(This, BackupPath),
            (get({This, '$class'})):backup(This, FileBasicArrayList, lists:concat([(get({Path, '$class'})):toFileSystemString(Path), "backup.zip"]))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "backup()", E)
        end.

backupViews(This) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "backupViews()"),
            StringBuffer = 'StringMaker':new(),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({'BlisketBackupFactory', 'URLGLOBALS'}), '$class'})):getWebappPath(get({'BlisketBackupFactory', 'URLGLOBALS'}))),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({(get({get({'BlisketBackupFactory', 'PATH_GLOBALS'}), '$class'})):getInstance(get({'BlisketBackupFactory', 'PATH_GLOBALS'})), 'BACKUP_PATH'})),
            BackupPath = (get({StringBuffer, '$class'})):toString(StringBuffer),
            Path = 'AbPath':new(BackupPath, get({get({This, stringUtil}), 'EMPTY_STRING'})),
            FileBasicArrayList = 'BasicArrayListD':new(),
            StoreFrontsEntity = (fun(Target_N67550) -> (get({Target_N67550, '$class'})):getStoreFrontsEntityInstance(Target_N67550) end)('StoreFrontsEntityFactory':getInstance()),
            StoreFrontNamesBasicArrayList = (get({StoreFrontsEntity, '$class'})):getStoreFrontNames(StoreFrontsEntity),
            Size = (get({StoreFrontNamesBasicArrayList, '$class'})):size(StoreFrontNamesBasicArrayList),
            put({local, nextStore}, undefined),
            put({local, viewsPath}, undefined),
            lists:foreach(fun(Index) ->
                put({local, nextStore}, (get({StoreFrontNamesBasicArrayList, '$class'})):get(StoreFrontNamesBasicArrayList, Index)),
                (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
                (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({'BlisketBackupFactory', 'URLGLOBALS'}), '$class'})):getWebappPath(get({'BlisketBackupFactory', 'URLGLOBALS'}))),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({(get({get({'BlisketBackupFactory', 'PATH_GLOBALS'}), '$class'})):getInstance(get({'BlisketBackupFactory', 'PATH_GLOBALS'})), 'VIEWS_PATH'})),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({local, nextStore})),
                put({local, viewsPath}, (get({StringBuffer, '$class'})):toString(StringBuffer)),
                (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
                (get({StringBuffer, '$class'})):append(StringBuffer, "Backup Store Views: "),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({local, nextStore})),
                (get({StringBuffer, '$class'})):append(StringBuffer, " from: "),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({local, viewsPath})),
                'PreLogUtil':put((get({StringBuffer, '$class'})):toString(StringBuffer), This, "backupViews()"),
                (get({FileBasicArrayList, '$class'})):addAllList(FileBasicArrayList, (get({This, '$class'})):getFileBasicArrayList(This, get({local, viewsPath})))
            end, lists:seq(0, Size - 1)),
            (get({This, '$class'})):backup(This, FileBasicArrayList, lists:concat([(get({Path, '$class'})):toFileSystemString(Path), "backupViews.zip"]))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "backupViews()", E)
        end.

backupResources(This) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "backupResources()"),
            StringBuffer = 'StringMaker':new(),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({'BlisketBackupFactory', 'URLGLOBALS'}), '$class'})):getWebappPath(get({'BlisketBackupFactory', 'URLGLOBALS'}))),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({(get({get({'BlisketBackupFactory', 'PATH_GLOBALS'}), '$class'})):getInstance(get({'BlisketBackupFactory', 'PATH_GLOBALS'})), 'BACKUP_PATH'})),
            BackupPath = (get({StringBuffer, '$class'})):toString(StringBuffer),
            Path = 'AbPath':new(BackupPath, get({get({This, stringUtil}), 'EMPTY_STRING'})),
            FileBasicArrayList = 'BasicArrayListD':new(),
            StoreFrontsEntity = (fun(Target_N68873) -> (get({Target_N68873, '$class'})):getStoreFrontsEntityInstance(Target_N68873) end)('StoreFrontsEntityFactory':getInstance()),
            StoreFrontNamesBasicArrayList = (get({StoreFrontsEntity, '$class'})):getStoreFrontNames(StoreFrontsEntity),
            Size = (get({StoreFrontNamesBasicArrayList, '$class'})):size(StoreFrontNamesBasicArrayList),
            put({local, nextStore}, undefined),
            put({local, storeFrontInterface}, undefined),
            put({local, resourcesPath}, undefined),
            lists:foreach(fun(Index) ->
                put({local, nextStore}, (get({StoreFrontNamesBasicArrayList, '$class'})):get(StoreFrontNamesBasicArrayList, Index)),
                put({local, storeFrontInterface}, (get({StoreFrontsEntity, '$class'})):getStoreFrontInterface(StoreFrontsEntity, get({local, nextStore}))),
                (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
                (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({'BlisketBackupFactory', 'URLGLOBALS'}), '$class'})):getWebappPath(get({'BlisketBackupFactory', 'URLGLOBALS'}))),
                (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({local, storeFrontInterface}), '$class'})):getCurrentHostNamePath(get({local, storeFrontInterface}))),
                (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({local, storeFrontInterface}), '$class'})):getCategoryPath(get({local, storeFrontInterface}))),
                put({local, resourcesPath}, (get({StringBuffer, '$class'})):toString(StringBuffer)),
                (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
                (get({StringBuffer, '$class'})):append(StringBuffer, "Backup Store Resrouces: "),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({local, nextStore})),
                (get({StringBuffer, '$class'})):append(StringBuffer, " from: "),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({local, resourcesPath})),
                'PreLogUtil':put((get({StringBuffer, '$class'})):toString(StringBuffer), This, "backupResources()"),
                (get({FileBasicArrayList, '$class'})):addAllList(FileBasicArrayList, (get({This, '$class'})):getFileBasicArrayList(This, get({local, resourcesPath})))
            end, lists:seq(0, Size - 1)),
            (get({This, '$class'})):backup(This, FileBasicArrayList, lists:concat([(get({Path, '$class'})):toFileSystemString(Path), "backupResources.zip"]))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "backupResources()", E)
        end.

backupJsps(This) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "backupJsps()"),
            StringBuffer = 'StringMaker':new(),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({'BlisketBackupFactory', 'URLGLOBALS'}), '$class'})):getWebappPath(get({'BlisketBackupFactory', 'URLGLOBALS'}))),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({(get({get({'BlisketBackupFactory', 'PATH_GLOBALS'}), '$class'})):getInstance(get({'BlisketBackupFactory', 'PATH_GLOBALS'})), 'BACKUP_PATH'})),
            BackupPath = (get({StringBuffer, '$class'})):toString(StringBuffer),
            Path = 'AbPath':new(BackupPath, get({get({This, stringUtil}), 'EMPTY_STRING'})),
            FileBasicArrayList = 'BasicArrayListD':new(),
            StoreFrontsEntity = (fun(Target_N70267) -> (get({Target_N70267, '$class'})):getStoreFrontsEntityInstance(Target_N70267) end)('StoreFrontsEntityFactory':getInstance()),
            StoreFrontNamesBasicArrayList = (get({StoreFrontsEntity, '$class'})):getStoreFrontNames(StoreFrontsEntity),
            Size = (get({StoreFrontNamesBasicArrayList, '$class'})):size(StoreFrontNamesBasicArrayList),
            put({local, nextStore}, undefined),
            lists:foreach(fun(Index) ->
                put({local, nextStore}, (get({StoreFrontNamesBasicArrayList, '$class'})):get(StoreFrontNamesBasicArrayList, Index)),
                'PreLogUtil':put(lists:concat(["Backup Store Jsps: ", get({local, nextStore})]), This, "backupJsps()"),
                (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
                (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({'BlisketBackupFactory', 'URLGLOBALS'}), '$class'})):getWebappPath(get({'BlisketBackupFactory', 'URLGLOBALS'}))),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({local, nextStore})),
                (get({FileBasicArrayList, '$class'})):addAllList(FileBasicArrayList, (get({This, '$class'})):getFileBasicArrayList(This, (get({StringBuffer, '$class'})):toString(StringBuffer)))
            end, lists:seq(0, Size - 1)),
            (get({This, '$class'})):backup(This, FileBasicArrayList, lists:concat([(get({Path, '$class'})):toFileSystemString(Path), "backupJsps.zip"]))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "backupJsps()", E)
        end.

backup(This, FileBasicArrayList, ZipFile) when (is_list(ZipFile) orelse ZipFile =:= undefined) ->
        try
            StringBuffer = 'StringMaker':new(),
            (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
            (get({StringBuffer, '$class'})):append(StringBuffer, "ZipFile: "),
            (get({StringBuffer, '$class'})):append(StringBuffer, ZipFile),
            (get({StringBuffer, '$class'})):append(StringBuffer, " BasicArrayList: "),
            (get({StringBuffer, '$class'})):appendint(StringBuffer, (get({FileBasicArrayList, '$class'})):size(FileBasicArrayList)),
            'PreLogUtil':put(lists:concat(["Creating Backup Zip File: ", (get({StringBuffer, '$class'})):toString(StringBuffer)]), This, "backup()"),
            (fun(Target_N71234) -> (get({Target_N71234, '$class'})):create(Target_N71234, ZipFile, FileBasicArrayList) end)('ZipFileUtil':getInstance()),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Created Backup Zip File", This, "backup()")
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "backup()", E)
        end.

