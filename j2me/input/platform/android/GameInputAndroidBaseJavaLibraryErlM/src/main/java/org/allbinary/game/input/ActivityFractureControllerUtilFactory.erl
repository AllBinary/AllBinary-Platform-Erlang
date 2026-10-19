% Generated Code Do Not Modify
% package org.allbinary.game.input
% import org.allbinary.android.AndroidInfoFactory

-module('ActivityFractureControllerUtilFactory').
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


getInstance() ->
        try
        SDK_VERSION = (fun(Target_N65630) -> (get({Target_N65630, '$class'})):getVersion(Target_N65630) end)('AndroidInfoFactory':getInstance()),
        case (SDK_VERSION =< 8) of
            true ->
            throw({'$return', 'AndroidAPI1KeyFactory':getInstance()});
            false ->
            case (SDK_VERSION =< 11) of
            true ->
            throw({'$return', 'AndroidAPI9KeyFactory':getInstance()});
            false ->
            throw({'$return', 'AndroidAPI12KeyFactory':getAPI12Instance()})
        end
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

