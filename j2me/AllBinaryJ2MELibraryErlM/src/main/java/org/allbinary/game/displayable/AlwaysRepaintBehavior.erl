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
% package org.allbinary.game.displayable
% import org.allbinary.thread.ARunnable
% import javax.microedition.lcdui.Canvas
% import org.allbinary.game.configuration.feature.Features
% import org.allbinary.graphics.displayable.DisplayInfoSingleton
% import org.allbinary.graphics.opengles.OpenGLFeatureFactory
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings
% import org.allbinary.thread.NullRunnable

-module('AlwaysRepaintBehavior').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('RepaintBehavior', Function, Arguments).

static_init() ->
    put({?MODULE, instanceC}, 'AlwaysRepaintBehavior':new()),
    ok.

init_fields(This) ->
    put({This, 'NAME'}, "AlwaysRepaintBehavior"),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'RepaintBehavior':init(This),
    init_fields(This).


getInstance() ->
        get({'AlwaysRepaintBehavior', instanceC}).

repaint(This, Canvas) ->
        Features = 'Features':getInstance(),
        OpenGLFeatureFactory = 'OpenGLFeatureFactory':getInstance(),
        case (get({Features, '$class'})):isFeature(Features, get({OpenGLFeatureFactory, 'OPENGL'})) of
            true ->
            (fun(Target_N66526) -> (get({Target_N66526, '$class'})):process(Target_N66526) end)('DisplayInfoSingleton':getInstance());
            false ->
            Thread = 'Thread':new('ARunnable':new() % Java anonymous class body: implement it as a module
%                 ok % run
, get({This, 'NAME'})),
            (get({Thread, '$class'})):start(Thread)
        end.

onChangeRepaint(This, Canvas) ->
        ok.

