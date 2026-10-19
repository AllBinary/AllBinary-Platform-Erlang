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
% package org.allbinary.logic.system.os

-module('OperatingSystems').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'OperatingSystems':new()),
    ok.

init_fields(This) ->
    put({This, 'LINUX'}, "Linux"),
    put({This, 'WINDOWS'}, "Windows"),
    put({This, 'SOLARIS'}, "Solaris"),
    put({This, 'WINDOWS2000'}, "Windows 2000"),
    put({This, 'WINDOWS_NT'}, "Windows NT"),
    put({This, 'WINDOWS_10'}, "Windows 10"),
    put({This, 'WINDOWS_11'}, "Windows 11"),
    put({This, 'WINDOWS_VISTA'}, "Windows Vista"),
    put({This, 'WINDOWS_XP'}, "Windows XP"),
    put({This, 'ANDROID'}, get({This, 'LINUX'})),
    put({This, 'HARMONY'}, "HarmonyOS"),
    put({This, unknownSpecificOSAllowed}, true),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

isUnknownSpecificOSAllowed(This) ->
        get({This, unknownSpecificOSAllowed}).

setUnknownSpecificOSAllowed(This, AUnknownSpecificOSAllowed) when is_boolean(AUnknownSpecificOSAllowed) ->
        put({This, unknownSpecificOSAllowed}, AUnknownSpecificOSAllowed).

getInstance() ->
        get({'OperatingSystems', instance}).

