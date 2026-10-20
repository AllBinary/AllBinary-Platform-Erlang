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
% import org.allbinary.game.GameInfo
% import org.allbinary.logic.communication.log.LogUtil

-module('NoHighScoresFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('HighScoresBase', Function, Arguments).

static_init() ->
    put({?MODULE, instance}, 'NoHighScoresFactory':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, 'NO_HIGH_SCORES'}, array:new(0, {default, undefined})),
    ok.


getInstance() ->
        get({'NoHighScoresFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'HighScoresBase':'$init'(This),
    init_fields(This),
        ok.

fetchHighScores(This, GameInfo, HighScoresResultsListener) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Getting No HighScores", This, "fetchHighScores"),
        (get({HighScoresResultsListener, '$class'})):setHighScoresArray(HighScoresResultsListener, get({This, 'NO_HIGH_SCORES'})).

createHighScoresHelper(This) ->
        'HighScoresHelperBase':new().

