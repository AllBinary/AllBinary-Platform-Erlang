% 
% AllBinary Open License Version 1 
% Copyright (c) 2022 AllBinary 
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
% package org.allbinary.graphics.color
% import java.awt

-module('ColorUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ColorUtil':new()),
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
        get({'ColorUtil', instance}).

isGreyishOrWhiteLike(This, Color) ->
        try
        case (((erlang:abs(((get({Color, '$class'})):getRed(Color) - (get({Color, '$class'})):getGreen(Color))) > 20) orelse (erlang:abs(((get({Color, '$class'})):getRed(Color) - (get({Color, '$class'})):getBlue(Color))) > 20)) orelse (erlang:abs(((get({Color, '$class'})):getGreen(Color) - (get({Color, '$class'})):getBlue(Color))) > 20)) of
            true ->
            throw({'$return', false});
            false -> ok
        end,
        true
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isDark(This, Color) ->
        try
        case ((((get({Color, '$class'})):getRed(Color) < 16#77) andalso ((get({Color, '$class'})):getRed(Color) < 16#77)) andalso ((get({Color, '$class'})):getRed(Color) < 16#77)) of
            true ->
            throw({'$return', true});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

