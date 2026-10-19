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
% package org.allbinary.input.automation
% import org.allbinary.logic.io.file.FilePathData
% import org.allbinary.logic.string.StringMaker

-module('ImageOutputData').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'SAVE_PATH'}, (fun(Target_N65689) -> (get({Target_N65689, '$class'})):toString(Target_N65689) end)((fun(Target_N65696) -> (get({Target_N65696, '$class'})):appendchar(Target_N65696, get({'FilePathData':getInstance(), 'SEPARATORCHAR'})) end)((fun(Target_N65703) -> (get({Target_N65703, '$class'})):append(Target_N65703, "saves") end)((fun(Target_N65710) -> (get({Target_N65710, '$class'})):appendchar(Target_N65710, get({'FilePathData':getInstance(), 'SEPARATORCHAR'})) end)((fun(Target_N65717) -> (get({Target_N65717, '$class'})):append(Target_N65717, 'System':getProperty("user.dir")) end)('StringMaker':new())))))),
    ok.

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

