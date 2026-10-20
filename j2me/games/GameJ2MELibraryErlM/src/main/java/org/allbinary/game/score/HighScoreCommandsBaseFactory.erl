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
% import javax.microedition.lcdui.Command
% import org.allbinary.J2MEUtil
% import org.allbinary.logic.communication.log.LogUtil

-module('HighScoreCommandsBaseFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, 'HIGH_SCORE_COMMANDS'}, undefined),
    ok.


new(HIGH_SCORE_COMMANDS) when (is_tuple(HIGH_SCORE_COMMANDS) orelse HIGH_SCORE_COMMANDS =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, HIGH_SCORE_COMMANDS),
    This.

'$init'(This, HIGH_SCORE_COMMANDS) when (is_tuple(HIGH_SCORE_COMMANDS) orelse HIGH_SCORE_COMMANDS =:= undefined) ->
    init_fields(This),
        put({This, 'HIGH_SCORE_COMMANDS'}, HIGH_SCORE_COMMANDS).

isHighScoreCommand(This, Command) ->
        try
        lists:foreach(fun(Index) ->
            case (Command =:= array:get(Index, get({This, 'HIGH_SCORE_COMMANDS'}))) of
                true ->
                throw({'$return', true});
                false -> ok
            end
        end, lists:seq((array:size(get({This, 'HIGH_SCORE_COMMANDS'})) - 1), 0, -1)),
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
getIndex(This, Command) ->
        try
        lists:foreach(fun(Index) ->
            case (Command =:= array:get(Index, get({This, 'HIGH_SCORE_COMMANDS'}))) of
                true ->
                throw({'$return', Index});
                false -> ok
            end
        end, lists:seq((array:size(get({This, 'HIGH_SCORE_COMMANDS'})) - 1), 0, -1)),
        erlang:error({'Exception', "No Such Command"})
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

