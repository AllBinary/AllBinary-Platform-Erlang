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
% package org.allbinary.math
% import jsinterop.annotations.JsType
% import jsinterop.annotations.JsMethod
% import jsinterop.annotations.JsProperty

-module('PositionStrings').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'PositionStrings':new()),
    ok.

init_fields(This) ->
    put({This, 'X'}, "x"),
    put({This, 'Y'}, "y"),
    put({This, 'X_LABEL'}, "x: "),
    put({This, 'Y_LABEL'}, "y: "),
    put({This, 'Z_LABEL'}, "z: "),
    put({This, 'DX_LABEL'}, "dx: "),
    put({This, 'DY_LABEL'}, "dy: "),
    put({This, 'DZ_LABEL'}, "dz: "),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'PositionStrings', instance}).

