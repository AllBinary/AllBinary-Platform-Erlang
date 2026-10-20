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
% package tags.generic.user
% import javax.servlet.jsp.JspTagException
% import org.allbinary.business.user.role.UserRoleData
% import org.allbinary.logic.communication.http.request.AbResponseHandler
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
    '$init'(This),
    This.

'$init'(This) ->
    'StoreValidationTransformTag':'$init'(This),
    init_fields(This),
        ok.

setRole(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, role}, Value),
        (fun(Target_N65791) -> (get({Target_N65791, '$class'})):put(Target_N65791, get({'UserRoleData', 'NAME'}), get({This, role})) end)((get({This, '$class'})):getPropertiesHashMap(This)).

% throws JspTagException
doStartTag(This) ->
        try
        try
            case ((get({This, '$class'})):getCommand(This) =/= undefined) of
                true ->
                case ((fun(Target_N65928) -> (get({Target_N65928, '$class'})):compareTo(Target_N65928, (get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'EDIT'}) + get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'EDIT'}))) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    (get({This, '$class'})):setName(This, "Edit Session Validation User View - i.e. User Profile Edit"),
                    (get({This, '$class'})):setObjectFile(This, "views.generic.user.EditValidationView");
                    false -> ok
                end,
                case ((fun(Target_N66099) -> (get({Target_N66099, '$class'})):compareTo(Target_N66099, get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'NEW'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    (get({This, '$class'})):setName(This, "New User View"),
                    (get({This, '$class'})):setObjectFile(This, "views.generic.user.NewUserView");
                    false ->
                    case ((fun(Target_N66173) -> (get({Target_N66173, '$class'})):compareTo(Target_N66173, get({get({This, commonStrings}), 'INSERT'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    (get({This, '$class'})):setName(This, "Add Validation User View"),
                    (get({This, '$class'})):setObjectFile(This, "views.generic.user.AddValidationUserView");
                    false ->
                    case ((fun(Target_N66226) -> (get({Target_N66226, '$class'})):compareTo(Target_N66226, get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'VIEW'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    (get({This, '$class'})):setName(This, "Validation User View"),
                    (get({This, '$class'})):setObjectFile(This, "views.generic.user.ViewValidationUserView");
                    false ->
                    case ((fun(Target_N66300) -> (get({Target_N66300, '$class'})):compareTo(Target_N66300, get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'EDIT'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    (get({This, '$class'})):setName(This, "Validation User View"),
                    (get({This, '$class'})):setObjectFile(This, "views.generic.user.EditValidationUserView");
                    false ->
                    case ((fun(Target_N66374) -> (get({Target_N66374, '$class'})):compareTo(Target_N66374, get({get({This, commonStrings}), 'UPDATE'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    (get({This, '$class'})):setName(This, "Update Validation User View"),
                    (get({This, '$class'})):setObjectFile(This, "views.generic.user.UpdateValidationUserView");
                    false ->
                    case ((fun(Target_N66427) -> (get({Target_N66427, '$class'})):compareTo(Target_N66427, get({get({This, commonStrings}), 'DELETE'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    (get({This, '$class'})):setName(This, "Delete Validation User View"),
                    (get({This, '$class'})):setObjectFile(This, "views.generic.user.DeleteValidationUserView");
                    false ->
                    case ((fun(Target_N66480) -> (get({Target_N66480, '$class'})):compareTo(Target_N66480, get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'BACKUP'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    erlang:error({'Exception', "View not implemented"});
                    false ->
                    case ((fun(Target_N66554) -> (get({Target_N66554, '$class'})):compareTo(Target_N66554, get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'RESTORE'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    erlang:error({'Exception', "View not implemented"});
                    false ->
                    case ((fun(Target_N66628) -> (get({Target_N66628, '$class'})):compareTo(Target_N66628, get({get({This, commonStrings}), 'DROP'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    erlang:error({'Exception', "View not implemented"});
                    false ->
                    case ((fun(Target_N66681) -> (get({Target_N66681, '$class'})):compareTo(Target_N66681, get({get({This, commonStrings}), 'CREATE'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
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

