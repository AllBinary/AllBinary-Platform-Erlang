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
% package org.allbinary.game.configuration.feature
% import org.allbinary.logic.StdUtil
% import org.allbinary.util.ABHashtable
% import org.allbinary.util.BasicArrayList

-module('InGameFeatureChoiceGroups').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, gameFeatureChoiceGroupsExclusive}, 'InGameFeatureChoiceGroups':new()),
    put({?MODULE, gameFeatureChoiceGroupsMultiple}, 'InGameFeatureChoiceGroups':new()),
    ok.

init_fields(This) ->
    put({This, hashtable}, (fun(Target_N65770) -> (get({Target_N65770, '$class'})):createHashtable(Target_N65770) end)('StdUtil':getInstance())),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

getExclusiveInstance() ->
        get({'InGameFeatureChoiceGroups', gameFeatureChoiceGroupsExclusive}).

getMultipleInstance() ->
        get({'InGameFeatureChoiceGroups', gameFeatureChoiceGroupsMultiple}).

get(This) ->
        get({This, hashtable}).

add(This, Name, List) when (is_list(Name) orelse Name =:= undefined) ->
        (get({get({This, hashtable}), '$class'})):put(get({This, hashtable}), Name, List).

