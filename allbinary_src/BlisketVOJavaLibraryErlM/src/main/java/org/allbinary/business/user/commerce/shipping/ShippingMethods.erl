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
% package org.allbinary.business.user.commerce.shipping
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.context.modules.storefront.StoreFrontInterface
% import org.allbinary.business.user.commerce.shipping.modules.ShippingInterface
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.string.CommonStrings

-module('ShippingMethods').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ShippingMethodsInterface

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, shippingVector}, undefined),
    put({This, defaultShippingMethodInterface}, undefined),
    ok.


new(AbeClientInformation, StoreFrontInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, AbeClientInformation, StoreFrontInterface),
    This.

'$init'(This, AbeClientInformation, StoreFrontInterface) ->
    init_fields(This),
        put({This, defaultShippingMethodInterface}, (fun(Target_N66025) -> (get({Target_N66025, '$class'})):getDefaultInstance(Target_N66025) end)('ShippingMethodsFactory':new(AbeClientInformation, StoreFrontInterface))),
        put({This, shippingVector}, (fun(Target_N66084) -> (get({Target_N66084, '$class'})):getInstance(Target_N66084) end)('ShippingMethodsFactory':new(AbeClientInformation, StoreFrontInterface))).

get(This) ->
        get({This, shippingVector}).

% throws Exception
getShippingInterface(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
        put({local, shipping}, undefined),
        Size = (get({get({This, shippingVector}), '$class'})):size(get({This, shippingVector})),
        lists:foreach(fun(Index) ->
            put({local, shipping}, (get({get({This, shippingVector}), '$class'})):get(get({This, shippingVector}), Index)),
            case ((get({Name, '$class'})):compareTo(Name, (get({get({local, shipping}), '$class'})):getName(get({local, shipping}))) =:= 0) of
                true ->
                throw({'$return', get({local, shipping})});
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        Error = lists:concat(["Error Finding Shipping: ", Name]),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SHIPPINGERROR'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "getShippingInterface(String name)");
            false -> ok
        end,
        erlang:error({'Exception', Error}).

% throws Exception
getDefault(This) ->
        get({This, defaultShippingMethodInterface}).

