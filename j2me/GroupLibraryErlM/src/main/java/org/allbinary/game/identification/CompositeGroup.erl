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
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('CompositeGroup').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, groupInterface}, undefined),
    put({This, list}, 'BasicArrayListD':new()),
    ok.


new(GroupInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, GroupInterface),
    This.

init(This, GroupInterface) ->
    init_fields(This),
        put({This, groupInterface}, GroupInterface).

clear(This) ->
        (get({get({This, list}), '$class'})):clear(get({This, list})).

add(This, GroupInterface) ->
        CommonStrings = 'CommonStrings':getInstance(),
        GroupCommonFactory = 'GroupCommonFactory':getInstance(),
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({GroupCommonFactory, 'ADDING_LABEL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({GroupInterface, '$class'})):toString(GroupInterface)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({GroupCommonFactory, 'TO_LABEL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N66299) -> (get({Target_N66299, '$class'})):toString(Target_N66299, get({This, groupInterface})) end)('StringUtil':getInstance())),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, get({CommonStrings, 'ADD'})),
        (get({get({This, list}), '$class'})):add(get({This, list}), GroupInterface).

isInGroup(This, GroupInterface) ->
        try
        case (get({get({This, list}), '$class'})):contains(get({This, list}), GroupInterface) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getGroup(This) ->
        get({This, groupInterface}).

