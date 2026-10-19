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
% package org.allbinary.game.displayable.canvas
% import org.allbinary.graphics.displayable.DisplayInfoSingleton

-module('GameRunnable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements Runnable

init_fields(This) ->
    put({This, 'WAIT'}, 240),
    put({This, 'FAST'}, 60),
    put({This, waitInMillis}, get({This, 'WAIT'})),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

run(This) ->
        (fun(Target_N65771) -> (get({Target_N65771, '$class'})):process(Target_N65771) end)('DisplayInfoSingleton':getInstance()).

% throws Exception
processLoopSleep(This) ->
        timer:sleep(get({This, waitInMillis})).

