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
% package org.allbinary.game.combat.damage
% import javax.microedition.lcdui.Graphics
% import org.allbinary.game.rand.MyRandomFactory
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.color.BasicColorArrayIndexer
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.graphics.color.BasicColorSetUtil
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.logic.java.character.CharArrayFactory
% import org.allbinary.logic.math.PrimitiveLongUtil
% import org.allbinary.util.CircularIndexUtil
% import org.allbinary.view.ViewPosition
% import org.allbinary.view.ViewPositionBase

-module('PtsDamageFloaters').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('DamageFloaters', Function, Arguments).

static_init() ->
    put({?MODULE, basicColorArrayIndexer}, 'BasicColorArrayIndexer':new(array:from_list([get({'BasicColorFactory':getInstance(), 'WHITE'}), get({'BasicColorFactory':getInstance(), 'RED'}), get({'BasicColorFactory':getInstance(), 'YELLOW'}), get({'BasicColorFactory':getInstance(), 'BLUE'})]))),
    ok.

init_fields(This) ->
    put({This, basicSetColorUtil}, 'BasicColorSetUtil':getInstance()),
    put({This, layerInterface}, undefined),
    put({This, lastDamage}, array:new(5, {default, 0})),
    put({This, lastDamageString}, array:new(5, {default, array:new(0, {default, 0})})),
    put({This, lastDamageStringSizeArray}, array:new(5, {default, 0})),
    put({This, circularIndexUtil}, 'CircularIndexUtil':createInstance(5)),
    put({This, primitiveLongUtil}, undefined),
    put({This, myRandomFactory}, 'MyRandomFactory':getInstance()),
    ok.


new(LayerInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, LayerInterface),
    This.

'$init'(This, LayerInterface) ->
    'DamageFloaters':'$init'(This),
    init_fields(This),
        put({This, primitiveLongUtil}, 'PrimitiveLongUtil':createPowerOfTen(100000)),
        put({This, layerInterface}, LayerInterface),
        CHAR_ARRAY = (fun(Target_N66537) -> (get({Target_N66537, '$class'})):getZeroCharArray(Target_N66537) end)('CharArrayFactory':getInstance()),
        lists:foreach(fun(Index) ->
            put({This, lastDamageString}, array:set(Index, CHAR_ARRAY, get({This, lastDamageString})))
        end, lists:seq((array:size(get({This, lastDamageString})) - 1), 0, -1)).

add(This, Damage) when is_integer(Damage) ->
        Index = (get({get({This, circularIndexUtil}), '$class'})):getIndex(get({This, circularIndexUtil})),
        put({This, lastDamage}, array:set(Index, Damage, get({This, lastDamage}))),
        put({This, lastDamageString}, array:set(Index, (get({get({This, primitiveLongUtil}), '$class'})):getCharArray(get({This, primitiveLongUtil}), array:get(Index, get({This, lastDamage}))), get({This, lastDamageString}))),
        put({This, lastDamageStringSizeArray}, array:set(Index, (get({get({This, primitiveLongUtil}), '$class'})):getCurrentTotalDigits(get({This, primitiveLongUtil})), get({This, lastDamageStringSizeArray}))),
        (get({get({This, circularIndexUtil}), '$class'})):next(get({This, circularIndexUtil})).

paint(This, Graphics) ->
        ViewPosition = (get({get({This, layerInterface}), '$class'})):getViewPosition(get({This, layerInterface})),
        X = (get({ViewPosition, '$class'})):getX(ViewPosition),
        Y = (get({ViewPosition, '$class'})):getY(ViewPosition),
        lists:foreach(fun(Index) ->
            case (array:get(Index, get({This, lastDamage})) =/= 0) of
                true ->
                Delta = (10 * ((Index + 2))),
                (get({get({This, basicSetColorUtil}), '$class'})):setBasicColorP(get({This, basicSetColorUtil}), Graphics, (get({get({'PtsDamageFloaters', basicColorArrayIndexer}), '$class'})):get(get({'PtsDamageFloaters', basicColorArrayIndexer}))),
                (get({Graphics, '$class'})):drawChars(Graphics, array:get(Index, get({This, lastDamageString})), 0, array:get(Index, get({This, lastDamageStringSizeArray})), (X - (get({get({This, myRandomFactory}), '$class'})):getNextInt(get({This, myRandomFactory}), Delta)), (Y - Delta), 0),
                (get({get({'PtsDamageFloaters', basicColorArrayIndexer}), '$class'})):next(get({'PtsDamageFloaters', basicColorArrayIndexer}));
                false -> ok
            end,
            put({This, lastDamage}, array:set(Index, 0, get({This, lastDamage})))
        end, lists:seq((array:size(get({This, lastDamage})) - 1), 0, -1)).

