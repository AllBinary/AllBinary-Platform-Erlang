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
% package org.allbinary.logic.communication.http.request

-module('AbeHttpRequestInfoData').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'AbeHttpRequestInfoData':new()),
    ok.

init_fields(This) ->
    put({This, 'HTTP_USER_AGENT'}, "HTTP_USER_AGENT"),
    put({This, 'REMOTE_ADDRESS'}, "REMOTE_ADDRESS"),
    put({This, 'REMOTE_HOST'}, "REMOTE_HOST"),
    put({This, 'REMOTE_HOST_BY_ADDRESS'}, "REMOTE_HOST_BY_ADDRESS"),
    put({This, 'REMOTE_PORT'}, "REMOTE_PORT"),
    put({This, 'REQUEST_FILE_PATH'}, "REQUEST_FILE_PATH"),
    ok.


getInstance() ->
        get({'AbeHttpRequestInfoData', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

