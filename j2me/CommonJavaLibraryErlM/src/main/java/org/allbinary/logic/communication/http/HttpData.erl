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
% package org.allbinary.logic.communication.http
% import org.allbinary.string.CommonSeps

-module('HttpData').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'HttpData':new()),
    ok.

init_fields(This) ->
    put({This, 'EQUALS'}, undefined),
    put({This, 'PARAM_SEP'}, undefined),
    put({This, 'URL_PARAM_SEP'}, undefined),
    put({This, 'URL_LABEL'}, "Url: "),
    ok.


getInstance() ->
        get({'HttpData', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        CommonSeps = 'CommonSeps':getInstance(),
        put({This, 'EQUALS'}, get({CommonSeps, 'EQUALS'})),
        put({This, 'PARAM_SEP'}, get({CommonSeps, 'AMPERSAND'})),
        put({This, 'URL_PARAM_SEP'}, get({CommonSeps, 'QUESTION'})).

