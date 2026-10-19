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
% import org.allbinary.game.input.GameKeyFactory
% import org.allbinary.game.input.PlayerGameInput
% import org.allbinary.game.input.event.GameKeyEvent
% import org.allbinary.game.input.event.GameKeyEventUtil
% import org.allbinary.game.layer.AllBinaryGameLayerManager
% import org.allbinary.game.layer.special.SpecialGameInputFactory
% import org.allbinary.game.layer.special.SpecialGameInputInterface
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('CheatGameInputProcessor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('PlayerGameInput', Function, Arguments).

static_init() ->
    put({?MODULE, inputProcessor}, get({'SpecialGameInputFactory', 'NO_SPECIAL_GAME_INPUT'})),
    ok.

init_fields(This) ->
    put({This, 'PROCESS_GAME'}, "processGame"),
    put({This, gameCanvas}, undefined),
    put({This, gameKeyFactory}, 'GameKeyFactory':getInstance()),
    ok.


new(GameCanvas) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, GameCanvas),
    This.

init(This, GameCanvas) ->
        'PlayerGameInput':init(This, 'BasicArrayListD':new(), 'BasicArrayListD':new(), (-1)),
        init_fields(This),
        put({This, gameCanvas}, GameCanvas).

update(This) ->
        try
            GameLayerManager = (get({get({This, gameCanvas}), '$class'})):getLayerManager(get({This, gameCanvas})),
            List = (get({This, '$class'})):getGameKeyEventList(This),
            Size = (get({List, '$class'})):size(List),
            lists:foreach(fun(Index) ->
                AnyType = array:get(Index, get({List, objectArray})),
                Key = 'GameKeyEventUtil':getKey(AnyType),
                case (Key =:= (get({get({get({This, gameKeyFactory}), 'LEVEL_DOWN'}), '$class'})):getId(get({get({This, gameKeyFactory}), 'LEVEL_DOWN'}))) of
                    true ->
                    (get({get({'CheatGameInputProcessor', inputProcessor}), '$class'})):strafeLeft(get({'CheatGameInputProcessor', inputProcessor})),
                    throw('$break');
                    false ->
                    case (Key =:= (get({get({get({This, gameKeyFactory}), 'LEVEL_UP'}), '$class'})):getId(get({get({This, gameKeyFactory}), 'LEVEL_UP'}))) of
                    true ->
                    (get({get({'CheatGameInputProcessor', inputProcessor}), '$class'})):strafeRight(get({'CheatGameInputProcessor', inputProcessor})),
                    throw('$break');
                    false -> ok
                end
                end,
                case (Key =:= (get({get({get({This, gameKeyFactory}), 'LEFT'}), '$class'})):getId(get({get({This, gameKeyFactory}), 'LEFT'}))) of
                    true ->
                    (get({get({'CheatGameInputProcessor', inputProcessor}), '$class'})):left(get({'CheatGameInputProcessor', inputProcessor})),
                    throw('$break');
                    false ->
                    case (Key =:= (get({get({get({This, gameKeyFactory}), 'RIGHT'}), '$class'})):getId(get({get({This, gameKeyFactory}), 'RIGHT'}))) of
                    true ->
                    (get({get({'CheatGameInputProcessor', inputProcessor}), '$class'})):right(get({'CheatGameInputProcessor', inputProcessor})),
                    throw('$break');
                    false ->
                    case (Key =:= (get({get({get({This, gameKeyFactory}), 'UP'}), '$class'})):getId(get({get({This, gameKeyFactory}), 'UP'}))) of
                    true ->
                    (get({get({'CheatGameInputProcessor', inputProcessor}), '$class'})):up(get({'CheatGameInputProcessor', inputProcessor})),
                    throw('$break');
                    false ->
                    case (Key =:= (get({get({get({This, gameKeyFactory}), 'DOWN'}), '$class'})):getId(get({get({This, gameKeyFactory}), 'DOWN'}))) of
                    true ->
                    (get({get({'CheatGameInputProcessor', inputProcessor}), '$class'})):down(get({'CheatGameInputProcessor', inputProcessor})),
                    throw('$break');
                    false ->
                    case (Key =:= (get({get({get({This, gameKeyFactory}), 'KEY_NUM1'}), '$class'})):getId(get({get({This, gameKeyFactory}), 'KEY_NUM1'}))) of
                    true ->
                    (get({get({'CheatGameInputProcessor', inputProcessor}), '$class'})):special1(get({'CheatGameInputProcessor', inputProcessor}), GameLayerManager, get({'GameKeyEvent', 'NONE'})),
                    throw('$break');
                    false ->
                    case (Key =:= (get({get({get({This, gameKeyFactory}), 'KEY_NUM3'}), '$class'})):getId(get({get({This, gameKeyFactory}), 'KEY_NUM3'}))) of
                    true ->
                    (get({get({'CheatGameInputProcessor', inputProcessor}), '$class'})):special2(get({'CheatGameInputProcessor', inputProcessor}), GameLayerManager, get({'GameKeyEvent', 'NONE'})),
                    throw('$break');
                    false -> ok
                end
                end
                end
                end
                end
                end
            end, lists:seq(0, Size - 1)),
            (get({List, '$class'})):clear(List)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'UPDATE'}), E)
        end.

