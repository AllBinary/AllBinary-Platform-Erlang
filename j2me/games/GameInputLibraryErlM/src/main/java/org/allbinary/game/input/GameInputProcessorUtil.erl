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
% package org.allbinary.game.input

-module('GameInputProcessorUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


init(InputProcessorArray) when (is_tuple(InputProcessorArray) orelse InputProcessorArray =:= undefined) ->
        NoInputProcessor = 'GameInputProcessor':getInstance(),
        Total = get({'InputFactory':getInstance(), 'MAX'}),
        lists:foreach(fun(Index) ->
            InputProcessorCanBeNull = array:get(Index, InputProcessorArray),
            case (InputProcessorCanBeNull =:= undefined) of
                true ->
                array:set(Index, NoInputProcessor, InputProcessorArray);
                false -> ok
            end
        end, lists:seq(0, Total - 1)).

