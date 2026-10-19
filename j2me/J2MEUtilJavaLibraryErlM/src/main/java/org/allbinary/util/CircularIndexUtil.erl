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
% import jsinterop.annotations.JsType
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonLabels
% import jsinterop.annotations.JsMethod
% import jsinterop.annotations.JsConstructor
% import jsinterop.annotations.JsProperty

-module('CircularIndexUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'NULL_CIRCULAR_INDEX_UTIL'}, 'CircularIndexUtil':new(0, 0)),
    ok.

init_fields(This) ->
    put({This, index}, 0),
    put({This, lastIndex}, 0),
    put({This, size}, 0),
    ok.


new(Index, Size) when is_integer(Index), is_integer(Size) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Index, Size),
    This.

init(This, Index, Size) when is_integer(Index), is_integer(Size) ->
    init_fields(This),
        (get({This, '$class'})):setSize(This, Size),
        (get({This, '$class'})):setIndex(This, Index).

next(This) ->
        case (get({This, index}) >= get({This, lastIndex})) of
            true ->
            put({This, index}, 0);
            false ->
            put({This, index}, get({This, index}) + 1)
        end,
        get({This, index}).

previous(This) ->
        case (get({This, index}) < 1) of
            true ->
            put({This, index}, get({This, lastIndex}));
            false ->
            put({This, index}, get({This, index}) - 1)
        end,
        get({This, index}).

setIndex(This, Index) when is_integer(Index) ->
        try
        case (Index > get({This, lastIndex})) of
            true ->
            throw({'$return', ok});
            false -> ok
        end,
        put({This, index}, Index)
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getIndex(This) ->
        get({This, index}).

createInstance(Max) when is_integer(Max) ->
        'CircularIndexUtil':new(0, Max).

createInstanceAt(Index, Max) when is_integer(Index), is_integer(Max) ->
        'CircularIndexUtil':new(Index, Max).

setSize(This, Size) when is_integer(Size) ->
        put({This, size}, Size),
        put({This, lastIndex}, (Size - 1)),
        put({This, index}, 0).

getSize(This) ->
        get({This, size}).

toString(This) ->
        (fun(Target_N66850) -> (get({Target_N66850, '$class'})):toString(Target_N66850) end)((fun(Target_N66857) -> (get({Target_N66857, '$class'})):appendint(Target_N66857, get({This, size})) end)((fun(Target_N66864) -> (get({Target_N66864, '$class'})):append(Target_N66864, "size: ") end)((fun(Target_N66871) -> (get({Target_N66871, '$class'})):appendint(Target_N66871, get({This, lastIndex})) end)((fun(Target_N66878) -> (get({Target_N66878, '$class'})):append(Target_N66878, "lastIndex: ") end)((fun(Target_N66885) -> (get({Target_N66885, '$class'})):appendint(Target_N66885, get({This, index})) end)((fun(Target_N66892) -> (get({Target_N66892, '$class'})):append(Target_N66892, get({'CommonLabels':getInstance(), 'INDEX_LABEL'})) end)('StringMaker':new()))))))).

