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
% package org.allbinary.layer
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.ABHashtable
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.util.BasicArrayListUtil

-module('LayerInterfaceFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'SINGLETON'}, 'LayerInterfaceFactory':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, list}, (fun(Target_N65913) -> (get({Target_N65913, '$class'})):getImmutableInstance(Target_N65913) end)('BasicArrayListUtil':getInstance())),
    put({This, 'HASHTABLE_LABEL'}, "Hashtable: "),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'LayerInterfaceFactory', 'SINGLETON'}).

init(This) ->
        put({This, list}, 'BasicArrayListD':new()).

% throws Exception
getNexInstance(This, Hashtable, X, Y, Z) when is_integer(X), is_integer(Y), is_integer(Z) ->
        CommonStrings = 'CommonStrings':getInstance(),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N66182) -> (get({Target_N66182, '$class'})):toString(Target_N66182) end)((fun(Target_N66189) -> (get({Target_N66189, '$class'})):append(Target_N66189, (fun(Target_N66232) -> (get({Target_N66232, '$class'})):toString(Target_N66232, Hashtable) end)('StringUtil':getInstance())) end)((fun(Target_N66196) -> (get({Target_N66196, '$class'})):append(Target_N66196, get({This, 'HASHTABLE_LABEL'})) end)('StringMaker':new()))), This, get({CommonStrings, 'GET_INSTANCE'})),
        TypeInteger = (get({Hashtable, '$class'})):get(Hashtable, get({'Layer', 'ID'})),
        LayerInterfaceFactoryInterface = array:get(((get({TypeInteger, '$class'})):intValue(TypeInteger) - 1), get({get({This, list}), objectArray})),
        (get({LayerInterfaceFactoryInterface, '$class'})):getNextInstance(LayerInterfaceFactoryInterface, Hashtable, X, Y, Z).

add(This, LayerInterfaceFactoryInterface) ->
        (get({get({This, list}), '$class'})):add(get({This, list}), LayerInterfaceFactoryInterface).

