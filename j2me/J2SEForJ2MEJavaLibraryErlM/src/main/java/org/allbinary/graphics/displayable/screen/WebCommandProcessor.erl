%
% AllBinary Open License Version 1
% Copyright (c) 2022 AllBinary
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
% package org.allbinary.graphics.displayable.screen
% import java.awt.Desktop
% import java.net.URI
% import javax.microedition.lcdui.Canvas
% import javax.microedition.lcdui.Command
% import javax.microedition.lcdui.CommandListener
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('WebCommandProcessor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'WebCommandProcessor':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, aboutCommandProcessor}, 'AboutCommandProcessor':getInstance()),
    put({This, list}, 'BasicArrayListD':new()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'WebCommandProcessor', instance}).

process(This, MidletCommandListener, Command, Canvas) ->
        try
            case ('Desktop':isDesktopSupported() andalso (fun(Target_N66114) -> (get({Target_N66114, '$class'})):isSupported(Target_N66114, get({get({'Desktop', 'Action'}), 'BROWSE'})) end)('Desktop':getDesktop())) of
                true ->
                (fun(Target_N66174) -> (get({Target_N66174, '$class'})):browse(Target_N66174, 'URI':new((get({get({This, list}), '$class'})):removeAt(get({This, list}), 0))) end)('Desktop':getDesktop());
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, get({CommonStrings, 'PROCESS'}), E)
        end.

