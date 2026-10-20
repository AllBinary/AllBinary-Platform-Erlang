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
% package org.allbinary.persistance
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.string.CommonSeps

-module('PlatformRecordIdUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'PlatformRecordIdUtil':new()),
    ok.

init_fields(This) ->
    put({This, 'PLATFORM_SHORT_NAME'}, "AND"),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'PlatformRecordIdUtil', instance}).

getRecordId(This, AbeClientInformation, BaseRecordId) when (is_list(BaseRecordId) orelse BaseRecordId =:= undefined) ->
        (fun(Target_N65834) -> (get({Target_N65834, '$class'})):toString(Target_N65834) end)((fun(Target_N65841) -> (get({Target_N65841, '$class'})):append(Target_N65841, BaseRecordId) end)((fun(Target_N65848) -> (get({Target_N65848, '$class'})):append(Target_N65848, get({This, 'PLATFORM_SHORT_NAME'})) end)((fun(Target_N65855) -> (get({Target_N65855, '$class'})):append(Target_N65855, get({'CommonSeps':getInstance(), 'UNDERSCORE'})) end)((fun(Target_N65862) -> (get({Target_N65862, '$class'})):append(Target_N65862, (get({AbeClientInformation, '$class'})):toShortString(AbeClientInformation)) end)('StringMaker':new()))))).

