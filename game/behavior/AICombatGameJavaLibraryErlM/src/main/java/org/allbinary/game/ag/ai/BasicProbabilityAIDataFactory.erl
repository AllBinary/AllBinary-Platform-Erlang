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
% package org.allbinary.game.ag.ai
% import javax.microedition.lcdui.Canvas
% import org.allbinary.logic.math.SmallIntegerSingletonFactory
% import org.allbinary.time.NoTimeDelayHelper
% import org.allbinary.util.ABHashtable

-module('BasicProbabilityAIDataFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance(This) ->
        LikelyhoodIntegerArray = array:new((get({'Canvas', 'KEY_NUM9'}) + 1), {default, array:new(2, {default, undefined})}),
        SmallIntegerSingletonFactory = 'SmallIntegerSingletonFactory':getInstance(),
        array:set(get({'Canvas', 'UP'}), array:set(0, (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 0), array:get(get({'Canvas', 'UP'}), LikelyhoodIntegerArray)), LikelyhoodIntegerArray),
        array:set(get({'Canvas', 'UP'}), array:set(1, (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 10), array:get(get({'Canvas', 'UP'}), LikelyhoodIntegerArray)), LikelyhoodIntegerArray),
        array:set(get({'Canvas', 'DOWN'}), array:set(0, (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 10), array:get(get({'Canvas', 'DOWN'}), LikelyhoodIntegerArray)), LikelyhoodIntegerArray),
        array:set(get({'Canvas', 'DOWN'}), array:set(1, (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 14), array:get(get({'Canvas', 'DOWN'}), LikelyhoodIntegerArray)), LikelyhoodIntegerArray),
        array:set(get({'Canvas', 'LEFT'}), array:set(0, (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 14), array:get(get({'Canvas', 'LEFT'}), LikelyhoodIntegerArray)), LikelyhoodIntegerArray),
        array:set(get({'Canvas', 'LEFT'}), array:set(1, (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 18), array:get(get({'Canvas', 'LEFT'}), LikelyhoodIntegerArray)), LikelyhoodIntegerArray),
        array:set(get({'Canvas', 'RIGHT'}), array:set(0, (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 18), array:get(get({'Canvas', 'RIGHT'}), LikelyhoodIntegerArray)), LikelyhoodIntegerArray),
        array:set(get({'Canvas', 'RIGHT'}), array:set(1, (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 22), array:get(get({'Canvas', 'RIGHT'}), LikelyhoodIntegerArray)), LikelyhoodIntegerArray),
        array:set(get({'Canvas', 'KEY_NUM7'}), array:set(0, (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 22), array:get(get({'Canvas', 'KEY_NUM7'}), LikelyhoodIntegerArray)), LikelyhoodIntegerArray),
        array:set(get({'Canvas', 'KEY_NUM7'}), array:set(1, (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 26), array:get(get({'Canvas', 'KEY_NUM7'}), LikelyhoodIntegerArray)), LikelyhoodIntegerArray),
        array:set(get({'Canvas', 'KEY_NUM9'}), array:set(0, (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 26), array:get(get({'Canvas', 'KEY_NUM9'}), LikelyhoodIntegerArray)), LikelyhoodIntegerArray),
        array:set(get({'Canvas', 'KEY_NUM9'}), array:set(1, (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 30), array:get(get({'Canvas', 'KEY_NUM9'}), LikelyhoodIntegerArray)), LikelyhoodIntegerArray),
        array:set(get({'Canvas', 'KEY_NUM1'}), array:set(0, (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 30), array:get(get({'Canvas', 'KEY_NUM1'}), LikelyhoodIntegerArray)), LikelyhoodIntegerArray),
        array:set(get({'Canvas', 'KEY_NUM1'}), array:set(1, (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 40), array:get(get({'Canvas', 'KEY_NUM1'}), LikelyhoodIntegerArray)), LikelyhoodIntegerArray),
        RepeatLikelyhoodIntegerArray = array:new((get({'Canvas', 'KEY_NUM9'}) + 1), {default, undefined}),
        array:set(get({'Canvas', 'UP'}), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 0), RepeatLikelyhoodIntegerArray),
        array:set(get({'Canvas', 'DOWN'}), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 0), RepeatLikelyhoodIntegerArray),
        array:set(get({'Canvas', 'LEFT'}), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 0), RepeatLikelyhoodIntegerArray),
        array:set(get({'Canvas', 'RIGHT'}), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 0), RepeatLikelyhoodIntegerArray),
        array:set(get({'Canvas', 'KEY_NUM7'}), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 0), RepeatLikelyhoodIntegerArray),
        array:set(get({'Canvas', 'KEY_NUM9'}), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 0), RepeatLikelyhoodIntegerArray),
        array:set(get({'Canvas', 'KEY_NUM1'}), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 10), RepeatLikelyhoodIntegerArray),
        InputProbability = 'InputProbability':new(LikelyhoodIntegerArray, RepeatLikelyhoodIntegerArray, 42, get({'NoTimeDelayHelper', 'SINGLETON'})),
        (get({InputProbability, '$class'})):toHashtable(InputProbability).

