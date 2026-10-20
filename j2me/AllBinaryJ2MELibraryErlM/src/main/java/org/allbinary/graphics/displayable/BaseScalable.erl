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
% package org.allbinary.graphics.displayable

-module('BaseScalable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ScalableListener

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getRatio(This, Ratio) when is_number(Ratio) ->
        1.0.

getLeft(This, XOffset) when is_integer(XOffset) ->
        (-1).

getTop(This, YOffset) when is_integer(YOffset) ->
        (-1).

scale(This, Ratio) when is_number(Ratio) ->
        ok.

