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
% import tags.StoreValidationTransformTag

-module('UsersTag').
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
        put({This, role}, Value).

% throws JspTagException
doStartTag(This) ->
        try
        try
            (get({This, '$class'})):setName(This, "Admin Users View"),
            (get({This, '$class'})):setObjectFile(This, "views.admin.user.UsersValidationView"),
            case ((get({This, '$class'})):getCommand(This) =/= undefined) of
                true ->
                (fun(Target_N65910) -> (get({Target_N65910, '$class'})):put(Target_N65910, get({'UserRoleData', 'NAME'}), get({This, role})) end)((get({This, '$class'})):getPropertiesHashMap(This)),
                case ((fun(Target_N65967) -> (get({Target_N65967, '$class'})):compareTo(Target_N65967, get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'VIEW'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    ok;
                    false ->
                    erlang:error({'Exception', lists:concat(["No Such View Command: ", (get({This, '$class'})):getCommand(This)])})
                end,
                throw({'$return', 'StoreValidationTransformTag':doStartTag(This)});
                false -> ok
            end,
            erlang:error({'Exception', "Command Null"})
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            'AbResponseHandler':sendJspTagRedirect(get({This, pageContext}), E),
            get({'UsersTag', 'SKIP_BODY'})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

