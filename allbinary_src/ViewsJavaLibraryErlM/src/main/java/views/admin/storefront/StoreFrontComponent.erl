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
% package views.admin.storefront
% import javax.servlet.http.HttpServletRequest
% import org.allbinary.business.context.modules.storefront.StoreFront
% import org.allbinary.business.context.modules.storefront.StoreFrontInterface
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import views.business.context.modules.storefront.HttpStoreComponentView

-module('StoreFrontComponent').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('HttpStoreComponentView', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, newStoreFrontInterface}, undefined),
    ok.


new(TransformInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, TransformInfoInterface),
    This.

'$init'(This, TransformInfoInterface) ->
        'HttpStoreComponentView':'$init'(This, TransformInfoInterface),
        init_fields(This),
        put({This, newStoreFrontInterface}, 'StoreFront':new((fun(Target_N65945) -> (get({Target_N65945, '$class'})):getRequest(Target_N65945) end)((get({This, '$class'})):getPageContext(This)))),
        case ((get({get({This, newStoreFrontInterface}), '$class'})):getName(get({This, newStoreFrontInterface})) =:= undefined) of
            true ->
            (get({get({This, newStoreFrontInterface}), '$class'})):setName(get({This, newStoreFrontInterface}), (fun(Target_N66044) -> (get({Target_N66044, '$class'})):getStoreName(Target_N66044) end)((get({This, '$class'})):getWeblisketSession(This)));
            false -> ok
        end.

% throws Exception
view(This) ->
        try
            'HttpStoreComponentView':view(This)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPERERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "view", E);
                false -> ok
            end,
            erlang:error(E)
        end.

