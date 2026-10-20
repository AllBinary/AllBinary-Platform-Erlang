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
% package org.allbinary.game.layer.identification
% import org.allbinary.game.identification.Group
% import org.allbinary.game.identification.GroupInterfaceCompositeInterface
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.layer.event.LayerManagerEvent
% import org.allbinary.layer.event.LayerManagerEventHandler
% import org.allbinary.layer.event.LayerManagerEventListener
% import org.allbinary.logic.communication.log.ForcedLogUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.util.event.AllBinaryEventObject
% import org.allbinary.logic.util.event.EventStrings
% import org.allbinary.string.CommonLabels
% import org.allbinary.string.CommonSeps
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('GroupLayerManagerListener').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('LayerManagerEventListener', Function, Arguments).

static_init() ->
    put({?MODULE, 'SINGLETON'}, 'GroupLayerManagerListener':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, list}, 'BasicArrayListD':new()),
    ok.


getInstance() ->
        get({'GroupLayerManagerListener', 'SINGLETON'}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'LayerManagerEventListener':'$init'(This),
    init_fields(This),
        (fun(Target_N66255) -> (get({Target_N66255, '$class'})):addListener(Target_N66255, This) end)('LayerManagerEventHandler':getInstance()).

clear(This) ->
        put({local, groupList}, undefined),
        Size = (get({get({This, list}), '$class'})):size(get({This, list})),
        lists:foreach(fun(Index) ->
            put({local, groupList}, array:get(Index, get({get({This, list}), objectArray}))),
            (get({get({local, groupList}), '$class'})):clear(get({local, groupList}))
        end, lists:seq((Size - 1), 0, -1)).

getGroupSizeFromInterface(This, GroupInterfaceCompositeInterface) ->
        GroupInterfaceArray = (get({GroupInterfaceCompositeInterface, '$class'})):getGroupInterface(GroupInterfaceCompositeInterface),
        (get({This, '$class'})):getGroupSize(This, array:get(0, GroupInterfaceArray)).

getGroupSize(This, GroupInterface) ->
        Id = trunc((get({GroupInterface, '$class'})):getGroupId(GroupInterface)),
        (get({This, '$class'})):getGroupSizeById(This, Id).

getList(This, GroupInterface) ->
        Id = trunc((get({GroupInterface, '$class'})):getGroupId(GroupInterface)),
        (get({This, '$class'})):getListById(This, Id).

getListById(This, GroupId) when is_integer(GroupId) ->
        GroupList = array:get(GroupId, get({get({This, list}), objectArray})),
        GroupList.

getGroupSizeById(This, GroupId) when is_integer(GroupId) ->
        GroupList = array:get(GroupId, get({get({This, list}), objectArray})),
        Size = (get({GroupList, '$class'})):size(GroupList),
        Size.

areAllOtherGroupsEmpty(This, GroupInterface) ->
        try
        Id = trunc((get({GroupInterface, '$class'})):getGroupId(GroupInterface)),
        Size = (get({get({This, list}), '$class'})):size(get({This, list})),
        lists:foreach(fun(Index) ->
            case (Id =/= Index) of
                true ->
                GroupSize = (get({This, '$class'})):getGroupSizeById(This, Index),
                case (GroupSize =/= 0) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N67540) -> (get({Target_N67540, '$class'})):toString(Target_N67540) end)((fun(Target_N67547) -> (get({Target_N67547, '$class'})):appendint(Target_N67547, GroupSize) end)((fun(Target_N67554) -> (get({Target_N67554, '$class'})):append(Target_N67554, "Group Size: ") end)('StringMaker':new()))), This, "areAllOtherGroupsEmpty"),
                    throw({'$return', false});
                    false -> ok
                end;
                false -> ok
            end
        end, lists:seq((Size - 1), 0, -1)),
        true
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isIdInList(This, Id, ExcludeGroupList) when is_integer(Id) ->
        try
        Size = (get({ExcludeGroupList, '$class'})):size(ExcludeGroupList),
        put({local, groupInterfaceArray}, undefined),
        put({local, groupInterface}, undefined),
        put({local, groupId}, 0),
        lists:foreach(fun(Index) ->
            put({local, groupInterfaceArray}, array:get(Index, get({ExcludeGroupList, objectArray}))),
            Size2 = array:size(get({local, groupInterfaceArray})),
            lists:foreach(fun(Index2) ->
                put({local, groupInterface}, array:get(Index2, get({local, groupInterfaceArray}))),
                put({local, groupId}, trunc((get({get({local, groupInterface}), '$class'})):getGroupId(get({local, groupInterface})))),
                case (get({local, groupId}) =:= Id) of
                    true ->
                    throw({'$return', true});
                    false -> ok
                end
            end, lists:seq(0, Size2 - 1))
        end, lists:seq((Size - 1), 0, -1)),
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

