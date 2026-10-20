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

-module('MainFeatureFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'MainFeatureFactory':new()),
    ok.

init_fields(This) ->
    put({This, 'FULL_SCREEN'}, 'Feature':new("Full Screen")),
    put({This, 'TITLE_BAR'}, 'Feature':new("Title Bar")),
    put({This, 'STATIC'}, 'Feature':new("Static Dependent Feature")),
    put({This, 'LOAD_ONDEMAND'}, 'Feature':new("Load OnDemand")),
    put({This, 'LOAD_ALL'}, 'Feature':new("Load All")),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'MainFeatureFactory', instance}).

