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
% import org.allbinary.graphics.displayable.GameTickDisplayInfoSingleton
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings
% import org.allbinary.time.GameTickTimeDelayHelper
% import org.allbinary.time.GameTickTimeDelayHelperFactory

-module('GameFrameRunnable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('GameRunnable', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, gameTickDisplayInfoSingleton}, 'GameTickDisplayInfoSingleton':getInstance()),
    put({This, allBinaryGameCanvas}, undefined),
    put({This, gameTickTimeDelayHelper}, 'GameTickTimeDelayHelperFactory':getInstance()),
    ok.


new(AllBinaryGameCanvas) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, AllBinaryGameCanvas),
    This.

init(This, AllBinaryGameCanvas) ->
    'GameRunnable':init(This),
    init_fields(This),
        put({This, allBinaryGameCanvas}, AllBinaryGameCanvas).

run(This) ->
        try
            AllBinaryGameCanvas = get({This, allBinaryGameCanvas}),
            (fun(Target_N66057) -> (get({Target_N66057, '$class'})):setStartTime(Target_N66057, (get({get({This, gameTickTimeDelayHelper}), '$class'})):setStartTime(get({This, gameTickTimeDelayHelper}))) end)((get({AllBinaryGameCanvas, '$class'})):getLoopTimeHelperP(AllBinaryGameCanvas)),
            (get({get({This, gameTickDisplayInfoSingleton}), '$class'})):update(get({This, gameTickDisplayInfoSingleton})),
            (get({AllBinaryGameCanvas, '$class'})):processGame(AllBinaryGameCanvas),
            case ((not (get({AllBinaryGameCanvas, '$class'})):isRunning(AllBinaryGameCanvas)) orelse (get({AllBinaryGameCanvas, '$class'})):isPaused(AllBinaryGameCanvas)) of
                true ->
                (get({AllBinaryGameCanvas, '$class'})):notifyDonePainting(AllBinaryGameCanvas);
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, get({CommonStrings, 'RUN'}), E)
        end.

