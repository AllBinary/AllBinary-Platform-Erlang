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
% package org.allbinary.game.layer.special
% import javax.microedition.lcdui.Canvas
% import org.allbinary.game.input.GameInputProcessor

-module('AnalogInputBuilder').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'AnalogInputBuilder':new()),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'AnalogInputBuilder', instance}).

disable(This, InputProcessorArray, CollidableDestroyableDamageableLayer) when (is_tuple(InputProcessorArray) orelse InputProcessorArray =:= undefined) ->
        array:set(get({'Canvas', 'UP'}), 'SpecialUpGameInputProcessor':new(CollidableDestroyableDamageableLayer), InputProcessorArray),
        array:set(get({'Canvas', 'DOWN'}), 'SpecialDownGameInputProcessor':new(CollidableDestroyableDamageableLayer), InputProcessorArray),
        array:set(get({'Canvas', 'RIGHT'}), 'SpecialRightGameInputProcessor':new(CollidableDestroyableDamageableLayer), InputProcessorArray),
        array:set(get({'Canvas', 'LEFT'}), 'SpecialLeftGameInputProcessor':new(CollidableDestroyableDamageableLayer), InputProcessorArray),
        array:set(get({'Canvas', 'KEY_NUM0'}), 'Special1GameInputProcessor':new(CollidableDestroyableDamageableLayer), InputProcessorArray),
        array:set(get({'Canvas', 'KEY_NUM5'}), 'Special3GameInputProcessor':new(CollidableDestroyableDamageableLayer), InputProcessorArray).

enable(This, InputProcessorArray, CollidableDestroyableDamageableLayer) when (is_tuple(InputProcessorArray) orelse InputProcessorArray =:= undefined) ->
        array:set(get({'Canvas', 'UP'}), 'SpecialAnalogUpGameInputProcessor':new(CollidableDestroyableDamageableLayer), InputProcessorArray),
        array:set(get({'Canvas', 'DOWN'}), 'SpecialAnalogDownGameInputProcessor':new(CollidableDestroyableDamageableLayer), InputProcessorArray),
        array:set(get({'Canvas', 'RIGHT'}), 'SpecialAnalogRightGameInputProcessor':new(CollidableDestroyableDamageableLayer), InputProcessorArray),
        array:set(get({'Canvas', 'LEFT'}), 'SpecialAnalogLeftGameInputProcessor':new(CollidableDestroyableDamageableLayer), InputProcessorArray),
        array:set(get({'Canvas', 'KEY_NUM0'}), 'SpecialAnalogLeftTriggerGameInputProcessor':new(CollidableDestroyableDamageableLayer), InputProcessorArray),
        array:set(get({'Canvas', 'KEY_NUM5'}), 'SpecialAnalogRightTriggerGameInputProcessor':new(CollidableDestroyableDamageableLayer), InputProcessorArray).

