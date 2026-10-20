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
% package org.allbinary.media.image.cache
% import java.util.HashMap
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.string.StringMaker

-module('BufferedImageInfoFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, hashMap}, (fun(Target_N65682) -> (get({Target_N65682, '$class'})):createHashMap(Target_N65682) end)('StdUtil':getInstance())),
    ok.

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

getInstance(Width, Height, Type) when is_integer(Width), is_integer(Height), is_integer(Type) ->
        Stringbuffer = 'StringMaker':new(),
        (get({Stringbuffer, '$class'})):appendint(Stringbuffer, Width),
        (get({Stringbuffer, '$class'})):appendint(Stringbuffer, Height),
        (get({Stringbuffer, '$class'})):appendint(Stringbuffer, Type),
        Key = (get({Stringbuffer, '$class'})):toString(Stringbuffer),
        put({local, bufferedImageInfo}, (get({get({'BufferedImageInfoFactory', hashMap}), '$class'})):get(get({'BufferedImageInfoFactory', hashMap}), Key)),
        case (get({local, bufferedImageInfo}) =:= undefined) of
            true ->
            put({local, bufferedImageInfo}, 'BufferedImageInfo':new(Width, Height, Type)),
            (get({get({'BufferedImageInfoFactory', hashMap}), '$class'})):put(get({'BufferedImageInfoFactory', hashMap}), Key, get({local, bufferedImageInfo}));
            false -> ok
        end,
        get({local, bufferedImageInfo}).

