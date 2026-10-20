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
% package org.allbinary.input.automation.module.generic

-module('GenericConfigData').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'RELATIVE_PATH'}, "./"),
    put({?MODULE, 'CONFIG_PATH'}, "modules/configs/"),
    put({?MODULE, 'MODULE_RELATIVE_PATH'}, lists:concat([(get({'GenericConfigData', 'RELATIVE_PATH'}) + get({'GenericConfigData', 'CONFIG_PATH'})), "allbinary/input/automation/module/"])),
    put({?MODULE, 'GAME_MODULE_RELATIVE_PATH'}, lists:concat([get({'GenericConfigData', 'MODULE_RELATIVE_PATH'}), "game/"])),
    put({?MODULE, 'MMO_GAME_MODULE_RELATIVE_PATH'}, lists:concat([get({'GenericConfigData', 'GAME_MODULE_RELATIVE_PATH'}), "mmog/"])),
    put({?MODULE, 'FREE_MMO_GAME_MODULE_RELATIVE_PATH'}, "free/"),
    ok.

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

