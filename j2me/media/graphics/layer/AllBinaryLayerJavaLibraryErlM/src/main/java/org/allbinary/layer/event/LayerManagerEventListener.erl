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
% package org.allbinary.layer.event
% import org.allbinary.logic.util.event.AllBinaryEventObject

-module('LayerManagerEventListener').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements LayerManagerEventListenerInterface

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


onEvent(This, EventObject) ->
        ok.

% throws Exception
onCreateLayerManagerEvent(This, LayerManagerEvent) ->
        ok.

% throws Exception
onDeleteLayerManagerEvent(This, LayerManagerEvent) ->
        ok.

