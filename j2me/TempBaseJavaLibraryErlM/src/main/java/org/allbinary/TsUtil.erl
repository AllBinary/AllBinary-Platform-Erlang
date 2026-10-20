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
% package org.allbinary

-module('TsUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'TsUtil':new()),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'TsUtil', instance}).

longBitsToDouble(This, Bits) when is_integer(Bits) ->
        (get({get({get({'java', lang}), 'Double'}), '$class'})):longBitsToDouble(get({get({'java', lang}), 'Double'}), Bits).

intBitsToFloat(This, Bits) when is_integer(Bits) ->
        (get({get({get({'java', lang}), 'Float'}), '$class'})):intBitsToFloat(get({get({'java', lang}), 'Float'}), Bits).

hashCode(This, AnyType) ->
        (get({AnyType, '$class'})):hashCode(AnyType).

% throws InterruptedException
waitFor(This, Any, TimeoutMillis) when is_integer(TimeoutMillis) ->
        AnyType = Any,
        (get({AnyType, '$class'})):wait(AnyType, TimeoutMillis).

compareTo(This, A, B) when (is_list(A) orelse A =:= undefined), (is_list(B) orelse B =:= undefined) ->
        (get({A, '$class'})):compareTo(A, B).

