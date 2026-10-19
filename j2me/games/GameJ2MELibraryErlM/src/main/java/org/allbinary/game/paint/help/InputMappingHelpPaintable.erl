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
% package org.allbinary.game.paint.help
% import javax.microedition.lcdui.Font
% import javax.microedition.lcdui.Graphics
% import org.allbinary.game.input.GameKey
% import org.allbinary.game.input.GameKeyFactory
% import org.allbinary.game.input.Input
% import org.allbinary.game.input.PlatformInputMappingFactory
% import org.allbinary.game.input.mapping.GameInputMapping
% import org.allbinary.game.input.mapping.PersistentInputMapping
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.graphics.color.BasicColorUtil
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.string.CommonLabels
% import org.allbinary.string.CommonSeps
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.BasicArrayList

-module('InputMappingHelpPaintable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('HelpPaintable', Function, Arguments).

static_init() ->
    put({?MODULE, 'AND'}, " and "),
    put({?MODULE, 'SEP'}, ", "),
    put({?MODULE, 'MORE_THAN_TWO_IN_LIST_AND'}, ", and "),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, commonSeps}, 'CommonSeps':getInstance()),
    put({This, stringUtil}, 'StringUtil':getInstance()),
    put({This, basicColorFactory}, 'BasicColorFactory':getInstance()),
    put({This, 'NONE'}, get({'GameKeyFactory':getInstance(), 'NONE'})),
    put({This, 'EMPTY_STRING'}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
    put({This, gameInputMappingArray}, undefined),
    put({This, keyMappingArray}, array:new(0, {default, undefined})),
    put({This, actionBasicColor}, get({'BasicColorUtil':getInstance(), 'ZERO_ARRAY'})),
    put({This, inputBasicColorArray}, array:new(0, {default, array:new(0, {default, undefined})})),
    put({This, selectedBasicColor}, undefined),
    put({This, updateMyFontProperties}, 'UpdateMyFontProperties':new()),
    ok.


new(GameInputMappingArray, BackgroundBasicColor, BasicColor) when (is_tuple(GameInputMappingArray) orelse GameInputMappingArray =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, GameInputMappingArray, BackgroundBasicColor, BasicColor),
    This.

init(This, GameInputMappingArray, BackgroundBasicColor, BasicColor) when (is_tuple(GameInputMappingArray) orelse GameInputMappingArray =:= undefined) ->
        'HelpPaintable':init(This, "Input Mapping", BackgroundBasicColor, BasicColor),
        init_fields(This),
        put({This, gameInputMappingArray}, GameInputMappingArray),
        (get({This, '$class'})):update(This, get({This, 'NONE'}), get({This, 'NONE'})),
        case ((BackgroundBasicColor =:= get({get({This, basicColorFactory}), 'WHITE'})) orelse (BasicColor =:= get({get({This, basicColorFactory}), 'WHITE'}))) of
            true ->
            put({This, selectedBasicColor}, get({get({This, basicColorFactory}), 'RED'}));
            false ->
            put({This, selectedBasicColor}, get({get({This, basicColorFactory}), 'WHITE'}))
        end.

updateMeasurement(This, Graphics) ->
        Font = (get({Graphics, '$class'})):getFont(Graphics),
        UpdateMyFontProperties = 'UpdateMyFontProperties':new(),
        put({UpdateMyFontProperties, charHeight}, (get({Font, '$class'})):getHeight(Font)),
        StringMaker = 'StringMaker':new(),
        InputInfo = get({This, inputInfo}),
        Size = array:size(InputInfo),
        put({UpdateMyFontProperties, actionStringArray}, array:new(Size, {default, undefined})),
        put({UpdateMyFontProperties, keymappingBeginWidthArray}, array:new(Size, {default, 0})),
        put({UpdateMyFontProperties, actionStringDeltaXArray}, array:new(Size, {default, 0})),
        put({UpdateMyFontProperties, inputDeltaXArray}, array:new(Size, {default, array:new(0, {default, 0})})),
        put({UpdateMyFontProperties, sepArray}, array:new(Size, {default, array:new(0, {default, undefined})})),
        put({UpdateMyFontProperties, sepWidthArray}, array:new(Size, {default, array:new(0, {default, 0})})),
        put({local, list}, undefined),
        put({local, keyMappings}, undefined),
        put({local, actionString}, undefined),
        put({local, input}, undefined),
        put({local, size2}, 0),
        lists:foreach(fun(Index) ->
            put({local, list}, array:get(Index, get({This, keyMappingArray}))),
            put({local, keyMappings}, (get({This, '$class'})):get(This, get({local, list}))),
            (get({StringMaker, '$class'})):delete(StringMaker, 0, (get({StringMaker, '$class'})):length(StringMaker)),
            put({local, actionString}, (fun(Target_N68546) -> (get({Target_N68546, '$class'})):toString(Target_N68546) end)((fun(Target_N68553) -> (get({Target_N68553, '$class'})):append(Target_N68553, get({get({This, commonSeps}), 'SPACE'})) end)((fun(Target_N68560) -> (get({Target_N68560, '$class'})):append(Target_N68560, get({get({This, commonSeps}), 'SPACE'})) end)((fun(Target_N68567) -> (get({Target_N68567, '$class'})):append(Target_N68567, get({get({This, commonSeps}), 'COLON'})) end)((get({StringMaker, '$class'})):append(StringMaker, array:get(Index, InputInfo))))))),
            put({UpdateMyFontProperties, actionStringArray}, array:set(Index, get({local, actionString}), get({UpdateMyFontProperties, actionStringArray}))),
            (get({StringMaker, '$class'})):delete(StringMaker, 0, (get({StringMaker, '$class'})):length(StringMaker)),
            put({UpdateMyFontProperties, keymappingBeginWidthArray}, array:set(Index, (((get({Font, '$class'})):stringWidth(Font, (fun(Target_N68827) -> (get({Target_N68827, '$class'})):toString(Target_N68827) end)((fun(Target_N68834) -> (get({Target_N68834, '$class'})):append(Target_N68834, get({local, keyMappings})) end)((get({StringMaker, '$class'})):append(StringMaker, array:get(Index, get({UpdateMyFontProperties, actionStringArray})))))) bsr 1)), get({UpdateMyFontProperties, keymappingBeginWidthArray}))),
            put({UpdateMyFontProperties, actionStringDeltaXArray}, array:set(Index, (get({Font, '$class'})):stringWidth(Font, get({local, actionString})), get({UpdateMyFontProperties, actionStringDeltaXArray}))),
            put({local, size2}, (get({get({local, list}), '$class'})):size(get({local, list}))),
            put({UpdateMyFontProperties, inputDeltaXArray}, array:set(Index, array:new(get({local, size2}), {default, 0}), get({UpdateMyFontProperties, inputDeltaXArray}))),
            put({UpdateMyFontProperties, sepArray}, array:set(Index, array:new(get({local, size2}), {default, undefined}), get({UpdateMyFontProperties, sepArray}))),
            put({UpdateMyFontProperties, sepWidthArray}, array:set(Index, array:new(get({local, size2}), {default, 0}), get({UpdateMyFontProperties, sepWidthArray}))),
            lists:foreach(fun(Index2) ->
                put({local, input}, array:get(Index2, get({get({local, list}), objectArray}))),
                put({UpdateMyFontProperties, inputDeltaXArray}, array:set(Index, array:set(Index2, (get({Font, '$class'})):stringWidth(Font, (get({get({local, input}), '$class'})):getName(get({local, input}))), array:get(Index, get({UpdateMyFontProperties, inputDeltaXArray}))), get({UpdateMyFontProperties, inputDeltaXArray}))),
                put({UpdateMyFontProperties, sepArray}, array:set(Index, array:set(Index2, get({This, 'EMPTY_STRING'}), array:get(Index, get({UpdateMyFontProperties, sepArray}))), get({UpdateMyFontProperties, sepArray}))),
                case ((Index2 + 1) < (get({get({local, list}), '$class'})):size(get({local, list}))) of
                    true ->
                    case ((get({get({local, list}), '$class'})):size(get({local, list})) =:= 2) of
                        true ->
                        put({UpdateMyFontProperties, sepArray}, array:set(Index, array:set(Index2, get({'InputMappingHelpPaintable', 'AND'}), array:get(Index, get({UpdateMyFontProperties, sepArray}))), get({UpdateMyFontProperties, sepArray})));
                        false ->
                        case ((Index2 + 2) =:= (get({get({local, list}), '$class'})):size(get({local, list}))) of
                            true ->
                            put({UpdateMyFontProperties, sepArray}, array:set(Index, array:set(Index2, get({'InputMappingHelpPaintable', 'MORE_THAN_TWO_IN_LIST_AND'}), array:get(Index, get({UpdateMyFontProperties, sepArray}))), get({UpdateMyFontProperties, sepArray})));
                            false ->
                            put({UpdateMyFontProperties, sepArray}, array:set(Index, array:set(Index2, get({'InputMappingHelpPaintable', 'SEP'}), array:get(Index, get({UpdateMyFontProperties, sepArray}))), get({UpdateMyFontProperties, sepArray})))
                        end
                    end;
                    false -> ok
                end,
                case (array:get(Index2, array:get(Index, get({UpdateMyFontProperties, sepArray}))) =/= get({This, 'EMPTY_STRING'})) of
                    true ->
                    put({UpdateMyFontProperties, sepWidthArray}, array:set(Index, array:set(Index2, (get({Font, '$class'})):stringWidth(Font, array:get(Index2, array:get(Index, get({UpdateMyFontProperties, sepArray})))), array:get(Index, get({UpdateMyFontProperties, sepWidthArray}))), get({UpdateMyFontProperties, sepWidthArray})));
                    false -> ok
                end
            end, lists:seq(0, get({local, size2}) - 1))
        end, lists:seq(0, Size - 1)),
        put({This, updateMyFontProperties}, UpdateMyFontProperties),
        'HelpPaintable':updateMeasurement(This, Graphics).

update(This, SelectedGameKey, SelectedInput) ->
        StringMaker = 'StringMaker':new(),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N70231) -> (get({Target_N70231, '$class'})):toString(Target_N70231) end)((fun(Target_N70238) -> (get({Target_N70238, '$class'})):append(Target_N70238, (get({get({This, stringUtil}), '$class'})):toString(get({This, stringUtil}), SelectedInput)) end)((fun(Target_N70245) -> (get({Target_N70245, '$class'})):append(Target_N70245, " Input: ") end)((fun(Target_N70252) -> (get({Target_N70252, '$class'})):append(Target_N70252, (get({get({This, stringUtil}), '$class'})):toString(get({This, stringUtil}), SelectedGameKey)) end)((fun(Target_N70259) -> (get({Target_N70259, '$class'})):append(Target_N70259, "selected GameKey: ") end)((get({StringMaker, '$class'})):append(StringMaker, get({'CommonLabels':getInstance(), 'START_LABEL'}))))))), This, get({get({This, commonStrings}), 'UPDATE'})),
        GameKeyMapping = (fun(Target_N70437) -> (get({Target_N70437, '$class'})):getPersistentInputMappingInstance(Target_N70437) end)('PlatformInputMappingFactory':getInstance()),
        Size = array:size(get({This, gameInputMappingArray})),
        KeyInfo = array:new(Size, {default, undefined}),
        KeyMappingArray = array:new(Size, {default, undefined}),
        ActionBasicColor = array:new(Size, {default, undefined}),
        InputBasicColorArray = array:new(Size, {default, undefined}),
        put({local, gameInputMapping}, undefined),
        put({local, gameKey}, undefined),
        put({local, list}, undefined),
        lists:foreach(fun(Index) ->
            put({local, gameInputMapping}, array:get(Index, get({This, gameInputMappingArray}))),
            put({local, gameKey}, (get({get({local, gameInputMapping}), '$class'})):getGameKey(get({local, gameInputMapping}))),
            put({local, list}, (fun(Target_N70975) -> (get({Target_N70975, '$class'})):getMappedInput(Target_N70975, get({local, gameKey})) end)((get({GameKeyMapping, '$class'})):getInputMapping(GameKeyMapping))),
            Size2 = (get({get({local, list}), '$class'})):size(get({local, list})),
            array:set(Index, array:new(Size2, {default, undefined}), InputBasicColorArray),
            lists:foreach(fun(Index2) ->
                array:set(Index, array:set(Index2, get({This, basicColor}), array:get(Index, InputBasicColorArray)), InputBasicColorArray)
            end, lists:seq(0, Size2 - 1)),
            case (get({local, gameKey}) =:= SelectedGameKey) of
                true ->
                (get({StringMaker, '$class'})):delete(StringMaker, 0, (get({StringMaker, '$class'})):length(StringMaker)),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N71375) -> (get({Target_N71375, '$class'})):toString(Target_N71375) end)((fun(Target_N71382) -> (get({Target_N71382, '$class'})):append(Target_N71382, (get({get({This, stringUtil}), '$class'})):toString(get({This, stringUtil}), SelectedGameKey)) end)((get({StringMaker, '$class'})):append(StringMaker, "Found: selected GameKey: "))), This, get({get({This, commonStrings}), 'UPDATE'})),
                array:set(Index, get({This, selectedBasicColor}), ActionBasicColor),
                IndexOfSelectedInput = (get({get({local, list}), '$class'})):indexOf(get({local, list}), SelectedInput),
                case (IndexOfSelectedInput >= 0) of
                    true ->
                    (get({StringMaker, '$class'})):delete(StringMaker, 0, (get({StringMaker, '$class'})):length(StringMaker)),
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N71653) -> (get({Target_N71653, '$class'})):toString(Target_N71653) end)((fun(Target_N71660) -> (get({Target_N71660, '$class'})):append(Target_N71660, (get({get({This, stringUtil}), '$class'})):toString(get({This, stringUtil}), SelectedInput)) end)((get({StringMaker, '$class'})):append(StringMaker, "Found: selected Input: "))), This, get({get({This, commonStrings}), 'UPDATE'})),
                    array:set(Index, array:set(IndexOfSelectedInput, get({This, selectedBasicColor}), array:get(Index, InputBasicColorArray)), InputBasicColorArray);
                    false -> ok
                end;
                false ->
                array:set(Index, get({This, basicColor}), ActionBasicColor)
            end,
            array:set(Index, (get({get({local, gameInputMapping}), '$class'})):getName(get({local, gameInputMapping})), KeyInfo),
            array:set(Index, get({local, list}), KeyMappingArray)
        end, lists:seq(0, Size - 1)),
        put({This, keyMappingArray}, KeyMappingArray),
        put({This, actionBasicColor}, ActionBasicColor),
        put({This, inputBasicColorArray}, InputBasicColorArray),
        'HelpPaintable':setInputInfoP(This, KeyInfo),
        put({This, myFontProcessor}, get({This, updateMyFontProcessor})).

