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
% package org.allbinary.game.ag.ai.scroller
% import javax.microedition.lcdui.Canvas
% import org.allbinary.game.ai.BasicAI
% import org.allbinary.game.input.GameInput
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.layer.AllBinaryLayerManager
% import org.allbinary.logic.math.SmallIntegerSingletonFactory
% import org.allbinary.time.GameTickTimeDelayHelperFactory
% import org.allbinary.time.TimeDelayHelper

-module('TimedFireAI').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicAI', Function, Arguments).

static_init() ->
    put({?MODULE, 'TIME'}, (fun(Target_N65842) -> (get({Target_N65842, '$class'})):getAt(Target_N65842, 1) end)('SmallIntegerSingletonFactory':getInstance())),
    ok.

init_fields(This) ->
    put({This, maxFireDelayTimeHelper}, 'TimeDelayHelper':new(0)),
    put({This, delay}, 0),
    ok.


new(Delay, OwnerLayerInterface, GameInput) when is_integer(Delay) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Delay, OwnerLayerInterface, GameInput),
    This.

'$init'(This, Delay, OwnerLayerInterface, GameInput) when is_integer(Delay) ->
        'BasicAI':'$init'(This, OwnerLayerInterface, GameInput),
        init_fields(This),
        put({This, delay}, Delay).

% throws Exception
processAI(This, AllBinaryLayerManager) ->
        TimeFiredInterface = (get({This, '$class'})):getOwnerLayerInterface(This),
        case ((get({get({This, maxFireDelayTimeHelper}), '$class'})):isTime(get({This, maxFireDelayTimeHelper}), get({'GameTickTimeDelayHelperFactory':getInstance(), startTime})) andalso (((get({TimeFiredInterface, '$class'})):getLastFireTime(TimeFiredInterface) + get({get({This, maxFireDelayTimeHelper}), delay})) < (get({get({This, maxFireDelayTimeHelper}), '$class'})):getStartTime(get({This, maxFireDelayTimeHelper})))) of
            true ->
            'BasicAI':processKeyAI(This, get({'Canvas', 'KEY_NUM1'})),
            put({get({This, maxFireDelayTimeHelper}), delay}, get({This, delay}));
            false -> ok
        end.

