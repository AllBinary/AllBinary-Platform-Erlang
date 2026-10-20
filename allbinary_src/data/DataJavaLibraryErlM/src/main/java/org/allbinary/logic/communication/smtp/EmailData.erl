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
% package org.allbinary.logic.communication.smtp

-module('EmailData').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'SERVER'}, "EMAIL_SERVER"),
    put({?MODULE, 'NAME'}, "EMAIL_NAME"),
    put({?MODULE, 'FROM'}, "EMAIL_FROM"),
    put({?MODULE, 'TO'}, "EMAIL_TO"),
    put({?MODULE, 'CC'}, "EMAIL_CC"),
    put({?MODULE, 'BCC'}, "EMAIL_BCC"),
    put({?MODULE, 'SUBJECT'}, "EMAIL_SUBJECT"),
    put({?MODULE, 'CONTENT'}, "EMAIL_CONTENT"),
    ok.

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

