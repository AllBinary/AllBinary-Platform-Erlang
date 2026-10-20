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
% package org.allbinary.business.context.modules.storefront
% import org.allbinary.data.tables.context.module.storefronts.StoreFrontsEntity
% import org.allbinary.data.tables.context.module.storefronts.StoreFrontsEntityFactory
% import org.allbinary.data.tree.dom.DomNodeInterface
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings

-module('StoreFrontViewFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

getInstance(StoreName) when (is_list(StoreName) orelse StoreName =:= undefined) ->
        LogUtil = 'LogUtil':getInstance(),
        try
            StoreFronts = (fun(Target_N65927) -> (get({Target_N65927, '$class'})):getStoreFrontsEntityInstance(Target_N65927) end)('StoreFrontsEntityFactory':getInstance()),
            'StoreFrontView':new((get({StoreFronts, '$class'})):getStoreFrontInterface(StoreFronts, StoreName))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'FACTORYERROR'})) of
                true ->
                (get({LogUtil, '$class'})):put(LogUtil, get({CommonStrings, 'EXCEPTION'}), "StoreFrontFactory", get({CommonStrings, 'GET_INSTANCE'}), E);
                false -> ok
            end,
            undefined
        end.

