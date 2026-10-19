% Generated Code Do Not Modify
% package org.allbinary.game.input
% import org.allbinary.logic.NullUtil

-module('AndroidAPI1KeyFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('AndroidKeyFactory', Function, Arguments).

static_init() ->
    put({?MODULE, instance}, get({'NullUtil':getInstance(), 'NULL_OBJECT'})),
    ok.

init_fields(This) ->
    ok.


getInstance() ->
        case (get({'AndroidAPI1KeyFactory', instance}) =:= get({'NullUtil':getInstance(), 'NULL_OBJECT'})) of
            true ->
            put({'AndroidAPI1KeyFactory', instance}, 'AndroidAPI1KeyFactory':new());
            false -> ok
        end,
        get({'AndroidAPI1KeyFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'AndroidKeyFactory':init(This),
    init_fields(This),
        ok.

