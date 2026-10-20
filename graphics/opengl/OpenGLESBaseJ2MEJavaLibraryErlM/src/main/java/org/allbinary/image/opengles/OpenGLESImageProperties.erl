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
% package org.allbinary.image.opengles

-module('OpenGLESImageProperties').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, textureID}, (-1)),
    put({This, scaleX}, 1.0),
    put({This, scaleY}, 1.0),
    put({This, scaleX2}, 1.0),
    put({This, scaleY2}, 1.0),
    put({This, angle}, 0),
    put({This, redf}, 1.0),
    put({This, greenf}, 1.0),
    put({This, bluef}, 1.0),
    put({This, alphaf}, 0.0),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


