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
% package org.allbinary.logic.communication.log.config.type
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('LogConfigType').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, availableLogConfigTypes}, 'BasicArrayListD':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, name}, undefined),
    put({This, description}, undefined),
    ok.


new(Name, Description) when (is_list(Name) orelse Name =:= undefined), (is_list(Description) orelse Description =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Name, Description),
    This.

'$init'(This, Name, Description) when (is_list(Name) orelse Name =:= undefined), (is_list(Description) orelse Description =:= undefined) ->
    init_fields(This),
        put({This, name}, Name),
        put({This, description}, Description),
        (get({get({'LogConfigType', availableLogConfigTypes}), '$class'})):add(get({'LogConfigType', availableLogConfigTypes}), This).

getName(This) ->
        get({This, name}).

getDescription(This) ->
        get({This, description}).

setName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, name}, Value).

setDescription(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, description}, Value).

