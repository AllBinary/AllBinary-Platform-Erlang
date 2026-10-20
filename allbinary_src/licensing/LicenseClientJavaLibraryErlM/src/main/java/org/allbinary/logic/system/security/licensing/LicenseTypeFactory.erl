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
% import org.allbinary.string.CommonStrings

-module('LicenseTypeFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'LicenseTypeFactory':new()),
    ok.

init_fields(This) ->
    put({This, 'UNKNOWN'}, 'LicenseType':new(get({'CommonStrings':getInstance(), 'UNKNOWN'}))),
    put({This, 'DEMO'}, 'LicenseType':new("Demo")),
    put({This, 'NORMAL'}, 'LicenseType':new("Normal")),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'LicenseTypeFactory', instance}).

getInstance(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
        try
        case ((fun(Target_N65916) -> (get({Target_N65916, '$class'})):compareTo(Target_N65916, Name) end)((get({get({This, 'DEMO'}), '$class'})):getName(get({This, 'DEMO'}))) =:= 0) of
            true ->
            throw({'$return', get({This, 'DEMO'})});
            false ->
            case ((fun(Target_N65966) -> (get({Target_N65966, '$class'})):compareTo(Target_N65966, Name) end)((get({get({This, 'NORMAL'}), '$class'})):getName(get({This, 'NORMAL'}))) =:= 0) of
            true ->
            throw({'$return', get({This, 'NORMAL'})});
            false -> ok
        end
        end,
        get({This, 'UNKNOWN'})
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

