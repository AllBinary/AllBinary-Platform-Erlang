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
% package org.allbinary.input.motion.button
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListUtil

-module('TouchButtonFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'SINGLETON'}, 'TouchButtonFactory':new()),
    ok.

init_fields(This) ->
    put({This, 'LIST'}, (fun(Target_N65761) -> (get({Target_N65761, '$class'})):getImmutableInstance(Target_N65761) end)('BasicArrayListUtil':getInstance())),
    put({This, list}, get({This, 'LIST'})),
    put({This, savedList}, get({This, 'LIST'})),
    put({This, saved}, false),
    ok.


getInstance() ->
        get({'TouchButtonFactory', 'SINGLETON'}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

defaultList(This) ->
        put({This, list}, get({This, 'LIST'})),
        (get({This, '$class'})):toggle(This, false, get({This, 'LIST'})).

toggle(This, Save, List) when is_boolean(Save) ->
        case (List =/= (fun(Target_N66046) -> (get({Target_N66046, '$class'})):getImmutableInstance(Target_N66046) end)('BasicArrayListUtil':getInstance())) of
            true ->
            put({This, savedList}, List),
            case (not get({This, saved})) of
                true ->
                put({This, list}, get({This, savedList}));
                false -> ok
            end;
            false ->
            case Save of
                true ->
                case (not get({This, saved})) of
                    true ->
                    put({This, saved}, true),
                    put({This, savedList}, get({This, list})),
                    put({This, list}, get({This, 'LIST'}));
                    false ->
                    ok
                end;
                false ->
                put({This, list}, get({This, savedList})),
                put({This, saved}, false)
            end
        end.

% throws Exception
setList(This, List) ->
        case (List =:= undefined) of
            true ->
            erlang:error({'Exception', "Null List"});
            false -> ok
        end,
        put({This, list}, List).

getList(This) ->
        get({This, list}).

