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
% package org.allbinary.business.context.modules.storefront.statistics.advertisements
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.context.modules.storefront.StoreFrontInterface
% import org.allbinary.logic.StdUtil

-module('StoreFrontAdvertisementsStatistics').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements StoreFrontAdvertisementsStatisticsInterface

init_fields(This) ->
    ok.


new(StoreFrontInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, StoreFrontInterface),
    This.

init(This, StoreFrontInterface) ->
    init_fields(This),
        ok.

toHashMap(This) ->
        HashMap = (fun(Target_N65821) -> (get({Target_N65821, '$class'})):createHashMap(Target_N65821) end)('StdUtil':getInstance()),
        HashMap.

toVector(This) ->
        undefined.

getKey(This) ->
        undefined.

