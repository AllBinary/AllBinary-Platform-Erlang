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
% package org.allbinary.logic.communication.log
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.logic.StdUtil

-module('LogBuffer').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, logEntryVector}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        put({This, logEntryVector}, 'BasicArrayListD':new()).

add(This, Log) ->
        (get({get({This, logEntryVector}), '$class'})):add(get({This, logEntryVector}), Log).

logAll(This) ->
        Size = (get({get({This, logEntryVector}), '$class'})):size(get({This, logEntryVector})),
        lists:foreach(fun(Index) ->
            Log = (get({get({This, logEntryVector}), '$class'})):get(get({This, logEntryVector}), Index),
            (get({get({This, logUtil}), '$class'})):putL(get({This, logUtil}), Log)
        end, lists:seq(0, Size - 1)).

