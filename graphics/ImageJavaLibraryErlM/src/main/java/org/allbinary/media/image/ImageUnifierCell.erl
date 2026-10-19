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
% package org.allbinary.media.image

-module('ImageUnifierCell').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, width}, undefined),
    put({This, height}, undefined),
    ok.


new(Width, Height) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Width, Height),
    This.

init(This, Width, Height) ->
    init_fields(This),
        (get({This, '$class'})):setWidth(This, Width),
        (get({This, '$class'})):setHeight(This, Height).

getWidth(This) ->
        get({This, width}).

setWidth(This, Width) ->
        put({This, width}, Width).

getHeight(This) ->
        get({This, height}).

setHeight(This, Height) ->
        put({This, height}, Height).

