% 
% AllBinary Open License Version 1 
% Copyright (c) 2022 AllBinary 
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
% package org.allbinary.media.graphics.geography.map.topview

-module('BasicTopViewGeographicMapStrings').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'BasicTopViewGeographicMapStrings':new()),
    ok.

init_fields(This) ->
    put({This, 'DEFAULT'}, "Default"),
    put({This, 'OTHER'}, "Other"),
    put({This, 'WALL'}, "Wall"),
    put({This, 'OFF_MAP'}, "OffMap"),
    put({This, 'FLOOR'}, "Floor"),
    put({This, 'DOOR'}, "Door"),
    put({This, 'STAIRS_UP'}, "StairsUp"),
    put({This, 'STAIRS_DOWN'}, "StairsDown"),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'BasicTopViewGeographicMapStrings', instance}).

