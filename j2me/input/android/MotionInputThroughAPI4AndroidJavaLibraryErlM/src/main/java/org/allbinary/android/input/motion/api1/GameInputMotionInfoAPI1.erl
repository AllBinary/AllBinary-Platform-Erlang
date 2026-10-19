%
% AllBinary Open License Version 1
% Copyright (c) 2009 AllBinary
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
% package org.allbinary.android.input.motion.api1
% import org.allbinary.android.input.motion.GameInputMotionInfo

-module('GameInputMotionInfoAPI1').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('GameInputMotionInfo', Function, Arguments).

static_init() ->
    put({?MODULE, instance}, 'GameInputMotionInfoAPI1':new()),
    ok.

init_fields(This) ->
    ok.


getInstance() ->
        get({'GameInputMotionInfoAPI1', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
        'GameInputMotionInfo':init(This, 4, 1).

