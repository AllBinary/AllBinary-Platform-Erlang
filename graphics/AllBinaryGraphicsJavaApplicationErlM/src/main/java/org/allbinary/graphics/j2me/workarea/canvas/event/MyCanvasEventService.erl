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
% package org.allbinary.graphics.j2me.workarea.canvas.event

-module('MyCanvasEventService').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, listenerList}, 'EventListenerList':new()),
    put({?MODULE, 'DELETE'}, "delete"),
    put({?MODULE, 'DUPLICATE'}, "duplicate"),
    put({?MODULE, 'SELECT'}, "select"),
    put({?MODULE, 'ROTATE'}, "rotate"),
    put({?MODULE, 'EXPLODE'}, "explode"),
    put({?MODULE, 'AUTOEXPLODE'}, "autoExplode"),
    put({?MODULE, 'CENTER'}, "center"),
    ok.

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

addListener(Listener) ->
        (get({get({'MyCanvasEventService', listenerList}), '$class'})):add(get({'MyCanvasEventService', listenerList}), get({Listener, '$class'}), Listener).

removeListener(Listener) ->
        (get({get({'MyCanvasEventService', listenerList}), '$class'})):remove(get({'MyCanvasEventService', listenerList}), get({Listener, '$class'}), Listener).

% throws Exception
fire(Evt) ->
        Listeners = (get({get({'MyCanvasEventService', listenerList}), '$class'})):getListenerList(get({'MyCanvasEventService', listenerList})),
        lists:foreach(fun(I) ->
            case (array:get(I, Listeners) =:= get({array:get((I + 1), Listeners), '$class'})) of
                true ->
                case ((fun(Target_N66414) -> (get({Target_N66414, '$class'})):compareTo(Target_N66414, get({'MyCanvasEventService', 'DELETE'})) end)((get({Evt, '$class'})):getCommand(Evt)) =:= 0) of
                    true ->
                    (fun(Target_N67256) -> (get({Target_N67256, '$class'})):delete(Target_N67256, Evt) end)((array:get((I + 1), Listeners)));
                    false ->
                    case ((fun(Target_N66469) -> (get({Target_N66469, '$class'})):compareTo(Target_N66469, get({'MyCanvasEventService', 'DUPLICATE'})) end)((get({Evt, '$class'})):getCommand(Evt)) =:= 0) of
                    true ->
                    (fun(Target_N67180) -> (get({Target_N67180, '$class'})):duplicate(Target_N67180, Evt) end)((array:get((I + 1), Listeners)));
                    false ->
                    case ((fun(Target_N66524) -> (get({Target_N66524, '$class'})):compareTo(Target_N66524, get({'MyCanvasEventService', 'SELECT'})) end)((get({Evt, '$class'})):getCommand(Evt)) =:= 0) of
                    true ->
                    (fun(Target_N67104) -> (get({Target_N67104, '$class'})):select(Target_N67104, Evt) end)((array:get((I + 1), Listeners)));
                    false ->
                    case ((fun(Target_N66579) -> (get({Target_N66579, '$class'})):compareTo(Target_N66579, get({'MyCanvasEventService', 'ROTATE'})) end)((get({Evt, '$class'})):getCommand(Evt)) =:= 0) of
                    true ->
                    (fun(Target_N67028) -> (get({Target_N67028, '$class'})):rotate(Target_N67028, Evt) end)((array:get((I + 1), Listeners)));
                    false ->
                    case ((fun(Target_N66634) -> (get({Target_N66634, '$class'})):compareTo(Target_N66634, get({'MyCanvasEventService', 'EXPLODE'})) end)((get({Evt, '$class'})):getCommand(Evt)) =:= 0) of
                    true ->
                    (fun(Target_N66952) -> (get({Target_N66952, '$class'})):explode(Target_N66952, Evt) end)((array:get((I + 1), Listeners)));
                    false ->
                    case ((fun(Target_N66689) -> (get({Target_N66689, '$class'})):compareTo(Target_N66689, get({'MyCanvasEventService', 'AUTOEXPLODE'})) end)((get({Evt, '$class'})):getCommand(Evt)) =:= 0) of
                    true ->
                    (fun(Target_N66876) -> (get({Target_N66876, '$class'})):autoExplode(Target_N66876, Evt) end)((array:get((I + 1), Listeners)));
                    false ->
                    case ((fun(Target_N66744) -> (get({Target_N66744, '$class'})):compareTo(Target_N66744, get({'MyCanvasEventService', 'CENTER'})) end)((get({Evt, '$class'})):getCommand(Evt)) =:= 0) of
                    true ->
                    (fun(Target_N66800) -> (get({Target_N66800, '$class'})):center(Target_N66800, Evt) end)((array:get((I + 1), Listeners)));
                    false -> ok
                end
                end
                end
                end
                end
                end
                end;
                false -> ok
            end
        end, lists:seq(0, array:size(Listeners) - 1, 2)).

