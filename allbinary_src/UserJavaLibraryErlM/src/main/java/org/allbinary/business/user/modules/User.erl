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
% package org.allbinary.business.user.modules
% import java.util.Calendar
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import javax.servlet.http.HttpServletRequest
% import org.allbinary.business.context.modules.storefront.StoreFrontData
% import org.allbinary.business.entry.EntryData
% import org.allbinary.business.user.UserData
% import org.allbinary.business.user.UserInterface
% import org.allbinary.business.user.modules.configuration.UserConfigurationDomDocumentMapping
% import org.allbinary.business.user.modules.configuration.UserConfigurationInterface
% import org.allbinary.business.user.modules.configuration.UserConfigurationInterfaceFactory
% import org.allbinary.business.user.password.Password
% import org.allbinary.business.user.role.UserRole
% import org.allbinary.business.user.role.UserRoleB
% import org.allbinary.business.user.role.UserRoleData
% import org.allbinary.business.user.username.UserName
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.http.request.RequestParams
% import org.allbinary.logic.communication.http.request.session.WeblisketSessionData
% import org.allbinary.logic.communication.http.request.session.WeblisketSessionInterface
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.string.StringValidationUtil
% import org.allbinary.string.CommonStrings
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('User').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements UserInterface

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, userName}, undefined),
    put({This, prefixName}, undefined),
    put({This, firstName}, undefined),
    put({This, lastName}, undefined),
    put({This, middleName}, undefined),
    put({This, suffixName}, undefined),
    put({This, company}, undefined),
    put({This, positionAtCompany}, undefined),
    put({This, mainEmail}, undefined),
    put({This, secondaryEmail}, undefined),
    put({This, homePhone}, undefined),
    put({This, cellPhone}, undefined),
    put({This, workPhone}, undefined),
    put({This, otherContact}, undefined),
    put({This, electronicDevice}, undefined),
    put({This, fax}, undefined),
    put({This, role}, undefined),
    put({This, encryption}, undefined),
    put({This, secret}, undefined),
    put({This, password}, undefined),
    put({This, enable}, undefined),
    put({This, permissions}, undefined),
    put({This, userConfigurationInterface}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        put({This, userConfigurationInterface}, 'UserConfigurationInterfaceFactory':getInstance()),
        put({This, password}, 'Password':new(get({'StringUtil':getInstance(), 'EMPTY_STRING'}))).

new(Request) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Request),
    This;
new(UserHashMap) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, UserHashMap),
    This.

'$init'(This, Request) ->
    init_fields(This),
        (get({This, '$class'})):getFormData(This, (fun(Target_N67393) -> (get({Target_N67393, '$class'})):toHashMap(Target_N67393) end)('RequestParams':new(Request))),
        put({This, userConfigurationInterface}, 'UserConfigurationInterfaceFactory':getInstance((get({This, '$class'})):getRole(This)));
'$init'(This, UserHashMap) ->
    init_fields(This),
        (get({This, '$class'})):getFormData(This, UserHashMap),
        put({This, userConfigurationInterface}, 'UserConfigurationInterfaceFactory':getInstance((get({This, '$class'})):getRole(This))).


