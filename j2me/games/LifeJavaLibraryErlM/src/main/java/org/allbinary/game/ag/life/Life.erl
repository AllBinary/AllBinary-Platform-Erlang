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
% package org.allbinary.game.ag.life

-module('Life').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements LifeInterface

static_init() ->
    put({?MODULE, 'NO_LIFE'}, 'Life':createLife()),
    ok.

init_fields(This) ->
    put({This, lives}, 0),
    put({This, startLives}, 0),
    put({This, maxlives}, 0),
    ok.


createLife() ->
        try
            'Life':new(0, 0)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error({'RuntimeException'})
        end.

new(Lives, Maxlives) when is_integer(Lives), is_integer(Maxlives) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Lives, Maxlives),
    This.

init(This, Lives, Maxlives) when is_integer(Lives), is_integer(Maxlives) ->
    init_fields(This),
        put({This, maxlives}, Maxlives),
        case (Lives > get({This, maxlives})) of
            true ->
            erlang:error({'Exception', "To Many Lives"});
            false -> ok
        end,
        put({This, lives}, Lives),
        put({This, startLives}, Lives).

get(This) ->
        get({This, lives}).

set(This, Lives) when is_integer(Lives) ->
        put({This, lives}, Lives).

reset(This) ->
        put({This, lives}, get({This, startLives})).

add(This, Lives) when is_integer(Lives) ->
        case (not (get({This, '$class'})):reachedLimit(This)) of
            true ->
            case ((get({This, lives}) + Lives) =< (get({This, '$class'})):getMaxlives(This)) of
                true ->
                put({This, lives}, ((get({This, lives}) + Lives)));
                false ->
                put({This, lives}, (get({This, '$class'})):getMaxlives(This))
            end;
            false -> ok
        end.

isAlive(This) ->
        try
        case (get({This, lives}) =< 0) of
            true ->
            throw({'$return', false});
            false ->
            throw({'$return', true})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getMaxlives(This) ->
        get({This, maxlives}).

reachedLimit(This) ->
        try
        case ((get({This, lives}) > get({This, maxlives})) orelse (get({This, lives}) < 0)) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

deaths(This, Lives) when is_integer(Lives) ->
        case (not (get({This, '$class'})):reachedLimit(This)) of
            true ->
            case ((get({This, lives}) - Lives) >= 0) of
                true ->
                put({This, lives}, ((get({This, lives}) - Lives)));
                false ->
                put({This, lives}, 0)
            end;
            false -> ok
        end.

getStartLives(This) ->
        get({This, startLives}).

setStartLives(This, StartLives) when is_integer(StartLives) ->
        put({This, startLives}, StartLives).

