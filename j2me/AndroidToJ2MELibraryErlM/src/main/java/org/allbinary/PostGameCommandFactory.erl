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
% package org.allbinary
% import org.allbinary.game.commands.GameCommandsFactory
% import org.allbinary.game.configuration.feature.MultiPlayerGameFeatureFactory
% import org.allbinary.graphics.displayable.MyCanvas
% import org.allbinary.logic.system.os.GenericOperatingSystem
% import org.allbinary.logic.system.os.OperatingSystemFactory

-module('PostGameCommandFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'PostGameCommandFactory':new()),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'PostGameCommandFactory', instance}).

addCommands(This, Canvas) ->
        OperatingSystemInterface = (fun(Target_N65876) -> (get({Target_N65876, '$class'})):getOperatingSystemInstance(Target_N65876) end)('OperatingSystemFactory':getInstance()),
        GameCommandsFactory = 'GameCommandsFactory':getInstance(),
        case (not (get({OperatingSystemInterface, '$class'})):isOverScan(OperatingSystemInterface)) of
            true ->
            (get({Canvas, '$class'})):addCommand(Canvas, get({GameCommandsFactory, 'TOGGLE_KEYBOARD'}));
            false -> ok
        end,
        (fun(Target_N66040) -> (get({Target_N66040, '$class'})):addCommands(Target_N66040, Canvas) end)('MultiPlayerGameFeatureFactory':getInstance()).