areAllOtherGroupsLessThan(This, ExcludeGroupList, MaxSize) when is_integer(MaxSize) ->
        try
        Size = (get({get({This, list}), '$class'})):size(get({This, list})),
        lists:foreach(fun(Index) ->
            case (not (get({This, '$class'})):isIdInList(This, Index, ExcludeGroupList)) of
                true ->
                GroupSize = (get({This, '$class'})):getGroupSizeById(This, Index),
                case (GroupSize >= MaxSize) of
                    true ->
                    throw({'$return', false});
                    false -> ok
                end;
                false -> ok
            end
        end, lists:seq((Size - 1), 0, -1)),
        true
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

init(This, Total) when is_integer(Total) ->
        (fun Loop() -> case ((get({get({This, list}), '$class'})):size(get({This, list})) =< (Total + 1)) of true ->
            (get({get({This, list}), '$class'})):add(get({This, list}), 'BasicArrayListD':new()),
            Loop();
        false -> ok end end)().

onEvent(This, EventObject) ->
        'ForcedLogUtil':log(get({'EventStrings':getInstance(), 'PERFORMANCE_MESSAGE'}), This).

% throws Exception
onCreateLayerManagerEvent(This, LayerManagerEvent) ->
        LayerInterface = (get({LayerManagerEvent, '$class'})):getLayerInterface(LayerManagerEvent),
        GroupInterfaceArray = (get({LayerInterface, '$class'})):getGroupInterface(LayerInterface),
        Size = array:size(GroupInterfaceArray),
        put({local, id}, 0),
        put({local, groupList}, undefined),
        lists:foreach(fun(Index) ->
            put({local, id}, trunc((fun(Target_N69177) -> (get({Target_N69177, '$class'})):getGroupId(Target_N69177) end)(array:get(Index, GroupInterfaceArray)))),
            put({local, groupList}, array:get(get({local, id}), get({get({This, list}), objectArray}))),
            case (get({local, groupList}) =:= undefined) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N69319) -> (get({Target_N69319, '$class'})):toString(Target_N69319) end)((fun(Target_N69326) -> (get({Target_N69326, '$class'})):appendint(Target_N69326, get({local, id})) end)((fun(Target_N69333) -> (get({Target_N69333, '$class'})):append(Target_N69333, "id: ") end)('StringMaker':new()))), This, "onCreateLayerManagerEvent");
                false -> ok
            end,
            case (not (get({get({local, groupList}), '$class'})):contains(get({local, groupList}), LayerInterface)) of
                true ->
                (get({get({local, groupList}), '$class'})):add(get({local, groupList}), LayerInterface);
                false ->
                ok
            end
        end, lists:seq(0, Size - 1)).

% throws Exception
onDeleteLayerManagerEvent(This, LayerManagerEvent) ->
        LayerInterface = (get({LayerManagerEvent, '$class'})):getLayerInterface(LayerManagerEvent),
        GroupInterfaceArray = (get({LayerInterface, '$class'})):getGroupInterface(LayerInterface),
        Size = array:size(GroupInterfaceArray),
        put({local, id}, 0),
        put({local, groupList}, undefined),
        lists:foreach(fun(Index) ->
            put({local, id}, trunc((fun(Target_N69842) -> (get({Target_N69842, '$class'})):getGroupId(Target_N69842) end)(array:get(Index, GroupInterfaceArray)))),
            put({local, groupList}, array:get(get({local, id}), get({get({This, list}), objectArray}))),
            (get({get({local, groupList}), '$class'})):remove(get({local, groupList}), LayerInterface)
        end, lists:seq(0, Size - 1)).

log(This) ->
        StringBuffer = 'StringMaker':new(),
        GROUP = "Group: ",
        SPACE = get({'CommonSeps':getInstance(), 'SPACE'}),
        TOTAL_LABEL = get({'CommonLabels':getInstance(), 'TOTAL_LABEL'}),
        Size = (get({get({This, list}), '$class'})):size(get({This, list})),
        lists:foreach(fun(Index) ->
            GroupList = array:get(Index, get({get({This, list}), objectArray})),
            (get({StringBuffer, '$class'})):append(StringBuffer, GROUP),
            (get({StringBuffer, '$class'})):appendint(StringBuffer, Index),
            (get({StringBuffer, '$class'})):append(StringBuffer, SPACE),
            (get({StringBuffer, '$class'})):append(StringBuffer, TOTAL_LABEL),
            (get({StringBuffer, '$class'})):appendint(StringBuffer, (get({GroupList, '$class'})):size(GroupList)),
            (get({StringBuffer, '$class'})):append(StringBuffer, SPACE)
        end, lists:seq((Size - 1), 0, -1)),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "log").

