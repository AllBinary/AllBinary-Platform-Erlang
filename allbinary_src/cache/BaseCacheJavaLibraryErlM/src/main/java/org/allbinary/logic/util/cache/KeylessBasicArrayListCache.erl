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
% package org.allbinary.logic.util.cache
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListUtil

-module('KeylessBasicArrayListCache').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('IndexedBasicArrayListCache', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, basicArrayListUtil}, 'BasicArrayListUtil':getInstance()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'IndexedBasicArrayListCache':'$init'(This),
    init_fields(This),
        ok.

get(This) ->
        try
            case (get({This, index}) >= (get({get({This, list}), '$class'})):size(get({This, list}))) of
                true ->
                (get({This, '$class'})):addDefault(This);
                false -> ok
            end,
            List = (get({This, '$class'})):getAt(This, allbinary_java:first(get({This, index}), put({This, index}, get({This, index}) + 1))),
            List
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'GET'}), E),
            (get({get({This, basicArrayListUtil}), '$class'})):getImmutableInstance(get({This, basicArrayListUtil}))
        end.

clear(This) ->
        'IndexedBasicArrayListCache':clear(This),
        put({local, basicArrayList}, undefined),
        lists:foreach(fun(Index) ->
            put({local, basicArrayList}, (array:get(Index, get({get({This, list}), objectArray})))),
            (get({get({local, basicArrayList}), '$class'})):clear(get({local, basicArrayList}))
        end, lists:seq(((get({get({This, list}), '$class'})):size(get({This, list})) - 1), 0, -1)).

log(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "S: "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, (get({get({This, list}), '$class'})):size(get({This, list}))),
        S_LABEL = " s: ",
        put({local, basicArrayList}, undefined),
        lists:foreach(fun(Index) ->
            (get({StringBuffer, '$class'})):append(StringBuffer, S_LABEL),
            put({local, basicArrayList}, (array:get(Index, get({get({This, list}), objectArray})))),
            (get({StringBuffer, '$class'})):appendint(StringBuffer, (get({get({local, basicArrayList}), '$class'})):size(get({local, basicArrayList})))
        end, lists:seq(((get({get({This, list}), '$class'})):size(get({This, list})) - 1), 0, -1)),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

