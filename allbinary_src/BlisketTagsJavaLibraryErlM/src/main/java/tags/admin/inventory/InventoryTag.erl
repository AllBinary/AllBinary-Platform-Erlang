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
% package tags.admin.inventory
% import javax.servlet.jsp.JspTagException
% import org.allbinary.logic.communication.http.request.AbResponseHandler
% import org.allbinary.logic.system.security.licensing.LicensingException
% import tags.StoreValidationTransformTag

-module('InventoryTag').
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
                case ((fun(Target_N65777) -> (get({Target_N65777, '$class'})):compareTo(Target_N65777, get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'VIEW'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    erlang:error({'Exception', lists:concat(["No Such View Command: ", (get({This, '$class'})):getCommand(This)])});
                    false ->
                    case ((fun(Target_N65851) -> (get({Target_N65851, '$class'})):compareTo(Target_N65851, get({get({This, commonStrings}), 'INSERT'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    (get({This, '$class'})):setName(This, "Add Inventory Item Validation View"),
                    (get({This, '$class'})):setObjectFile(This, "views.admin.inventory.AddFileValidationView");
                    false ->
                    case ((fun(Target_N65904) -> (get({Target_N65904, '$class'})):compareTo(Target_N65904, get({get({This, commonStrings}), 'DELETE'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    (get({This, '$class'})):setName(This, "Delete Inventory Item Validation View"),
                    (get({This, '$class'})):setObjectFile(This, "views.admin.inventory.DeleteFileValidationView");
                    false ->
                    case ((fun(Target_N65957) -> (get({Target_N65957, '$class'})):compareTo(Target_N65957, get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'EDIT'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    (get({This, '$class'})):setName(This, "Edit Inventory Item Validation View"),
                    (get({This, '$class'})):setObjectFile(This, "views.admin.inventory.EditValidationView");
                    false ->
                    case ((fun(Target_N66031) -> (get({Target_N66031, '$class'})):compareTo(Target_N66031, get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'NEW'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    (get({This, '$class'})):setName(This, "New Inventory Item Validation View"),
                    (get({This, '$class'})):setObjectFile(This, "views.admin.inventory.NewValidationView");
                    false ->
                    case ((fun(Target_N66105) -> (get({Target_N66105, '$class'})):compareTo(Target_N66105, get({get({This, commonStrings}), 'UPDATE'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                    true ->
                    (get({This, '$class'})):setName(This, "Update Inventory Item Validation View"),
                    (get({This, '$class'})):setObjectFile(This, "views.admin.inventory.UpdateFileValidationView");
                    false ->
                    erlang:error({'Exception', lists:concat(["No Such View Command: ", (get({This, '$class'})):getCommand(This)])})
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
            get({'InventoryTag', 'SKIP_BODY'})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

