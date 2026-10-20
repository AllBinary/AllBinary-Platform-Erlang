% Generated Code Do Not Modify
% package org.allbinary.android
% import android.content.Context
% import android.view.View
% import android.widget.Toast
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings

-module('ToastUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ToastUtil':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'ToastUtil', instance}).

makeToast(This, View, Context, Message, Time) when (is_list(Message) orelse Message =:= undefined), is_integer(Time) ->
        ok % Java nested type MakeToast: move it to its own module
,
        (get({View, '$class'})):post(View, 'MakeToast':new(Message)).

