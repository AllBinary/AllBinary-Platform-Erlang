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

-module('SystemProperties').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'SystemProperties':new()),
    ok.

init_fields(This) ->
    put({This, 'OS_NAME'}, "os.name"),
    put({This, 'OS_ARCH'}, "os.arch"),
    put({This, 'OS_VERSION'}, "os.version"),
    put({This, 'USER_HOME'}, "user.home"),
    ok.


getInstance() ->
        get({'SystemProperties', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

getName(This) ->
        'System':getProperty(get({This, 'OS_NAME'})).

getArch(This) ->
        'System':getProperty(get({This, 'OS_ARCH'})).

getVersion(This) ->
        'System':getProperty(get({This, 'OS_VERSION'})).

getUserHomePath(This) ->
        'System':getProperty(get({This, 'USER_HOME'})).

