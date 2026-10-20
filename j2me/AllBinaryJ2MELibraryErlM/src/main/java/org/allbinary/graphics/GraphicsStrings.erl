% 
% AllBinary Open License Version 1 
% Copyright (c) 2025 AllBinary 
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
% package org.allbinary.graphics

-module('GraphicsStrings').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'GraphicsStrings':new()),
    ok.

init_fields(This) ->
    put({This, 'ANIMATION'}, "animation"),
    put({This, 'ANGLE'}, "angle"),
    put({This, 'MOVEMENT_ANGLE'}, "movement_angle"),
    put({This, 'ROTATION'}, "rotation"),
    put({This, 'OPACITY'}, "opacity"),
    put({This, 'HTML'}, "HTML"),
    put({This, 'WIDTH'}, "width"),
    put({This, 'HEIGHT'}, "height"),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'GraphicsStrings', instance}).

