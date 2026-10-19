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
% import org.allbinary.canvas.Processor
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings

-module('StartIntermissionProcessor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('Processor', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, gameCanvas}, undefined),
    put({This, 'WAIT'}, 5000),
    ok.


new(GameCanvas) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, GameCanvas),
    This.

init(This, GameCanvas) ->
    'Processor':init(This),
    init_fields(This),
        put({This, gameCanvas}, GameCanvas).

% throws Exception
process(This) ->
        case (fun(Target_N65929) -> (get({Target_N65929, '$class'})):isElapsedTNT(Target_N65929, get({This, 'WAIT'})) end)((fun(Target_N65936) -> (get({Target_N65936, '$class'})):getTimeDelayHelper(Target_N65936) end)((get({get({This, gameCanvas}), '$class'})):getStartIntermissionInterface(get({This, gameCanvas})))) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Intermission End", This, get({get({This, commonStrings}), 'PROCESS'})),
            (fun(Target_N66038) -> (get({Target_N66038, '$class'})):setEnabled(Target_N66038, false) end)((get({get({This, gameCanvas}), '$class'})):getStartIntermissionInterface(get({This, gameCanvas})));
            false -> ok
        end.

