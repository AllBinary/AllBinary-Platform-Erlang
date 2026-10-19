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
% package org.allbinary.logic.system.hardware.components.linux

-module('CpuInfo').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'PROCESSOR'}, 'CpuInfo':new("processor")),
    put({?MODULE, 'VENDORID'}, 'CpuInfo':new("vendor_id")),
    put({?MODULE, 'CPUFAMILY'}, 'CpuInfo':new("cpu family")),
    put({?MODULE, 'MODEL'}, 'CpuInfo':new("model")),
    put({?MODULE, 'MODELNAME'}, 'CpuInfo':new("model name")),
    put({?MODULE, 'STEPPING'}, 'CpuInfo':new("stepping")),
    put({?MODULE, 'CPUMHZ'}, 'CpuInfo':new("cpu MHz")),
    put({?MODULE, 'CACHESIZE'}, 'CpuInfo':new("cache size")),
    put({?MODULE, 'FDIVBUG'}, 'CpuInfo':new("fdiv_bug")),
    put({?MODULE, 'HLTBUG'}, 'CpuInfo':new("hlt_bug")),
    put({?MODULE, 'F00FBUG'}, 'CpuInfo':new("f00f_bug")),
    put({?MODULE, 'COMABUG'}, 'CpuInfo':new("coma_bug")),
    put({?MODULE, 'FPU'}, 'CpuInfo':new("fpu")),
    put({?MODULE, 'FPUEXCEPTION'}, 'CpuInfo':new("fpu_exception")),
    put({?MODULE, 'CPUIDLEVEL'}, 'CpuInfo':new("cache size")),
    put({?MODULE, 'WP'}, 'CpuInfo':new("yes")),
    put({?MODULE, 'FLAGS'}, 'CpuInfo':new("flags")),
    put({?MODULE, 'BOGOMIPS'}, 'CpuInfo':new("bogomips")),
    ok.

init_fields(This) ->
    put({This, name}, undefined),
    ok.


new(Name) when (is_list(Name) orelse Name =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Name),
    This.

init(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
    init_fields(This),
        put({This, name}, Name).

toString(This) ->
        get({This, name}).

