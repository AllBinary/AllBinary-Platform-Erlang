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
% import javax.microedition.lcdui.TextField
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.util.ABHashtable

-module('GameConfigurationTextInput').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, hashtable}, (fun(Target_N65707) -> (get({Target_N65707, '$class'})):createHashtable(Target_N65707) end)('StdUtil':getInstance())),
    put({?MODULE, 'SIMULATOR_IP'}, 'GameConfigurationTextInput':new("IP: ", "192.168.1.3")),
    put({?MODULE, 'SIMULATOR_PORT'}, 'GameConfigurationTextInput':new("Port: ", "8010")),
    ok.

init_fields(This) ->
    put({This, label}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
    put({This, text}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
    ok.


new(Label, Text) when (is_list(Label) orelse Label =:= undefined), (is_list(Text) orelse Text =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Label, Text),
    This.

init(This, Label, Text) when (is_list(Label) orelse Label =:= undefined), (is_list(Text) orelse Text =:= undefined) ->
    init_fields(This),
        (get({This, '$class'})):setText(This, Text),
        (get({This, '$class'})):setLabel(This, Label),
        (get({get({'GameConfigurationTextInput', hashtable}), '$class'})):put(get({'GameConfigurationTextInput', hashtable}), (get({This, '$class'})):getLabel(This), This).

update(TextField) ->
        AnyType = (get({TextField, '$class'})):getLabel(TextField),
        GameConfigurationTextInput = (get({get({'GameConfigurationTextInput', hashtable}), '$class'})):get(get({'GameConfigurationTextInput', hashtable}), AnyType),
        (get({GameConfigurationTextInput, '$class'})):setText(GameConfigurationTextInput, (get({TextField, '$class'})):getString(TextField)).

setText(This, Text) when (is_list(Text) orelse Text =:= undefined) ->
        put({This, text}, Text).

getText(This) ->
        get({This, text}).

setLabel(This, Label) when (is_list(Label) orelse Label =:= undefined) ->
        put({This, label}, Label).

getLabel(This) ->
        get({This, label}).

getHashtable() ->
        get({'GameConfigurationTextInput', hashtable}).

