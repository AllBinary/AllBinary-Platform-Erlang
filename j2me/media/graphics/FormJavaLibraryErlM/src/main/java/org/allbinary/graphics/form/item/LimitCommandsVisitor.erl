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
% package org.allbinary.graphics.form.item
% import javax.microedition.lcdui.Command
% import org.allbinary.game.commands.GameCommandsFactory
% import org.allbinary.graphics.displayable.DisplayInfoSingleton
% import org.allbinary.graphics.form.ScreenInfo
% import org.allbinary.logic.java.bool.BooleanFactory
% import org.allbinary.logic.util.visitor.Visitor

-module('LimitCommandsVisitor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('Visitor', Function, Arguments).

init_fields(This) ->
    put({This, isNotSmallDisplay}, false),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'Visitor':init(This),
    init_fields(This),
        DisplayInfo = 'DisplayInfoSingleton':getInstance(),
        put({This, isNotSmallDisplay}, ((((get({DisplayInfo, '$class'})):isPortrait(DisplayInfo) andalso ((get({DisplayInfo, '$class'})):getLastHeight(DisplayInfo) > get({'ScreenInfo':getInstance(), 'SMALL_WIDTH'})))) orelse (((not (get({DisplayInfo, '$class'})):isPortrait(DisplayInfo)) andalso ((get({DisplayInfo, '$class'})):getLastHeight(DisplayInfo) > get({'ScreenInfo':getInstance(), 'SMALL_HEIGHT'})))))).

visit(This, AnyType) ->
        try
        Command = AnyType,
        BooleanFactory = 'BooleanFactory':getInstance(),
        case (((get({This, isNotSmallDisplay}) orelse ((get({Command, '$class'})):getPriority(Command) =:= 1)) orelse (Command =:= get({'GameCommandsFactory':getInstance(), 'EXIT_COMMAND'}))) orelse (Command =:= get({'GameCommandsFactory':getInstance(), 'EXIT_WITHOUT_PROGRESS_COMMAND'}))) of
            true ->
            throw({'$return', get({BooleanFactory, 'TRUE'})});
            false ->
            throw({'$return', get({BooleanFactory, 'FALSE'})})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

