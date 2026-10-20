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
% import org.allbinary.game.configuration.feature.GameFeatureChoiceGroups
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('OpenGLOptions').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


init(This) ->
        OpenGLFeatureFactory = 'OpenGLFeatureFactory':getInstance(),
        case (fun(Target_N65757) -> (get({Target_N65757, '$class'})):isFeature(Target_N65757, get({OpenGLFeatureFactory, 'OPENGL_OPTIONS'})) end)('Features':getInstance()) of
            true ->
            OpenGLMultipleList = 'BasicArrayListD':new(),
            (get({OpenGLMultipleList, '$class'})):add(OpenGLMultipleList, get({OpenGLFeatureFactory, 'OPENGL'})),
            (fun(Target_N65886) -> (get({Target_N65886, '$class'})):add(Target_N65886, "OpenGL (Complete Restart)", OpenGLMultipleList) end)('GameFeatureChoiceGroups':getMultipleInstance()),
            OpenGLVersionSelectorMultipleList = 'BasicArrayListD':new(),
            (get({OpenGLVersionSelectorMultipleList, '$class'})):add(OpenGLVersionSelectorMultipleList, get({OpenGLFeatureFactory, 'OPENGL_AUTO_SELECT'})),
            (get({OpenGLVersionSelectorMultipleList, '$class'})):add(OpenGLVersionSelectorMultipleList, get({OpenGLFeatureFactory, 'OPENGL_MINIMUM'})),
            (fun(Target_N66046) -> (get({Target_N66046, '$class'})):add(Target_N66046, "OpenGL Version Selector", OpenGLVersionSelectorMultipleList) end)('GameFeatureChoiceGroups':getExclusiveInstance()),
            OpenGLImageColorMultipleList = 'BasicArrayListD':new(),
            (get({OpenGLImageColorMultipleList, '$class'})):add(OpenGLImageColorMultipleList, get({OpenGLFeatureFactory, 'IMAGE_COLOR_DEPTH_4444'})),
            (get({OpenGLImageColorMultipleList, '$class'})):add(OpenGLImageColorMultipleList, get({OpenGLFeatureFactory, 'IMAGE_COLOR_DEPTH_8888'})),
            (fun(Target_N66214) -> (get({Target_N66214, '$class'})):add(Target_N66214, "OpenGL Image Color RGBA", OpenGLImageColorMultipleList) end)('GameFeatureChoiceGroups':getExclusiveInstance());
            false -> ok
        end.

