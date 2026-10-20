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
% import javax.microedition.lcdui.Canvas
% import org.allbinary.game.configuration.feature.Features
% import org.allbinary.game.configuration.feature.MainFeatureFactory
% import javax.microedition.lcdui.CommandListener

-module('FullScreenUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'FullScreenUtil':new()),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'FullScreenUtil', instance}).

% throws Exception
initOnRun(This, FullScreenInterface, CommandListener) ->
        (get({(FullScreenInterface), '$class'})):waitOnNotify((FullScreenInterface), 0),
        case (CommandListener =/= undefined) of
            true ->
            (get({This, '$class'})):init(This, FullScreenInterface);
            false -> ok
        end.

init(This, FullScreenInterface) ->
        MainFeatureFactory = 'MainFeatureFactory':getInstance(),
        Features = 'Features':getInstance(),
        case (get({Features, '$class'})):isFeature(Features, get({MainFeatureFactory, 'FULL_SCREEN'})) of
            true ->
            (get({FullScreenInterface, '$class'})):setFullScreenMode(FullScreenInterface, true);
            false ->
            (get({FullScreenInterface, '$class'})):setFullScreenMode(FullScreenInterface, false)
        end.

isScreenChange(This, IsFullScreen) when is_boolean(IsFullScreen) ->
        try
        MainFeatureFactory = 'MainFeatureFactory':getInstance(),
        Features = 'Features':getInstance(),
        case ((get({Features, '$class'})):isFeature(Features, get({MainFeatureFactory, 'FULL_SCREEN'})) =/= IsFullScreen) of
            true ->
            throw({'$return', true});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isScreenChangeCanvas(This, FullScreenInterface) ->
        (get({This, '$class'})):isScreenChange(This, (get({FullScreenInterface, '$class'})):isFullScreenMode(FullScreenInterface)).

