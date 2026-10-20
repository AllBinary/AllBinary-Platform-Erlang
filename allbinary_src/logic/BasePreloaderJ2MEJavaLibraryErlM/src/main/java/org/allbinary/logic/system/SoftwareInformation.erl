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
% package org.allbinary.logic.system
% import org.allbinary.KotlinUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonSeps

-module('SoftwareInformation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, name}, undefined),
    put({This, shortName}, undefined),
    put({This, version}, undefined),
    ok.


new(Name, Version, ShortName) when (is_list(Name) orelse Name =:= undefined), (is_list(Version) orelse Version =:= undefined), (is_list(ShortName) orelse ShortName =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Name, Version, ShortName),
    This.

'$init'(This, Name, Version, ShortName) when (is_list(Name) orelse Name =:= undefined), (is_list(Version) orelse Version =:= undefined), (is_list(ShortName) orelse ShortName =:= undefined) ->
    init_fields(This),
        put({This, name}, Name),
        put({This, version}, Version),
        put({This, shortName}, (fun(Target_N65842) -> (get({Target_N65842, '$class'})):toString(Target_N65842) end)((fun(Target_N65849) -> (get({Target_N65849, '$class'})):append(Target_N65849, 'KotlinUtil':getShortName()) end)((fun(Target_N65856) -> (get({Target_N65856, '$class'})):append(Target_N65856, ShortName) end)('StringMaker':new())))).

getName(This) ->
        get({This, name}).

getVersion(This) ->
        get({This, version}).

toShortString(This) ->
        get({This, shortName}).

toString(This) ->
        NAME = "Name: ",
        VERSION = "Version: ",
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, NAME),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getName(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'CommonSeps':getInstance(), 'SPACE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, VERSION),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getVersion(This)),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

