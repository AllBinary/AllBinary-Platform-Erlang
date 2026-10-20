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
% package org.allbinary.animation.image
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.math.PositionStrings
% import org.allbinary.string.CommonLabels
% import org.allbinary.string.CommonSeps

-module('AnimationFactoryInitializationVisitor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, width}, 0),
    put({This, height}, 0),
    put({This, dx}, 0),
    put({This, dy}, 0),
    put({This, originalDx}, 0),
    put({This, originalDy}, 0),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


visit(This) ->
        ok.

toString(This) ->
        CommonSeps = 'CommonSeps':getInstance(),
        CommonLabels = 'CommonLabels':getInstance(),
        StringBuffer = 'StringMaker':new(),
        (fun(Target_N66026) -> (get({Target_N66026, '$class'})):appendfloat(Target_N66026, float(get({This, dx}))) end)((get({StringBuffer, '$class'})):append(StringBuffer, get({'PositionStrings':getInstance(), 'DX_LABEL'}))),
        (fun(Target_N66103) -> (get({Target_N66103, '$class'})):appendfloat(Target_N66103, float(get({This, dy}))) end)((get({StringBuffer, '$class'})):append(StringBuffer, get({'PositionStrings':getInstance(), 'DY_LABEL'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonLabels, 'WIDTH_LABEL'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, get({This, width})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'SPACE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonLabels, 'HEIGHT_LABEL'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, get({This, height})),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

