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
% package org.allbinary.business.user
% import java.util.HashMap
% import javax.servlet.http.HttpServletRequest
% import org.allbinary.business.user.modules.User
% import org.allbinary.business.user.role.UserRoleData
% import org.allbinary.logic.communication.http.request.RequestParams
% import org.allbinary.logic.visual.transform.info.TransformInfoHttpInterface
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface

-module('NewUserFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

% throws Exception
getInstance() ->
        'User':new().

% throws Exception
getInstance(TransformInfoInterface) ->
        HttpTransformInfoInterface = TransformInfoInterface,
        HttpServletRequest = (fun(Target_N65966) -> (get({Target_N65966, '$class'})):getRequest(Target_N65966) end)((get({HttpTransformInfoInterface, '$class'})):getPageContext(HttpTransformInfoInterface)),
        HashMap = (fun(Target_N66026) -> (get({Target_N66026, '$class'})):toHashMap(Target_N66026) end)('RequestParams':new(HttpServletRequest)),
        Role = (fun(Target_N66087) -> (get({Target_N66087, '$class'})):get(Target_N66087, (get({get({'UserRoleData', 'NAME'}), '$class'})):toString(get({'UserRoleData', 'NAME'}))) end)((get({HttpTransformInfoInterface, '$class'})):getPropertiesHashMap(HttpTransformInfoInterface)),
        (get({HashMap, '$class'})):put(HashMap, (get({get({'UserRoleData', 'NAME'}), '$class'})):toString(get({'UserRoleData', 'NAME'})), Role),
        'CreateUserFactory':getInstance(HashMap).

% throws Exception
getInstance(HttpServletRequest, PropertiesHashMap) ->
        try
        case (PropertiesHashMap =/= undefined) of
            true ->
            RequestHashMap = (fun(Target_N66383) -> (get({Target_N66383, '$class'})):toHashMap(Target_N66383) end)('RequestParams':new(HttpServletRequest)),
            RoleString = (get({PropertiesHashMap, '$class'})):get(PropertiesHashMap, (get({get({'UserRoleData', 'NAME'}), '$class'})):toString(get({'UserRoleData', 'NAME'}))),
            (get({RequestHashMap, '$class'})):put(RequestHashMap, (get({get({'UserRoleData', 'NAME'}), '$class'})):toString(get({'UserRoleData', 'NAME'})), RoleString),
            throw({'$return', 'CreateUserFactory':getInstance(RequestHashMap)});
            false ->
            erlang:error({'Exception', "Null HashMap"})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

