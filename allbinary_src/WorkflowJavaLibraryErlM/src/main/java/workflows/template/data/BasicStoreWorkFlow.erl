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
% package workflows.template.data
% import java.util.HashMap
% import javax.servlet.jsp.PageContext
% import org.allbinary.business.context.modules.storefront.StoreFrontData
% import org.allbinary.logic.control.workflow.StoreWorkFlowInterface

-module('BasicStoreWorkFlow').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements StoreWorkFlowInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicWorkFlow', Function, Arguments).

init_fields(This) ->
    ok.


new(PropertiesHashMap, PageContext) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, PropertiesHashMap, PageContext),
    This.

init(This, PropertiesHashMap, PageContext) ->
        'BasicWorkFlow':init(This, PropertiesHashMap, PageContext).

% throws Exception
getStoreName(This) ->
        (fun(Target_N65828) -> (get({Target_N65828, '$class'})):get(Target_N65828, get({'StoreFrontData':getInstance(), 'NAME'})) end)((get({This, '$class'})):getPropertiesHashMap(This)).

