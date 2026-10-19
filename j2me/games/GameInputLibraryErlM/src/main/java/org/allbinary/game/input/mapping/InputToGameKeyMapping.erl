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
% package org.allbinary.game.input.mapping
% import javax.microedition.lcdui.Canvas
% import org.allbinary.game.input.GameKey
% import org.allbinary.game.input.GameKeyFactory
% import org.allbinary.game.input.Input
% import org.allbinary.game.input.InputFactory
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.string.CommonLabels
% import org.allbinary.string.CommonSeps
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('InputToGameKeyMapping').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('InputMapping', Function, Arguments).

static_init() ->
    put({?MODULE, instance}, get({'NullUtil':getInstance(), 'NULL_OBJECT'})),
    ok.

init_fields(This) ->
    put({This, gameKeyFactory}, 'GameKeyFactory':getInstance()),
    put({This, mappedGameKeys}, array:from_list([get({get({This, gameKeyFactory}), 'UP'}), get({get({This, gameKeyFactory}), 'DOWN'}), get({get({This, gameKeyFactory}), 'LEFT'}), get({get({This, gameKeyFactory}), 'RIGHT'})])),
    put({This, platformToGameKeyMapping}, array:new(get({'InputFactory':getInstance(), 'MAX'}), {default, undefined})),
    put({This, negativePlatformToGameKeyMapping}, array:new(0, {default, undefined})),
    ok.


getNullInstance() ->
        case (get({'InputToGameKeyMapping', instance}) =:= get({'NullUtil':getInstance(), 'NULL_OBJECT'})) of
            true ->
            put({'InputToGameKeyMapping', instance}, 'InputToGameKeyMapping':new());
            false -> ok
        end,
        get({'InputToGameKeyMapping', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'InputMapping':init(This),
    init_fields(This),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'})),
        (get({This, '$class'})):clear(This).

clear(This) ->
        lists:foreach(fun(Index) ->
            put({This, platformToGameKeyMapping}, array:set(Index, get({get({This, gameKeyFactory}), 'NONE'}), get({This, platformToGameKeyMapping})))
        end, lists:seq((array:size(get({This, platformToGameKeyMapping})) - 1), 0, -1)).

removeAll(This) ->
        'InputMapping':removeAll(This),
        (get({This, '$class'})):clear(This).

addMapping(This, InputToGameKeyMapping) ->
        lists:foreach(fun(Index) ->
            Input = (get({InputToGameKeyMapping, '$class'})):getInstance(InputToGameKeyMapping, Index),
            case (Input =/= get({get({This, gameKeyFactory}), 'NONE'})) of
                true ->
                (get({This, '$class'})):addAll(This, Input, (get({InputToGameKeyMapping, '$class'})):getMappedInput(InputToGameKeyMapping, Input));
                false -> ok
            end
        end, lists:seq(((get({InputToGameKeyMapping, '$class'})):getMaxMappable(InputToGameKeyMapping) - 1), 0, -1)).

addAll(This, Input, List) ->
        lists:foreach(fun(Index) ->
            MappedToInput = array:get(Index, get({List, objectArray})),
            (get({This, '$class'})):add(This, Input, MappedToInput)
        end, lists:seq(((get({List, '$class'})):size(List) - 1), 0, -1)).

add(This, Input, MappedToInput) ->
        'InputMapping':add(This, Input, MappedToInput),
        (get({This, '$class'})):set(This, Input, MappedToInput).

remove(This, Input, MappedToInput) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N67594) -> (get({Target_N67594, '$class'})):toString(Target_N67594) end)((fun(Target_N67601) -> (get({Target_N67601, '$class'})):append(Target_N67601, (fun(Target_N67718) -> (get({Target_N67718, '$class'})):toString(Target_N67718, MappedToInput) end)('StringUtil':getInstance())) end)((fun(Target_N67608) -> (get({Target_N67608, '$class'})):append(Target_N67608, " == ") end)((fun(Target_N67615) -> (get({Target_N67615, '$class'})):append(Target_N67615, (fun(Target_N67671) -> (get({Target_N67671, '$class'})):toString(Target_N67671, Input) end)('StringUtil':getInstance())) end)((fun(Target_N67622) -> (get({Target_N67622, '$class'})):append(Target_N67622, get({'CommonLabels':getInstance(), 'START_LABEL'})) end)('StringMaker':new()))))), This, "InputToGameKeyMapping::remove"),
        'InputMapping':remove(This, Input, MappedToInput),
        (get({This, '$class'})):set(This, Input, get({get({This, gameKeyFactory}), 'NONE'})).

set(This, Input, MappedToInput) ->
        Id = (get({MappedToInput, '$class'})):getId(MappedToInput),
        case ((Id >= 0) andalso (Id < array:size(get({This, platformToGameKeyMapping})))) of
            true ->
            put({This, platformToGameKeyMapping}, array:set(Id, Input, get({This, platformToGameKeyMapping})));
            false -> ok
        end.

getMaxMappable(This) ->
        array:size(get({This, platformToGameKeyMapping})).

getReverseInstance(This, Id) when is_integer(Id) ->
        List = 'BasicArrayListD':new(),
        InputFactory = 'InputFactory':getInstance(),
        lists:foreach(fun(Index) ->
            case ((fun(Target_N68293) -> (get({Target_N68293, '$class'})):getId(Target_N68293) end)(array:get(Index, get({This, platformToGameKeyMapping}))) =:= Id) of
                true ->
                Input = (get({InputFactory, '$class'})):getInstanceById(InputFactory, Index),
                case (Input =/= undefined) of
                    true ->
                    (get({List, '$class'})):add(List, Input);
                    false -> ok
                end;
                false -> ok
            end
        end, lists:seq(0, array:size(get({This, platformToGameKeyMapping})) - 1)),
        List.

