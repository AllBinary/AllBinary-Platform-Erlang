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
% package org.allbinary.layer

-module('SingleLayerLayerProcessor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('LayerProcessor', Function, Arguments).

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
        'LayerProcessor':'$init'(This, 'SingleLayerLayerManager':new()).

% throws Exception
process(This, AllBinaryLayerManager) ->
        LayerManager = (get({This, '$class'})):getLayerManager(This),
        (get({This, '$class'})):processAt(This, AllBinaryLayerManager, (get({LayerManager, '$class'})):getLayerAt(LayerManager, 0), 0).

