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
% package org.allbinary.game.configuration
% import javax.microedition.lcdui.CommandListener
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.displayable.screen.CommandForm
% import org.allbinary.init.Init
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings

-module('InGameOptionsFormFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, get({'NullUtil':getInstance(), 'NULL_OBJECT'})),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, 'SINGLETON'}, 'CommandForm':getNullCommandForm()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        case (get({'InGameOptionsFormFactory', instance}) =:= get({'NullUtil':getInstance(), 'NULL_OBJECT'})) of
            true ->
            put({'InGameOptionsFormFactory', instance}, 'InGameOptionsFormFactory':new());
            false -> ok
        end,
        get({'InGameOptionsFormFactory', instance}).

init(This, CommandListener, InitInterface, Title, BackgrounBasicColor, ForegroundBasicColor) when (is_list(Title) orelse Title =:= undefined) ->
        try
            case (get({This, 'SINGLETON'}) =:= 'CommandForm':getNullCommandForm()) of
                true ->
                (get({InitInterface, '$class'})):init(InitInterface),
                put({This, 'SINGLETON'}, 'InGameOptionsForm':new(CommandListener, Title, BackgrounBasicColor, ForegroundBasicColor));
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, get({CommonStrings, 'INIT'}), E)
        end.

get(This) ->
        get({This, 'SINGLETON'}).

