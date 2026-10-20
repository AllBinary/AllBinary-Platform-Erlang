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
% package org.allbinary.business.init

-module('LicenseInitInfoUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'LicenseInitInfoUtil':new()),
    ok.

init_fields(This) ->
    put({This, 'INITFILENAME'}, "licenseinitdata.dat"),
    put({This, 'ABOUT'}, "about"),
    put({This, 'PRIVACY_POLICY'}, "privacy_policy"),
    put({This, 'OFFICIAL_ALLBINARY_SERVICES_SERVER'}, "https://services.allbinary.com/LicServ/serverssl.php"),
    ok.


getInstance() ->
        get({'LicenseInitInfoUtil', instance}).

setFilePath(This, FilePath) when (is_list(FilePath) orelse FilePath =:= undefined) ->
        ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

% throws Exception
write(This, InitData) ->
        ok.

% throws Exception
read(This) ->
        (get({This, '$class'})):readAgain(This, 0).

% throws Exception
readAgain(This, InitializeCounter) when is_integer(InitializeCounter) ->
        LicenseInitInfo = 'LicenseInitInfo':new(),
        (get({LicenseInitInfo, '$class'})):clearServers(LicenseInitInfo),
        (get({LicenseInitInfo, '$class'})):addServer(LicenseInitInfo, get({This, 'OFFICIAL_ALLBINARY_SERVICES_SERVER'})),
        LicenseInitInfo.