% throws Exception
initGameKey(This, Canvas, GameKey) ->
        Key = (get({Canvas, '$class'})):getKeyCode(Canvas, (get({GameKey, '$class'})):getId(GameKey)),
        case ((Key < 0) andalso ((-Key) < array:size(get({This, negativePlatformToGameKeyMapping})))) of
            true ->
            put({This, negativePlatformToGameKeyMapping}, array:set((-Key), GameKey, get({This, negativePlatformToGameKeyMapping})));
            false ->
            case (Key > 0) of
            true ->
            case (array:get(Key, get({This, platformToGameKeyMapping})) =:= get({get({This, gameKeyFactory}), 'NONE'})) of
                true ->
                put({This, platformToGameKeyMapping}, array:set(Key, GameKey, get({This, platformToGameKeyMapping})));
                false -> ok
            end;
            false ->
            'PreLogUtil':putOE((fun(Target_N68757) -> (get({Target_N68757, '$class'})):toString(Target_N68757) end)((fun(Target_N68764) -> (get({Target_N68764, '$class'})):appendint(Target_N68764, Key) end)((fun(Target_N68771) -> (get({Target_N68771, '$class'})):append(Target_N68771, get({'CommonSeps':getInstance(), 'COLON_SEP'})) end)((fun(Target_N68778) -> (get({Target_N68778, '$class'})):append(Target_N68778, (get({GameKey, '$class'})):toString(GameKey)) end)('StringMaker':new())))), This, get({get({This, commonStrings}), 'INIT'}), {'Exception'})
        end
        end.

% throws Exception
getSmallestCanvasGameKeyCode(This, Canvas) ->
        put({local, nextKey}, 0),
        put({local, smallestKey}, 0),
        put({local, index}, array:size(get({This, mappedGameKeys}))),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            put({local, nextKey}, (get({Canvas, '$class'})):getKeyCode(Canvas, (fun(Target_N69227) -> (get({Target_N69227, '$class'})):getId(Target_N69227) end)(array:get(get({local, index}), get({This, mappedGameKeys}))))),
            case (get({local, nextKey}) < get({local, smallestKey})) of
                true ->
                put({local, smallestKey}, get({local, nextKey}));
                false -> ok
            end,
            Loop();
        false -> ok end end)(),
        get({local, smallestKey}).

init(This, Canvas) ->
        try
            put({local, negativePlatformToGameKeyMapping}, array:new(0, {default, undefined})),
            put({local, smallestKey}, (get({This, '$class'})):getSmallestCanvasGameKeyCode(This, Canvas)),
            case (get({local, smallestKey}) < 0) of
                true ->
                put({local, smallestKey}, get({local, smallestKey}) - 1),
                case (get({local, smallestKey}) < (-256)) of
                    true ->
                    put({local, smallestKey}, (-256));
                    false -> ok
                end,
                put({local, negativePlatformToGameKeyMapping}, array:new((-get({local, smallestKey})), {default, undefined})),
                put({local, index}, array:size(get({local, negativePlatformToGameKeyMapping}))),
                (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
                    put({local, negativePlatformToGameKeyMapping}, array:set(get({local, index}), get({get({This, gameKeyFactory}), 'NONE'}), get({local, negativePlatformToGameKeyMapping}))),
                    Loop();
                false -> ok end end)(),
                put({This, negativePlatformToGameKeyMapping}, get({local, negativePlatformToGameKeyMapping}));
                false -> ok
            end,
            put({local, index}, array:size(get({This, mappedGameKeys}))),
            (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
                (get({This, '$class'})):initGameKey(This, Canvas, array:get(get({local, index}), get({This, mappedGameKeys}))),
                Loop();
            false -> ok end end)()
        catch _:T when T =/= '$break', T =/= '$continue', (not is_tuple(T) orelse element(1, T) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'INIT'}), T)
        end.

getInstanceForCanvas(This, Canvas, Id) when is_integer(Id) ->
        try
        case ((Id >= 0) andalso (Id < array:size(get({This, platformToGameKeyMapping})))) of
            true ->
            throw({'$return', array:get(Id, get({This, platformToGameKeyMapping}))});
            false ->
            case ((Id < 0) andalso ((-Id) < array:size(get({This, negativePlatformToGameKeyMapping})))) of
            true ->
            throw({'$return', array:get((-Id), get({This, negativePlatformToGameKeyMapping}))});
            false ->
            throw({'$return', get({get({This, gameKeyFactory}), 'NONE'})})
        end
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getInstance(This, Id) when is_integer(Id) ->
        try
        case ((Id >= 0) andalso (Id < array:size(get({This, platformToGameKeyMapping})))) of
            true ->
            throw({'$return', array:get(Id, get({This, platformToGameKeyMapping}))});
            false ->
            case ((Id < 0) andalso ((-Id) < array:size(get({This, negativePlatformToGameKeyMapping})))) of
            true ->
            throw({'$return', array:get((-Id), get({This, negativePlatformToGameKeyMapping}))});
            false ->
            throw({'$return', get({get({This, gameKeyFactory}), 'NONE'})})
        end
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

