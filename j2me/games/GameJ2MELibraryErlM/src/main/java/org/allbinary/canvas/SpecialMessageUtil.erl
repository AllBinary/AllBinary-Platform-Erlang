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
% import org.allbinary.game.configuration.feature.Features
% import org.allbinary.graphics.opengles.OpenGLFeatureFactory
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonSeps
% import org.allbinary.system.Memory

-module('SpecialMessageUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'SINGLETON'}, 'SpecialMessageUtil':new()),
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
        get({'SpecialMessageUtil', 'SINGLETON'}).

get(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, 'Memory':getInfo()),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'CommonSeps':getInstance(), 'SPACE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N65995) -> (get({Target_N65995, '$class'})):toString(Target_N65995) end)('GameStatisticsFactory':getInstance())),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'CommonSeps':getInstance(), 'SPACE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Option: "),
        case (fun(Target_N66107) -> (get({Target_N66107, '$class'})):isDefault(Target_N66107, get({'OpenGLFeatureFactory':getInstance(), 'OPENGL_AUTO_SELECT'})) end)('Features':getInstance()) of
            true ->
            (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N66245) -> (get({Target_N66245, '$class'})):getName(Target_N66245) end)(get({'OpenGLFeatureFactory':getInstance(), 'OPENGL_AUTO_SELECT'})));
            false ->
            (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N66183) -> (get({Target_N66183, '$class'})):getName(Target_N66183) end)(get({'OpenGLFeatureFactory':getInstance(), 'OPENGL_MINIMUM'})))
        end,
        (get({StringBuffer, '$class'})):toString(StringBuffer).