get(This, KeyList) ->
        StringBuffer = 'StringMaker':new(),
        put({local, key}, undefined),
        Size = (get({KeyList, '$class'})):size(KeyList),
        lists:foreach(fun(Index) ->
            put({local, key}, array:get(Index, get({KeyList, objectArray}))),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({local, key}), '$class'})):getName(get({local, key}))),
            case ((Index + 1) < (get({KeyList, '$class'})):size(KeyList)) of
                true ->
                case ((get({KeyList, '$class'})):size(KeyList) =:= 2) of
                    true ->
                    (get({StringBuffer, '$class'})):append(StringBuffer, get({'InputMappingHelpPaintable', 'AND'}));
                    false ->
                    case ((Index + 2) =:= (get({KeyList, '$class'})):size(KeyList)) of
                        true ->
                        (get({StringBuffer, '$class'})):append(StringBuffer, get({'InputMappingHelpPaintable', 'MORE_THAN_TWO_IN_LIST_AND'}));
                        false ->
                        (get({StringBuffer, '$class'})):append(StringBuffer, get({'InputMappingHelpPaintable', 'SEP'}))
                    end
                end;
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

paint(This, Graphics) ->
        (get({get({This, myFontProcessor}), '$class'})):process(get({This, myFontProcessor}), Graphics),
        HalfWidth = (get({get({This, displayInfo}), '$class'})):getLastHalfWidth(get({This, displayInfo})),
        (get({Graphics, '$class'})):setColor(Graphics, (get({get({This, basicColor}), '$class'})):intValue(get({This, basicColor}))),
        (get({Graphics, '$class'})):drawString(Graphics, get({This, title}), (HalfWidth - get({This, titleBeginWidth})), get({get({This, updateMyFontProperties}), charHeight}), get({This, anchor})),
        InputInfo = get({This, inputInfo}),
        Size = array:size(InputInfo),
        put({local, y}, 0),
        put({local, deltaX}, 0),
        put({local, size2}, 0),
        put({local, actionString}, undefined),
        put({local, input}, undefined),
        put({local, list}, undefined),
        put({local, sep}, undefined),
        put({local, beginWidth}, 0),
        lists:foreach(fun(Index) ->
            put({local, y}, (((Index + 3)) * get({get({This, updateMyFontProperties}), charHeight}))),
            put({local, deltaX}, 0),
            put({local, list}, array:get(Index, get({This, keyMappingArray}))),
            put({local, size2}, (get({get({local, list}), '$class'})):size(get({local, list}))),
            put({local, beginWidth}, array:get(Index, get({get({This, updateMyFontProperties}), keymappingBeginWidthArray}))),
            (get({Graphics, '$class'})):setColor(Graphics, (fun(Target_N73570) -> (get({Target_N73570, '$class'})):intValue(Target_N73570) end)(array:get(Index, get({This, actionBasicColor})))),
            put({local, actionString}, array:get(Index, get({get({This, updateMyFontProperties}), actionStringArray}))),
            (get({Graphics, '$class'})):drawString(Graphics, get({local, actionString}), ((HalfWidth - get({local, beginWidth})) + get({local, deltaX})), get({local, y}), get({This, anchor})),
            put({local, deltaX}, (get({local, deltaX}) + array:get(Index, get({get({This, updateMyFontProperties}), actionStringDeltaXArray})))),
            lists:foreach(fun(Index2) ->
                put({local, input}, array:get(Index2, get({get({local, list}), objectArray}))),
                (get({Graphics, '$class'})):setColor(Graphics, (fun(Target_N73877) -> (get({Target_N73877, '$class'})):intValue(Target_N73877) end)(array:get(Index2, array:get(Index, get({This, inputBasicColorArray}))))),
                (get({Graphics, '$class'})):drawString(Graphics, (get({get({local, input}), '$class'})):getName(get({local, input})), ((HalfWidth - get({local, beginWidth})) + get({local, deltaX})), get({local, y}), get({This, anchor})),
                put({local, deltaX}, (get({local, deltaX}) + array:get(Index2, array:get(Index, get({get({This, updateMyFontProperties}), inputDeltaXArray}))))),
                put({local, sep}, array:get(Index2, array:get(Index, get({get({This, updateMyFontProperties}), sepArray})))),
                (get({Graphics, '$class'})):setColor(Graphics, (get({get({This, basicColor}), '$class'})):intValue(get({This, basicColor}))),
                (get({Graphics, '$class'})):drawString(Graphics, get({local, sep}), ((HalfWidth - get({local, beginWidth})) + get({local, deltaX})), get({local, y}), get({This, anchor})),
                put({local, deltaX}, (get({local, deltaX}) + array:get(Index2, array:get(Index, get({get({This, updateMyFontProperties}), sepWidthArray})))))
            end, lists:seq(0, get({local, size2}) - 1))
        end, lists:seq(0, Size - 1)).
% Java nested class UpdateMyFontProperties: move it to its own module 'UpdateMyFontProperties'

