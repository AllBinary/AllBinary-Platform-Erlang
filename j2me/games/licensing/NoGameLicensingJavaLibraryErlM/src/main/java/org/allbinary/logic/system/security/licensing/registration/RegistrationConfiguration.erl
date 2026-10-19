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
% package org.allbinary.logic.system.security.licensing.registration
% import org.allbinary.logic.string.StringMaker

-module('RegistrationConfiguration').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'SINGLETON'}, 'RegistrationConfiguration':new()),
    ok.

init_fields(This) ->
    put({This, registrationCode}, "No Registration Code"),
    put({This, 'NAME'}, "registrationid"),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

getInstance() ->
        get({'RegistrationConfiguration', 'SINGLETON'}).

% throws Exception
read(This) ->
        ok.

% throws Exception
write(This) ->
        ok.

toString(This) ->
        (fun(Target_N65897) -> (get({Target_N65897, '$class'})):toString(Target_N65897) end)((fun(Target_N65904) -> (get({Target_N65904, '$class'})):append(Target_N65904, (get({This, '$class'})):getRegistrationCode(This)) end)((fun(Target_N65911) -> (get({Target_N65911, '$class'})):append(Target_N65911, "Registration Code: ") end)('StringMaker':new()))).

setRegistrationCode(This, RegistrationCode) when (is_list(RegistrationCode) orelse RegistrationCode =:= undefined) ->
        put({This, registrationCode}, RegistrationCode).

getRegistrationCode(This) ->
        get({This, registrationCode}).

