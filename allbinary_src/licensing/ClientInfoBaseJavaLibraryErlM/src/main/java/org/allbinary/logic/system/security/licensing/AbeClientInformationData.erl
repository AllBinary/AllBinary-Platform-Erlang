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
% package org.allbinary.logic.system.security.licensing

-module('AbeClientInformationData').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'AbeClientInformationData':new()),
    ok.

init_fields(This) ->
    put({This, 'KEY'}, "KEY"),
    put({This, 'NAME'}, "NAME"),
    put({This, 'VERSION'}, "VERSION"),
    put({This, 'SPECIALNAME'}, "SPECIALNAME"),
    put({This, 'LICENSEID'}, "LICENSEID"),
    put({This, 'LICENSE_TYPE'}, "LICENSETYPE"),
    put({This, 'PREVIOUSLICENSEID'}, "PREVIOUSLICENSEID"),
    put({This, 'OSNAME'}, "OSNAME"),
    put({This, 'OSARCH'}, "OSARCH"),
    put({This, 'OSVERSION'}, "OSVERSION"),
    put({This, 'OS'}, "OS"),
    put({This, 'HARDWARE'}, "HARDWARE"),
    put({This, 'LICENSESERVERS'}, "LICENSESERVERS"),
    put({This, 'NEWLICENSE'}, "NEWLICENSE"),
    put({This, 'ISNEW'}, "ISNEW"),
    put({This, 'SPECIAL'}, "SPECIAL"),
    ok.


getInstance() ->
        get({'AbeClientInformationData', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

