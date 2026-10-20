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
% import org.allbinary.AndroidUtil
% import org.allbinary.game.configuration.feature.Features
% import org.allbinary.graphics.opengles.OpenGLFeatureFactory
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings

-module('GameCanvasPauseRunnable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('GameRunnable', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, allBinaryGameCanvas}, undefined),
    ok.


new(AllBinaryGameCanvas) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, AllBinaryGameCanvas),
    This.

'$init'(This, AllBinaryGameCanvas) ->
    'GameRunnable':'$init'(This),
    init_fields(This),
        put({This, allBinaryGameCanvas}, AllBinaryGameCanvas).

run(This) ->
        ok.

% throws Exception
processLoopSleep(This) ->
        try
            Features = 'Features':getInstance(),
            IsOpenGL = (get({Features, '$class'})):isDefault(Features, get({'OpenGLFeatureFactory':getInstance(), 'OPENGL'})),
            case IsOpenGL of
                true ->
                (get({get({This, allBinaryGameCanvas}), '$class'})):processSleep(get({This, allBinaryGameCanvas}));
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, get({CommonStrings, 'RUN'}), E)
        end.

