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
% package org.allbinary.input.motion.button
% import org.allbinary.graphics.PointFactory
% import org.allbinary.graphics.Rectangle
% import org.allbinary.graphics.displayable.DisplayInfoSingleton

-module('CommonButtons').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'CommonButtons':new()),
    ok.

init_fields(This) ->
    put({This, 'STANDARD_BUTTON_SIZE'}, 0),
    put({This, 'NORMAL_BUTTON'}, undefined),
    put({This, 'LARGE_BUTTON'}, undefined),
    ok.


getInstance() ->
        get({'CommonButtons', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        DisplayInfo = 'DisplayInfoSingleton':getInstance(),
        put({local, commonButtonSize}, 128),
        (fun Loop() -> case (get({local, commonButtonSize}) > 64) of true ->
            TotalColumns = ((get({DisplayInfo, '$class'})):getLastWidth(DisplayInfo) / get({local, commonButtonSize})),
            TotalRows = ((get({DisplayInfo, '$class'})):getLastHeight(DisplayInfo) / get({local, commonButtonSize})),
            put({local, max}, TotalColumns),
            case (TotalRows > get({local, max})) of
                true ->
                put({local, max}, TotalRows);
                false -> ok
            end,
            case (get({local, max}) > 9) of
                true ->
                throw('$break');
                false -> ok
            end,
            put({local, commonButtonSize}, (get({local, commonButtonSize}) bsr 1)),
            Loop();
        false -> ok end end)(),
        put({This, 'STANDARD_BUTTON_SIZE'}, get({local, commonButtonSize})),
        put({This, 'NORMAL_BUTTON'}, 'Rectangle':new(get({'PointFactory':getInstance(), 'ZERO_ZERO'}), get({This, 'STANDARD_BUTTON_SIZE'}), get({This, 'STANDARD_BUTTON_SIZE'}))),
        put({This, 'LARGE_BUTTON'}, 'Rectangle':new(get({'PointFactory':getInstance(), 'ZERO_ZERO'}), (get({This, 'STANDARD_BUTTON_SIZE'}) bsl 1), (get({This, 'STANDARD_BUTTON_SIZE'}) bsl 1))).

