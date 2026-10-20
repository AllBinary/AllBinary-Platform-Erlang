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
% package org.allbinary.math

-module('AngleIncrementInfoFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'AngleIncrementInfoFactory':new()),
    ok.

init_fields(This) ->
    put({This, angleIncrementInfo}, array:new(trunc(get({'AngleFactory':getInstance(), 'TOTAL_ANGLE'})), {default, undefined})),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'AngleIncrementInfoFactory', instance}).

getAt(This, AngleIncrement) when is_integer(AngleIncrement) ->
        try
        HalfAngleIncrement = ((AngleIncrement bsr 1)),
        put({local, angleIncrementInfo}, undefined),
        AngleIncrementInfoCanBeNull = array:get(HalfAngleIncrement, get({This, angleIncrementInfo})),
        case (AngleIncrementInfoCanBeNull =:= undefined) of
            true ->
            put({local, angleIncrementInfo}, 'AngleIncrementInfo':new(AngleIncrement)),
            put({This, angleIncrementInfo}, array:set(HalfAngleIncrement, get({local, angleIncrementInfo}), get({This, angleIncrementInfo}))),
            throw({'$return', get({local, angleIncrementInfo})});
            false ->
            put({local, angleIncrementInfo}, AngleIncrementInfoCanBeNull)
        end,
        get({local, angleIncrementInfo})
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

