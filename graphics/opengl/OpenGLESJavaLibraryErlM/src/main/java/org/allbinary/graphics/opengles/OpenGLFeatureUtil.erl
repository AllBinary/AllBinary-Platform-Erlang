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
% package org.allbinary.graphics.opengles
% import org.allbinary.game.configuration.feature.Features

-module('OpenGLFeatureUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'OpenGLFeatureUtil':new()),
    ok.

init_fields(This) ->
    put({This, anyThreed}, false),
    ok.


getInstance() ->
        get({'OpenGLFeatureUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        OpenGLConfiguration = 'OpenGLConfiguration':getInstance(),
        Features = 'Features':getInstance(),
        OpenGLFeatureFactory = 'OpenGLFeatureFactory':getInstance(),
        put({This, anyThreed}, ((get({OpenGLConfiguration, '$class'})):isOpenGL(OpenGLConfiguration) andalso (((get({Features, '$class'})):isFeature(Features, get({OpenGLFeatureFactory, 'OPENGL_2D_AND_3D'})) orelse (get({Features, '$class'})):isFeature(Features, get({OpenGLFeatureFactory, 'OPENGL_3D'})))))).

isAnyThreed(This) ->
        get({This, anyThreed}).

