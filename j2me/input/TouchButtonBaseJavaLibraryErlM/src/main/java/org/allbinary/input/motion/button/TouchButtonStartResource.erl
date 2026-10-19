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
% package org.allbinary.input.motion.button

-module('TouchButtonStartResource').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('TouchButtonResource', Function, Arguments).

static_init() ->
    put({?MODULE, instance}, 'TouchButtonStartResource':new()),
    ok.

init_fields(This) ->
    ok.


getInstance() ->
        get({'TouchButtonStartResource', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
        'TouchButtonResource':init(This, "/touch_button_start_64_by_64.png", "/touch_button_start_hint_64_by_64.png").

