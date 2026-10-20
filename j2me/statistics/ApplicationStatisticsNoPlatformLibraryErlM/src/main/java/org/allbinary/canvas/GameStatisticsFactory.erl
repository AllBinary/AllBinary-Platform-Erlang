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
% package org.allbinary.canvas

-module('GameStatisticsFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BaseGameStatistics', Function, Arguments).

static_init() ->
    put({?MODULE, instance}, 'GameStatisticsFactory':new()),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'BaseGameStatistics':'$init'(This),
    init_fields(This).


getInstance() ->
        get({'GameStatisticsFactory', instance}).

add(This, String) when (is_list(String) orelse String =:= undefined) ->
        ok.

toString(This) ->
        erlang:error({'RuntimeException'}).

