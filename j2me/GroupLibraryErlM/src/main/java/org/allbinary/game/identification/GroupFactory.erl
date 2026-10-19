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
% package org.allbinary.game.identification
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('GroupFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'GroupFactory':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, 'NULL_GROUP_ARRAY'}, array:new(0, {default, undefined})),
    put({This, list}, 'BasicArrayListD':new()),
    put({This, index}, 0),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'GroupFactory', instance}).

getNextGroup(This) ->
        Group = array:get(get({This, index}), get({get({This, list}), objectArray})),
        put({This, index}, get({This, index}) + 1),
        Group.

getNextGroupByName(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
        Group = (get({This, '$class'})):getNextGroup(This),
        (get({Group, '$class'})):setName(Group, Name),
        Group.

init(This, Groups, NameArray) when is_integer(Groups), (is_tuple(NameArray) orelse NameArray =:= undefined) ->
        StringMaker = 'StringMaker':new(),
        StringUtil = 'StringUtil':getInstance(),
        TEAM = "Team ",
        (get({get({This, list}), '$class'})):clear(get({This, list})),
        put({This, index}, 0),
        put({local, size}, (get({get({This, list}), '$class'})):size(get({This, list}))),
        (fun Loop() -> case (get({local, size}) < Groups) of true ->
            put({local, name}, get({StringUtil, 'EMPTY_STRING'})),
            case (get({local, size}) < array:size(NameArray)) of
                true ->
                put({local, name}, array:get(get({local, size}), NameArray));
                false ->
                (get({StringMaker, '$class'})):delete(StringMaker, 0, (get({StringMaker, '$class'})):length(StringMaker)),
                put({local, name}, (fun(Target_N66681) -> (get({Target_N66681, '$class'})):toString(Target_N66681) end)((fun(Target_N66688) -> (get({Target_N66688, '$class'})):appendint(Target_N66688, get({local, size})) end)((get({StringMaker, '$class'})):append(StringMaker, TEAM))))
            end,
            (get({get({This, list}), '$class'})):add(get({This, list}), 'Group':new(get({local, name}), ((get({local, size}) + 3)))),
            put({local, size}, get({local, size}) + 1),
            Loop();
        false -> ok end end)().

