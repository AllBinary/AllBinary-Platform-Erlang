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
% package org.allbinary.logic.visual.media
% import java.util.HashMap
% import org.allbinary.logic.StdUtil

-module('MediaData').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, hashMap}, (fun(Target_N65652) -> (get({Target_N65652, '$class'})):createHashMap(Target_N65652) end)('StdUtil':getInstance())),
    ok.

init_fields(This) ->
    put({This, name}, undefined),
    put({This, type}, undefined),
    put({This, extension}, undefined),
    ok.


new(A_Name) when (is_list(A_Name) orelse A_Name =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, A_Name),
    This.

'$init'(This, A_Name) when (is_list(A_Name) orelse A_Name =:= undefined) ->
    init_fields(This),
        put({This, name}, A_Name),
        put({This, extension}, lists:concat([".", get({This, name})])),
        put({This, type}, get({'MediaTypeData':getInstance(), 'NOT_RESIZABLE_MEDIA'})),
        (get({get({'MediaData', hashMap}), '$class'})):put(get({'MediaData', hashMap}), A_Name, This).

getName(This) ->
        get({This, name}).

getType(This) ->
        get({This, type}).

getExtension(This) ->
        get({This, extension}).

isConvertableTo(This, MediaData) ->
        try
        case ((This =:= get({'MediaDataFactory':getInstance(), 'GIF'})) andalso (MediaData =:= get({'MediaDataFactory':getInstance(), 'JPG'}))) of
            true ->
            throw({'$return', true});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

toString(This) ->
        (get({This, '$class'})):getName(This).

% throws Exception
get(A_Name) when (is_list(A_Name) orelse A_Name =:= undefined) ->
        try
        MediaData = (get({get({'MediaData', hashMap}), '$class'})):get(get({'MediaData', hashMap}), A_Name),
        case (MediaData =/= undefined) of
            true ->
            throw({'$return', MediaData});
            false ->
            erlang:error({'Exception', "No Such MediaData"})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getDefault() ->
        get({'MediaDataFactory':getInstance(), 'JPG'}).

toHashMap() ->
        get({'MediaData', hashMap}).

