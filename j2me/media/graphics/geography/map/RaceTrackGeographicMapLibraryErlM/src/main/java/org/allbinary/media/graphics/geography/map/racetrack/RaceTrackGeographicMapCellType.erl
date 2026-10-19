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
% import org.allbinary.string.CommonStrings
% import org.allbinary.media.graphics.geography.map.GeographicMapCellType

-module('RaceTrackGeographicMapCellType').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('GeographicMapCellType', Function, Arguments).

init_fields(This) ->
    put({This, name}, undefined),
    put({This, travelCost}, 0),
    ok.


new(Name, Type, TravelCost, Reset) when (is_list(Name) orelse Name =:= undefined), is_integer(Type), is_integer(TravelCost), is_integer(Reset) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Name, Type, TravelCost, Reset),
    This.

init(This, Name, Type, TravelCost, Reset) when (is_list(Name) orelse Name =:= undefined), is_integer(Type), is_integer(TravelCost), is_integer(Reset) ->
        'GeographicMapCellType':init(This, Type, Reset),
        init_fields(This),
        put({This, name}, Name),
        put({This, travelCost}, TravelCost).

getTravelCost(This) ->
        get({This, travelCost}).

