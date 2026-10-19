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
% package org.allbinary.game.tracking
% import org.allbinary.layer.AllBinaryLayerCircularPool

-module('GenericTrackingLayerCircularStaticPool').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('AllBinaryLayerCircularPool', Function, Arguments).

static_init() ->
    put({?MODULE, 'SINGLETON'}, 'GenericTrackingLayerCircularStaticPool':new()),
    ok.

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'AllBinaryLayerCircularPool':init(This),
    init_fields(This),
        ok.

getInstance() ->
        get({'GenericTrackingLayerCircularStaticPool', 'SINGLETON'}).

