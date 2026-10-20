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

-module('ResourceLoadingLevelFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ResourceLoadingLevelFactory':new()),
    ok.

init_fields(This) ->
    put({This, 'LOAD_EARLY'}, 'ResourceLoadingLevel':new("Load Early", get({'Integer', 'MAX_VALUE'}))),
    put({This, 'LOAD_TOUCH'}, 'ResourceLoadingLevel':new("Load Touch", (get({'Integer', 'MAX_VALUE'}) - 1))),
    put({This, 'LOAD_GAME'}, 'ResourceLoadingLevel':new("Load Game", (get({'Integer', 'MAX_VALUE'}) - 2))),
    put({This, 'LEVEL'}, 'ResourceLoadingLevel':new("Level", (get({'Integer', 'MAX_VALUE'}) - 99))),
    put({This, 'MAX_LEVEL'}, 'ResourceLoadingLevel':new("Max Level", (get({'Integer', 'MAX_VALUE'}) - 100))),
    put({This, 'LOAD_ALL'}, 'ResourceLoadingLevel':new("Load All", (-1))),
    put({This, 'RESOURCE_LOADING_LEVEL_ARRAY'}, array:from_list([get({This, 'LOAD_ALL'}), get({This, 'MAX_LEVEL'}), get({This, 'LEVEL'}), get({This, 'LOAD_GAME'}), get({This, 'LOAD_TOUCH'}), get({This, 'LOAD_EARLY'})])),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'ResourceLoadingLevelFactory', instance}).

getLevelString(This, Level) when is_integer(Level) ->
        try
        lists:foreach(fun(Index) ->
            case (Level =:= (fun(Target_N66274) -> (get({Target_N66274, '$class'})):getLevel(Target_N66274) end)(array:get(Index, get({This, 'RESOURCE_LOADING_LEVEL_ARRAY'})))) of
                true ->
                throw({'$return', (fun(Target_N66314) -> (get({Target_N66314, '$class'})):getName(Target_N66314) end)(array:get(Index, get({This, 'RESOURCE_LOADING_LEVEL_ARRAY'})))});
                false -> ok
            end
        end, lists:seq(0, array:size(get({This, 'RESOURCE_LOADING_LEVEL_ARRAY'})) - 1)),
        allbinary_java:to_string(Level)
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

