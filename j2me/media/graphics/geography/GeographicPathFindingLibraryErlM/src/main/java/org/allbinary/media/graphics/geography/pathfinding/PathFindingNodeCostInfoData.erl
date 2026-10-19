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

-module('PathFindingNodeCostInfoData').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'PathFindingNodeCostInfoData':new()),
    ok.

init_fields(This) ->
    put({This, 'MAX_TOTAL_COST'}, get({'Integer', 'MAX_VALUE'})),
    put({This, 'MAX_NODE_COST'}, (get({'Integer', 'MAX_VALUE'}) / 10000)),
    ok.


getInstance() ->
        get({'PathFindingNodeCostInfoData', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

