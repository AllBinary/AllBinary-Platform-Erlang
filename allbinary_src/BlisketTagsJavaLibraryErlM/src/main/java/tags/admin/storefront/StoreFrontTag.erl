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
% package tags.admin.storefront
% import javax.servlet.jsp.JspTagException
% import org.allbinary.logic.communication.http.request.AbResponseHandler
% import org.allbinary.logic.system.security.licensing.LicensingException
% import tags.StoreValidationTransformTag

-module('StoreFrontTag').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('StoreValidationTransformTag', Function, Arguments).

init_fields(This) ->
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

% throws JspTagException
doStartTag(This) ->
        try
        try
            case ((get({This, '$class'})):getCommand(This) =/= undefined) of
                true ->
                case ((fun(Target_N65777) -> (get({Target_N65777, '$class'})):compareTo(Target_N65777, get({get({This, commonStrings}), 'INSERT'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    (get({This, '$class'})):setName(This, "Add Validation StoreFront View"),
                    (get({This, '$class'})):setObjectFile(This, "views.admin.storefront.AddValidationStoreFrontView");
                    false ->
                    case ((fun(Target_N65830) -> (get({Target_N65830, '$class'})):compareTo(Target_N65830, get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'VIEW'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    erlang:error({'Exception', "View not implemented"});
                    false ->
                    case ((fun(Target_N65904) -> (get({Target_N65904, '$class'})):compareTo(Target_N65904, get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'EDIT'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    (get({This, '$class'})):setName(This, "Edit Validation StoreFront View"),
                    (get({This, '$class'})):setObjectFile(This, "views.admin.storefront.EditValidationStoreFrontView");
                    false ->
                    case ((fun(Target_N65978) -> (get({Target_N65978, '$class'})):compareTo(Target_N65978, get({get({This, commonStrings}), 'UPDATE'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    (get({This, '$class'})):setName(This, "Update Validation StoreFront View"),
                    (get({This, '$class'})):setObjectFile(This, "views.admin.storefront.UpdateValidationStoreFrontView");
                    false ->
                    case ((fun(Target_N66031) -> (get({Target_N66031, '$class'})):compareTo(Target_N66031, get({get({This, commonStrings}), 'DELETE'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    (get({This, '$class'})):setName(This, "Delete Validation StoreFront View"),
                    (get({This, '$class'})):setObjectFile(This, "views.admin.storefront.DeleteValidationStoreFrontView");
                    false ->
                    case ((fun(Target_N66084) -> (get({Target_N66084, '$class'})):compareTo(Target_N66084, get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'BACKUP'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    erlang:error({'Exception', "View not implemented"});
                    false ->
                    case ((fun(Target_N66158) -> (get({Target_N66158, '$class'})):compareTo(Target_N66158, get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'RESTORE'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    erlang:error({'Exception', "View not implemented"});
                    false ->
                    case ((fun(Target_N66232) -> (get({Target_N66232, '$class'})):compareTo(Target_N66232, get({get({This, commonStrings}), 'DROP'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    erlang:error({'Exception', "View not implemented"});
                    false ->
                    case ((fun(Target_N66285) -> (get({Target_N66285, '$class'})):compareTo(Target_N66285, get({get({This, commonStrings}), 'CREATE'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
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
                end,
                throw({'$return', 'StoreValidationTransformTag':doStartTag(This)});
                false -> ok
            end,
            erlang:error({'Exception', "Command Null"})
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            'AbResponseHandler':sendJspTagLicensingRedirect(get({This, pageContext}), E),
            get({'StoreFrontTag', 'SKIP_BODY'})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

