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
% import org.allbinary.logic.communication.http.request.AbResponseHandler
% import tags.StoreValidationTransformTag

-module('WorkFlowsTag').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('StoreValidationTransformTag', Function, Arguments).

init_fields(This) ->
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

% throws JspTagException
doStartTag(This) ->
        try
        try
            case ((get({This, '$class'})):getCommand(This) =/= undefined) of
                true ->
                case ((fun(Target_N65732) -> (get({Target_N65732, '$class'})):compareTo(Target_N65732, get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'NEW'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    (get({This, '$class'})):setName(This, "New WorkFlow View"),
                    (get({This, '$class'})):setObjectFile(This, "views.admin.workflow.NewView");
                    false ->
                    case ((fun(Target_N65806) -> (get({Target_N65806, '$class'})):compareTo(Target_N65806, get({get({This, commonStrings}), 'INSERT'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    (get({This, '$class'})):setName(This, "Add Validation WorkFlow View"),
                    (get({This, '$class'})):setObjectFile(This, "views.admin.workflow.AddValidationView");
                    false ->
                    case ((fun(Target_N65859) -> (get({Target_N65859, '$class'})):compareTo(Target_N65859, get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'VIEW'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    (get({This, '$class'})):setName(This, "Validation WorkFlow View"),
                    (get({This, '$class'})):setObjectFile(This, "views.admin.workflow.WorkflowsValidationView");
                    false ->
                    case ((fun(Target_N65933) -> (get({Target_N65933, '$class'})):compareTo(Target_N65933, get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'EDIT'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    (get({This, '$class'})):setName(This, "Validation WorkFlow View"),
                    (get({This, '$class'})):setObjectFile(This, "views.admin.workflow.EditValidationView");
                    false ->
                    case ((fun(Target_N66007) -> (get({Target_N66007, '$class'})):compareTo(Target_N66007, get({get({This, commonStrings}), 'UPDATE'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    (get({This, '$class'})):setName(This, "Update Validation WorkFlow View"),
                    (get({This, '$class'})):setObjectFile(This, "views.admin.workflow.UpdateValidationView");
                    false ->
                    case ((fun(Target_N66060) -> (get({Target_N66060, '$class'})):compareTo(Target_N66060, get({get({This, commonStrings}), 'DELETE'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    (get({This, '$class'})):setName(This, "Delete Validation WorkFlow View"),
                    (get({This, '$class'})):setObjectFile(This, "views.admin.workflow.DeleteValidationView");
                    false ->
                    case ((fun(Target_N66113) -> (get({Target_N66113, '$class'})):compareTo(Target_N66113, get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'BACKUP'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    erlang:error({'Exception', "View not implemented"});
                    false ->
                    case ((fun(Target_N66187) -> (get({Target_N66187, '$class'})):compareTo(Target_N66187, get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'RESTORE'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    erlang:error({'Exception', "View not implemented"});
                    false ->
                    case ((fun(Target_N66261) -> (get({Target_N66261, '$class'})):compareTo(Target_N66261, get({get({This, commonStrings}), 'DROP'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    erlang:error({'Exception', "View not implemented"});
                    false ->
                    case ((fun(Target_N66314) -> (get({Target_N66314, '$class'})):compareTo(Target_N66314, get({get({This, commonStrings}), 'CREATE'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
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
            get({'WorkFlowsTag', 'SKIP_BODY'})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

