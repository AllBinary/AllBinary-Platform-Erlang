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
% package org.allbinary.util
% import jsinterop.annotations.JsType
% import org.allbinary.game.rand.MyRandomFactory
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonLabels
% import org.allbinary.string.CommonPhoneStrings
% import jsinterop.annotations.JsMethod
% import jsinterop.annotations.JsProperty

-module('BasicArrayListUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'BasicArrayListUtil':new()),
    ok.

init_fields(This) ->
    put({This, 'NULL_ARRAY_OF_ARRAY'}, array:new(0, {default, array:new(0, {default, undefined})})),
    put({This, myRandomFactory}, 'MyRandomFactory':getInstance()),
    put({This, immutableInstance}, 'ImmutableBasicArrayList':new("Immutable", 0)),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'BasicArrayListUtil', instance}).

getRandom(This, List) ->
        I_random = (get({This, '$class'})):getRandomIndex(This, List),
        array:get(I_random, get({List, objectArray})).

getRandomIndex(This, List) ->
        (get({get({This, myRandomFactory}), '$class'})):getAbsoluteNextInt(get({This, myRandomFactory}), (get({List, '$class'})):size(List)).

reverse(This, List) ->
        LastMinusOneIndex = ((get({List, '$class'})):size(List) - 2),
        put({local, temp}, undefined),
        Size = (LastMinusOneIndex div 2),
        put({local, secondSwapIndex}, 0),
        lists:foreach(fun(Index) ->
            put({local, secondSwapIndex}, (LastMinusOneIndex - Index)),
            put({local, temp}, (get({List, '$class'})):removeAt(List, Index)),
            (get({List, '$class'})):addAt(List, Index, (get({List, '$class'})):removeAt(List, get({local, secondSwapIndex}))),
            (get({List, '$class'})):addAt(List, (get({local, secondSwapIndex}) + 1), get({local, temp}))
        end, lists:seq(0, Size)).

log(This, List) ->
        S_LABEL = " s: ",
        Size = (get({List, '$class'})):size(List),
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'CommonLabels':getInstance(), 'TOTAL_LABEL'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, Size),
        lists:foreach(fun(Index) ->
            UsedList = array:get(Index, get({List, objectArray})),
            (get({StringBuffer, '$class'})):append(StringBuffer, S_LABEL),
            (get({StringBuffer, '$class'})):appendint(StringBuffer, (get({UsedList, '$class'})):size(UsedList))
        end, lists:seq((Size - 1), 0, -1)),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

getImmutableInstance(This) ->
        get({This, immutableInstance}).

main(Args) when (is_tuple(Args) orelse Args =:= undefined) ->
        CommonPhoneStrings = 'CommonPhoneStrings':getInstance(),
        List = 'BasicArrayListD':new(),
        (get({List, '$class'})):add(List, get({CommonPhoneStrings, 'ONE'})),
        (get({List, '$class'})):add(List, get({CommonPhoneStrings, 'TWO'})),
        (get({List, '$class'})):add(List, get({CommonPhoneStrings, 'THREE'})),
        (get({List, '$class'})):add(List, get({CommonPhoneStrings, 'FOUR'})),
        (get({List, '$class'})):add(List, get({CommonPhoneStrings, 'FIVE'})),
        (get({List, '$class'})):add(List, get({CommonPhoneStrings, 'SIX'})),
        (get({List, '$class'})):add(List, get({CommonPhoneStrings, 'SEVEN'})),
        (get({List, '$class'})):add(List, get({CommonPhoneStrings, 'EIGHT'})),
        (get({List, '$class'})):add(List, get({CommonPhoneStrings, 'NINE'})),
        (fun(Target_N67809) -> (get({Target_N67809, '$class'})):reverse(Target_N67809, List) end)('BasicArrayListUtil':getInstance()),
        io:format("~ts~n", [allbinary_java:to_string((get({List, '$class'})):toString(List))]).

