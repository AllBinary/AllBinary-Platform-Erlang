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
% package org.allbinary.emulator.device

-module('TrueTypeFontUtilBase').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.


new(Scale) when is_integer(Scale) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Scale),
    This.

'$init'(This, Scale) when is_integer(Scale) ->
    init_fields(This),
        ok.

getAsTextureSize(This, TextureSize) when is_integer(TextureSize) ->
        (-1).

getCellSize(This, CellSize) when is_integer(CellSize) ->
        (-1).

