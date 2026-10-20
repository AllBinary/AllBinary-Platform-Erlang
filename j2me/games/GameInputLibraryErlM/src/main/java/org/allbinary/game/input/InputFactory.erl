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
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.math.SmallIntegerSingletonFactory
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonStrings

-module('InputFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, get({'NullUtil':getInstance(), 'NULL_OBJECT'})),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, 'KEY_CODE_LABEL'}, "KeyCode: "),
    put({This, 'DEVICE_ID_LABEL'}, "DeviceId: "),
    put({This, 'MAX'}, (fun(Target_N66144) -> (get({Target_N66144, '$class'})):getMin(Target_N66144) end)('SmallIntegerSingletonFactory':getInstance())),
    put({This, inputIntegerArray}, array:new(get({This, 'MAX'}), {default, undefined})),
    put({This, 'NO_INPUT'}, 'Input':new(0, get({get({This, commonStrings}), 'UNKNOWN'}))),
    ok.


getInstance() ->
        case (get({'InputFactory', instance}) =:= get({'NullUtil':getInstance(), 'NULL_OBJECT'})) of
            true ->
            put({'InputFactory', instance}, 'InputFactory':new());
            false -> ok
        end,
        get({'InputFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        Size = array:size(get({This, inputIntegerArray})),
        lists:foreach(fun(Index) ->
            put({This, inputIntegerArray}, array:set(Index, get({This, 'NO_INPUT'}), get({This, inputIntegerArray})))
        end, lists:seq(0, Size - 1)).

add(This, Id, Input) when is_integer(Id) ->
        put({This, inputIntegerArray}, array:set(Id, Input, get({This, inputIntegerArray}))).

getInstanceById(This, Id) when is_integer(Id) ->
        put({local, id}, Id),
        try
        case (get({local, id}) < 0) of
            true ->
            put({local, id}, (-get({local, id})));
            false -> ok
        end,
        case (get({local, id}) > array:size(get({This, inputIntegerArray}))) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N66743) -> (get({Target_N66743, '$class'})):toString(Target_N66743) end)((fun(Target_N66750) -> (get({Target_N66750, '$class'})):appendint(Target_N66750, get({local, id})) end)((fun(Target_N66757) -> (get({Target_N66757, '$class'})):append(Target_N66757, "Warning id: ") end)('StringMaker':new()))), This, get({get({This, commonStrings}), 'GET_INSTANCE'})),
            throw({'$return', get({This, 'NO_INPUT'})});
            false -> ok
        end,
        array:get(get({local, id}), get({This, inputIntegerArray}))
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

