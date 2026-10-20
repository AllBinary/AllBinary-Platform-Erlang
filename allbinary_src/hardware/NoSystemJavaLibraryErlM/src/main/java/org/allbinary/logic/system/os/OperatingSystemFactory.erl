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
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonStrings

-module('OperatingSystemFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'OperatingSystemFactory':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, genericOperatingSystem}, get({'NoOperatingSystem', 'NO_OPERATING_SYSTEM'})),
    ok.


getInstance() ->
        get({'OperatingSystemFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

getOperatingSystemInstance(This) ->
        CommonStrings = 'CommonStrings':getInstance(),
        try
            OsString = (fun(Target_N65984) -> (get({Target_N65984, '$class'})):toString(Target_N65984) end)((fun(Target_N65991) -> (get({Target_N65991, '$class'})):append(Target_N65991, (get({get({This, genericOperatingSystem}), '$class'})):toString(get({This, genericOperatingSystem}))) end)((fun(Target_N65998) -> (get({Target_N65998, '$class'})):append(Target_N65998, "OperatingSystem Info: ") end)('StringMaker':new()))),
            io:format("~ts~n", [allbinary_java:to_string(OsString)]),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), OsString, This, get({CommonStrings, 'GET_INSTANCE'}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, get({CommonStrings, 'GET_INSTANCE'}), E)
        end,
        get({This, genericOperatingSystem}).

