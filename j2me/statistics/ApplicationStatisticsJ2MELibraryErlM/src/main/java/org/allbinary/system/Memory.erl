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
    init(This),
    This.

init(This) ->
    init_fields(This).


getInfo() ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "Memory: Free: "),
        (get({StringBuffer, '$class'})):appendlong(StringBuffer, trunc((fun(Target_N65706) -> (get({Target_N65706, '$class'})):freeMemory(Target_N65706) end)('Runtime':getRuntime()))),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Total: "),
        (get({StringBuffer, '$class'})):appendlong(StringBuffer, trunc((fun(Target_N65784) -> (get({Target_N65784, '$class'})):totalMemory(Target_N65784) end)('Runtime':getRuntime()))),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

