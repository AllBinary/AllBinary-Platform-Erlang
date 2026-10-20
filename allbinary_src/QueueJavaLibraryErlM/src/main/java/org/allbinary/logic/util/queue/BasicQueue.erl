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
% package org.allbinary.logic.util.queue
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('BasicQueue').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, queueVector}, 'BasicArrayListD':new()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

% throws Exception
offer(This, AnyType) ->
        (get({get({This, queueVector}), '$class'})):add(get({This, queueVector}), AnyType),
        true.

remove(This, AnyType) ->
        (get({get({This, queueVector}), '$class'})):remove(get({This, queueVector}), AnyType).

removeLast(This) ->
        AnyType = (get({get({This, queueVector}), '$class'})):get(get({This, queueVector}), ((get({get({This, queueVector}), '$class'})):size(get({This, queueVector})) - 1)),
        (get({get({This, queueVector}), '$class'})):remove(get({This, queueVector}), AnyType),
        AnyType.

