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
% package org.allbinary.game.input.event
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.util.event.AllBinaryEventObject

-module('GameKeyEvent').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('AllBinaryEventObject', Function, Arguments).

static_init() ->
    put({?MODULE, 'NONE'}, 'GameKeyEvent':new(get({'NullUtil':getInstance(), 'NULL_OBJECT'}), (-1), (-1), (-1), (-1), false)),
    ok.

init_fields(This) ->
    put({This, sourceId}, 0),
    put({This, repeated}, false),
    put({This, key}, 0),
    put({This, gameActionKey}, 0),
    put({This, originalKey}, 0),
    ok.


createEvent(AnyType, SourceId, Key) when is_integer(SourceId), is_integer(Key) ->
        'GameKeyEvent':new(AnyType, SourceId, 0, 0, Key, false).

new(AnyType, SourceId, OriginalKey, GameActionKey, Key, Repeated) when is_integer(SourceId), is_integer(OriginalKey), is_integer(GameActionKey), is_integer(Key), is_boolean(Repeated) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, AnyType, SourceId, OriginalKey, GameActionKey, Key, Repeated),
    This.

'$init'(This, AnyType, SourceId, OriginalKey, GameActionKey, Key, Repeated) when is_integer(SourceId), is_integer(OriginalKey), is_integer(GameActionKey), is_integer(Key), is_boolean(Repeated) ->
        'AllBinaryEventObject':'$init'(This, AnyType),
        init_fields(This),
        put({This, sourceId}, SourceId),
        (get({This, '$class'})):setOriginalKey(This, OriginalKey),
        put({This, key}, Key),
        (get({This, '$class'})):setGameActionKey(This, GameActionKey),
        (get({This, '$class'})):setRepeatEvents(This, Repeated).

init(This, AnyType) ->
        (get({This, '$class'})):setSource(This, AnyType).

setRepeatEvents(This, Repeated) when is_boolean(Repeated) ->
        put({This, repeated}, Repeated).

hasRepeatEvents(This) ->
        get({This, repeated}).

getKey(This) ->
        get({This, key}).

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "\nKey: "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, (get({This, '$class'})):getKey(This)),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

getOriginalKey(This) ->
        get({This, originalKey}).

setOriginalKey(This, OriginalKey) when is_integer(OriginalKey) ->
        put({This, originalKey}, OriginalKey).

getGameActionKey(This) ->
        get({This, gameActionKey}).

setGameActionKey(This, GameActionKey) when is_integer(GameActionKey) ->
        put({This, gameActionKey}, GameActionKey).

getSourceId(This) ->
        get({This, sourceId}).

