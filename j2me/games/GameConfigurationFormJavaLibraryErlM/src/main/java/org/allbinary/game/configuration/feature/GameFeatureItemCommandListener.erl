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
% package org.allbinary.game.configuration.feature
% import javax.microedition.lcdui.Command
% import javax.microedition.lcdui.Item
% import javax.microedition.lcdui.ItemCommandListener
% import org.allbinary.game.configuration.GameConfigurationGauge
% import org.allbinary.game.configuration.GameConfigurationUtil
% import org.allbinary.game.configuration.GameOptionsForm
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.midlet.MidletStrings
% import org.allbinary.string.CommonLabels
% import org.allbinary.string.CommonStrings

-module('GameFeatureItemCommandListener').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ItemCommandListener

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, gameOptionsForm}, undefined),
    ok.


new(GameOptionsForm) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, GameOptionsForm),
    This.

'$init'(This, GameOptionsForm) ->
    init_fields(This),
        put({This, gameOptionsForm}, GameOptionsForm).

commandAction(This, Command, Item) ->
        try
            ItemLabel = (get({Item, '$class'})):getLabel(Item),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N66140) -> (get({Target_N66140, '$class'})):toString(Target_N66140) end)((fun(Target_N66147) -> (get({Target_N66147, '$class'})):append(Target_N66147, ItemLabel) end)((fun(Target_N66154) -> (get({Target_N66154, '$class'})):append(Target_N66154, get({'CommonLabels':getInstance(), 'ITEM_LABEL'})) end)('StringMaker':new()))), This, get({'MidletStrings':getInstance(), 'COMMAND_ACTION'})),
            case allbinary_java:instance_of(Item, 'GameConfigurationGauge') of
                true ->
                (fun(Target_N66275) -> (get({Target_N66275, '$class'})):change(Target_N66275, get({This, gameOptionsForm}), Item) end)('GameConfigurationUtil':getInstance());
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, get({'MidletStrings':getInstance(), 'COMMAND_ACTION'}), E)
        end.

