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
% package org.allbinary.graphics.j2me.workarea.canvas

-module('IntegerDimension').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, width}, 0),
    put({This, height}, 0),
    ok.


new(Width, Height) when is_integer(Width), is_integer(Height) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Width, Height),
    This.

'$init'(This, Width, Height) when is_integer(Width), is_integer(Height) ->
    init_fields(This),
        (get({This, '$class'})):setWidth(This, Width),
        (get({This, '$class'})):setHeight(This, Height).

getWidth(This) ->
        get({This, width}).

setWidth(This, Width) when is_integer(Width) ->
        put({This, width}, Width).

getHeight(This) ->
        get({This, height}).

setHeight(This, Height) when is_integer(Height) ->
        put({This, height}, Height).

