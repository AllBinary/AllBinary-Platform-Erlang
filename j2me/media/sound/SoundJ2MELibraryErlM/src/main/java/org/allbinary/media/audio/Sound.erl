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
% package org.allbinary.media.audio
% import javax.microedition.media.Player
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.string.CommonStrings

-module('Sound').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements SoundInterface
% implements Runnable

init_fields(This) ->
    put({This, resource}, undefined),
    put({This, player}, get({'NoPlayer', 'NO_PLAYER'})),
    ok.


new(Resource) when (is_list(Resource) orelse Resource =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Resource),
    This.

'$init'(This, Resource) when (is_list(Resource) orelse Resource =:= undefined) ->
    init_fields(This),
        put({This, resource}, Resource).

getResource(This) ->
        get({This, resource}).

getPlayerP(This) ->
        get({This, player}).

setPlayerP(This, Player) ->
        put({This, player}, Player).

% throws Exception
init(This) ->
        ok.

getDuration(This) ->
        (-1).

run(This) ->
        try
            (get({get({This, player}), '$class'})):start(get({This, player}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            'PreLogUtil':put(get({CommonStrings, 'EXCEPTION'}), This, get({CommonStrings, 'RUN'}))
        end.

