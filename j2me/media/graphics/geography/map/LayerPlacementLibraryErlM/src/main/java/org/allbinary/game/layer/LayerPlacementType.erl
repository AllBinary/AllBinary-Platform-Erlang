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
% package org.allbinary.game.layer

-module('LayerPlacementType').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, type}, 0),
    ok.


new(Type) when is_integer(Type) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Type),
    This.

'$init'(This, Type) when is_integer(Type) ->
    init_fields(This),
        put({This, type}, Type).

getType(This) ->
        get({This, type}).

setType(This, Type) when is_integer(Type) ->
        put({This, type}, Type).

