% Generated Code Do Not Modify
% package org.allbinary.android
% import android.app.Activity
% import android.view.View
% import android.view.ViewGroup

-module('ViewSwapper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'NULL_VIEW_ARRAY'}, array:new(0, {default, undefined})),
    ok.

init_fields(This) ->
    put({This, rootViewId}, 0),
    put({This, activity}, undefined),
    put({This, currentMainViewId}, (-1)),
    put({This, mainViewArray}, get({'ViewSwapper', 'NULL_VIEW_ARRAY'})),
    put({This, topViewArray}, get({'ViewSwapper', 'NULL_VIEW_ARRAY'})),
    ok.


new(Activity, RootViewId) when is_integer(RootViewId) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Activity, RootViewId),
    This.

'$init'(This, Activity, RootViewId) when is_integer(RootViewId) ->
    init_fields(This),
        put({This, activity}, Activity),
        put({This, rootViewId}, RootViewId).

setMainViews(This, ViewArray) when (is_tuple(ViewArray) orelse ViewArray =:= undefined) ->
        put({This, mainViewArray}, ViewArray).

setTopViewArray(This, TopViewArray) when (is_tuple(TopViewArray) orelse TopViewArray =:= undefined) ->
        put({This, topViewArray}, TopViewArray).

setMainView(This, Id) when is_integer(Id) ->
        ViewGroup = (get({get({This, activity}), '$class'})):findViewById(get({This, activity}), get({This, rootViewId})),
        case (Id =/= get({This, currentMainViewId})) of
            true ->
            lists:foreach(fun(Index) ->
                (get({ViewGroup, '$class'})):removeView(ViewGroup, array:get(Index, get({This, topViewArray})))
            end, lists:seq(0, array:size(get({This, topViewArray})) - 1)),
            lists:foreach(fun(Index) ->
                case (Id =/= (fun(Target_N66449) -> (get({Target_N66449, '$class'})):getId(Target_N66449) end)(array:get(Index, get({This, mainViewArray})))) of
                    true ->
                    (get({ViewGroup, '$class'})):removeView(ViewGroup, array:get(Index, get({This, mainViewArray})));
                    false -> ok
                end
            end, lists:seq(0, array:size(get({This, mainViewArray})) - 1)),
            lists:foreach(fun(Index) ->
                case (Id =:= (fun(Target_N66635) -> (get({Target_N66635, '$class'})):getId(Target_N66635) end)(array:get(Index, get({This, mainViewArray})))) of
                    true ->
                    (get({ViewGroup, '$class'})):addView(ViewGroup, array:get(Index, get({This, mainViewArray}))),
                    put({This, currentMainViewId}, Id);
                    false -> ok
                end
            end, lists:seq(0, array:size(get({This, mainViewArray})) - 1)),
            lists:foreach(fun(Index) ->
                (get({ViewGroup, '$class'})):addView(ViewGroup, array:get(Index, get({This, topViewArray})))
            end, lists:seq(0, array:size(get({This, topViewArray})) - 1));
            false -> ok
        end.

