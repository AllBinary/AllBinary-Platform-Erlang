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
% package org.allbinary.string
% import jsinterop.annotations.JsType

-module('CommonPhoneStrings').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'CommonPhoneStrings':new()),
    ok.

init_fields(This) ->
    put({This, 'UP'}, "UP"),
    put({This, 'DOWN'}, "DOWN"),
    put({This, 'LEFT'}, "LEFT"),
    put({This, 'RIGHT'}, "RIGHT"),
    put({This, 'ZERO'}, "0"),
    put({This, 'ONE'}, "1"),
    put({This, 'TWO'}, "2"),
    put({This, 'THREE'}, "3"),
    put({This, 'FOUR'}, "4"),
    put({This, 'FIVE'}, "5"),
    put({This, 'SIX'}, "6"),
    put({This, 'SEVEN'}, "7"),
    put({This, 'EIGHT'}, "8"),
    put({This, 'NINE'}, "9"),
    put({This, 'POUND'}, "#"),
    put({This, 'STAR'}, "*"),
    put({This, 'FIRE'}, "FIRE"),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'CommonPhoneStrings', instance}).

