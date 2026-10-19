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
% import admin.taghelpers.DownloadItemsHelperFactory
% import admin.taghelpers.DownloadItemsRequestHelperFactory
% import org.allbinary.logic.communication.http.request.AbResponseHandler

-module('DownloadItemsTag').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('TableTag', Function, Arguments).

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'TableTag':init(This),
    init_fields(This),
        (get({This, '$class'})):setTagHelperFactory(This, 'DownloadItemsHelperFactory':new()),
        (get({This, '$class'})):setTagRequestHelperFactory(This, 'DownloadItemsRequestHelperFactory':new()).

% throws JspTagException
doStartTag(This) ->
        try
        try
            case (get({This, '$class'})):isEnabled(This) of
                true ->
                case ((get({This, '$class'})):getCommand(This) =/= undefined) of
                    true ->
                    case (((((fun(Target_N65882) -> (get({Target_N65882, '$class'})):compareTo(Target_N65882, get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'BACKUP'})) end)((get({This, '$class'})):getCommand(This)) =/= 0) andalso ((fun(Target_N65953) -> (get({Target_N65953, '$class'})):compareTo(Target_N65953, get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'RESTORE'})) end)((get({This, '$class'})):getCommand(This)) =/= 0)) andalso ((fun(Target_N66025) -> (get({Target_N66025, '$class'})):compareTo(Target_N66025, get({get({This, commonStrings}), 'CREATE'})) end)((get({This, '$class'})):getCommand(This)) =/= 0)) andalso ((fun(Target_N66076) -> (get({Target_N66076, '$class'})):compareTo(Target_N66076, get({get({This, commonStrings}), 'DROP'})) end)((get({This, '$class'})):getCommand(This)) =/= 0)) of
                        true ->
                        ParentTag = (get({This, '$class'})):getParent(This),
                        (fun(Target_N66169) -> (get({Target_N66169, '$class'})):isValid(Target_N66169, This, ParentTag) end)('ParentInventoryTagHelper':getInstance()),
                        (fun(Target_N66211) -> (get({Target_N66211, '$class'})):put(Target_N66211, get({'AbTagData', 'PARENT'}), ParentTag) end)((get({This, '$class'})):getPropertiesHashMap(This));
                        false -> ok
                    end,
                    throw({'$return', 'TableTag':doStartTag(This)});
                    false -> ok
                end;
                false -> ok
            end,
            get({'DownloadItemsTag', 'SKIP_BODY'})
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            'AbResponseHandler':sendJspTagRedirect(get({This, pageContext}), E),
            get({'DownloadItemsTag', 'SKIP_BODY'})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

