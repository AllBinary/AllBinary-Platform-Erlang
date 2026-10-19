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
% package org.allbinary.game.resource
% import org.allbinary.graphics.RelativeRelationship
% import org.allbinary.logic.StdUtil
% import org.allbinary.util.ABHashtable
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.util.BasicArrayListUtil

-module('ResourceRelativeRelationshipFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ResourceRelativeRelationshipFactoryInterface

init_fields(This) ->
    put({This, basicArrayListUtil}, 'BasicArrayListUtil':getInstance()),
    put({This, hashtable}, (fun(Target_N65813) -> (get({Target_N65813, '$class'})):createHashtable(Target_N65813) end)('StdUtil':getInstance())),
    put({This, initialized}, false),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


% throws Exception
init(This, Level) when is_integer(Level) ->
        (get({This, '$class'})):setInitialized(This, true).

% throws Exception
getResourceRelativeRelationshipList(This, Resource) when (is_list(Resource) orelse Resource =:= undefined) ->
        try
        ListCanBeNull = (get({get({This, hashtable}), '$class'})):get(get({This, hashtable}), Resource),
        case (ListCanBeNull =:= undefined) of
            true ->
            throw({'$return', (get({get({This, basicArrayListUtil}), '$class'})):getImmutableInstance(get({This, basicArrayListUtil}))});
            false -> ok
        end,
        ListCanBeNull
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
addResourceRelativeRelationship(This, Resource, HardPoint) when (is_list(Resource) orelse Resource =:= undefined) ->
        put({local, list}, (get({This, '$class'})):getResourceRelativeRelationshipList(This, Resource)),
        case (get({local, list}) =:= (get({get({This, basicArrayListUtil}), '$class'})):getImmutableInstance(get({This, basicArrayListUtil}))) of
            true ->
            put({local, list}, 'BasicArrayListD':new());
            false -> ok
        end,
        (get({get({local, list}), '$class'})):add(get({local, list}), HardPoint),
        (get({get({This, hashtable}), '$class'})):put(get({This, hashtable}), Resource, get({local, list})).

isLoadingLevel(This, Level) when is_integer(Level) ->
        false.

isFeature(This) ->
        false.

setInitialized(This, Initialized) when is_boolean(Initialized) ->
        put({This, initialized}, Initialized).

isInitialized(This) ->
        get({This, initialized}).

