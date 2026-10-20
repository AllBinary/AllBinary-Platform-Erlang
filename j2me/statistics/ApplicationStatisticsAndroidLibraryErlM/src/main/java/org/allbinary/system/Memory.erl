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
% package org.allbinary.system
% import org.allbinary.logic.string.StringMaker

-module('Memory').
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


getInfo() ->
        StringBuffer = 'StringMaker':new(),
        MaxUtilizedMemoryAvailable = (fun(Target_N65674) -> (get({Target_N65674, '$class'})):maxMemory(Target_N65674) end)('Runtime':getRuntime()),
        MemoryUsed = (fun(Target_N65729) -> (get({Target_N65729, '$class'})):totalMemory(Target_N65729) end)('Runtime':getRuntime()),
        (get({StringBuffer, '$class'})):append(StringBuffer, "APK Memory: Available: "),
        (get({StringBuffer, '$class'})):appendlong(StringBuffer, MaxUtilizedMemoryAvailable),
        (get({StringBuffer, '$class'})):append(StringBuffer, "/"),
        (get({StringBuffer, '$class'})):appendlong(StringBuffer, trunc((fun(Target_N65874) -> (get({Target_N65874, '$class'})):maxMemory(Target_N65874) end)('Runtime':getRuntime()))),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Used: "),
        (get({StringBuffer, '$class'})):appendlong(StringBuffer, MemoryUsed),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Free: "),
        (get({StringBuffer, '$class'})):appendlong(StringBuffer, (MaxUtilizedMemoryAvailable - MemoryUsed)),
        (get({StringBuffer, '$class'})):append(StringBuffer, "/"),
        (get({StringBuffer, '$class'})):appendlong(StringBuffer, trunc(((fun(Target_N66081) -> (get({Target_N66081, '$class'})):maxMemory(Target_N66081) end)('Runtime':getRuntime()) - MemoryUsed))),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

