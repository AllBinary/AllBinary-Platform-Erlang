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
% package org.allbinary.game.layer
% import java.util.Enumeration
% import org.allbinary.layer.Layer
% import org.allbinary.logic.math.SmallIntegerSingletonFactory
% import org.allbinary.util.ABHashtable
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.util.EnumerationUtil

-module('LevelLayersFinder').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'LevelLayersFinder':new()),
    ok.

init_fields(This) ->
    put({This, enumerationUtil}, 'EnumerationUtil':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'LevelLayersFinder', instance}).

get(This, Hashtable) ->
        SmallIntegerSingletonFactory = 'SmallIntegerSingletonFactory':getInstance(),
        List = 'BasicArrayListD':new(),
        Enumeration = (get({Hashtable, '$class'})):keys(Hashtable),
        put({local, layerHashtableCanBeNull}, undefined),
        put({local, integerCanBeNull}, undefined),
        put({local, cachedIntegerCanBeNull}, undefined),
        (fun Loop() -> case (get({get({This, enumerationUtil}), '$class'})):hasMoreElements(get({This, enumerationUtil}), Enumeration) of true ->
            put({local, layerHashtableCanBeNull}, (get({Hashtable, '$class'})):get(Hashtable, (get({get({This, enumerationUtil}), '$class'})):nextElement(get({This, enumerationUtil}), Enumeration))),
            put({local, integerCanBeNull}, (get({get({local, layerHashtableCanBeNull}), '$class'})):get(get({local, layerHashtableCanBeNull}), get({'Layer', 'ID'}))),
            put({local, cachedIntegerCanBeNull}, (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, (get({get({local, integerCanBeNull}), '$class'})):intValue(get({local, integerCanBeNull})))),
            case (not (get({List, '$class'})):contains(List, get({local, cachedIntegerCanBeNull}))) of
                true ->
                (get({List, '$class'})):add(List, get({local, cachedIntegerCanBeNull}));
                false -> ok
            end,
            Loop();
        false -> ok end end)(),
        List.

