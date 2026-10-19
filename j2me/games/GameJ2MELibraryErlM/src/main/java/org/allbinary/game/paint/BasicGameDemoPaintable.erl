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
% package org.allbinary.game.paint
% import javax.microedition.lcdui.Graphics
% import org.allbinary.graphics.paint.NullPaintable
% import org.allbinary.graphics.paint.Paintable
% import org.allbinary.graphics.paint.StatePaintable

-module('BasicGameDemoPaintable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('StatePaintable', Function, Arguments).

init_fields(This) ->
    put({This, mainDemoStatePaintable}, undefined),
    put({This, ownershipPaintable}, undefined),
    put({This, helpPaintableInterface}, undefined),
    put({This, currentStatePaintable}, 'NullPaintable':getInstance()),
    ok.


new(MainDemoStatePaintable, OwnershipPaintable, HelpPaintableInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, MainDemoStatePaintable, OwnershipPaintable, HelpPaintableInterface),
    This.

init(This, MainDemoStatePaintable, OwnershipPaintable, HelpPaintableInterface) ->
    'StatePaintable':init(This),
    init_fields(This),
        put({This, mainDemoStatePaintable}, MainDemoStatePaintable),
        (get({This, '$class'})):setCurrentStatePaintable(This, 'NullPaintable':getInstance()),
        put({This, ownershipPaintable}, OwnershipPaintable),
        put({This, helpPaintableInterface}, HelpPaintableInterface).

setState(This, State) when is_integer(State) ->
        case (State =:= 0) of
            true ->
            (get({This, '$class'})):setCurrentStatePaintable(This, (get({This, '$class'})):getMainDemoStatePaintable(This));
            false ->
            case (State =:= 1) of
            true ->
            (get({This, '$class'})):setCurrentStatePaintable(This, get({This, helpPaintableInterface}));
            false ->
            (get({This, '$class'})):setCurrentStatePaintable(This, get({This, ownershipPaintable}))
        end
        end.

paint(This, Graphics) ->
        (fun(Target_N66284) -> (get({Target_N66284, '$class'})):paint(Target_N66284, Graphics) end)((get({This, '$class'})):getCurrentStatePaintable(This)).

getHelpPaintableInterface(This) ->
        get({This, helpPaintableInterface}).

setCurrentStatePaintable(This, CurrentStatePaintable) ->
        put({This, currentStatePaintable}, CurrentStatePaintable).

getCurrentStatePaintable(This) ->
        get({This, currentStatePaintable}).

getMainDemoStatePaintable(This) ->
        get({This, mainDemoStatePaintable}).

