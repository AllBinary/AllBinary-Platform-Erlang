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
% package org.allbinary.game.input
% import org.allbinary.logic.NullUtil

-module('PlatformKeyFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, get({'NullUtil':getInstance(), 'NULL_OBJECT'})),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        case (get({'PlatformKeyFactory', instance}) =:= get({'NullUtil':getInstance(), 'NULL_OBJECT'})) of
            true ->
            put({'PlatformKeyFactory', instance}, 'PlatformKeyFactory':new());
            false -> ok
        end,
        get({'PlatformKeyFactory', instance}).

getString(This, KeyCode) when is_integer(KeyCode) ->
        'J2MEGameKey':getString(KeyCode).

isSubmission(This, Input) ->
        (fun(Target_N65917) -> (get({Target_N65917, '$class'})):isSubmission(Target_N65917, Input) end)('J2MEKeyFactory':getInstance()).

isDelete(This, Input) ->
        (fun(Target_N66002) -> (get({Target_N66002, '$class'})):isDelete(Target_N66002, Input) end)('J2MEKeyFactory':getInstance()).

isBackSpace(This, Input) ->
        (fun(Target_N66087) -> (get({Target_N66087, '$class'})):isBackSpace(Target_N66087, Input) end)('J2MEKeyFactory':getInstance()).

isLeft(This, Input) ->
        (fun(Target_N66172) -> (get({Target_N66172, '$class'})):isLeft(Target_N66172, Input) end)('J2MEKeyFactory':getInstance()).

isRight(This, Input) ->
        (fun(Target_N66257) -> (get({Target_N66257, '$class'})):isRight(Target_N66257, Input) end)('J2MEKeyFactory':getInstance()).

isUp(This, Input) ->
        (fun(Target_N66342) -> (get({Target_N66342, '$class'})):isUp(Target_N66342, Input) end)('J2MEKeyFactory':getInstance()).

isDown(This, Input) ->
        (fun(Target_N66427) -> (get({Target_N66427, '$class'})):isDown(Target_N66427, Input) end)('J2MEKeyFactory':getInstance()).

isEnter(This, Input) ->
        (fun(Target_N66512) -> (get({Target_N66512, '$class'})):isEnter(Target_N66512, Input) end)('J2MEKeyFactory':getInstance()).

