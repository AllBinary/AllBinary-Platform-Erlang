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
% package org.allbinary.logic.communication.http.file.upload
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.user.role.BasicUserRoleFactory
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.io.file.AbFile
% import org.allbinary.logic.io.path.AbPath
% import org.allbinary.string.CommonStrings

-module('HttpFilePermissions').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, file}, undefined),
    put({This, userRoles}, 'BasicArrayListD':new()),
    ok.


new(FullPath) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, FullPath),
    This.

'$init'(This, FullPath) ->
    init_fields(This),
        put({This, file}, 'AbFile':createAbFileFromAbPath('AbPath':new((get({FullPath, '$class'})):toFileSystemString(FullPath), get({'FileUploadData':getInstance(), 'FILE'})))),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEWERROR'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Loading Privileges: ", (get({FullPath, '$class'})):toFileSystemString(FullPath)]), This, get({get({This, commonStrings}), 'CONSTRUCTOR'}));
            false -> ok
        end,
        case (get({This, '$class'})):isFile(This) of
            true ->
            (get({get({This, userRoles}), '$class'})):add(get({This, userRoles}), get({'BasicUserRoleFactory':getInstance(), 'ADMINISTRATOR'}));
            false -> ok
        end,
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEWERROR'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["User Roles: ", get({This, userRoles})]), This, get({get({This, commonStrings}), 'CONSTRUCTOR'}));
            false -> ok
        end.

isFile(This) ->
        (get({get({This, file}), '$class'})):isFile(get({This, file})).

getUserRoles(This) ->
        get({This, userRoles}).

