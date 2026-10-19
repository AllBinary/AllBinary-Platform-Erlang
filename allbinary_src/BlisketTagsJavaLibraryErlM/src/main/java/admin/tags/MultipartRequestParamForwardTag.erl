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
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import javax.servlet.jsp.JspTagException
% import javax.servlet.jsp.tagext.Tag
% import admin.taghelpers.MultipartRequestParamForwardHelper
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.http.request.AbResponseHandler
% import org.allbinary.logic.system.security.licensing.LicensingException
% import tags.CustomTagSupport
% import tags.HelperTag

-module('MultipartRequestParamForwardTag').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('CustomTagSupport', Function, Arguments).

init_fields(This) ->
    put({This, page}, undefined),
    put({This, command}, undefined),
    put({This, paramVector}, undefined),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'CustomTagSupport':init(This),
    init_fields(This).


setPage(This, Page) when (is_list(Page) orelse Page =:= undefined) ->
        put({This, page}, Page).

setCommand(This, Command) when (is_list(Command) orelse Command =:= undefined) ->
        put({This, command}, Command).

setParamVector(This, ParamVector) ->
        put({This, paramVector}, ParamVector).

% throws JspTagException
doStartTag(This) ->
        try
            ParentTag = (get({This, '$class'})):getParent(This),
            (fun(Target_N66254) -> (get({Target_N66254, '$class'})):isValid(Target_N66254, This, ParentTag) end)('ParentInventoryTagHelper':getInstance()),
            HashMap = (fun(Target_N66304) -> (get({Target_N66304, '$class'})):createHashMap(Target_N66304) end)('StdUtil':getInstance()),
            (get({HashMap, '$class'})):put(HashMap, get({'AbTagData', 'PARENT'}), ParentTag),
            MultipartRequestParamForwardHelper = 'MultipartRequestParamForwardHelper':new(ParentTag, get({This, page}), get({This, command}), get({This, paramVector}), get({This, pageContext})),
            (get({MultipartRequestParamForwardHelper, '$class'})):forward(MultipartRequestParamForwardHelper),
            get({'Tag', 'SKIP_BODY'})
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            'AbResponseHandler':sendJspTagLicensingRedirect(get({This, pageContext}), E),
            get({'Tag', 'SKIP_BODY'})
        end.

