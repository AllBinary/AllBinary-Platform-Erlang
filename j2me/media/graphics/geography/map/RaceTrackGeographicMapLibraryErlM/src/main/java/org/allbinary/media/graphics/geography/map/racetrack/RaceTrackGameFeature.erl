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
% package org.allbinary.media.graphics.geography.map.racetrack
% import org.allbinary.game.configuration.feature.GameFeature

-module('RaceTrackGameFeature').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('GameFeature', Function, Arguments).

static_init() ->
    put({?MODULE, 'MINI_MAP'}, 'RaceTrackGameFeature':new("Mini Map")),
    put({?MODULE, 'AUTO_FINISH_AI'}, 'RaceTrackGameFeature':new("Auto Finish AI")),
    ok.

init_fields(This) ->
    ok.


new(Name) when (is_list(Name) orelse Name =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Name),
    This.

init(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
        'GameFeature':init(This, Name).

