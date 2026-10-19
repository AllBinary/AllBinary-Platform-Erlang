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
% package views.generic.user
% import org.allbinary.business.user.username.UserName
% import org.allbinary.data.tables.user.UserEntityFactory
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.control.validate.ValidationComponentInterface
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('EditValidationUserView').
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
        put({This, userName}, (fun(Target_N65982) -> (get({Target_N65982, '$class'})):getUserName(Target_N65982) end)((get({This, '$class'})):getWeblisketSession(This))).

isValid(This) ->
        try
        try
            case ((fun(Target_N66075) -> (get({Target_N66075, '$class'})):isValid(Target_N66075, get({This, userName})) end)('UserName':getInstance()) =:= true) of
                true ->
                put({This, user}, (fun(Target_N66173) -> (get({Target_N66173, '$class'})):getUser(Target_N66173, get({This, userName})) end)('UserEntityFactory':getInstance())),
                case (get({This, user}) =:= undefined) of
                    true ->
                    throw({'$return', false});
                    false -> ok
                end;
                false ->
                false
            end,
            (get({get({This, user}), '$class'})):isValid(get({This, user}))
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
        try
            StringBuffer = 'StringMaker':new(),
            case (fun(Target_N66657) -> (get({Target_N66657, '$class'})):booleanValue(Target_N66657) end)((fun(Target_N66664) -> (get({Target_N66664, '$class'})):isValid(Target_N66664, get({This, userName})) end)('UserName':getInstance())) of
                true ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "User Name is valid", This, "validationInfo()");
                    false -> ok
                end,
                put({This, user}, (fun(Target_N66991) -> (get({Target_N66991, '$class'})):getUser(Target_N66991, get({This, userName})) end)('UserEntityFactory':getInstance())),
                case (get({This, user}) =:= undefined) of
                    true ->
                    (get({StringBuffer, '$class'})):append(StringBuffer, "User does not exist.<br />"),
                    throw({'$return', (get({StringBuffer, '$class'})):toString(StringBuffer)});
                    false -> ok
                end;
                false ->
                (get({StringBuffer, '$class'})):append(StringBuffer, "User Name is not valid.<br />"),
                throw({'$return', (get({StringBuffer, '$class'})):toString(StringBuffer)})
            end,
            case ((get({get({This, user}), '$class'})):isValid(get({This, user})) =:= false) of
                true ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "User exists but is invalid - Probably manually modified", This, "validationInfo()");
                    false -> ok
                end,
                (get({StringBuffer, '$class'})):append(StringBuffer, "User data is not valid - Please call administrator.<br />"),
                (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, user}), '$class'})):validationInfo(get({This, user})));
                false -> ok
            end,
            (get({StringBuffer, '$class'})):toString(StringBuffer)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEWERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Failed to generate validation error info", This, "validationInfo()", E);
                false -> ok
            end,
            "Error Validating Form"
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

toValidationInfoDoc(This) ->
        undefined.

toValidationInfoNode(This, Document) ->
        undefined.