% throws Exception
getFormData(This, UserHashMap) ->
        put({This, userName}, (fun(Target_N67699) -> (get({Target_N67699, '$class'})):get(Target_N67699) end)('UserName':new(UserHashMap))),
        StringUtil = 'StringUtil':getInstance(),
        put({local, passwordString}, (get({StringUtil, '$class'})):getNonNull(StringUtil, (get({UserHashMap, '$class'})):get(UserHashMap, get({'UserData', 'PASSWORD'})))),
        StringValidationUtil = 'StringValidationUtil':getInstance(),
        case ((get({StringValidationUtil, '$class'})):isEmpty(StringValidationUtil, get({This, userName})) andalso (get({StringValidationUtil, '$class'})):isEmpty(StringValidationUtil, get({local, passwordString}))) of
            true ->
            put({This, userName}, (get({StringUtil, '$class'})):getNonNull(StringUtil, (get({UserHashMap, '$class'})):get(UserHashMap, get({'WeblisketSessionData', 'REMOVABLEUSERNAME'})))),
            put({local, passwordString}, (get({StringUtil, '$class'})):getNonNull(StringUtil, (get({UserHashMap, '$class'})):get(UserHashMap, get({'WeblisketSessionData', 'REMOVABLEPASSWORD'}))));
            false -> ok
        end,
        Encryption = (get({StringUtil, '$class'})):getNonNull(StringUtil, (get({UserHashMap, '$class'})):get(UserHashMap, get({'EntryData':getInstance(), 'ENCRYPTION'}))),
        Secret = (get({StringUtil, '$class'})):getNonNull(StringUtil, (get({UserHashMap, '$class'})):get(UserHashMap, get({'UserData', 'SECRET'}))),
        put({This, password}, 'Password':new(get({local, passwordString}))),
        put({This, prefixName}, (get({StringUtil, '$class'})):getNonNull(StringUtil, (get({UserHashMap, '$class'})):get(UserHashMap, get({'UserData', 'PREFIXNAME'})))),
        put({This, firstName}, (get({StringUtil, '$class'})):getNonNull(StringUtil, (get({UserHashMap, '$class'})):get(UserHashMap, get({'UserData', 'FIRSTNAME'})))),
        put({This, lastName}, (get({StringUtil, '$class'})):getNonNull(StringUtil, (get({UserHashMap, '$class'})):get(UserHashMap, get({'UserData', 'LASTNAME'})))),
        put({This, middleName}, (get({StringUtil, '$class'})):getNonNull(StringUtil, (get({UserHashMap, '$class'})):get(UserHashMap, get({'UserData', 'MIDDLENAME'})))),
        put({This, suffixName}, (get({StringUtil, '$class'})):getNonNull(StringUtil, (get({UserHashMap, '$class'})):get(UserHashMap, get({'UserData', 'SUFFIXNAME'})))),
        put({This, company}, (get({StringUtil, '$class'})):getNonNull(StringUtil, (get({UserHashMap, '$class'})):get(UserHashMap, get({'UserData', 'COMPANY'})))),
        put({This, positionAtCompany}, (get({StringUtil, '$class'})):getNonNull(StringUtil, (get({UserHashMap, '$class'})):get(UserHashMap, get({'UserData', 'POSITIONATCOMPANY'})))),
        put({This, mainEmail}, (get({StringUtil, '$class'})):getNonNull(StringUtil, (get({UserHashMap, '$class'})):get(UserHashMap, get({'UserData', 'MAINEMAIL'})))),
        put({This, secondaryEmail}, (get({StringUtil, '$class'})):getNonNull(StringUtil, (get({UserHashMap, '$class'})):get(UserHashMap, get({'UserData', 'SECONDARYEMAIL'})))),
        put({This, homePhone}, (get({StringUtil, '$class'})):getNonNull(StringUtil, (get({UserHashMap, '$class'})):get(UserHashMap, get({'UserData', 'HOMEPHONE'})))),
        put({This, cellPhone}, (get({StringUtil, '$class'})):getNonNull(StringUtil, (get({UserHashMap, '$class'})):get(UserHashMap, get({'UserData', 'CELLPHONE'})))),
        put({This, workPhone}, (get({StringUtil, '$class'})):getNonNull(StringUtil, (get({UserHashMap, '$class'})):get(UserHashMap, get({'UserData', 'WORKPHONE'})))),
        put({This, otherContact}, (get({StringUtil, '$class'})):getNonNull(StringUtil, (get({UserHashMap, '$class'})):get(UserHashMap, get({'UserData', 'OTHERCONTACT'})))),
        put({This, electronicDevice}, (get({StringUtil, '$class'})):getNonNull(StringUtil, (get({UserHashMap, '$class'})):get(UserHashMap, get({'UserData', 'ELECTRONICDEVICE'})))),
        put({This, fax}, (get({StringUtil, '$class'})):getNonNull(StringUtil, (get({UserHashMap, '$class'})):get(UserHashMap, get({'UserData', 'FAX'})))),
        put({This, role}, 'UserRoleB':getRole((get({UserHashMap, '$class'})):get(UserHashMap, (get({get({'UserRoleData', 'NAME'}), '$class'})):toString(get({'UserRoleData', 'NAME'}))))),
        put({This, permissions}, (get({StringUtil, '$class'})):getNonNull(StringUtil, (get({UserHashMap, '$class'})):get(UserHashMap, get({'UserData', 'PERMISSIONS'})))),
        case ((not (get({StringValidationUtil, '$class'})):isEmpty(StringValidationUtil, get({This, permissions}))) andalso ((get({get({This, permissions}), '$class'})):compareTo(get({This, permissions}), get({'StoreFrontData':getInstance(), 'NAME'})) =:= 0)) of
            true ->
            put({This, permissions}, (get({StringUtil, '$class'})):getNonNull(StringUtil, (get({UserHashMap, '$class'})):get(UserHashMap, get({'StoreFrontData':getInstance(), 'NAME'}))));
            false ->
            case (get({This, permissions}) =:= undefined) of
            true ->
            put({This, permissions}, "No Permissions");
            false -> ok
        end
        end,
        put({This, enable}, (get({StringUtil, '$class'})):getNonNull(StringUtil, (get({UserHashMap, '$class'})):get(UserHashMap, get({'EntryData':getInstance(), 'ENABLE'})))).

