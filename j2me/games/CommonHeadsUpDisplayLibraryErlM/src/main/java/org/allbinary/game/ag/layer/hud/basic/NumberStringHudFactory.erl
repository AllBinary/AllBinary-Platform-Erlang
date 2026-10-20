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
% package org.allbinary.game.ag.layer.hud.basic
% import org.allbinary.game.graphics.hud.BasicHudFactory
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.string.CommonStrings

-module('NumberStringHudFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'NullUtil':getInstance()),
    ok.

init_fields(This) ->
    put({This, 'NULL_NUMBER_STRING_HUD'}, (get({This, '$class'})):createHud(This)),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        case (get({'NumberStringHudFactory', instance}) =:= 'NullUtil':getInstance()) of
            true ->
            put({'NumberStringHudFactory', instance}, 'NumberStringHudFactory':new());
            false -> ok
        end,
        get({'NumberStringHudFactory', instance}).

createHud(This) ->
        try
            'NumberStringHud':new(get({'StringUtil':getInstance(), 'EMPTY_STRING'}), 9, get({'BasicHudFactory':getInstance(), 'ABSOLUTE'}), 1, 0, get({'BasicColorFactory':getInstance(), 'NULL_COLOR'}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            LogUtil = 'LogUtil':getInstance(),
            CommonStrings = 'CommonStrings':getInstance(),
            (get({LogUtil, '$class'})):put(LogUtil, get({CommonStrings, 'EXCEPTION'}), This, get({CommonStrings, 'CONSTRUCTOR'}), E),
            erlang:error({'RuntimeException'})
        end.

