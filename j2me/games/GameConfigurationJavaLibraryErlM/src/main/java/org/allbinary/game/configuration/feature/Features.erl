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
% package org.allbinary.game.configuration.feature
% import org.allbinary.game.configuration.event.GameFeatureEvent
% import org.allbinary.game.configuration.event.GameFeatureEventHandler
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.system.os.GenericOperatingSystem
% import org.allbinary.logic.system.os.OperatingSystemFactory
% import org.allbinary.string.CommonLabels
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('Features').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'SINGLETON'}, get({'NullUtil':getInstance(), 'NULL_OBJECT'})),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, list}, undefined),
    put({This, defaultList}, undefined),
    ok.


getInstance() ->
        case (get({'Features', 'SINGLETON'}) =:= get({'NullUtil':getInstance(), 'NULL_OBJECT'})) of
            true ->
            put({'Features', 'SINGLETON'}, 'Features':new());
            false -> ok
        end,
        get({'Features', 'SINGLETON'}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        put({This, list}, 'BasicArrayListD':new()),
        put({This, defaultList}, 'BasicArrayListD':new()),
        (get({This, '$class'})):init(This).

% throws Exception
addDefault(This, GameFeature) ->
        (get({This, '$class'})):add(This, GameFeature),
        case (not (get({get({This, defaultList}), '$class'})):contains(get({This, defaultList}), GameFeature)) of
            true ->
            (get({get({This, defaultList}), '$class'})):add(get({This, defaultList}), GameFeature);
            false -> ok
        end.

% throws Exception
add(This, GameFeature) ->
        case (not (get({get({This, list}), '$class'})):contains(get({This, list}), GameFeature)) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N66690) -> (get({Target_N66690, '$class'})):toString(Target_N66690) end)((fun(Target_N66697) -> (get({Target_N66697, '$class'})):append(Target_N66697, (get({GameFeature, '$class'})):toString(GameFeature)) end)((fun(Target_N66704) -> (get({Target_N66704, '$class'})):append(Target_N66704, get({'CommonLabels':getInstance(), 'START_LABEL'})) end)('StringMaker':new()))), This, get({get({This, commonStrings}), 'ADD'})),
            (get({get({This, list}), '$class'})):add(get({This, list}), GameFeature),
            (fun(Target_N66838) -> (get({Target_N66838, '$class'})):fireEvent(Target_N66838, 'GameFeatureEvent':new(GameFeature, (get({GameFeature, '$class'})):toString(GameFeature))) end)('GameFeatureEventHandler':getInstance());
            false -> ok
        end.

% throws Exception
removeDefault(This, GameFeature) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N66994) -> (get({Target_N66994, '$class'})):toString(Target_N66994) end)((fun(Target_N67001) -> (get({Target_N67001, '$class'})):append(Target_N67001, (get({GameFeature, '$class'})):toString(GameFeature)) end)((fun(Target_N67008) -> (get({Target_N67008, '$class'})):append(Target_N67008, get({'CommonLabels':getInstance(), 'START_LABEL'})) end)('StringMaker':new()))), This, "removeDefault"),
        (get({This, '$class'})):remove(This, GameFeature),
        (get({get({This, defaultList}), '$class'})):remove(get({This, defaultList}), GameFeature).

% throws Exception
remove(This, GameFeature) ->
        case (get({get({This, list}), '$class'})):contains(get({This, list}), GameFeature) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'REMOVE'})),
            (get({get({This, list}), '$class'})):remove(get({This, list}), GameFeature),
            (fun(Target_N67355) -> (get({Target_N67355, '$class'})):fireEvent(Target_N67355, 'GameFeatureEvent':new(GameFeature, (get({GameFeature, '$class'})):toString(GameFeature))) end)('GameFeatureEventHandler':getInstance());
            false -> ok
        end.

init(This) ->
        try
            GameFeatureFactory = 'GameFeatureFactory':getInstance(),
            InputFeatureFactory = 'InputFeatureFactory':getInstance(),
            SensorFeatureFactory = 'SensorFeatureFactory':getInstance(),
            TouchFeatureFactory = 'TouchFeatureFactory':getInstance(),
            (get({This, '$class'})):addDefault(This, get({GameFeatureFactory, 'ARTIFICIAL_INTELLEGENCE_PROCESSOR'})),
            (get({This, '$class'})):addDefault(This, get({GameFeatureFactory, 'COLLIDABLE_INTERFACE_LAYER_PROCESSOR'})),
            (get({This, '$class'})):addDefault(This, get({GameFeatureFactory, 'GAME_INPUT_LAYER_PROCESSOR'})),
            (get({This, '$class'})):addDefault(This, get({GameFeatureFactory, 'TICKABLE_LAYER_PROCESSOR'})),
            (get({This, '$class'})):addDefault(This, get({InputFeatureFactory, 'MULTI_KEY_PRESS'})),
            (get({This, '$class'})):addDefault(This, get({InputFeatureFactory, 'REMOVE_DUPLICATE_KEY_PRESSES'})),
            (get({This, '$class'})):addDefault(This, get({GameFeatureFactory, 'SCREEN_SHAKE'})),
            (get({This, '$class'})):addDefault(This, get({GameFeatureFactory, 'POST_IMAGE_LOADING_MODIFICATION'})),
            OperatingSystemInterface = (fun(Target_N67986) -> (get({Target_N67986, '$class'})):getOperatingSystemInstance(Target_N67986) end)('OperatingSystemFactory':getInstance()),
            case (get({OperatingSystemInterface, '$class'})):isOverScan(OperatingSystemInterface) of
                true ->
                (get({This, '$class'})):addDefault(This, get({SensorFeatureFactory, 'NO_ORIENTATION'})),
                (get({This, '$class'})):addDefault(This, get({TouchFeatureFactory, 'HIDE_SCREEN_BUTTONS'}));
                false ->
                (get({This, '$class'})):addDefault(This, get({SensorFeatureFactory, 'ORIENTATION_SENSORS'})),
                (get({This, '$class'})):addDefault(This, get({TouchFeatureFactory, 'AUTO_HIDE_SHOW_SCREEN_BUTTONS'}))
            end,
            (get({This, '$class'})):addDefault(This, get({TouchFeatureFactory, 'TOUCH_ENABLED'})),
            (get({This, '$class'})):addDefault(This, get({'MainFeatureFactory':getInstance(), 'FULL_SCREEN'})),
            (get({This, '$class'})):addDefault(This, get({'MainFeatureFactory':getInstance(), 'LOAD_ONDEMAND'}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            'PreLogUtil':putOE(get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'INIT'}), E)
        end.

isDefault(This, GameFeature) ->
        (get({get({This, defaultList}), '$class'})):contains(get({This, defaultList}), GameFeature).

isFeature(This, GameFeature) ->
        (get({get({This, list}), '$class'})):contains(get({This, list}), GameFeature).

% throws Exception
toggle(This, GameFeature) ->
        case (get({This, '$class'})):isFeature(This, GameFeature) of
            true ->
            (get({This, '$class'})):remove(This, GameFeature);
            false ->
            (get({This, '$class'})):add(This, GameFeature)
        end.