isValid(This) ->
        try
            put({local, valid}, true),
            case (not (fun(Target_N70340) -> (get({Target_N70340, '$class'})):booleanValue(Target_N70340) end)((fun(Target_N70347) -> (get({Target_N70347, '$class'})):isValid(Target_N70347, get({This, userName})) end)('UserName':getInstance()))) of
                true ->
                put({local, valid}, false);
                false -> ok
            end,
            case (not (fun(Target_N70435) -> (get({Target_N70435, '$class'})):booleanValue(Target_N70435) end)((get({get({This, password}), '$class'})):isValid(get({This, password})))) of
                true ->
                put({local, valid}, false);
                false -> ok
            end,
            StringValidationUtil = 'StringValidationUtil':getInstance(),
            case (not (get({StringValidationUtil, '$class'})):isValidRequired(StringValidationUtil, get({This, firstName}), 1, get({'UserData', 'MAXLEN'}))) of
                true ->
                put({local, valid}, false);
                false -> ok
            end,
            case (not (get({StringValidationUtil, '$class'})):isValidRequired(StringValidationUtil, get({This, lastName}), 1, get({'UserData', 'MAXLEN'}))) of
                true ->
                put({local, valid}, false);
                false -> ok
            end,
            case ((not (get({StringValidationUtil, '$class'})):isValidRequired(StringValidationUtil, get({This, mainEmail}), 1, get({'UserData', 'MAXLEN'}))) orelse (allbinary_java:index_of(get({This, mainEmail}), "@") =:= (-1))) of
                true ->
                put({local, valid}, false);
                false -> ok
            end,
            get({local, valid})
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VALIDATIONERROR'})) of
                true ->
                CommonStrings = 'CommonStrings':getInstance(),
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Failed to validate form", This, get({CommonStrings, 'IS_VALID'}), E);
                false -> ok
            end,
            false
        end.

validationInfo(This) ->
        try
            StringValidationUtil = 'StringValidationUtil':getInstance(),
            StringBuffer = 'StringMaker':new(),
            (get({StringBuffer, '$class'})):append(StringBuffer, 'UserName':getValidationInfo(get({This, userName}))),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, password}), '$class'})):getValidationInfo(get({This, password}))),
            case (not (get({StringValidationUtil, '$class'})):isValidRequired(StringValidationUtil, get({This, firstName}), 1, get({'UserData', 'MAXLEN'}))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, "Please enter a valid First Name.<br />");
                false -> ok
            end,
            case (not (get({StringValidationUtil, '$class'})):isValidRequired(StringValidationUtil, get({This, lastName}), 1, get({'UserData', 'MAXLEN'}))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, "Please enter a valid Last Name.<br />");
                false -> ok
            end,
            case ((not (get({StringValidationUtil, '$class'})):isValidRequired(StringValidationUtil, get({This, mainEmail}), 1, get({'UserData', 'MAXLEN'}))) orelse (allbinary_java:index_of(get({This, mainEmail}), "@") =:= (-1))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, "Please enter a valid email address.<br />");
                false -> ok
            end,
            (get({StringBuffer, '$class'})):toString(StringBuffer)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Failed to generate validation error info", This, "validationInfo()", E);
                false -> ok
            end,
            "Error Validating Form"
        end.

setUserName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, userName}, Value).

setPrefixName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, prefixName}, Value).

setFirstName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, firstName}, Value).

setLastName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, lastName}, Value).

setMiddleName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, middleName}, Value).

setSuffixName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, suffixName}, Value).

setCompany(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, company}, Value).

setPositionAtCompany(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, positionAtCompany}, Value).

setMainEmail(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, mainEmail}, Value).

setSecondaryEmail(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, secondaryEmail}, Value).

setHomePhone(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, homePhone}, Value).

setCellPhone(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, cellPhone}, Value).

setWorkPhone(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, workPhone}, Value).

setOtherContact(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, otherContact}, Value).

setElectronicContact(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, electronicDevice}, Value).

setFax(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, fax}, Value).

setRole(This, Role) ->
        put({This, role}, Role).

