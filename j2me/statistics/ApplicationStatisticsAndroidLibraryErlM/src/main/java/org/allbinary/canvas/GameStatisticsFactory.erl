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
% package org.allbinary.canvas
% import org.allbinary.logic.string.StringMaker

-module('GameStatisticsFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('AndroidGameStatistics', Function, Arguments).

static_init() ->
    put({?MODULE, 'SINGLETON'}, 'GameStatisticsFactory':new()),
    ok.

init_fields(This) ->
    put({This, stringBuffer}, 'StringMaker':new()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'AndroidGameStatistics':'$init'(This),
    init_fields(This).


getInstance() ->
        get({'GameStatisticsFactory', 'SINGLETON'}).

add(This, String) when (is_list(String) orelse String =:= undefined) ->
        case ((get({get({This, stringBuffer}), '$class'})):length(get({This, stringBuffer})) > 12000) of
            true ->
            (get({get({This, stringBuffer}), '$class'})):delete(get({This, stringBuffer}), 0, (get({get({This, stringBuffer}), '$class'})):length(get({This, stringBuffer}))),
            (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), "Old Stats Cleared");
            false -> ok
        end,
        (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), String).

toString(This) ->
        (fun(Target_N66001) -> (get({Target_N66001, '$class'})):toString(Target_N66001) end)((fun(Target_N66008) -> (get({Target_N66008, '$class'})):append(Target_N66008, (get({get({This, stringBuffer}), '$class'})):toString(get({This, stringBuffer}))) end)((fun(Target_N66015) -> (get({Target_N66015, '$class'})):append(Target_N66015, 'AndroidGameStatistics':toString(This)) end)('StringMaker':new()))).

