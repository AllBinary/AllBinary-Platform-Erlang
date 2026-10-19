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
% package views.admin.user
% import java.util.HashMap
% import javax.servlet.http.HttpServletRequest
% import org.allbinary.business.user.username.UserName
% import org.allbinary.data.tables.user.UserEntityFactory
% import org.allbinary.logic.communication.http.request.RequestParams
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.control.validate.ValidationComponentInterface
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('DeleteValidationUserView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ValidationComponentInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('UserView', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, userName}, undefined),
    ok.


new(TransformInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, TransformInfoInterface),
    This.

init(This, TransformInfoInterface) ->
        'UserView':init(This, TransformInfoInterface),
        init_fields(This),
        HttpServletRequest = (fun(Target_N66063) -> (get({Target_N66063, '$class'})):getRequest(Target_N66063) end)((get({This, '$class'})):getPageContext(This)),
        HashMap = (fun(Target_N66118) -> (get({Target_N66118, '$class'})):toHashMap(Target_N66118) end)('RequestParams':new(HttpServletRequest)),
        put({This, userName}, (fun(Target_N66183) -> (get({Target_N66183, '$class'})):get(Target_N66183) end)('UserName':new(HashMap))),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["User Name: ", get({This, userName})]), This, get({get({This, commonStrings}), 'CONSTRUCTOR'}));
            false -> ok
        end.

isValid(This) ->
        try
        try
            case ((fun(Target_N66526) -> (get({Target_N66526, '$class'})):isValid(Target_N66526, get({This, userName})) end)('UserName':getInstance()) =:= true) of
                true ->
                put({This, user}, (fun(Target_N66631) -> (get({Target_N66631, '$class'})):getUser(Target_N66631, get({This, userName})) end)('UserEntityFactory':getInstance())),
                case (get({This, user}) =:= undefined) of
                    true ->
                    throw({'$return', false});
                    false -> ok
                end;
                false ->
                throw({'$return', false})
            end,
            true
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEWERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Failed to validate form", This, get({get({This, commonStrings}), 'IS_VALID'}), E);
                false -> ok
            end,
            false
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

validationInfo(This) ->
        try
            StringBuffer = 'StringMaker':new(),
            case ((fun(Target_N67116) -> (get({Target_N67116, '$class'})):isValid(Target_N67116, get({This, userName})) end)('UserName':getInstance()) =:= true) of
                true ->
                put({This, user}, (fun(Target_N67228) -> (get({Target_N67228, '$class'})):getUser(Target_N67228, get({This, userName})) end)('UserEntityFactory':getInstance())),
                case (get({This, user}) =:= undefined) of
                    true ->
                    (get({StringBuffer, '$class'})):append(StringBuffer, "User does not exist.<br />");
                    false -> ok
                end;
                false ->
                (get({StringBuffer, '$class'})):append(StringBuffer, "User Name is not valid.<br />")
            end,
            (get({StringBuffer, '$class'})):toString(StringBuffer)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEWERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Failed to generate validation error info", This, "validationInfo()", E);
                false -> ok
            end,
            "Error Validating Form"
        end.

toValidationInfoDoc(This) ->
        undefined.

toValidationInfoNode(This, Document) ->
        undefined.