setPermissions(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, permissions}, Value).

setEncryption(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, encryption}, Value).

setSecret(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, secret}, Value).

setPassword(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        (get({get({This, password}), '$class'})):set(get({This, password}), Value).

enable(This) ->
        (get({This, '$class'})):setEnable(This, "Yes").

disable(This) ->
        (get({This, '$class'})):setEnable(This, "No").

setEnable(This, Enable) when (is_list(Enable) orelse Enable =:= undefined) ->
        put({This, enable}, Enable).

getUserName(This) ->
        get({This, userName}).

getPrefixName(This) ->
        get({This, prefixName}).

getFirstName(This) ->
        get({This, firstName}).

getLastName(This) ->
        get({This, lastName}).

getMiddleName(This) ->
        get({This, middleName}).

getSuffixName(This) ->
        get({This, suffixName}).

getCompany(This) ->
        get({This, company}).

getPositionAtCompany(This) ->
        get({This, positionAtCompany}).

getMainEmail(This) ->
        get({This, mainEmail}).

getSecondaryEmail(This) ->
        get({This, secondaryEmail}).

getHomePhone(This) ->
        get({This, homePhone}).

getCellPhone(This) ->
        get({This, cellPhone}).

getWorkPhone(This) ->
        get({This, workPhone}).

getOtherContact(This) ->
        get({This, otherContact}).

getElectronicContact(This) ->
        get({This, electronicDevice}).

getFax(This) ->
        get({This, fax}).

getRole(This) ->
        get({This, role}).

getPermissions(This) ->
        get({This, permissions}).

getEncryption(This) ->
        get({This, encryption}).

getSecret(This) ->
        get({This, secret}).

getPassword(This) ->
        (get({get({This, password}), '$class'})):get(get({This, password})).

% throws Exception
toVector(This) ->
        Values = 'BasicArrayListD':new(),
        (get({Values, '$class'})):add(Values, get({This, userName})),
        (get({Values, '$class'})):add(Values, get({This, prefixName})),
        (get({Values, '$class'})):add(Values, get({This, firstName})),
        (get({Values, '$class'})):add(Values, get({This, lastName})),
        (get({Values, '$class'})):add(Values, get({This, middleName})),
        (get({Values, '$class'})):add(Values, get({This, suffixName})),
        (get({Values, '$class'})):add(Values, get({This, company})),
        (get({Values, '$class'})):add(Values, get({This, positionAtCompany})),
        (get({Values, '$class'})):add(Values, get({This, mainEmail})),
        (get({Values, '$class'})):add(Values, get({This, secondaryEmail})),
        (get({Values, '$class'})):add(Values, get({This, homePhone})),
        (get({Values, '$class'})):add(Values, get({This, cellPhone})),
        (get({Values, '$class'})):add(Values, get({This, workPhone})),
        (get({Values, '$class'})):add(Values, get({This, otherContact})),
        (get({Values, '$class'})):add(Values, get({This, electronicDevice})),
        (get({Values, '$class'})):add(Values, get({This, fax})),
        (get({Values, '$class'})):add(Values, (fun(Target_N75369) -> (get({Target_N75369, '$class'})):toString(Target_N75369) end)((get({This, '$class'})):getRole(This))),
        UserConfigurationDomDocumentMapping = 'UserConfigurationDomDocumentMapping':new((get({This, '$class'})):getUserConfigurationInterface(This)),
        (get({Values, '$class'})):add(Values, (get({UserConfigurationDomDocumentMapping, '$class'})):toDomDocumentString(UserConfigurationDomDocumentMapping)),
        (get({Values, '$class'})):add(Values, get({This, permissions})),
        (get({Values, '$class'})):addAllList(Values, (get({get({This, password}), '$class'})):toVector(get({This, password}), get({This, secret}))),
        (get({Values, '$class'})):add(Values, get({This, enable})),
        Calendar = 'Calendar':getInstance(),
        Time = allbinary_java:to_string((fun(Target_N75674) -> (get({Target_N75674, '$class'})):toString(Target_N75674) end)((get({Calendar, '$class'})):getTimeInMillis(Calendar))),
        (get({Values, '$class'})):add(Values, Time),
        (get({Values, '$class'})):add(Values, Time),
        Values.

% throws Exception
toHashMap(This) ->
        Values = (fun(Target_N75857) -> (get({Target_N75857, '$class'})):createHashMap(Target_N75857) end)('StdUtil':getInstance()),
        (get({Values, '$class'})):put(Values, get({'UserData', 'USERNAME'}), get({This, userName})),
        (get({Values, '$class'})):put(Values, get({'UserData', 'PREFIXNAME'}), get({This, prefixName})),
        (get({Values, '$class'})):put(Values, get({'UserData', 'FIRSTNAME'}), get({This, firstName})),
        (get({Values, '$class'})):put(Values, get({'UserData', 'LASTNAME'}), get({This, lastName})),
        (get({Values, '$class'})):put(Values, get({'UserData', 'MIDDLENAME'}), get({This, middleName})),
        (get({Values, '$class'})):put(Values, get({'UserData', 'SUFFIXNAME'}), get({This, suffixName})),
        (get({Values, '$class'})):put(Values, get({'UserData', 'COMPANY'}), get({This, company})),
        (get({Values, '$class'})):put(Values, get({'UserData', 'POSITIONATCOMPANY'}), get({This, positionAtCompany})),
        (get({Values, '$class'})):put(Values, get({'UserData', 'MAINEMAIL'}), get({This, mainEmail})),
        (get({Values, '$class'})):put(Values, get({'UserData', 'SECONDARYEMAIL'}), get({This, secondaryEmail})),
        (get({Values, '$class'})):put(Values, get({'UserData', 'HOMEPHONE'}), get({This, homePhone})),
        (get({Values, '$class'})):put(Values, get({'UserData', 'CELLPHONE'}), get({This, cellPhone})),
        (get({Values, '$class'})):put(Values, get({'UserData', 'WORKPHONE'}), get({This, workPhone})),
        (get({Values, '$class'})):put(Values, get({'UserData', 'OTHERCONTACT'}), get({This, otherContact})),
        (get({Values, '$class'})):put(Values, get({'UserData', 'ELECTRONICDEVICE'}), get({This, electronicDevice})),
        (get({Values, '$class'})):put(Values, get({'UserData', 'FAX'}), get({This, fax})),
        case ((get({This, '$class'})):getRole(This) =/= undefined) of
            true ->
            (get({Values, '$class'})):put(Values, (get({get({'UserRoleData', 'NAME'}), '$class'})):toString(get({'UserRoleData', 'NAME'})), (fun(Target_N76720) -> (get({Target_N76720, '$class'})):toString(Target_N76720) end)((get({This, '$class'})):getRole(This)));
            false -> ok
        end,
        UserConfigurationDomDocumentMapping = 'UserConfigurationDomDocumentMapping':new((get({This, '$class'})):getUserConfigurationInterface(This)),
        (get({Values, '$class'})):put(Values, get({'UserData', 'CONFIGURATION'}), (get({UserConfigurationDomDocumentMapping, '$class'})):toDomDocumentString(UserConfigurationDomDocumentMapping)),
        (get({Values, '$class'})):put(Values, get({'UserData', 'PERMISSIONS'}), get({This, permissions})),
        (get({Values, '$class'})):putAll(Values, (get({get({This, password}), '$class'})):toHashMap(get({This, password}), get({This, secret}))),
        (get({Values, '$class'})):put(Values, get({'EntryData':getInstance(), 'ENABLE'}), get({This, enable})),
        Calendar = 'Calendar':getInstance(),
        Time = allbinary_java:to_string((fun(Target_N77084) -> (get({Target_N77084, '$class'})):toString(Target_N77084) end)((get({Calendar, '$class'})):getTimeInMillis(Calendar))),
        (get({Values, '$class'})):put(Values, get({'EntryData':getInstance(), 'LASTMODIFIED'}), Time),
        Values.

toPasswordHashMap(This) ->
        (get({get({This, password}), '$class'})):toHashMap(get({This, password}), get({This, secret})).

validateSession(This, WeblisketSession) ->
        (get({WeblisketSession, '$class'})):setAuthenticated(WeblisketSession),
        (get({WeblisketSession, '$class'})):setRole(WeblisketSession, (get({This, '$class'})):getRole(This)),
        (get({WeblisketSession, '$class'})):setUserName(WeblisketSession, (get({This, '$class'})):getUserName(This)).

updateSession(This, WeblisketSession) ->
        ok.

isSessionValid(This) ->
        true.

% throws Exception
getKey(This) ->
        get({This, userName}).

toValidationInfoDoc(This) ->
        undefined.

toValidationInfoNode(This, Document) ->
        undefined.

getUserConfigurationInterface(This) ->
        get({This, userConfigurationInterface}).

setUserConfigurationInterface(This, UserConfigurationInterface) ->
        put({This, userConfigurationInterface}, UserConfigurationInterface).

