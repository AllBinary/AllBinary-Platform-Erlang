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
% package org.allbinary.graphics.color
% import java.awt
% import org.allbinary.logic.util.cache.CacheableInterface

-module('ColorCacheable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements CacheableInterface

init_fields(This) ->
    put({This, key}, undefined),
    put({This, color}, undefined),
    ok.


new(Key) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Key),
    This.

'$init'(This, Key) ->
    init_fields(This),
        put({This, key}, Key),
        put({This, color}, 'Color':new((get({(Key), '$class'})):intValue((Key)))).

getKey(This) ->
        get({This, key}).

getColor(This) ->
        get({This, color}).

setColor(This, Color) ->
        put({This, color}, Color).

