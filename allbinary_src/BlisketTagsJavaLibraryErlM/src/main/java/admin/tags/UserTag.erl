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
% package admin.tags
% import javax.servlet.jsp.JspTagException
% import admin.taghelpers.UserHelperFactory
% import org.allbinary.business.entry.EntryData
% import org.allbinary.business.user.role.UserRoleData
% import org.allbinary.logic.communication.http.request.AbResponseHandler

-module('UserTag').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('TableTag', Function, Arguments).

init_fields(This) ->
    put({This, role}, undefined),
    put({This, enable}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'TableTag':'$init'(This),
    init_fields(This),
        (get({This, '$class'})):setTagHelperFactory(This, 'UserHelperFactory':new()),
        (get({This, '$class'})):setTagRequestHelperFactory(This, 'UserHelperFactory':new()).

setRole(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, role}, Value),
        (fun(Target_N65915) -> (get({Target_N65915, '$class'})):put(Target_N65915, get({'UserRoleData', 'NAME'}), get({This, role})) end)((get({This, '$class'})):getPropertiesHashMap(This)).

setEnable(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, enable}, Value),
        (fun(Target_N66041) -> (get({Target_N66041, '$class'})):put(Target_N66041, get({'EntryData':getInstance(), 'ENABLE'}), get({This, enable})) end)((get({This, '$class'})):getPropertiesHashMap(This)).

% throws JspTagException
doStartTag(This) ->
        try
        try
            case (get({This, '$class'})):isEnabled(This) of
                true ->
                throw({'$return', 'TableTag':doStartTag(This)});
                false -> ok
            end,
            get({'UserTag', 'SKIP_BODY'})
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            'AbResponseHandler':sendJspTagRedirect(get({This, pageContext}), E),
            get({'UserTag', 'SKIP_BODY'})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

