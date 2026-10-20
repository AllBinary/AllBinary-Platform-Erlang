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
% package org.allbinary.util
% import org.allbinary.logic.communication.log.ForcedLogUtil

-module('ImmutableBasicArrayList').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicArrayListS', Function, Arguments).

init_fields(This) ->
    put({This, name}, undefined),
    ok.


new(Name, Size) when (is_list(Name) orelse Name =:= undefined), is_integer(Size) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Name, Size),
    This.

'$init'(This, Name, Size) when (is_list(Name) orelse Name =:= undefined), is_integer(Size) ->
        'BasicArrayListS':'$init'(This, Size),
        init_fields(This),
        put({This, name}, Name).

add(This, E) ->
        'ForcedLogUtil':log(get({This, name}), This),
        true.

addAt(This, Index, Element) when is_integer(Index) ->
        'ForcedLogUtil':log(get({This, name}), This).

toString(This) ->
        get({This, name}).

