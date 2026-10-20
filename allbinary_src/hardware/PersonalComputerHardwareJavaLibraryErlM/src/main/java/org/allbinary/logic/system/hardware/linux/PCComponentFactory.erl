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
% package org.allbinary.logic.system.hardware.linux
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory
% import org.allbinary.logic.communication.log.config.type.LogConfigTypes
% import org.allbinary.logic.system.hardware.components.ComponentFactory
% import org.allbinary.logic.system.hardware.components.interfaces.HardwareComponentInterface
% import org.allbinary.logic.system.hardware.components.linux.Bridge
% import org.allbinary.logic.system.hardware.components.linux.Ethernet
% import org.allbinary.logic.system.hardware.components.linux.HardDriveController
% import org.allbinary.logic.system.hardware.components.linux.Media
% import org.allbinary.logic.system.hardware.components.linux.PCI
% import org.allbinary.logic.system.hardware.components.linux.Unknown
% import org.allbinary.logic.system.hardware.components.linux.Usb
% import org.allbinary.logic.system.hardware.components.linux.Video
% import org.allbinary.string.CommonStrings

-module('PCComponentFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'PCComponentFactory':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, componentFactory}, 'ComponentFactory':getInstance()),
    ok.


getInstance() ->
        get({'PCComponentFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

getInstance(This, Component, ComponentData) when (is_list(Component) orelse Component =:= undefined), (is_list(ComponentData) orelse ComponentData =:= undefined) ->
        try
        try
            case (Component =/= undefined) of
                true ->
                case ((get({Component, '$class'})):compareTo(Component, (get({get({get({This, componentFactory}), 'ETHERNET'}), '$class'})):toString(get({get({This, componentFactory}), 'ETHERNET'}))) =:= 0) of
                    true ->
                    throw({'$return', 'Ethernet':new(ComponentData)});
                    false ->
                    case ((get({Component, '$class'})):compareTo(Component, (get({get({get({This, componentFactory}), 'BRIDGE'}), '$class'})):toString(get({get({This, componentFactory}), 'BRIDGE'}))) =:= 0) of
                    true ->
                    throw({'$return', 'Bridge':new(ComponentData)});
                    false ->
                    case ((get({Component, '$class'})):compareTo(Component, (get({get({get({This, componentFactory}), 'IDE'}), '$class'})):toString(get({get({This, componentFactory}), 'IDE'}))) =:= 0) of
                    true ->
                    throw({'$return', 'HardDriveController':new(ComponentData)});
                    false ->
                    case ((get({Component, '$class'})):compareTo(Component, (get({get({get({This, componentFactory}), 'MULTIMEDIA'}), '$class'})):toString(get({get({This, componentFactory}), 'MULTIMEDIA'}))) =:= 0) of
                    true ->
                    throw({'$return', 'Media':new(ComponentData)});
                    false ->
                    case ((get({Component, '$class'})):compareTo(Component, (get({get({get({This, componentFactory}), 'SCSI'}), '$class'})):toString(get({get({This, componentFactory}), 'SCSI'}))) =:= 0) of
                    true ->
                    throw({'$return', 'HardDriveController':new(ComponentData)});
                    false ->
                    case ((get({Component, '$class'})):compareTo(Component, (get({get({get({This, componentFactory}), 'USB'}), '$class'})):toString(get({get({This, componentFactory}), 'USB'}))) =:= 0) of
                    true ->
                    throw({'$return', 'Usb':new(ComponentData)});
                    false ->
                    case ((get({Component, '$class'})):compareTo(Component, (get({get({get({This, componentFactory}), 'VGA'}), '$class'})):toString(get({get({This, componentFactory}), 'VGA'}))) =:= 0) of
                    true ->
                    throw({'$return', 'Video':new(ComponentData)});
                    false ->
                    case ((get({Component, '$class'})):compareTo(Component, (get({get({get({This, componentFactory}), 'PCI'}), '$class'})):toString(get({get({This, componentFactory}), 'PCI'}))) =:= 0) of
                    true ->
                    throw({'$return', 'PCI':new(ComponentData)});
                    false -> ok
                end
                end
                end
                end
                end
                end
                end
                end;
                false -> ok
            end,
            'Unknown':new(ComponentData)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            case (get({get({'LogConfigTypes', 'LOGGING'}), '$class'})):contains(get({'LogConfigTypes', 'LOGGING'}), get({'LogConfigTypeFactory':getInstance(), 'FACTORYERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, get({CommonStrings, 'GET_INSTANCE'}), E);
                false -> ok
            end,
            'Unknown':new(get({CommonStrings, 'EXCEPTION'}))
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getComponentType(This, Component) when (is_list(Component) orelse Component =:= undefined) ->
        try
        case (allbinary_java:index_of(Component, (get({get({get({This, componentFactory}), 'ETHERNET'}), '$class'})):toString(get({get({This, componentFactory}), 'ETHERNET'}))) >= 0) of
            true ->
            throw({'$return', (get({get({get({This, componentFactory}), 'ETHERNET'}), '$class'})):toString(get({get({This, componentFactory}), 'ETHERNET'}))});
            false ->
            case (allbinary_java:index_of(Component, (get({get({get({This, componentFactory}), 'BRIDGE'}), '$class'})):toString(get({get({This, componentFactory}), 'BRIDGE'}))) >= 0) of
            true ->
            throw({'$return', (get({get({get({This, componentFactory}), 'BRIDGE'}), '$class'})):toString(get({get({This, componentFactory}), 'BRIDGE'}))});
            false ->
            case (allbinary_java:index_of(Component, (get({get({get({This, componentFactory}), 'IDE'}), '$class'})):toString(get({get({This, componentFactory}), 'IDE'}))) >= 0) of
            true ->
            throw({'$return', (get({get({get({This, componentFactory}), 'IDE'}), '$class'})):toString(get({get({This, componentFactory}), 'IDE'}))});
            false ->
            case (allbinary_java:index_of(Component, (get({get({get({This, componentFactory}), 'MULTIMEDIA'}), '$class'})):toString(get({get({This, componentFactory}), 'MULTIMEDIA'}))) >= 0) of
            true ->
            throw({'$return', (get({get({get({This, componentFactory}), 'MULTIMEDIA'}), '$class'})):toString(get({get({This, componentFactory}), 'MULTIMEDIA'}))});
            false ->
            case (allbinary_java:index_of(Component, (get({get({get({This, componentFactory}), 'SCSI'}), '$class'})):toString(get({get({This, componentFactory}), 'SCSI'}))) >= 0) of
            true ->
            throw({'$return', (get({get({get({This, componentFactory}), 'SCSI'}), '$class'})):toString(get({get({This, componentFactory}), 'SCSI'}))});
            false ->
            case (allbinary_java:index_of(Component, (get({get({get({This, componentFactory}), 'USB'}), '$class'})):toString(get({get({This, componentFactory}), 'USB'}))) >= 0) of
            true ->
            throw({'$return', (get({get({get({This, componentFactory}), 'USB'}), '$class'})):toString(get({get({This, componentFactory}), 'USB'}))});
            false ->
            case (allbinary_java:index_of(Component, (get({get({get({This, componentFactory}), 'VGA'}), '$class'})):toString(get({get({This, componentFactory}), 'VGA'}))) >= 0) of
            true ->
            throw({'$return', (get({get({get({This, componentFactory}), 'VGA'}), '$class'})):toString(get({get({This, componentFactory}), 'VGA'}))});
            false ->
            case ((get({Component, '$class'})):compareTo(Component, (get({get({get({This, componentFactory}), 'PCI'}), '$class'})):toString(get({get({This, componentFactory}), 'PCI'}))) =:= 0) of
            true ->
            throw({'$return', (get({get({get({This, componentFactory}), 'PCI'}), '$class'})):toString(get({get({This, componentFactory}), 'PCI'}))});
            false -> ok
        end
        end
        end
        end
        end
        end
        end
        end,
        (get({get({get({This, componentFactory}), 'UNKNOWN'}), '$class'})):toString(get({get({This, componentFactory}), 'UNKNOWN'}))
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

