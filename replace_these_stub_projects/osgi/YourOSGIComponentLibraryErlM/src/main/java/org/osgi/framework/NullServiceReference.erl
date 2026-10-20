% 
% AllBinary Open License Version 1 
% Copyright (c) 2025 AllBinary 
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
% package org.osgi.framework
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.string.StringUtil

-module('NullServiceReference').
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


getProperty(This, Key) when (is_list(Key) orelse Key =:= undefined) ->
        get({'NullUtil':getInstance(), 'NULL_OBJECT'}).

getPropertyKeys(This) ->
        (fun(Target_N65726) -> (get({Target_N65726, '$class'})):getArrayInstance(Target_N65726) end)('StringUtil':getInstance()).

compareTo(This, O) ->
        erlang:error({'RuntimeException'}).

