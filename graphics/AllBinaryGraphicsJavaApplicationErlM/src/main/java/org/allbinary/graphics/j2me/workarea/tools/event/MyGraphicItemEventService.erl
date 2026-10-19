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
% package org.allbinary.graphics.j2me.workarea.tools.event

-module('MyGraphicItemEventService').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, listenerList}, 'EventListenerList':new()),
    put({?MODULE, 'DELETE'}, "delete"),
    put({?MODULE, 'DESELECT'}, "deselect"),
    put({?MODULE, 'SELECT'}, "select"),
    put({?MODULE, 'DUPLICATE'}, "duplicate"),
    put({?MODULE, 'ROTATE'}, "rotate"),
    ok.

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

addListener(Listener) ->
        (get({get({'MyGraphicItemEventService', listenerList}), '$class'})):add(get({'MyGraphicItemEventService', listenerList}), get({Listener, '$class'}), Listener).

removeListener(Listener) ->
        (get({get({'MyGraphicItemEventService', listenerList}), '$class'})):remove(get({'MyGraphicItemEventService', listenerList}), get({Listener, '$class'}), Listener).

% throws Exception
fire(Evt) ->
        Listeners = (get({get({'MyGraphicItemEventService', listenerList}), '$class'})):getListenerList(get({'MyGraphicItemEventService', listenerList})),
        lists:foreach(fun(I) ->
            case (array:get(I, Listeners) =:= get({array:get((I + 1), Listeners), '$class'})) of
                true ->
                case ((fun(Target_N66346) -> (get({Target_N66346, '$class'})):compareTo(Target_N66346, get({'MyGraphicItemEventService', 'SELECT'})) end)((get({Evt, '$class'})):getCommand(Evt)) =:= 0) of
                    true ->
                    (fun(Target_N66926) -> (get({Target_N66926, '$class'})):highlight(Target_N66926, Evt) end)((array:get((I + 1), Listeners)));
                    false ->
                    case ((fun(Target_N66401) -> (get({Target_N66401, '$class'})):compareTo(Target_N66401, get({'MyGraphicItemEventService', 'DESELECT'})) end)((get({Evt, '$class'})):getCommand(Evt)) =:= 0) of
                    true ->
                    (fun(Target_N66850) -> (get({Target_N66850, '$class'})):deselect(Target_N66850, Evt) end)((array:get((I + 1), Listeners)));
                    false ->
                    case ((fun(Target_N66456) -> (get({Target_N66456, '$class'})):compareTo(Target_N66456, get({'MyGraphicItemEventService', 'DELETE'})) end)((get({Evt, '$class'})):getCommand(Evt)) =:= 0) of
                    true ->
                    (fun(Target_N66774) -> (get({Target_N66774, '$class'})):delete(Target_N66774, Evt) end)((array:get((I + 1), Listeners)));
                    false ->
                    case ((fun(Target_N66511) -> (get({Target_N66511, '$class'})):compareTo(Target_N66511, get({'MyGraphicItemEventService', 'DUPLICATE'})) end)((get({Evt, '$class'})):getCommand(Evt)) =:= 0) of
                    true ->
                    (fun(Target_N66698) -> (get({Target_N66698, '$class'})):duplicate(Target_N66698, Evt) end)((array:get((I + 1), Listeners)));
                    false ->
                    case ((fun(Target_N66566) -> (get({Target_N66566, '$class'})):compareTo(Target_N66566, get({'MyGraphicItemEventService', 'ROTATE'})) end)((get({Evt, '$class'})):getCommand(Evt)) =:= 0) of
                    true ->
                    (fun(Target_N66622) -> (get({Target_N66622, '$class'})):rotate(Target_N66622, Evt) end)((array:get((I + 1), Listeners)));
                    false -> ok
                end
                end
                end
                end
                end;
                false -> ok
            end
        end, lists:seq(0, array:size(Listeners) - 1, 2)).

