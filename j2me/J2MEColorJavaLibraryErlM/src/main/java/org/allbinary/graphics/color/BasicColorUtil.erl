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
% package org.allbinary.graphics.color

-module('BasicColorUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'BasicColorUtil':new()),
    ok.

init_fields(This) ->
    put({This, 'ZERO_ARRAY'}, array:new(0, {default, undefined})),
    put({This, 'ALPHA'}, 16#FF000000),
    put({This, isAlpha}, true),
    put({This, ffOpaque}, true),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'BasicColorUtil', instance}).

getRGB(This, Red, Green, Blue) when is_integer(Red), is_integer(Green), is_integer(Blue) ->
        put({local, value}, 0),
        case get({This, isAlpha}) of
            true ->
            case get({This, ffOpaque}) of
                true ->
                put({local, value}, get({This, 'ALPHA'}));
                false -> ok
            end;
            false -> ok
        end,
        put({local, value}, (((Red bsl 16)) bor get({local, value}))),
        put({local, value}, (((Green bsl 8)) bor get({local, value}))),
        put({local, value}, (Blue bor get({local, value}))),
        get({local, value}).

getARGB(This, AlphaValue, R, G, B) when is_integer(AlphaValue), is_integer(R), is_integer(G), is_integer(B) ->
        (((((((AlphaValue bsl 24)) band get({This, 'ALPHA'}))) + ((((R bsl 16)) band 16#00FF0000))) + ((((G bsl 8)) band 16#0000FF00))) + ((B band 16#000000FF))).

get(This, AlphaValue, Color) when is_integer(AlphaValue), is_integer(Color) ->
        (((((AlphaValue bsl 24)) band get({This, 'ALPHA'}))) + Color).

invert(This, Color) when is_integer(Color) ->
        (((16#FFFFFF - Color)) bor get({This, 'ALPHA'})).

