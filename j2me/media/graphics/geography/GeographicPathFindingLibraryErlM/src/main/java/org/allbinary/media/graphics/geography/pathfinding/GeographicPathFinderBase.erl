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
% package org.allbinary.media.graphics.geography.pathfinding
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.BasicArrayList

-module('GeographicPathFinderBase').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'NULL_GEOGRAPHIC_PATH_FINDER_BASE'}, 'GeographicPathFinderBase':new()),
    ok.

init_fields(This) ->
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


% throws Exception
searchTotalPath(This, StartPathFindingNodeList, EndPathFindingNodeList, TotalPaths) when is_integer(TotalPaths) ->
        erlang:error({'RuntimeException'}).

% throws Exception
searchTotalPathN(This, StartPathFindingNodeList, EndPathFindingNodeList, TotalPaths, MultipassState) when is_integer(TotalPaths) ->
        erlang:error({'RuntimeException'}).

