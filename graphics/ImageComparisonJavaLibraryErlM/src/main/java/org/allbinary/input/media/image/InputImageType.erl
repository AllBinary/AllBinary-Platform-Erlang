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
% package org.allbinary.input.media.image
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.logic.StdUtil

-module('InputImageType').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, hashMap}, (fun(Target_N65702) -> (get({Target_N65702, '$class'})):createHashMap(Target_N65702) end)('StdUtil':getInstance())),
    put({?MODULE, 'TYPE_VECTOR'}, 'BasicArrayListD':new()),
    put({?MODULE, 'CAPTURE'}, 'InputImageType':new("Capture", 0)),
    put({?MODULE, 'COMPARISON'}, 'InputImageType':new("Comparison", 1)),
    put({?MODULE, 'MOTION'}, 'InputImageType':new("Motion", 2)),
    ok.

init_fields(This) ->
    put({This, name}, undefined),
    put({This, index}, 0),
    ok.


new(Name, Index) when (is_list(Name) orelse Name =:= undefined), is_integer(Index) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Name, Index),
    This.

init(This, Name, Index) when (is_list(Name) orelse Name =:= undefined), is_integer(Index) ->
    init_fields(This),
        put({This, name}, Name),
        put({This, index}, Index),
        (get({get({'InputImageType', 'TYPE_VECTOR'}), '$class'})):add(get({'InputImageType', 'TYPE_VECTOR'}), This),
        (get({get({'InputImageType', hashMap}), '$class'})):put(get({'InputImageType', hashMap}), (get({This, '$class'})):getName(This), This).

toString(This) ->
        lists:concat(["ImageType: ", (get({This, '$class'})):getName(This)]).

getName(This) ->
        get({This, name}).

getInstance(ImageTypeString) when (is_list(ImageTypeString) orelse ImageTypeString =:= undefined) ->
        (get({get({'InputImageType', hashMap}), '$class'})):get(get({'InputImageType', hashMap}), ImageTypeString).

getAllAsVector() ->
        get({'InputImageType', 'TYPE_VECTOR'}).

getIndex(This) ->
        get({This, index}).

