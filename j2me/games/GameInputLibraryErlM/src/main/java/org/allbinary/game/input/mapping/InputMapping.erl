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
% package org.allbinary.game.input.mapping
% import org.allbinary.game.input.Input
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.string.CommonLabels
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.logic.StdUtil
% import org.allbinary.util.ABHashtable

-module('InputMapping').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, hashtable}, (fun(Target_N65986) -> (get({Target_N65986, '$class'})):createHashtable(Target_N65986) end)('StdUtil':getInstance())),
    put({This, mappedList}, 'BasicArrayListD':new()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

getTotalMapped(This) ->
        (get({get({This, hashtable}), '$class'})):size(get({This, hashtable})).

isDefaultNew(This) ->
        false.

getDefault(This) ->
        'InputToGameKeyMapping':getNullInstance().

removeAll(This) ->
        (get({get({This, hashtable}), '$class'})):clear(get({This, hashtable})),
        (get({get({This, mappedList}), '$class'})):clear(get({This, mappedList})).

remove(This, Input, MappedToInput) ->
        StringBuffer = 'StringMaker':new(),
        StringUtil = 'StringUtil':getInstance(),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'CommonLabels':getInstance(), 'START_LABEL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({StringUtil, '$class'})):toString(StringUtil, Input)),
        (get({StringBuffer, '$class'})):append(StringBuffer, " == "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({StringUtil, '$class'})):toString(StringUtil, MappedToInput)),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "InputMapping::remove"),
        List = (get({This, '$class'})):getMappedInput(This, Input),
        case (get({List, '$class'})):contains(List, MappedToInput) of
            true ->
            (get({List, '$class'})):remove(List, MappedToInput),
            (get({get({This, mappedList}), '$class'})):remove(get({This, mappedList}), MappedToInput),
            (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
            (get({StringBuffer, '$class'})):append(StringBuffer, "Removed: "),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({StringUtil, '$class'})):toString(StringUtil, Input)),
            (get({StringBuffer, '$class'})):append(StringBuffer, " == "),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({StringUtil, '$class'})):toString(StringUtil, MappedToInput)),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "InputMapping::remove");
            false ->
            (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
            (get({StringBuffer, '$class'})):append(StringBuffer, "Not Deleted: "),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({StringUtil, '$class'})):toString(StringUtil, Input)),
            (get({StringBuffer, '$class'})):append(StringBuffer, " == "),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({StringUtil, '$class'})):toString(StringUtil, MappedToInput)),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "InputMapping::remove")
        end.

% throws Exception
addMapping(This, InputToGameKeyMapping) ->
        erlang:error({'Exception', get({get({This, commonStrings}), 'NOT_IMPLEMENTED'})}).

add(This, Input, MappedToInput) ->
        List = (get({This, '$class'})):getMappedInput(This, Input),
        case (not (get({List, '$class'})):contains(List, MappedToInput)) of
            true ->
            (get({List, '$class'})):add(List, MappedToInput),
            (get({get({This, mappedList}), '$class'})):add(get({This, mappedList}), MappedToInput);
            false -> ok
        end.

isMapped(This, Input) ->
        (get({get({This, mappedList}), '$class'})):contains(get({This, mappedList}), Input).

getMappedInput(This, Id) ->
        try
        MappingInputCanBeNullList = (get({get({This, hashtable}), '$class'})):get(get({This, hashtable}), Id),
        case (MappingInputCanBeNullList =:= undefined) of
            true ->
            List = 'BasicArrayListD':new(),
            (get({get({This, hashtable}), '$class'})):put(get({This, hashtable}), Id, List),
            throw({'$return', List});
            false -> ok
        end,
        MappingInputCanBeNullList
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getHashtable(This) ->
        get({This, hashtable}).

