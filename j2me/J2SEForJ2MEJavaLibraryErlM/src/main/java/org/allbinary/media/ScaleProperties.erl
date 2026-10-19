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
        (fun(Target_N65828) -> (get({Target_N65828, '$class'})):toString(Target_N65828) end)((fun(Target_N65835) -> (get({Target_N65835, '$class'})):appendint(Target_N65835, get({This, scaleHeight})) end)((fun(Target_N65842) -> (get({Target_N65842, '$class'})):append(Target_N65842, "scaleHeight: ") end)((fun(Target_N65849) -> (get({Target_N65849, '$class'})):appendint(Target_N65849, get({This, scaleWidth})) end)((fun(Target_N65856) -> (get({Target_N65856, '$class'})):append(Target_N65856, "scaleWidth: ") end)((fun(Target_N65863) -> (get({Target_N65863, '$class'})):appendfloat(Target_N65863, get({This, scaleY})) end)((fun(Target_N65870) -> (get({Target_N65870, '$class'})):append(Target_N65870, "scaleY: ") end)((fun(Target_N65877) -> (get({Target_N65877, '$class'})):appendfloat(Target_N65877, get({This, scaleX})) end)((fun(Target_N65884) -> (get({Target_N65884, '$class'})):append(Target_N65884, "scaleX: ") end)((fun(Target_N65891) -> (get({Target_N65891, '$class'})):appendboolean(Target_N65891, get({This, shouldScale})) end)((fun(Target_N65898) -> (get({Target_N65898, '$class'})):append(Target_N65898, get({'CommonLabels':getInstance(), 'COLON_SEP'})) end)('StringMaker':new()))))))))))).

