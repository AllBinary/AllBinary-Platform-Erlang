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

-module('ColorTemperatureUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ColorTemperatureUtil':new()),
    ok.

init_fields(This) ->
    put({This, basicColorFactory}, 'BasicColorFactory':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'ColorTemperatureUtil', instance}).

getBasicColor(This, ThirdTemp) when is_integer(ThirdTemp) ->
        put({local, basicColor}, get({get({This, basicColorFactory}), 'RED'})),
        case (ThirdTemp > 3700) of
            true ->
            put({local, basicColor}, get({get({This, basicColorFactory}), 'PURPLE'}));
            false ->
            case (ThirdTemp > 3200) of
            true ->
            put({local, basicColor}, get({get({This, basicColorFactory}), 'BLUE'}));
            false ->
            case (ThirdTemp > 2700) of
            true ->
            put({local, basicColor}, get({get({This, basicColorFactory}), 'PUCE'}));
            false ->
            case (ThirdTemp > 2200) of
            true ->
            put({local, basicColor}, get({get({This, basicColorFactory}), 'WHITE'}));
            false ->
            case (ThirdTemp > 1700) of
            true ->
            put({local, basicColor}, get({get({This, basicColorFactory}), 'GREEN'}));
            false ->
            case (ThirdTemp > 1200) of
            true ->
            put({local, basicColor}, get({get({This, basicColorFactory}), 'YELLOW'}));
            false ->
            case (ThirdTemp > 700) of
            true ->
            put({local, basicColor}, get({get({This, basicColorFactory}), 'ORANGE'}));
            false -> ok
        end
        end
        end
        end
        end
        end
        end,
        get({local, basicColor}).

