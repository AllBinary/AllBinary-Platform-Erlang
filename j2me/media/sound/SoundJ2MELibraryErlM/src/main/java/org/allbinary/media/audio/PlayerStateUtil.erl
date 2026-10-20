% 
% AllBinary Open License Version 1 
% Copyright (c) 2022 AllBinary 
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
% package org.allbinary.media.audio
% import javax.microedition.media.Player
% import org.allbinary.string.CommonStrings

-module('PlayerStateUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'PlayerStateUtil':new()),
    ok.

init_fields(This) ->
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, 'UNREALIZED'}, "UNREALIZED"),
    put({This, 'REALIZED'}, "REALIZED"),
    put({This, 'PREFETCHED'}, "PREFETCHED"),
    put({This, 'STARTED'}, "STARTED"),
    put({This, 'CLOSED'}, "CLOSED"),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'PlayerStateUtil', instance}).

convert(This, State) when is_integer(State) ->
        try
        case (State =:= get({'Player', 'UNREALIZED'})) of
            true ->
            throw({'$return', get({This, 'UNREALIZED'})});
            false ->
            case (State =:= get({'Player', 'REALIZED'})) of
            true ->
            throw({'$return', get({This, 'REALIZED'})});
            false ->
            case (State =:= get({'Player', 'PREFETCHED'})) of
            true ->
            throw({'$return', get({This, 'PREFETCHED'})});
            false ->
            case (State =:= get({'Player', 'STARTED'})) of
            true ->
            throw({'$return', get({This, 'STARTED'})});
            false ->
            case (State =:= get({'Player', 'CLOSED'})) of
            true ->
            throw({'$return', get({This, 'CLOSED'})});
            false -> ok
        end
        end
        end
        end
        end,
        get({get({This, commonStrings}), 'UNKNOWN'})
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

