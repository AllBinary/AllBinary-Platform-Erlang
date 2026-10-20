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
% package org.allbinary.game.input

-module('J2MEKeyFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'J2MEKeyFactory':new()),
    ok.

init_fields(This) ->
    put({This, gameKeyFactory}, 'GameKeyFactory':getInstance()),
    ok.


getInstance() ->
        get({'J2MEKeyFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

init(This) ->
        GameKeyArray = array:from_list([get({get({This, gameKeyFactory}), 'DOWN'}), get({get({This, gameKeyFactory}), 'FIRE'}), get({get({This, gameKeyFactory}), 'GAME_A'}), get({get({This, gameKeyFactory}), 'GAME_B'}), get({get({This, gameKeyFactory}), 'GAME_C'}), get({get({This, gameKeyFactory}), 'GAME_D'}), get({get({This, gameKeyFactory}), 'KEY_NUM0'}), get({get({This, gameKeyFactory}), 'KEY_NUM1'}), get({get({This, gameKeyFactory}), 'KEY_NUM2'}), get({get({This, gameKeyFactory}), 'KEY_NUM3'}), get({get({This, gameKeyFactory}), 'KEY_NUM4'}), get({get({This, gameKeyFactory}), 'KEY_NUM5'}), get({get({This, gameKeyFactory}), 'KEY_NUM6'}), get({get({This, gameKeyFactory}), 'KEY_NUM7'}), get({get({This, gameKeyFactory}), 'KEY_NUM8'}), get({get({This, gameKeyFactory}), 'KEY_NUM9'}), get({get({This, gameKeyFactory}), 'KEY_POUND'}), get({get({This, gameKeyFactory}), 'KEY_STAR'}), get({get({This, gameKeyFactory}), 'LEFT'}), get({get({This, gameKeyFactory}), 'LEVEL_DOWN'}), get({get({This, gameKeyFactory}), 'LEVEL_UP'}), get({get({This, gameKeyFactory}), 'NONE'}), get({get({This, gameKeyFactory}), 'RIGHT'}), get({get({This, gameKeyFactory}), 'UP'})]),
        InputFactory = 'InputFactory':getInstance(),
        put({local, index}, array:size(GameKeyArray)),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            (get({InputFactory, '$class'})):add(InputFactory, (fun(Target_N66334) -> (get({Target_N66334, '$class'})):getId(Target_N66334) end)(array:get(get({local, index}), GameKeyArray)), array:get(get({local, index}), GameKeyArray)),
            Loop();
        false -> ok end end)().

isSubmission(This, Input) ->
        try
        case (Input =:= get({get({This, gameKeyFactory}), 'FIRE'})) of
            true ->
            throw({'$return', true});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isDelete(This, Input) ->
        try
        case (Input =:= get({get({This, gameKeyFactory}), 'GAME_D'})) of
            true ->
            throw({'$return', true});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isBackSpace(This, Input) ->
        false.

isUp(This, Input) ->
        try
        case (Input =:= get({get({This, gameKeyFactory}), 'UP'})) of
            true ->
            throw({'$return', true});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isDown(This, Input) ->
        try
        case (Input =:= get({get({This, gameKeyFactory}), 'DOWN'})) of
            true ->
            throw({'$return', true});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isLeft(This, Input) ->
        try
        case (Input =:= get({get({This, gameKeyFactory}), 'LEFT'})) of
            true ->
            throw({'$return', true});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isRight(This, Input) ->
        try
        case (Input =:= get({get({This, gameKeyFactory}), 'RIGHT'})) of
            true ->
            throw({'$return', true});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isEnter(This, Input) ->
        try
        case (Input =:= get({get({This, gameKeyFactory}), 'FIRE'})) of
            true ->
            throw({'$return', true});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

