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
% package org.allbinary.game.ag.layer.hud.basic.score
% import org.allbinary.game.score.Scoreable

-module('ScoreableAddOnlyForHud').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('Scoreable', Function, Arguments).

init_fields(This) ->
    put({This, scoreHudWidget}, undefined),
    ok.


new(ScoreVectorGraphic) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, ScoreVectorGraphic),
    This.

'$init'(This, ScoreVectorGraphic) ->
        'Scoreable':'$init'(This, 0),
        init_fields(This),
        put({This, scoreHudWidget}, ScoreVectorGraphic),
        (fun(Target_N65729) -> (get({Target_N65729, '$class'})):set(Target_N65729, 0) end)((get({This, '$class'})):getScoreHudWidget(This)).

removePoints(This, Points) when is_integer(Points) ->
        ok.

addPoints(This, Points) when is_integer(Points) ->
        'Scoreable':addPoints(This, Points),
        (fun(Target_N65875) -> (get({Target_N65875, '$class'})):add(Target_N65875, Points) end)((get({This, '$class'})):getScoreHudWidget(This)).

getScoreHudWidget(This) ->
        get({This, scoreHudWidget}).

