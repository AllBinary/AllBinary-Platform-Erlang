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
% package org.allbinary.game.layer.weapon
% import org.allbinary.util.CircularIndexUtil

-module('WeaponLayerArrayLayerCircularStaticPool').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'WeaponLayerArrayLayerCircularStaticPool':new()),
    ok.

init_fields(This) ->
    put({This, 'MAX'}, 5),
    put({This, circularIndexUtil}, 'CircularIndexUtil':createInstance(get({This, 'MAX'}))),
    put({This, 'ALL_WEAPONLAYER_ARRAY'}, array:new(4, {default, undefined})),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'WeaponLayerArrayLayerCircularStaticPool', instance}).

init(This) ->
        WEAPONLAYER_ARRAY = array:new((get({This, 'MAX'}) * 2), {default, undefined}),
        TWO_WEAPONLAYER_ARRAY = array:new(get({This, 'MAX'}), {default, undefined}),
        THREE_WEAPONLAYER_ARRAY = array:new(get({This, 'MAX'}), {default, undefined}),
        lists:foreach(fun(Index) ->
            array:set(Index, array:new(1, {default, undefined}), WEAPONLAYER_ARRAY),
            array:set(Index, array:new(2, {default, undefined}), TWO_WEAPONLAYER_ARRAY),
            array:set(Index, array:new(3, {default, undefined}), THREE_WEAPONLAYER_ARRAY)
        end, lists:seq(0, get({This, 'MAX'}) - 1)),
        put({This, 'ALL_WEAPONLAYER_ARRAY'}, array:set(1, WEAPONLAYER_ARRAY, get({This, 'ALL_WEAPONLAYER_ARRAY'}))),
        put({This, 'ALL_WEAPONLAYER_ARRAY'}, array:set(2, TWO_WEAPONLAYER_ARRAY, get({This, 'ALL_WEAPONLAYER_ARRAY'}))),
        put({This, 'ALL_WEAPONLAYER_ARRAY'}, array:set(3, THREE_WEAPONLAYER_ARRAY, get({This, 'ALL_WEAPONLAYER_ARRAY'}))).

% throws Exception
getInstanceArray(This, Size) when is_integer(Size) ->
        WeaponLayerArray = array:get((get({get({This, circularIndexUtil}), '$class'})):getIndex(get({This, circularIndexUtil})), array:get(Size, get({This, 'ALL_WEAPONLAYER_ARRAY'}))),
        (get({get({This, circularIndexUtil}), '$class'})):next(get({This, circularIndexUtil})),
        WeaponLayerArray.

