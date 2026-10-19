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
% import javax.servlet.jsp.tagext.Tag
% import admin.taghelpers.InventoryHelperFactory
% import admin.taghelpers.InventoryRequestHelperFactory
% import org.allbinary.business.context.modules.storefront.StoreFrontData
% import org.allbinary.logic.communication.http.request.AbResponseHandler

-module('InventoryTag').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('TableTag', Function, Arguments).

init_fields(This) ->
    put({This, storeName}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
        'TableTag':init(This),
        init_fields(This),
        (get({This, '$class'})):setTagHelperFactory(This, 'InventoryHelperFactory':new()),
        (get({This, '$class'})):setTagRequestHelperFactory(This, 'InventoryRequestHelperFactory':new()).

setStoreName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, storeName}, Value).

% throws JspTagException
doStartTag(This) ->
        try
        try
            case (get({This, '$class'})):isEnabled(This) of
                true ->
                case ((get({This, '$class'})):getCommand(This) =/= undefined) of
                    true ->
                    case (((((fun(Target_N66029) -> (get({Target_N66029, '$class'})):compareTo(Target_N66029, get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'BACKUP'})) end)((get({This, '$class'})):getCommand(This)) =/= 0) andalso ((fun(Target_N66100) -> (get({Target_N66100, '$class'})):compareTo(Target_N66100, get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'RESTORE'})) end)((get({This, '$class'})):getCommand(This)) =/= 0)) andalso ((fun(Target_N66172) -> (get({Target_N66172, '$class'})):compareTo(Target_N66172, get({get({This, commonStrings}), 'CREATE'})) end)((get({This, '$class'})):getCommand(This)) =/= 0)) andalso ((fun(Target_N66223) -> (get({Target_N66223, '$class'})):compareTo(Target_N66223, get({get({This, commonStrings}), 'DROP'})) end)((get({This, '$class'})):getCommand(This)) =/= 0)) of
                        true ->
                        ParentTag = (get({This, '$class'})):getParent(This),
                        (fun(Target_N66316) -> (get({Target_N66316, '$class'})):isValid(Target_N66316, This, ParentTag) end)('ParentInventoryTagHelper':getInstance()),
                        (fun(Target_N66358) -> (get({Target_N66358, '$class'})):put(Target_N66358, get({'AbTagData', 'PARENT'}), ParentTag) end)((get({This, '$class'})):getPropertiesHashMap(This)),
                        (fun(Target_N66408) -> (get({Target_N66408, '$class'})):put(Target_N66408, get({'StoreFrontData':getInstance(), 'NAME'}), get({This, storeName})) end)((get({This, '$class'})):getPropertiesHashMap(This));
                        false -> ok
                    end,
                    throw({'$return', 'TableTag':doStartTag(This)});
                    false -> ok
                end;
                false -> ok
            end,
            get({'InventoryTag', 'SKIP_BODY'})
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            'AbResponseHandler':sendJspTagRedirect(get({This, pageContext}), E),
            get({'InventoryTag', 'SKIP_BODY'})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

