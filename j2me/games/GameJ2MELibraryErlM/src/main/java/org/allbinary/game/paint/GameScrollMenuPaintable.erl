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
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.color.ColorChangeEventHandler
% import org.allbinary.graphics.color.ColorChangeListener
% import org.allbinary.graphics.form.FormPaintable
% import org.allbinary.graphics.form.ScrollSelectionForm
% import org.allbinary.graphics.form.item.ABStringComponent
% import org.allbinary.graphics.form.item.ABTextItem
% import org.allbinary.graphics.paint.Paintable
% import org.allbinary.logic.util.event.AllBinaryEventObject

-module('GameScrollMenuPaintable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ColorChangeListener

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicGameDemoPaintable', Function, Arguments).

init_fields(This) ->
    ok.


new(MainDemoStatePaintable, OwnershipPaintable, HelpPaintableInterface, BasicColor) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, MainDemoStatePaintable, OwnershipPaintable, HelpPaintableInterface, BasicColor),
    This.

'$init'(This, MainDemoStatePaintable, OwnershipPaintable, HelpPaintableInterface, BasicColor) ->
        'BasicGameDemoPaintable':'$init'(This, MainDemoStatePaintable, OwnershipPaintable, HelpPaintableInterface),
        (get({This, '$class'})):setColor(This, BasicColor),
        (fun(Target_N65959) -> (get({Target_N65959, '$class'})):addListenerInterface(Target_N65959, This) end)('ColorChangeEventHandler':getInstance()).

setState(This, State) when is_integer(State) ->
        (get({This, '$class'})):setCurrentStatePaintable(This, (get({This, '$class'})):getMainDemoStatePaintable(This)).

onEvent(This, EventObject) ->
        ok.

setColor(This, BasicColor) ->
        MainGameDemoStatePaintable = (get({This, '$class'})):getMainDemoStatePaintable(This),
        FormPaintable = (get({MainGameDemoStatePaintable, '$class'})):getMenuPaintableInterface(MainGameDemoStatePaintable),
        ScrollSelectionForm = (get({FormPaintable, '$class'})):getForm(FormPaintable),
        (fun(Target_N66450) -> (get({Target_N66450, '$class'})):setBasicColorP(Target_N66450, BasicColor) end)((get({MainGameDemoStatePaintable, '$class'})):getOwnershipPaintableInterface(MainGameDemoStatePaintable)),
        (get({ScrollSelectionForm, '$class'})):setButtonBasicColor(ScrollSelectionForm, BasicColor),
        put({local, item}, undefined),
        put({local, stringComponent}, undefined),
        lists:foreach(fun(Index) ->
            put({local, item}, (get({ScrollSelectionForm, '$class'})):get(ScrollSelectionForm, Index)),
            put({local, stringComponent}, (get({get({local, item}), '$class'})):getLabelStringComponent(get({local, item}))),
            case (get({local, stringComponent}) =/= undefined) of
                true ->
                (get({get({local, stringComponent}), '$class'})):setForegroundBasicColor(get({local, stringComponent}), BasicColor);
                false -> ok
            end
        end, lists:seq(((get({ScrollSelectionForm, '$class'})):size(ScrollSelectionForm) - 1), 0, -1)).

