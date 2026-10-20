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
% package org.allbinary.resources
% import org.allbinary.logic.StdUtil
% import org.allbinary.util.ABHashtable

-module('KeyValueFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'KeyValueFactory':new()),
    ok.

init_fields(This) ->
    put({This, 'MAP'}, (fun(Target_N65759) -> (get({Target_N65759, '$class'})):createHashtable(Target_N65759) end)('StdUtil':getInstance())),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'KeyValueFactory', instance}).

get(This, Key) when (is_list(Key) orelse Key =:= undefined) ->
        try
        Value = (get({get({This, 'MAP'}), '$class'})):get(get({This, 'MAP'}), Key),
        case (Value =:= undefined) of
            true ->
            throw({'$return', Key});
            false -> ok
        end,
        Value
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

