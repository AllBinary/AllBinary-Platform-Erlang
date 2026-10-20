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
% package org.allbinary.game.score
% import java.io.ByteArrayInputStream
% import java.io.DataInputStream
% import java.io.EOFException
% import java.io.IOException
% import javax.microedition.rms.RecordComparator
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings

-module('ScoreComparator').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements RecordComparator

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, isHighestBest}, false),
    ok.


new(IsHighestBest) when is_boolean(IsHighestBest) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, IsHighestBest),
    This.

'$init'(This, IsHighestBest) when is_boolean(IsHighestBest) ->
    init_fields(This),
        put({This, isHighestBest}, IsHighestBest).

getBestScore(This) ->
        case get({This, isHighestBest}) of true -> get({'Long', 'MAX_VALUE'}); false -> 0 end.

compare(This, RecordOne, RecordTwo) when (is_tuple(RecordOne) orelse RecordOne =:= undefined), (is_tuple(RecordTwo) orelse RecordTwo =:= undefined) ->
        try
        ByteArrayInputStreamOne = 'ByteArrayInputStream':new(RecordOne),
        InputStreamOne = 'DataInputStream':new(ByteArrayInputStreamOne),
        ByteArrayInputStreamTwo = 'ByteArrayInputStream':new(RecordTwo),
        InputStreamTwo = 'DataInputStream':new(ByteArrayInputStreamTwo),
        put({local, scoreOne}, 0),
        put({local, scoreTwo}, 0),
        try
            (get({InputStreamOne, '$class'})):readUTF(InputStreamOne),
            (get({InputStreamTwo, '$class'})):readUTF(InputStreamTwo),
            put({local, scoreOne}, (get({InputStreamOne, '$class'})):readLong(InputStreamOne)),
            put({local, scoreTwo}, (get({InputStreamTwo, '$class'})):readLong(InputStreamTwo))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            put({local, commonStrings}, 'CommonStrings':getInstance()),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({local, commonStrings}), 'EXCEPTION'}), This, "compare", E)
        end,
        case get({This, isHighestBest}) of
            true ->
            throw({'$return', (get({This, '$class'})):getHighTooLow(This, get({local, scoreOne}), get({local, scoreTwo}))});
            false ->
            throw({'$return', (get({This, '$class'})):getLowTooHigh(This, get({local, scoreOne}), get({local, scoreTwo}))})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getHighTooLow(This, ScoreOne, ScoreTwo) when is_integer(ScoreOne), is_integer(ScoreTwo) ->
        try
        case (ScoreOne > ScoreTwo) of
            true ->
            throw({'$return', get({'RecordComparator', 'PRECEDES'})});
            false ->
            case (ScoreOne < ScoreTwo) of
            true ->
            throw({'$return', get({'RecordComparator', 'FOLLOWS'})});
            false ->
            throw({'$return', get({'RecordComparator', 'EQUIVALENT'})})
        end
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getLowTooHigh(This, ScoreOne, ScoreTwo) when is_integer(ScoreOne), is_integer(ScoreTwo) ->
        try
        case (ScoreOne < ScoreTwo) of
            true ->
            throw({'$return', get({'RecordComparator', 'PRECEDES'})});
            false ->
            case (ScoreOne > ScoreTwo) of
            true ->
            throw({'$return', get({'RecordComparator', 'FOLLOWS'})});
            false ->
            throw({'$return', get({'RecordComparator', 'EQUIVALENT'})})
        end
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

