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
% package org.allbinary.game.health
% import org.allbinary.animation.Animation
% import org.allbinary.game.graphics.hud.BasicHudFactory
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.layer.AllBinaryLayer

-module('HealthBarAnimation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('Animation', Function, Arguments).

init_fields(This) ->
    put({This, basicColorFactory}, 'BasicColorFactory':getInstance()),
    put({This, x2}, 0),
    put({This, thickness}, 0),
    put({This, location}, 0),
    put({This, allbinaryLayer}, undefined),
    ok.


new(LayerInterface, Location) when is_integer(Location) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, LayerInterface, Location),
    This.

init(This, LayerInterface, Location) when is_integer(Location) ->
    'Animation':init(This),
    init_fields(This),
        put({This, allbinaryLayer}, LayerInterface),
        put({This, location}, Location),
        BasicHudFactory = 'BasicHudFactory':getInstance(),
        case ((get({This, location}) =/= get({BasicHudFactory, 'TOPLEFT'})) andalso (get({This, location}) =/= get({BasicHudFactory, 'BOTTOMLEFT'}))) of
            true ->
            erlang:error({'Exception', "Location Not Valid"});
            false -> ok
        end,
        case ((get({LayerInterface, '$class'})):getWidth(LayerInterface) > 40) of
            true ->
            put({This, thickness}, 3);
            false ->
            case ((get({LayerInterface, '$class'})):getWidth(LayerInterface) > 20) of
            true ->
            put({This, thickness}, 2);
            false ->
            put({This, thickness}, 1)
        end
        end.

onHealthChange(This, NewX2) when is_integer(NewX2) ->
        put({This, x2}, NewX2),
        Quarter = (((get({get({This, allbinaryLayer}), '$class'})):getWidth(get({This, allbinaryLayer})) bsr 2)),
        case (get({This, x2}) > (Quarter * 3)) of
            true ->
            put({This, basicColor}, get({get({This, basicColorFactory}), 'GREEN'})),
            put({This, colorP}, (get({get({This, basicColor}), '$class'})):intValue(get({This, basicColor})));
            false ->
            case (get({This, x2}) > (Quarter * 2)) of
            true ->
            put({This, basicColor}, get({get({This, basicColorFactory}), 'YELLOW'})),
            put({This, colorP}, (get({get({This, basicColor}), '$class'})):intValue(get({This, basicColor})));
            false ->
            case (get({This, x2}) > Quarter) of
            true ->
            put({This, basicColor}, get({get({This, basicColorFactory}), 'ORANGE'})),
            put({This, colorP}, (get({get({This, basicColor}), '$class'})):intValue(get({This, basicColor})));
            false ->
            put({This, basicColor}, get({get({This, basicColorFactory}), 'RED'})),
            put({This, colorP}, (get({get({This, basicColor}), '$class'})):intValue(get({This, basicColor})))
        end
        end
        end.

getY(This) ->
        try
        BasicHudFactory = 'BasicHudFactory':getInstance(),
        case (get({This, location}) =:= get({BasicHudFactory, 'TOPLEFT'})) of
            true ->
            throw({'$return', ((fun(Target_N67068) -> (get({Target_N67068, '$class'})):getY(Target_N67068) end)((get({get({This, allbinaryLayer}), '$class'})):getViewPosition(get({This, allbinaryLayer}))) - 4)});
            false ->
            case (get({This, location}) =:= get({BasicHudFactory, 'BOTTOMLEFT'})) of
            true ->
            throw({'$return', ((fun(Target_N67020) -> (get({Target_N67020, '$class'})):getY2(Target_N67020) end)((get({get({This, allbinaryLayer}), '$class'})):getViewPosition(get({This, allbinaryLayer}))) + 4)});
            false -> ok
        end
        end,
        (-1)
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

