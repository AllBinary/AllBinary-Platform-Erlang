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
% package tags.admin
% import javax.servlet.jsp.JspTagException
% import org.allbinary.business.user.role.UserRoleData
% import org.allbinary.logic.communication.http.request.AbResponseHandler
% import org.allbinary.logic.communication.sql.SqlStrings
% import tags.StoreValidationTransformTag

-module('UserTag').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('StoreValidationTransformTag', Function, Arguments).

init_fields(This) ->
    put({This, role}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'StoreValidationTransformTag':init(This),
    init_fields(This),
        ok.

setRole(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, role}, Value),
        (fun(Target_N65821) -> (get({Target_N65821, '$class'})):put(Target_N65821, get({'UserRoleData', 'NAME'}), get({This, role})) end)((get({This, '$class'})):getPropertiesHashMap(This)).

% throws JspTagException
doStartTag(This) ->
        try
        try
            case ((get({This, '$class'})):getCommand(This) =/= undefined) of
                true ->
                case ((fun(Target_N65958) -> (get({Target_N65958, '$class'})):compareTo(Target_N65958, get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'NEW'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    (get({This, '$class'})):setName(This, "New User View"),
                    (get({This, '$class'})):setObjectFile(This, "views.admin.user.NewUserView");
                    false ->
                    case (((fun(Target_N66036) -> (get({Target_N66036, '$class'})):compareTo(Target_N66036, get({get({This, commonStrings}), 'INSERT'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) orelse ((fun(Target_N66086) -> (get({Target_N66086, '$class'})):compareTo(Target_N66086, get({'SqlStrings':getInstance(), 'INSERT_INTO'})) end)((get({This, '$class'})):getCommand(This)) =:= 0)) of
                    true ->
                    (get({This, '$class'})):setName(This, "Add Validation User View"),
                    (get({This, '$class'})):setObjectFile(This, "views.admin.user.AddValidationUserView");
                    false ->
                    case ((fun(Target_N66145) -> (get({Target_N66145, '$class'})):compareTo(Target_N66145, get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'VIEW'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    (get({This, '$class'})):setName(This, "Validation User View"),
                    (get({This, '$class'})):setObjectFile(This, "views.admin.user.ViewValidationUserView");
                    false ->
                    case ((fun(Target_N66219) -> (get({Target_N66219, '$class'})):compareTo(Target_N66219, get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'EDIT'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    (get({This, '$class'})):setName(This, "Validation User View"),
                    (get({This, '$class'})):setObjectFile(This, "views.admin.user.EditValidationUserView");
                    false ->
                    case (((fun(Target_N66297) -> (get({Target_N66297, '$class'})):compareTo(Target_N66297, get({get({This, commonStrings}), 'UPDATE'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) orelse ((fun(Target_N66347) -> (get({Target_N66347, '$class'})):compareTo(Target_N66347, get({'SqlStrings':getInstance(), 'UPDATE'})) end)((get({This, '$class'})):getCommand(This)) =:= 0)) of
                    true ->
                    (get({This, '$class'})):setName(This, "Update Validation User View"),
                    (get({This, '$class'})):setObjectFile(This, "views.admin.user.UpdateValidationUserView");
                    false ->
                    case ((fun(Target_N66406) -> (get({Target_N66406, '$class'})):compareTo(Target_N66406, get({get({This, commonStrings}), 'DELETE'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    (get({This, '$class'})):setName(This, "Delete Validation User View"),
                    (get({This, '$class'})):setObjectFile(This, "views.admin.user.DeleteValidationUserView");
                    false ->
                    case ((fun(Target_N66459) -> (get({Target_N66459, '$class'})):compareTo(Target_N66459, get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'BACKUP'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    erlang:error({'Exception', "View not implemented"});
                    false ->
                    case ((fun(Target_N66533) -> (get({Target_N66533, '$class'})):compareTo(Target_N66533, get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'RESTORE'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    erlang:error({'Exception', "View not implemented"});
                    false ->
                    case ((fun(Target_N66607) -> (get({Target_N66607, '$class'})):compareTo(Target_N66607, get({get({This, commonStrings}), 'DROP'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    erlang:error({'Exception', "View not implemented"});
                    false ->
                    case ((fun(Target_N66660) -> (get({Target_N66660, '$class'})):compareTo(Target_N66660, get({get({This, commonStrings}), 'CREATE'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    erlang:error({'Exception', "View not implemented"});
                    false ->
                    erlang:error({'Exception', lists:concat(["No Such View Command: ", (get({This, '$class'})):getCommand(This)])})
                end
                end
                end
                end
                end
                end
                end
                end
                end
                end,
                throw({'$return', 'StoreValidationTransformTag':doStartTag(This)});
                false -> ok
            end,
            erlang:error({'Exception', "Command Null"})
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            'AbResponseHandler':sendJspTagRedirect(get({This, pageContext}), E),
            get({'UserTag', 'SKIP_BODY'})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

