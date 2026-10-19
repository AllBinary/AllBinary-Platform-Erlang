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
% package org.allbinary
% import org.allbinary.business.init.LicenseInitInfoUtil
% import org.allbinary.data.resource.ResourceUtil
% import org.allbinary.logic.system.security.licensing.PartnerIdentifierFileUtil

-module('AllBinaryAndroidGameInitializationUtil').
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


init() ->
        ResourceUtil = 'ResourceUtil':getInstance(),
        AndroidResources = 'AndroidResources':getInstance(),
        LicenseInitInfoUtil = 'LicenseInitInfoUtil':getInstance(),
        (get({ResourceUtil, '$class'})):addResource(ResourceUtil, get({LicenseInitInfoUtil, 'INITFILENAME'}), allbinary_java:to_string(get({get({AndroidResources, raw}), licenseinitdata}))),
        (get({ResourceUtil, '$class'})):addResource(ResourceUtil, get({'PartnerIdentifierFileUtil':getInstance(), 'FILE_NAME'}), allbinary_java:to_string(get({get({AndroidResources, raw}), partner}))).

