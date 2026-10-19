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
% package admin.taghelpers
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.user.role.BasicUserRole
% import org.allbinary.business.user.role.UserRole
% import org.allbinary.globals.URLGLOBALS
% import org.allbinary.logic.communication.http.file.upload.HttpFilePermissions
% import org.allbinary.logic.communication.http.request.HttpRequestUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.io.path.AbPath
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.string.CommonLabels

-module('AuthenticationHelperUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'AuthenticationHelperUtil':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'AuthenticationHelperUtil', instance}).

% throws Exception
isAuthorized(This, AuthenticationHelper, FilePath) when (is_list(FilePath) orelse FilePath =:= undefined) ->
        try
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEWERROR'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([get({'CommonLabels':getInstance(), 'START'}), FilePath]), This, "isAuthorized()");
            false -> ok
        end,
        EndIndex = (fun(Target_N66345) -> (get({Target_N66345, '$class'})):getLastSeparatorIndex(Target_N66345, FilePath) end)('HttpRequestUtil':getInstance()),
        FullPath = 'AbPath':new(lists:concat([(get({get({'AuthenticationHelperUtil', 'URLGLOBALS'}), '$class'})):getWebappPath(get({'AuthenticationHelperUtil', 'URLGLOBALS'})), string:slice(FilePath, 0, (EndIndex) - (0))]), get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
        DownloadFilePermissions = 'HttpFilePermissions':new(FullPath),
        UserRoles = (get({DownloadFilePermissions, '$class'})):getUserRoles(DownloadFilePermissions),
        UserRole = (get({AuthenticationHelper, '$class'})):getRole(AuthenticationHelper),
        BasicUserRole = (get({UserRole, '$class'})):getBasicUserRole(UserRole),
        case (get({UserRoles, '$class'})):contains(UserRoles, BasicUserRole) of
            true ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Authorized", This, "isAuthorized()");
                false -> ok
            end,
            throw({'$return', true});
            false ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Not Authorized: ", (get({BasicUserRole, '$class'})):toString(BasicUserRole)]), This, "isAuthorized()");
                false -> ok
            end,
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

