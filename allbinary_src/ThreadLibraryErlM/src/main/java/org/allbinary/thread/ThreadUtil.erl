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
% package org.allbinary.thread
% import org.allbinary.logic.communication.log.LogUtil

-module('ThreadUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ThreadUtil':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, 'JOIN'}, "join"),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'ThreadUtil', instance}).

isRunning(This, Thread) ->
        try
        case ((Thread =/= undefined) andalso (get({Thread, '$class'})):isAlive(Thread)) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
join(This, Thread) ->
        case (fun(Target_N65933) -> (get({Target_N65933, '$class'})):isRunning(Target_N65933, Thread) end)('ThreadUtil':getInstance()) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Waiting for Thread To Join/End", This, get({This, 'JOIN'})),
            (get({Thread, '$class'})):join(Thread);
            false -> ok
        end.

