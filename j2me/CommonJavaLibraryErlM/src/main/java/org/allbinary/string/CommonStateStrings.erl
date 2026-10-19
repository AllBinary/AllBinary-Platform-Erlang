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
% package org.allbinary.string

-module('CommonStateStrings').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'CommonStateStrings':new()),
    ok.

init_fields(This) ->
    put({This, 'CONTEXT'}, "Context: "),
    put({This, 'FINISH'}, "finish"),
    put({This, 'CREATE'}, "onCreate"),
    put({This, 'START'}, "onStart"),
    put({This, 'RESTART'}, "onRestart"),
    put({This, 'RESUME'}, "onResume"),
    put({This, 'PAUSE'}, "onPause"),
    put({This, 'STOP'}, "onStop"),
    put({This, 'DESTROY'}, "onDestroy"),
    put({This, 'BIND'}, "onBind"),
    put({This, 'ON_SAVE_INSTANCE_STATE'}, "onSaveInstanceState"),
    put({This, 'ON_START_COMMAND'}, "onStartCommand"),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'CommonStateStrings', instance}).

