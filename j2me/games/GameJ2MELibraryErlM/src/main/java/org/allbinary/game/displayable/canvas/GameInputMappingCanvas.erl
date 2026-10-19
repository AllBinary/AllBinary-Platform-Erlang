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
% package org.allbinary.game.displayable.canvas
% import javax.microedition.lcdui.Command
% import javax.microedition.lcdui.CommandListener
% import javax.microedition.lcdui.Graphics
% import org.allbinary.game.commands.GameCommandsFactory
% import org.allbinary.game.input.GameKey
% import org.allbinary.game.input.GameKeyFactory
% import org.allbinary.game.input.Input
% import org.allbinary.game.input.InputFactory
% import org.allbinary.game.input.PlatformInputMappingFactory
% import org.allbinary.game.input.mapping.InputMappingInterface
% import org.allbinary.game.input.mapping.PersistentInputMapping
% import org.allbinary.game.layer.AllBinaryGameLayerManager
% import org.allbinary.game.paint.ColorFillBasePaintable
% import org.allbinary.game.paint.ColorFillPaintableFactory
% import org.allbinary.game.paint.help.HelpPaintable
% import org.allbinary.game.paint.help.InputMappingHelpPaintable
% import org.allbinary.graphics.paint.ProcessPaintable
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.util.BasicArrayList

-module('GameInputMappingCanvas').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements InputMappingInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('GameCommandCanvas', Function, Arguments).

static_init() ->
    put({?MODULE, 'NAME'}, "GameInputMappingCanvas"),
    put({?MODULE, 'DISPLAY'}, 'Command':new("Controls", get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({'Command', 'SCREEN'}), 2)),
    put({?MODULE, 'DEFAULT'}, 'Command':new("Default", get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({'Command', 'SCREEN'}), 2)),
    ok.

init_fields(This) ->
    put({This, paintable}, undefined),
    put({This, helpPaintable}, undefined),
    put({This, colorFillPaintable}, undefined),
    put({This, inputMapping}, undefined),
    put({This, 'NONE'}, get({'GameKeyFactory':getInstance(), 'NONE'})),
    put({This, abeClientInformation}, undefined),
    put({This, selectedGameKey}, get({This, 'NONE'})),
    put({This, selectedInput}, get({This, 'NONE'})),
    put({This, inputFactory}, 'InputFactory':getInstance()),
    ok.


new(AbeClientInformation, CommandListener, AllBinaryGameLayerManager, HelpPaintable) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, AbeClientInformation, CommandListener, AllBinaryGameLayerManager, HelpPaintable),
    This.

init(This, AbeClientInformation, CommandListener, AllBinaryGameLayerManager, HelpPaintable) ->
        'GameCommandCanvas':init(This, CommandListener, get({'GameInputMappingCanvas', 'NAME'}), (get({AllBinaryGameLayerManager, '$class'})):getBackgroundBasicColor(AllBinaryGameLayerManager), (get({AllBinaryGameLayerManager, '$class'})):getForegroundBasicColor(AllBinaryGameLayerManager)),
        init_fields(This),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'})),
        case (HelpPaintable =:= undefined) of
            true ->
            erlang:error({'Exception', "Help Paintable Exception"});
            false -> ok
        end,
        put({This, abeClientInformation}, AbeClientInformation),
        put({This, helpPaintable}, HelpPaintable),
        put({This, inputMapping}, (fun(Target_N67083) -> (get({Target_N67083, '$class'})):getPersistentInputMappingInstance(Target_N67083) end)('PlatformInputMappingFactory':getInstance())),
        put({This, paintable}, 'ProcessPaintable':new()),
        put({This, colorFillPaintable}, (fun(Target_N67163) -> (get({Target_N67163, '$class'})):getInstance(Target_N67163, (get({AllBinaryGameLayerManager, '$class'})):getBackgroundBasicColor(AllBinaryGameLayerManager), false) end)('ColorFillPaintableFactory':getInstance())).

% throws Exception
close(This) ->
        'GameCommandCanvas':close(This),
        (get({get({This, paintable}), '$class'})):process(get({This, paintable})),
        put({This, selectedGameKey}, get({This, 'NONE'})),
        put({This, selectedInput}, get({This, 'NONE'})),
        (get({This, '$class'})):update(This).

initCommands(This, CmdListener) ->
        (get({This, '$class'})):removeAllCommands(This),
        (get({This, '$class'})):addCommand(This, get({'GameCommandsFactory':getInstance(), 'CLOSE_AND_SHOW_GAME_CANVAS'})),
        (get({This, '$class'})):addCommand(This, get({'GameInputMappingCanvas', 'DEFAULT'})),
        (get({This, '$class'})):addCommand(This, get({'GameInputMappingInstructionsCanvas', 'DISPLAY'})),
        (get({This, '$class'})):setCommandListener(This, CmdListener).

