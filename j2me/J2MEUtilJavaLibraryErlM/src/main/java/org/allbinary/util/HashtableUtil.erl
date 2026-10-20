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
% package org.allbinary.util
% import java.util.Enumeration
% import jsinterop.annotations.JsType

-module('HashtableUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'HashtableUtil':new()),
    ok.

init_fields(This) ->
    put({This, enumerationUtil}, 'EnumerationUtil':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'HashtableUtil', instance}).

putAll(This, FromHashtable, Hashtable) ->
        Enumeration = (get({FromHashtable, '$class'})):keys(FromHashtable),
        put({local, keyCanBeNull}, undefined),
        put({local, valueCanBeNull}, undefined),
        (fun Loop() -> case (get({get({This, enumerationUtil}), '$class'})):hasMoreElements(get({This, enumerationUtil}), Enumeration) of true ->
            put({local, keyCanBeNull}, (get({get({This, enumerationUtil}), '$class'})):nextElement(get({This, enumerationUtil}), Enumeration)),
            put({local, valueCanBeNull}, (get({Hashtable, '$class'})):get(Hashtable, get({local, keyCanBeNull}))),
            case (get({local, valueCanBeNull}) =:= undefined) of
                true ->
                ok;
                false ->
                (get({Hashtable, '$class'})):put(Hashtable, get({local, keyCanBeNull}), get({local, valueCanBeNull}))
            end,
            Loop();
        false -> ok end end)().

getKeysAsArray(This, Hashtable) ->
        ObjectArray = array:new((get({Hashtable, '$class'})):size(Hashtable), {default, undefined}),
        put({local, index}, 0),
        Enumeration = (get({Hashtable, '$class'})):keys(Hashtable),
        (fun Loop() -> case (get({get({This, enumerationUtil}), '$class'})):hasMoreElements(get({This, enumerationUtil}), Enumeration) of true ->
            array:set(allbinary_java:first(get({local, index}), put({local, index}, get({local, index}) + 1)), (get({get({This, enumerationUtil}), '$class'})):nextElement(get({This, enumerationUtil}), Enumeration), ObjectArray),
            Loop();
        false -> ok end end)(),
        ObjectArray.

getKeysAsList(This, Hashtable) ->
        List = 'BasicArrayListS':new((get({Hashtable, '$class'})):size(Hashtable)),
        Enumeration = (get({Hashtable, '$class'})):keys(Hashtable),
        (fun Loop() -> case (get({get({This, enumerationUtil}), '$class'})):hasMoreElements(get({This, enumerationUtil}), Enumeration) of true ->
            (get({List, '$class'})):add(List, (get({get({This, enumerationUtil}), '$class'})):nextElement(get({This, enumerationUtil}), Enumeration)),
            Loop();
        false -> ok end end)(),
        List.

