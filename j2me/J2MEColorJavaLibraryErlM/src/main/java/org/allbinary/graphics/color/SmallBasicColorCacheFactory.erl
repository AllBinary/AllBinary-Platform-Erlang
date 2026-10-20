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
% import org.allbinary.logic.string.StringUtil

-module('SmallBasicColorCacheFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'SmallBasicColorCacheFactory':new()),
    ok.

init_fields(This) ->
    put({This, 'SIZE'}, 255),
    put({This, 'INDEX_TO_COLOR'}, array:new(get({This, 'SIZE'}), {default, 0})),
    put({This, 'BASIC_COLOR_ARRAY'}, array:new(get({This, 'SIZE'}), {default, undefined})),
    put({This, colorIndex}, 0),
    ok.


getInstance() ->
        get({'SmallBasicColorCacheFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

add(This, BasicDefaultColor) ->
        put({This, 'BASIC_COLOR_ARRAY'}, array:set(get({This, colorIndex}), BasicDefaultColor, get({This, 'BASIC_COLOR_ARRAY'}))),
        put({This, 'INDEX_TO_COLOR'}, array:set(get({This, colorIndex}), (get({BasicDefaultColor, '$class'})):intValue(BasicDefaultColor), get({This, 'INDEX_TO_COLOR'}))),
        put({This, colorIndex}, get({This, colorIndex}) + 1).

getAndOrCreate(This, ColorAsInt) when is_integer(ColorAsInt) ->
        try
        put({local, basicColor}, undefined),
        lists:foreach(fun(Index) ->
            case (array:get(Index, get({This, 'INDEX_TO_COLOR'})) =:= ColorAsInt) of
                true ->
                throw({'$return', array:get(Index, get({This, 'BASIC_COLOR_ARRAY'}))});
                false -> ok
            end
        end, lists:seq(0, get({This, 'SIZE'}) - 1)),
        ALPHA_MASK = 16#FF000000,
        put({local, basicColor}, (fun(Target_N66338) -> (get({Target_N66338, '$class'})):createInstanceAN(Target_N66338, (ColorAsInt band ALPHA_MASK), (ColorAsInt band 16#00FFFFFF), get({'StringUtil':getInstance(), 'EMPTY_STRING'})) end)('BasicColorFactory':getInstance())),
        (get({This, '$class'})):add(This, get({local, basicColor})),
        get({local, basicColor})
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