keyPressed(This, KeyCode) when is_integer(KeyCode) ->
        (get({This, '$class'})):keyPressedByDevice(This, KeyCode, 0).

keyReleased(This, KeyCode) when is_integer(KeyCode) ->
        (get({This, '$class'})):keyReleasedByDevice(This, KeyCode, 0).

keyRepeated(This, KeyCode) when is_integer(KeyCode) ->
        (get({This, '$class'})):keyRepeatedByDevice(This, KeyCode, 0).

keyPressedByDevice(This, KeyCode, DeviceId) when is_integer(KeyCode), is_integer(DeviceId) ->
        (get({This, '$class'})):addGameKey(This, KeyCode, false),
        'GameCommandCanvas':keyPressedByDevice(This, KeyCode, 0).

addGameKey(This, KeyCode, Repeated) when is_integer(KeyCode), is_boolean(Repeated) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N68212) -> (get({Target_N68212, '$class'})):toString(Target_N68212) end)((fun(Target_N68219) -> (get({Target_N68219, '$class'})):append(Target_N68219, integer_to_list(KeyCode, 16)) end)((fun(Target_N68226) -> (get({Target_N68226, '$class'})):append(Target_N68226, "Raw Device Key Code: ") end)('StringMaker':new()))), This, get({get({This, gameInputStrings}), 'ADD_KEY_EVENT'})),
            GameKey = (get({get({This, inputToGameKeyMapping}), '$class'})):getInstanceForCanvas(get({This, inputToGameKeyMapping}), This, KeyCode),
            Input = (get({get({This, inputFactory}), '$class'})):getInstanceById(get({This, inputFactory}), KeyCode),
            (get({This, '$class'})):processInputMapping(This, GameKey, Input)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Key Event Error", This, get({get({This, gameInputStrings}), 'ADD_KEY_EVENT'}), E)
        end.

% throws Exception
processInputMapping(This, GameKey, Input) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "Start Passed GameKey: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, stringUtil}), '$class'})):toString(get({This, stringUtil}), GameKey)),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Input: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, stringUtil}), '$class'})):toString(get({This, stringUtil}), Input)),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, get({get({This, commonStrings}), 'PROCESS'})),
        case (get({This, selectedGameKey}) =/= get({This, 'NONE'})) of
            true ->
            (get({This, '$class'})):gameActionCrud(This, GameKey, Input);
            false ->
            (get({This, '$class'})):setSelectedAction(This, GameKey)
        end.

setSelectedAction(This, GameKey) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N69123) -> (get({Target_N69123, '$class'})):toString(Target_N69123) end)((fun(Target_N69130) -> (get({Target_N69130, '$class'})):append(Target_N69130, (get({get({This, stringUtil}), '$class'})):toString(get({This, stringUtil}), GameKey)) end)((fun(Target_N69137) -> (get({Target_N69137, '$class'})):append(Target_N69137, "Selected GameKey: ") end)('StringMaker':new()))), This, "setSelectedAction"),
        put({This, selectedGameKey}, GameKey),
        put({This, selectedInput}, get({This, 'NONE'})),
        (get({get({This, helpPaintable}), '$class'})):update(get({This, helpPaintable}), get({This, selectedGameKey}), get({This, selectedInput})),
        (get({get({This, repaintBehavior}), '$class'})):onChangeRepaint(get({This, repaintBehavior}), This).

% throws Exception
gameActionCrud(This, GameKey, Input) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "Start GameKey: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, stringUtil}), '$class'})):toString(get({This, stringUtil}), get({This, selectedGameKey}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Input: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, stringUtil}), '$class'})):toString(get({This, stringUtil}), get({This, selectedInput}))),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "gameActionCrud"),
        case (get({This, selectedInput}) =:= get({This, 'NONE'})) of
            true ->
            List = (fun(Target_N69797) -> (get({Target_N69797, '$class'})):getMappedInput(Target_N69797, get({This, selectedGameKey})) end)((get({get({This, inputMapping}), '$class'})):getInputMapping(get({This, inputMapping}))),
            IsInputAlreadyMappedToSelectedAction = (get({List, '$class'})):contains(List, Input),
            case IsInputAlreadyMappedToSelectedAction of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N69988) -> (get({Target_N69988, '$class'})):toString(Target_N69988) end)((fun(Target_N69995) -> (get({Target_N69995, '$class'})):append(Target_N69995, (get({get({This, stringUtil}), '$class'})):toString(get({This, stringUtil}), Input)) end)((fun(Target_N70002) -> (get({Target_N70002, '$class'})):append(Target_N70002, "Already Mapped Input: ") end)('StringMaker':new()))), This, "gameActionCrud"),
                put({This, selectedInput}, Input),
                (get({get({This, helpPaintable}), '$class'})):update(get({This, helpPaintable}), get({This, selectedGameKey}), get({This, selectedInput})),
                (get({get({This, repaintBehavior}), '$class'})):onChangeRepaint(get({This, repaintBehavior}), This);
                false ->
                (get({This, '$class'})):addNewMapping(This, GameKey, Input)
            end;
            false ->
            case (get({get({This, inputMapping}), '$class'})):isDelete(get({This, inputMapping}), Input) of
            true ->
            (get({This, '$class'})):deleteCurrentMapping(This);
            false ->
            (get({This, '$class'})):setSelectedAction(This, GameKey)
        end
        end.

