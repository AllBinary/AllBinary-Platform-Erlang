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
% package org.allbinary.logic.communication.http
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.TsUtil
% import org.allbinary.logic.StdUtil

-module('AcceptableResponseUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'AcceptableResponseUtil':new()),
        (fun(Target_N65799) -> (get({Target_N65799, '$class'})):hashCode(Target_N65799, get({'AcceptableResponseFactory':getInstance(), 'HTML'})) end)('TsUtil':getInstance()),
    ok.

init_fields(This) ->
    put({This, candidateVector}, 'BasicArrayListD':new()),
    put({This, tagNameVector}, 'BasicArrayListD':new()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'AcceptableResponseUtil', instance}).


get(This, Index) when is_integer(Index) ->
        (get({get({This, candidateVector}), '$class'})):get(get({This, candidateVector}), Index).

getTagName(This, Index) when is_integer(Index) ->
        (get({get({This, tagNameVector}), '$class'})):get(get({This, tagNameVector}), Index).

size(This) ->
        (get({get({This, candidateVector}), '$class'})):size(get({This, candidateVector})).

