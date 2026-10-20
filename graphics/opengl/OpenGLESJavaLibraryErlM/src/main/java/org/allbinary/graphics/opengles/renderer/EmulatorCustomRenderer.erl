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
% package org.allbinary.graphics.opengles.renderer
% import javax.microedition.khronos.egl.EGLConfig
% import javax.microedition.khronos.opengles.GL10
% import org.allbinary.emulator.InitEmulatorFactory
% import org.allbinary.string.CommonStrings
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.log.PreLogUtil

-module('EmulatorCustomRenderer').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, renderStrings}, 'RendererStrings':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


onSurfaceCreated(This, Gl, EglConfig) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, renderStrings}), 'ON_SURFACE_CREATED'})),
        InitEmulatorFactory = 'InitEmulatorFactory':getInstance(),
        case (not (get({InitEmulatorFactory, '$class'})):isInitEmulator(InitEmulatorFactory)) of
            true ->
            try
                WAIT_FOR_EMULATOR = "Waiting on Emulator Initialization",
                (fun Loop() -> case (not (get({InitEmulatorFactory, '$class'})):isInitEmulator(InitEmulatorFactory)) of true ->
                    'PreLogUtil':put(WAIT_FOR_EMULATOR, This, get({get({This, renderStrings}), 'ON_SURFACE_CREATED'})),
                    timer:sleep(180),
                    Loop();
                false -> ok end end)()
            catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, renderStrings}), 'ON_SURFACE_CREATED'}), E)
            end;
            false -> ok
        end.