% throws Exception
addNewMapping(This, GameKey, Input) ->
        METHOD_NAME = "addNewMapping",
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, METHOD_NAME),
        IsInputAlreadyMapped = (fun(Target_N70385) -> (get({Target_N70385, '$class'})):isMapped(Target_N70385, Input) end)((get({get({This, inputMapping}), '$class'})):getInputMapping(get({This, inputMapping}))),
        case ((not IsInputAlreadyMapped) andalso (not (get({get({This, inputMapping}), '$class'})):isSystemInput(get({This, inputMapping}), Input))) of
            true ->
            StringBuffer = 'StringMaker':new(),
            (get({StringBuffer, '$class'})):append(StringBuffer, "Add Key Mapping : GameKey: "),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, stringUtil}), '$class'})):toString(get({This, stringUtil}), get({This, selectedGameKey}))),
            (get({StringBuffer, '$class'})):append(StringBuffer, " Input: "),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, stringUtil}), '$class'})):toString(get({This, stringUtil}), get({This, selectedInput}))),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, METHOD_NAME),
            (fun(Target_N70838) -> (get({Target_N70838, '$class'})):add(Target_N70838, get({This, selectedGameKey}), Input) end)((get({get({This, inputMapping}), '$class'})):getInputMapping(get({This, inputMapping}))),
            put({This, selectedInput}, Input),
            (get({This, '$class'})):update(This);
            false ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Unable to add Mapping since one already exists or is MENU, HOME, or BACK key and setting selected action to what it is already mapped to", This, METHOD_NAME),
            (get({This, '$class'})):setSelectedAction(This, GameKey)
        end.

% throws Exception
deleteCurrentMapping(This) ->
        METHOD_NAME = "deleteCurrentMapping",
        List = (fun(Target_N71070) -> (get({Target_N71070, '$class'})):getMappedInput(Target_N71070, get({This, selectedGameKey})) end)((get({get({This, inputMapping}), '$class'})):getInputMapping(get({This, inputMapping}))),
        case ((get({List, '$class'})):size(List) > 1) of
            true ->
            StringBuffer = 'StringMaker':new(),
            (get({StringBuffer, '$class'})):append(StringBuffer, "Start GameKey: "),
            (get({StringBuffer, '$class'})):append(StringBuffer, "Remove Key Mapping: GameKey: "),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, stringUtil}), '$class'})):toString(get({This, stringUtil}), get({This, selectedGameKey}))),
            (get({StringBuffer, '$class'})):append(StringBuffer, " Input: "),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, stringUtil}), '$class'})):toString(get({This, stringUtil}), get({This, selectedInput}))),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, METHOD_NAME),
            (fun(Target_N71503) -> (get({Target_N71503, '$class'})):remove(Target_N71503, get({This, selectedGameKey}), get({This, selectedInput})) end)((get({get({This, inputMapping}), '$class'})):getInputMapping(get({This, inputMapping}))),
            put({This, selectedInput}, get({This, 'NONE'})),
            (get({This, '$class'})):update(This);
            false ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Can't Remove Last Key Mapping", This, METHOD_NAME)
        end.

% throws Exception
setDefault(This) ->
        (get({get({This, inputMapping}), '$class'})):setDefault(get({This, inputMapping}), get({This, abeClientInformation})),
        (get({get({This, helpPaintable}), '$class'})):update(get({This, helpPaintable}), get({This, 'NONE'}), get({This, 'NONE'})),
        (get({get({This, repaintBehavior}), '$class'})):onChangeRepaint(get({This, repaintBehavior}), This).

% throws Exception
update(This) ->
        (get({get({This, inputMapping}), '$class'})):update(get({This, inputMapping}), get({This, abeClientInformation})),
        (get({get({This, helpPaintable}), '$class'})):update(get({This, helpPaintable}), get({This, selectedGameKey}), get({This, selectedInput})),
        (get({get({This, repaintBehavior}), '$class'})):onChangeRepaint(get({This, repaintBehavior}), This).

paint(This, Graphics) ->
        (get({get({This, colorFillPaintable}), '$class'})):paint(get({This, colorFillPaintable}), Graphics),
        (get({get({This, helpPaintable}), '$class'})):paint(get({This, helpPaintable}), Graphics),
        (get({get({This, paintable}), '$class'})):paint(get({This, paintable}), Graphics),
        'GameCommandCanvas':paint(This, Graphics).

