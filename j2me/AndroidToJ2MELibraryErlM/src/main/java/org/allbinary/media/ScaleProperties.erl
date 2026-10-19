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
% package org.allbinary.media
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonLabels

-module('ScaleProperties').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ScaleProperties':new()),
    ok.

init_fields(This) ->
    put({This, scaleX}, 0.0),
    put({This, scaleY}, 0.0),
    put({This, scaleWidth}, 0),
    put({This, scaleHeight}, 0),
    put({This, shouldScale}, false),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


toString(This) ->
        (fun(Target_N65832) -> (get({Target_N65832, '$class'})):toString(Target_N65832) end)((fun(Target_N65839) -> (get({Target_N65839, '$class'})):appendint(Target_N65839, get({This, scaleHeight})) end)((fun(Target_N65846) -> (get({Target_N65846, '$class'})):append(Target_N65846, "scaleHeight: ") end)((fun(Target_N65853) -> (get({Target_N65853, '$class'})):appendint(Target_N65853, get({This, scaleWidth})) end)((fun(Target_N65860) -> (get({Target_N65860, '$class'})):append(Target_N65860, "scaleWidth: ") end)((fun(Target_N65867) -> (get({Target_N65867, '$class'})):appendfloat(Target_N65867, get({This, scaleY})) end)((fun(Target_N65874) -> (get({Target_N65874, '$class'})):append(Target_N65874, "scaleY: ") end)((fun(Target_N65881) -> (get({Target_N65881, '$class'})):appendfloat(Target_N65881, get({This, scaleX})) end)((fun(Target_N65888) -> (get({Target_N65888, '$class'})):append(Target_N65888, "scaleX: ") end)((fun(Target_N65895) -> (get({Target_N65895, '$class'})):appendboolean(Target_N65895, get({This, shouldScale})) end)((fun(Target_N65902) -> (get({Target_N65902, '$class'})):append(Target_N65902, get({'CommonLabels':getInstance(), 'COLON_SEP'})) end)('StringMaker':new()))))))))))).

