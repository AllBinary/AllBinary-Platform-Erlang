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
% package org.allbinary.game.media.graphics.geography.map.racetrack
% import org.allbinary.media.graphics.geography.map.BasicGeographicMap
% import org.allbinary.media.graphics.geography.pathfinding.PathFinderGraphVisitorFactoryBase
% import org.allbinary.media.graphics.geography.pathfinding.PathFinderGraphVisitorBase

-module('PathFinderGraphHackVisitorFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('PathFinderGraphVisitorFactoryBase', Function, Arguments).

init_fields(This) ->
    put({This, edgeMinimum}, 0),
    put({This, minPathWeight}, 0),
    put({This, maxPathWeight}, 0),
    ok.


new(EdgeMinimum, MinPathWeight, MaxPathWeight) when is_integer(EdgeMinimum), is_integer(MinPathWeight), is_integer(MaxPathWeight) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, EdgeMinimum, MinPathWeight, MaxPathWeight),
    This.

init(This, EdgeMinimum, MinPathWeight, MaxPathWeight) when is_integer(EdgeMinimum), is_integer(MinPathWeight), is_integer(MaxPathWeight) ->
    'PathFinderGraphVisitorFactoryBase':init(This),
    init_fields(This),
        put({This, edgeMinimum}, EdgeMinimum),
        put({This, minPathWeight}, MinPathWeight),
        put({This, maxPathWeight}, MaxPathWeight).

getInstance(This, GeographicMapInterface) ->
        'PathFinderGraphHackVisitor':new(GeographicMapInterface, get({This, edgeMinimum}), get({This, minPathWeight}), get({This, maxPathWeight})).

