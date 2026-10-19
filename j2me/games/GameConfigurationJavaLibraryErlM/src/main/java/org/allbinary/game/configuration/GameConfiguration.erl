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
% import org.allbinary.game.configuration.event.GameFeatureEvent
% import org.allbinary.game.configuration.event.GameFeatureEventHandler
% import org.allbinary.logic.java.bool.BooleanFactory
% import org.allbinary.logic.math.SmallIntegerSingletonFactory
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil

-module('GameConfiguration').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'MIN_VALUE'}, get({'Integer', 'MIN_VALUE'})),
    ok.

init_fields(This) ->
    put({This, name}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
    put({This, defaultValue}, (fun(Target_N65916) -> (get({Target_N65916, '$class'})):getAt(Target_N65916, 0) end)('SmallIntegerSingletonFactory':getInstance())),
    put({This, value}, get({'GameConfiguration', 'MIN_VALUE'})),
    put({This, minValue}, get({This, defaultValue})),
    put({This, maxValue}, get({This, defaultValue})),
    put({This, modifiable}, get({'BooleanFactory':getInstance(), 'TRUE'})),
    ok.


new(Name, DefaultValue, MinValue, MaxValue) when (is_list(Name) orelse Name =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Name, DefaultValue, MinValue, MaxValue),
    This.

init(This, Name, DefaultValue, MinValue, MaxValue) when (is_list(Name) orelse Name =:= undefined) ->
    init_fields(This),
        (get({This, '$class'})):setName(This, Name),
        (get({This, '$class'})):setDefaultValue(This, DefaultValue),
        put({This, value}, (get({This, '$class'})):getDefaultValue(This)),
        (get({This, '$class'})):setMinValue(This, MinValue),
        (get({This, '$class'})):setMaxValue(This, MaxValue),
        (fun(Target_N66290) -> (get({Target_N66290, '$class'})):put(Target_N66290, (get({This, '$class'})):getName(This), This) end)((fun(Target_N66297) -> (get({Target_N66297, '$class'})):getHashtable(Target_N66297) end)('GameConfigurationSingleton':getInstance())).

% throws Exception
setValue(This, Value) ->
        case (get({This, value}) =/= Value) of
            true ->
            OldValue = get({This, value}),
            put({This, value}, Value),
            (fun(Target_N66569) -> (get({Target_N66569, '$class'})):fireEvent(Target_N66569, 'GameFeatureEvent':new(This, (fun(Target_N66610) -> (get({Target_N66610, '$class'})):toString(Target_N66610) end)((fun(Target_N66617) -> (get({Target_N66617, '$class'})):appendint(Target_N66617, trunc((get({get({This, value}), '$class'})):intValue(get({This, value})))) end)((fun(Target_N66624) -> (get({Target_N66624, '$class'})):append(Target_N66624, " to ") end)((fun(Target_N66631) -> (get({Target_N66631, '$class'})):appendint(Target_N66631, trunc((get({OldValue, '$class'})):intValue(OldValue))) end)((fun(Target_N66638) -> (get({Target_N66638, '$class'})):append(Target_N66638, " value: from: ") end)((fun(Target_N66645) -> (get({Target_N66645, '$class'})):append(Target_N66645, get({This, name})) end)('StringMaker':new())))))))) end)('GameFeatureEventHandler':getInstance());
            false -> ok
        end.

getValue(This) ->
        get({This, value}).

setMaxValue(This, MaxValue) ->
        put({This, maxValue}, MaxValue).

getMaxValue(This) ->
        get({This, maxValue}).

setMinValue(This, MinValue) ->
        put({This, minValue}, MinValue).

getMinValue(This) ->
        get({This, minValue}).

setName(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
        put({This, name}, Name).

getName(This) ->
        get({This, name}).

setDefaultValue(This, DefaultValue) ->
        put({This, defaultValue}, DefaultValue).

getDefaultValue(This) ->
        get({This, defaultValue}).

% throws Exception
setDefault(This) ->
        (get({This, '$class'})):setValue(This, (get({This, '$class'})):getDefaultValue(This)).

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "Name: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, name})),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Min: "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc((fun(Target_N67574) -> (get({Target_N67574, '$class'})):intValue(Target_N67574) end)((get({This, '$class'})):getMinValue(This)))),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Max: "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc((fun(Target_N67643) -> (get({Target_N67643, '$class'})):intValue(Target_N67643) end)((get({This, '$class'})):getMaxValue(This)))),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Value: "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc((fun(Target_N67712) -> (get({Target_N67712, '$class'})):intValue(Target_N67712) end)((get({This, '$class'})):getValue(This)))),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Default: "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc((fun(Target_N67781) -> (get({Target_N67781, '$class'})):intValue(Target_N67781) end)((get({This, '$class'})):getDefaultValue(This)))),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Modifiable: "),
        (get({StringBuffer, '$class'})):appendboolean(StringBuffer, (fun(Target_N67850) -> (get({Target_N67850, '$class'})):booleanValue(Target_N67850) end)((get({This, '$class'})):isModifiable(This))),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

setModifiable(This, Modifiable) ->
        put({This, modifiable}, Modifiable).

isModifiable(This) ->
        get({This, modifiable}).

