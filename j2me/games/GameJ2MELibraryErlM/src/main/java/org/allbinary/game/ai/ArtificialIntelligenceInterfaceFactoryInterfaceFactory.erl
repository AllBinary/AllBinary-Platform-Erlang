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
% package org.allbinary.game.ai
% import org.allbinary.util.ABHashtable
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.util.BasicArrayListUtil

-module('ArtificialIntelligenceInterfaceFactoryInterfaceFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'SINGLETON'}, 'ArtificialIntelligenceInterfaceFactoryInterfaceFactory':new()),
    ok.

init_fields(This) ->
    put({This, list}, (fun(Target_N65744) -> (get({Target_N65744, '$class'})):getImmutableInstance(Target_N65744) end)('BasicArrayListUtil':getInstance())),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


clear(This) ->
        put({This, list}, 'BasicArrayListD':new()).

getInstance() ->
        get({'ArtificialIntelligenceInterfaceFactoryInterfaceFactory', 'SINGLETON'}).

getInstanceFromCollection(This, Hashtable) ->
        TypeInteger = (get({Hashtable, '$class'})):get(Hashtable, get({'BasicAI', 'ID'})),
        Type = (get({TypeInteger, '$class'})):intValue(TypeInteger),
        ArtificialIntelligenceInterfaceFactoryInterface = array:get((Type - 1), get({get({This, list}), objectArray})),
        ArtificialIntelligenceInterfaceFactoryInterface.

add(This, ArtificialIntelligenceInterfaceFactoryInterface) ->
        (get({get({This, list}), '$class'})):add(get({This, list}), ArtificialIntelligenceInterfaceFactoryInterface).

