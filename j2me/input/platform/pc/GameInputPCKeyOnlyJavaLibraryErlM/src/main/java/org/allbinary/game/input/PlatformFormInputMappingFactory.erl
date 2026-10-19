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
% import org.allbinary.game.input.mapping.InputToGameKeyMapping
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings

-module('PlatformFormInputMappingFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, get({'NullUtil':getInstance(), 'NULL_OBJECT'})),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, inputToGameKeyMapping}, 'InputToGameKeyMapping':getNullInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        case (get({'PlatformFormInputMappingFactory', instance}) =:= get({'NullUtil':getInstance(), 'NULL_OBJECT'})) of
            true ->
            put({'PlatformFormInputMappingFactory', instance}, 'PlatformFormInputMappingFactory':new());
            false -> ok
        end,
        get({'PlatformFormInputMappingFactory', instance}).

getOrCreate(This) ->
        try
            case (get({This, inputToGameKeyMapping}) =:= 'InputToGameKeyMapping':getNullInstance()) of
                true ->
                PcKeyFactory = 'PCKeyFactory':getInstance(),
                InputToGameKeyMapping = 'InputToGameKeyMapping':new(),
                GameKeyFactory = 'GameKeyFactory':getInstance(),
                (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'UP'}), get({PcKeyFactory, 'DPAD_UP'})),
                (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'DOWN'}), get({PcKeyFactory, 'DPAD_DOWN'})),
                (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'LEFT'}), get({PcKeyFactory, 'DPAD_LEFT'})),
                (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'RIGHT'}), get({PcKeyFactory, 'DPAD_RIGHT'})),
                (get({InputToGameKeyMapping, '$class'})):add(InputToGameKeyMapping, get({GameKeyFactory, 'KEY_NUM1'}), get({PcKeyFactory, 'ENTER'})),
                put({This, inputToGameKeyMapping}, InputToGameKeyMapping);
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, get({CommonStrings, 'GET_INSTANCE'}), E)
        end,
        get({This, inputToGameKeyMapping}).

