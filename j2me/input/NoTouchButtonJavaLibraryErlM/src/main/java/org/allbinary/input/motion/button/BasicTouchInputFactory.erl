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
% package org.allbinary.input.motion.button
% import org.allbinary.game.input.InputFactory
% import org.allbinary.game.input.mapping.InputToGameKeyMapping
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonLabels
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('BasicTouchInputFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, get({'NullUtil':getInstance(), 'NULL_OBJECT'})),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, 'SPECIAL_BUTTON_SIX'}, 'TouchButtonInput':new((get({'InputFactory':getInstance(), 'MAX'}) - 30), "Button 6")),
    put({This, 'SPECIAL_BUTTON_FIVE'}, 'TouchButtonInput':new((get({'InputFactory':getInstance(), 'MAX'}) - 31), "Button 5")),
    put({This, 'SPECIAL_BUTTON_FOUR'}, 'TouchButtonInput':new((get({'InputFactory':getInstance(), 'MAX'}) - 32), "Button 4")),
    put({This, 'SPECIAL_BUTTON_THREE'}, 'TouchButtonInput':new((get({'InputFactory':getInstance(), 'MAX'}) - 33), "Button 3")),
    put({This, 'SPECIAL_BUTTON_TWO'}, 'TouchButtonInput':new((get({'InputFactory':getInstance(), 'MAX'}) - 34), "Button 2")),
    put({This, 'SPECIAL_BUTTON_ONE'}, 'TouchButtonInput':new((get({'InputFactory':getInstance(), 'MAX'}) - 35), "Button 1")),
    put({This, 'UP'}, 'TouchButtonInput':new((get({'InputFactory':getInstance(), 'MAX'}) - 36), "Up Button")),
    put({This, 'LEFT'}, 'TouchButtonInput':new((get({'InputFactory':getInstance(), 'MAX'}) - 37), "Left Button")),
    put({This, 'RIGHT'}, 'TouchButtonInput':new((get({'InputFactory':getInstance(), 'MAX'}) - 38), "Right Button")),
    put({This, 'DOWN'}, 'TouchButtonInput':new((get({'InputFactory':getInstance(), 'MAX'}) - 39), "Down Button")),
    put({This, 'NONE'}, 'TouchButtonInput':new((get({'InputFactory':getInstance(), 'MAX'}) - 40), "No Button")),
    put({This, initialized}, false),
    put({This, list}, 'BasicArrayListD':new()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        case (get({'BasicTouchInputFactory', instance}) =:= get({'NullUtil':getInstance(), 'NULL_OBJECT'})) of
            true ->
            put({'BasicTouchInputFactory', instance}, 'BasicTouchInputFactory':new());
            false -> ok
        end,
        get({'BasicTouchInputFactory', instance}).

init(This, InputToGameKeyMapping) ->
        case (not get({This, initialized})) of
            true ->
            put({This, initialized}, true),
            (get({get({This, list}), '$class'})):add(get({This, list}), get({This, 'UP'})),
            (get({get({This, list}), '$class'})):add(get({This, list}), get({This, 'LEFT'})),
            (get({get({This, list}), '$class'})):add(get({This, list}), get({This, 'RIGHT'})),
            (get({get({This, list}), '$class'})):add(get({This, list}), get({This, 'DOWN'})),
            (get({get({This, list}), '$class'})):add(get({This, list}), get({This, 'SPECIAL_BUTTON_TWO'})),
            (get({get({This, list}), '$class'})):add(get({This, list}), get({This, 'SPECIAL_BUTTON_FOUR'})),
            (get({get({This, list}), '$class'})):add(get({This, list}), get({This, 'SPECIAL_BUTTON_THREE'})),
            (get({get({This, list}), '$class'})):add(get({This, list}), get({This, 'SPECIAL_BUTTON_ONE'})),
            (get({get({This, list}), '$class'})):add(get({This, list}), get({This, 'SPECIAL_BUTTON_FIVE'})),
            (get({get({This, list}), '$class'})):add(get({This, list}), get({This, 'SPECIAL_BUTTON_SIX'})),
            (get({This, '$class'})):updateAllList(This, get({This, list}), InputToGameKeyMapping);
            false -> ok
        end.

updateAll(This, InputToGameKeyMapping) ->
        (get({This, '$class'})):updateAllList(This, (get({This, '$class'})):getList(This), InputToGameKeyMapping).

updateAllList(This, List, InputToGameKeyMapping) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N67713) -> (get({Target_N67713, '$class'})):toString(Target_N67713) end)((fun(Target_N67720) -> (get({Target_N67720, '$class'})):appendint(Target_N67720, (get({List, '$class'})):size(List)) end)((fun(Target_N67727) -> (get({Target_N67727, '$class'})):append(Target_N67727, get({'CommonLabels':getInstance(), 'START'})) end)('StringMaker':new()))), This, "updateAll"),
        lists:foreach(fun(Index) ->
            TouchButtonInput = (get({List, '$class'})):get(List, Index),
            (get({TouchButtonInput, '$class'})):update(TouchButtonInput, InputToGameKeyMapping)
        end, lists:seq(((get({List, '$class'})):size(List) - 1), 0, -1)).

getList(This) ->
        get({This, list}).

