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
% package org.allbinary.game.init
% import javax.microedition.lcdui.CommandListener
% import org.allbinary.game.resource.ResourceInitialization
% import org.allbinary.game.resource.ResourceLoadingLevelFactory
% import org.allbinary.graphics.PointFactory
% import org.allbinary.graphics.canvas.transition.progress.ProgressCanvas
% import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory
% import org.allbinary.logic.math.SmallIntegerSingletonFactory
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.math.AngleFactory
% import org.allbinary.string.CommonStrings

-module('CommonGameInitialization').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BaseGameInitialization', Function, Arguments).

init_fields(This) ->
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    ok.


new(ResourceInitializationArray, Portion) when (is_tuple(ResourceInitializationArray) orelse ResourceInitializationArray =:= undefined), is_integer(Portion) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, ResourceInitializationArray, Portion),
    This.

'$init'(This, ResourceInitializationArray, Portion) when (is_tuple(ResourceInitializationArray) orelse ResourceInitializationArray =:= undefined), is_integer(Portion) ->
        'BaseGameInitialization':'$init'(This, ResourceInitializationArray, Portion),
        init_fields(This).

% throws Exception
init(This, AbeClientInformation, CommandListener, Level) when is_integer(Level) ->
        'BaseGameInitialization':init(This, AbeClientInformation, CommandListener, Level),
        ResourceLoadingLevelFactory = 'ResourceLoadingLevelFactory':getInstance(),
        case ((not (get({This, '$class'})):isGameInitialized(This)) andalso (Level =:= (get({get({ResourceLoadingLevelFactory, 'LOAD_ALL'}), '$class'})):getLevel(get({ResourceLoadingLevelFactory, 'LOAD_ALL'})))) of
            true ->
            (get({This, '$class'})):setGameInitialized(This, true),
            ProgressCanvas = 'ProgressCanvasFactory':getInstance(),
            (fun(Target_N66294) -> (get({Target_N66294, '$class'})):init(Target_N66294) end)('SmallIntegerSingletonFactory':getInstance()),
            (get({ProgressCanvas, '$class'})):addNormalPortion(ProgressCanvas, 50, "Integers"),
            (fun(Target_N66353) -> (get({Target_N66353, '$class'})):init(Target_N66353) end)('PointFactory':getInstance()),
            (get({ProgressCanvas, '$class'})):addNormalPortion(ProgressCanvas, 50, "Points"),
            'AngleFactory':getInstance(),
            (get({ProgressCanvas, '$class'})):addNormalPortion(ProgressCanvas, 50, "Angles"),
            (get({This, '$class'})):initGame(This),
            (fun(Target_N66478) -> (get({Target_N66478, '$class'})):init(Target_N66478) end)(array:get(get({This, 'GAME_RESOURCES'}), get({This, resourceInitializationArray})));
            false -> ok
        end,
        'BaseGameInitialization':resourceInitialization(This, Level).

% throws Exception
initGame(This) ->
        erlang:error({'Exception', get({get({This, commonStrings}), 'NOT_IMPLEMENTED'})}).

