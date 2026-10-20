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
    put({This, scaleX}, 1.0),
    put({This, scaleY}, 1.0),
    put({This, scaleWidth}, 0),
    put({This, scaleHeight}, 0),
    put({This, shouldScale}, false),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


toString(This) ->
        (fun(Target_N65844) -> (get({Target_N65844, '$class'})):toString(Target_N65844) end)((fun(Target_N65851) -> (get({Target_N65851, '$class'})):appendint(Target_N65851, get({This, scaleHeight})) end)((fun(Target_N65858) -> (get({Target_N65858, '$class'})):append(Target_N65858, "scaleHeight: ") end)((fun(Target_N65865) -> (get({Target_N65865, '$class'})):appendint(Target_N65865, get({This, scaleWidth})) end)((fun(Target_N65872) -> (get({Target_N65872, '$class'})):append(Target_N65872, "scaleWidth: ") end)((fun(Target_N65879) -> (get({Target_N65879, '$class'})):appendfloat(Target_N65879, get({This, scaleY})) end)((fun(Target_N65886) -> (get({Target_N65886, '$class'})):append(Target_N65886, "scaleY: ") end)((fun(Target_N65893) -> (get({Target_N65893, '$class'})):appendfloat(Target_N65893, get({This, scaleX})) end)((fun(Target_N65900) -> (get({Target_N65900, '$class'})):append(Target_N65900, "scaleX: ") end)((fun(Target_N65907) -> (get({Target_N65907, '$class'})):appendboolean(Target_N65907, get({This, shouldScale})) end)((fun(Target_N65914) -> (get({Target_N65914, '$class'})):append(Target_N65914, get({'CommonLabels':getInstance(), 'COLON_SEP'})) end)('StringMaker':new()))))))))))).

