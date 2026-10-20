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
% import org.allbinary.game.layer.AllBinaryGameLayerManager
% import org.allbinary.game.paint.ColorFillBasePaintable
% import org.allbinary.game.paint.ColorFillPaintableFactory
% import org.allbinary.graphics.Anchor
% import org.allbinary.graphics.draw.DrawStringUtil
% import org.allbinary.logic.string.StringUtil

-module('GameInputMappingInstructionsCanvas').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('GameCommandCanvas', Function, Arguments).

static_init() ->
    put({?MODULE, 'DISPLAY'}, 'Command':new("Help", get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({'Command', 'SCREEN'}), 1)),
    put({?MODULE, 'CLOSE'}, 'Command':new("Close", get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({'Command', 'SCREEN'}), 1)),
    put({?MODULE, 'NAME'}, "GameInputMappingInstructionsCanvas"),
    ok.

init_fields(This) ->
    put({This, drawStringUtil}, 'DrawStringUtil':getInstance()),
    put({This, 'TITLE'}, "Input Instructions"),
    put({This, instructions}, array:from_list(["Add Input Mapping:", "1. Select the desired action by generating a currently defined input for a given action.", "(Example: Press the '1' key to select the Fire action)", "2. Make the newly desired input for the selected action.", "(Example: Press 'f' to add it to the selected action)", "Note: If the input is already mapped to another action then it will not be added. You", "will need to deleted from the other action before adding it to another.", "Warning: Not all keys map for a given platform and show as Unknown.", get({'StringUtil':getInstance(), 'EMPTY_STRING'}), "Remove Input Mapping:", "1. Select the desired action by generating a currently defined input for a given action.", "(Example: Press the key '1' to select the Fire action)", "2. Select a mapped input for the selected action.", "(Example: Press the key '1' to select the '1' key input for the selected Fire action)", "3. Press the Delete Key."])),
    put({This, colorFillPaintable}, undefined),
    put({This, anchor}, get({'Anchor', 'TOP_LEFT'})),
    ok.


new(CommandListener, AllBinaryGameLayerManager) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, CommandListener, AllBinaryGameLayerManager),
    This.

'$init'(This, CommandListener, AllBinaryGameLayerManager) ->
        'GameCommandCanvas':'$init'(This, CommandListener, get({'GameInputMappingInstructionsCanvas', 'NAME'}), (get({AllBinaryGameLayerManager, '$class'})):getBackgroundBasicColor(AllBinaryGameLayerManager), (get({AllBinaryGameLayerManager, '$class'})):getForegroundBasicColor(AllBinaryGameLayerManager)),
        init_fields(This),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'})),
        put({This, colorFillPaintable}, (fun(Target_N66540) -> (get({Target_N66540, '$class'})):getInstance(Target_N66540, (get({AllBinaryGameLayerManager, '$class'})):getBackgroundBasicColor(AllBinaryGameLayerManager), false) end)('ColorFillPaintableFactory':getInstance())).

initCommands(This, CmdListener) ->
        (get({This, '$class'})):removeAllCommands(This),
        (get({This, '$class'})):addCommand(This, get({'GameInputMappingInstructionsCanvas', 'CLOSE'})),
        (get({This, '$class'})):setCommandListener(This, CmdListener).

paint(This, Graphics) ->
        (get({get({This, myFontProcessor}), '$class'})):process(get({This, myFontProcessor}), Graphics),
        (get({get({This, colorFillPaintable}), '$class'})):paint(get({This, colorFillPaintable}), Graphics),
        HalfWidth = (get({get({This, displayInfo}), '$class'})):getLastHalfWidth(get({This, displayInfo})),
        BeginWidth = (((fun(Target_N66922) -> (get({Target_N66922, '$class'})):stringWidth(Target_N66922, get({This, 'TITLE'})) end)((get({Graphics, '$class'})):getFont(Graphics)) bsr 1)),
        (get({Graphics, '$class'})):setColor(Graphics, get({This, foregroundColor})),
        (get({Graphics, '$class'})):drawString(Graphics, get({This, 'TITLE'}), (HalfWidth - BeginWidth), get({This, fontHeight}), get({This, anchor})),
        (get({get({This, drawStringUtil}), '$class'})):drawCenterStrings(get({This, drawStringUtil}), Graphics, get({This, instructions}), (get({get({This, displayInfo}), '$class'})):getLastWidth(get({This, displayInfo})), get({This, fontHeight}), HalfWidth, (3 * get({This, fontHeight}))),
        'GameCommandCanvas':paint(This, Graphics).

