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
% package org.allbinary.logic.visual.transform.info
% import java.util.HashMap
% import javax.servlet.jsp.PageContext
% import org.allbinary.business.context.modules.storefront.StoreFrontFactory
% import org.allbinary.business.context.modules.storefront.StoreFrontInterface
% import org.allbinary.logic.communication.http.request.session.WeblisketSession
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringValidationUtil
% import org.allbinary.string.CommonStrings

-module('TransformInfoHttpFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

% throws Exception
getInstance(PropertiesHashMap, PageContext) ->
        try
        LogUtil = 'LogUtil':getInstance(),
        try
            WeblisketSession = 'WeblisketSession':new(PropertiesHashMap, PageContext),
            case (not (fun(Target_N66006) -> (get({Target_N66006, '$class'})):isEmpty(Target_N66006, (get({WeblisketSession, '$class'})):getStoreName(WeblisketSession)) end)('StringValidationUtil':getInstance())) of
                true ->
                StoreFrontInterface = 'StoreFrontFactory':getInstance((get({WeblisketSession, '$class'})):getStoreName(WeblisketSession)),
                case (StoreFrontInterface =/= undefined) of
                    true ->
                    throw({'$return', 'TransformInfoHttpStore':new(StoreFrontInterface, PropertiesHashMap, PageContext)});
                    false ->
                    erlang:error({'Exception', lists:concat(["No StoreFront with: ", (get({WeblisketSession, '$class'})):getStoreName(WeblisketSession)])})
                end;
                false ->
                throw({'$return', 'TransformInfoHttpContext':new(PropertiesHashMap, PageContext)})
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPERFACTORYERROR'})) of
                true ->
                CommonStrings = 'CommonStrings':getInstance(),
                (get({LogUtil, '$class'})):put(LogUtil, get({CommonStrings, 'EXCEPTION'}), "TransformInfoFactory", get({CommonStrings, 'GET_INSTANCE'}), E);
                false -> ok
            end,
            erlang:error(E)
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

