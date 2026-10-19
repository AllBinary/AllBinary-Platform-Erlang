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
% package org.allbinary.game.ag.ai
% import org.allbinary.game.input.GameInput
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.layer.AllBinaryLayerManager
% import org.allbinary.util.HashtableUtil
% import org.allbinary.game.ai.BasicAI
% import org.allbinary.util.ABHashtable

-module('KeyPressesAI').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicAI', Function, Arguments).

init_fields(This) ->
    put({This, on}, true),
    put({This, keys}, undefined),
    ok.


new(Hashtable, OwnerLayerInterface, GameInput) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Hashtable, OwnerLayerInterface, GameInput),
    This.

init(This, Hashtable, OwnerLayerInterface, GameInput) ->
        'BasicAI':init(This, OwnerLayerInterface, GameInput),
        init_fields(This),
        put({This, keys}, array:new((get({Hashtable, '$class'})):size(Hashtable), {default, undefined})),
        ObjectArray = (fun(Target_N65922) -> (get({Target_N65922, '$class'})):getKeysAsArray(Target_N65922, Hashtable) end)('HashtableUtil':getInstance()),
        Size = array:size(ObjectArray),
        lists:foreach(fun(Index) ->
            put({This, keys}, array:set(Index, (get({Hashtable, '$class'})):get(Hashtable, array:get(Index, ObjectArray)), get({This, keys})))
        end, lists:seq(0, Size - 1)).

% throws Exception
processAI(This, AllBinaryLayerManager) ->
        case get({This, on}) of
            true ->
            lists:foreach(fun(Index) ->
                'BasicAI':processKeyAI(This, (fun(Target_N66323) -> (get({Target_N66323, '$class'})):intValue(Target_N66323) end)(array:get(Index, get({This, keys}))))
            end, lists:seq(0, array:size(get({This, keys})) - 1));
            false -> ok
        end.

% throws Exception
toggle(This) ->
        case (get({This, '$class'})):isOn(This) of
            true ->
            (get({This, '$class'})):setOn(This, false);
            false ->
            (get({This, '$class'})):setOn(This, true)
        end.

% throws Exception
disable(This) ->
        (get({This, '$class'})):setOn(This, false).

% throws Exception
enable(This) ->
        (get({This, '$class'})):setOn(This, true).

setOn(This, On) when is_boolean(On) ->
        put({This, on}, On).

isOn(This) ->
        get({This, on}).

