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
% package org.allbinary.game.midlet

-module('LicenseLoadingTypeFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'LicenseLoadingTypeFactory':new()),
    ok.

init_fields(This) ->
    put({This, 'INITIAL_LOADING'}, 'LicenseLoadingType':new("Initial Loading")),
    put({This, 'GAME_START'}, 'LicenseLoadingType':new("Game Start")),
    put({This, 'LOGIN'}, 'LicenseLoadingType':new("Login")),
    put({This, 'OTHER'}, 'LicenseLoadingType':new("Other/Usually The First Non Demo Level")),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getIntance() ->
        get({'LicenseLoadingTypeFactory', instance}).

