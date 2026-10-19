% Generated Code Do Not Modify
% package org.allbinary.game.input
% import org.allbinary.logic.NullUtil

-module('PlatformKeyFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, get({'NullUtil':getInstance(), 'NULL_OBJECT'})),
    ok.

init_fields(This) ->
    put({This, androidKeyFactory}, 'ActivityFractureControllerUtilFactory':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        case (get({'PlatformKeyFactory', instance}) =:= get({'NullUtil':getInstance(), 'NULL_OBJECT'})) of
            true ->
            put({'PlatformKeyFactory', instance}, 'PlatformKeyFactory':new());
            false -> ok
        end,
        get({'PlatformKeyFactory', instance}).

getString(This, KeyCode) when is_integer(KeyCode) ->
        'AndroidGameKey':getString(KeyCode).

isSubmission(This, Input) ->
        (get({get({This, androidKeyFactory}), '$class'})):isSubmission(get({This, androidKeyFactory}), Input).

isDelete(This, Input) ->
        (get({get({This, androidKeyFactory}), '$class'})):isDelete(get({This, androidKeyFactory}), Input).

isBackSpace(This, Input) ->
        (get({get({This, androidKeyFactory}), '$class'})):isBackSpace(get({This, androidKeyFactory}), Input).

isLeft(This, Input) ->
        (get({get({This, androidKeyFactory}), '$class'})):isLeft(get({This, androidKeyFactory}), Input).

isRight(This, Input) ->
        (get({get({This, androidKeyFactory}), '$class'})):isRight(get({This, androidKeyFactory}), Input).

isUp(This, Input) ->
        (get({get({This, androidKeyFactory}), '$class'})):isUp(get({This, androidKeyFactory}), Input).

isDown(This, Input) ->
        (get({get({This, androidKeyFactory}), '$class'})):isDown(get({This, androidKeyFactory}), Input).

isEnter(This, Input) ->
        (get({get({This, androidKeyFactory}), '$class'})):isEnter(get({This, androidKeyFactory}), Input).

