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
% package org.allbinary.image
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('ImageTypeUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'SINGLETON'}, 'ImageTypeUtil':new()),
    ok.

init_fields(This) ->
    put({This, 'PNG'}, "png"),
    put({This, 'JPG'}, "jpg"),
    put({This, 'GIF'}, "gif"),
    put({This, list}, 'BasicArrayListD':new()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        (get({get({This, list}), '$class'})):add(get({This, list}), get({This, 'JPG'})),
        (get({get({This, list}), '$class'})):add(get({This, list}), get({This, 'GIF'})),
        (get({get({This, list}), '$class'})):add(get({This, list}), get({This, 'PNG'})).

isSupported(This, MediaFileType) when (is_list(MediaFileType) orelse MediaFileType =:= undefined) ->
        put({local, mediaFileType}, MediaFileType),
        try
        put({local, mediaFileType}, string:lowercase(get({local, mediaFileType}))),
        lists:foreach(fun(Index) ->
            Name = (get({get({This, list}), '$class'})):get(get({This, list}), Index),
            case ((get({get({local, mediaFileType}), '$class'})):compareTo(get({local, mediaFileType}), Name) =:= 0) of
                true ->
                throw({'$return', true});
                false -> ok
            end
        end, lists:seq(((get({get({This, list}), '$class'})):size(get({This, list})) - 1), 0, -1)),
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getInstance() ->
        get({'ImageTypeUtil', 'SINGLETON'}).

