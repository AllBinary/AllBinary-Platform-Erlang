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
% package org.allbinary.input.automation.actions.script.condition.processors.input
% import java.awt.event.KeyEvent
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.data.tree.dom.DomNodeHelper
% import org.allbinary.data.tree.dom.DomSearchHelper
% import org.allbinary.data.tree.dom.ModDomHelper
% import org.allbinary.input.KeySingletonFactory
% import org.allbinary.input.KeyUtil
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonLabels
% import org.w3c.dom.Document
% import org.w3c.dom.Node
% import org.w3c.dom.NodeList

-module('KeyboardActionScriptInput').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements KeyboardActionScriptInputInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicProfileActionScriptInput', Function, Arguments).

static_init() ->
    put({?MODULE, 'NAME'}, "Keyboard"),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, keyArray}, array:from_list(['KeySingletonFactory':getInstance(get({'KeyEvent', 'VK_0'}))])),
    put({This, keyboardActionScriptInputJPanel}, undefined),
    put({This, press}, false),
    put({This, release}, false),
    put({This, delayBetweenKeys}, 0),
    ok.


new(Node) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Node),
    This.

init(This, Node) ->
        'BasicProfileActionScriptInput':init(This, get({'KeyboardActionScriptInput', 'NAME'}), Node),
        init_fields(This),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'})),
        ActionNode = 'DomSearchHelper':getNode(get({'KeyboardActionScriptInputData', 'NAME'}), (get({Node, '$class'})):getChildNodes(Node)),
        case (ActionNode =/= undefined) of
            true ->
            NodeList = (get({ActionNode, '$class'})):getChildNodes(ActionNode),
            Vector = 'BasicArrayListD':new(),
            lists:foreach(fun(Index) ->
                ChildNode = (get({NodeList, '$class'})):item(NodeList, Index),
                case (fun(Target_N66725) -> (get({Target_N66725, '$class'})):startsWith(Target_N66725, get({'KeyboardActionScriptInputData', 'KEY'})) end)((get({ChildNode, '$class'})):getNodeName(ChildNode)) of
                    true ->
                    KeyString = 'DomNodeHelper':getTextNodeValue(ChildNode),
                    (get({Vector, '$class'})):add(Vector, allbinary_java:to_string(KeyString));
                    false ->
                    case ((fun(Target_N66775) -> (get({Target_N66775, '$class'})):compareTo(Target_N66775, get({'KeyboardActionScriptInputData', 'DELAY_BETWEEN_KEYS'})) end)((get({ChildNode, '$class'})):getNodeName(ChildNode)) =:= 0) of
                    true ->
                    Time = 'DomNodeHelper':getTextNodeValue(ChildNode),
                    (get({This, '$class'})):setDelayBetweenKeys(This, (fun(Target_N67251) -> (get({Target_N67251, '$class'})):intValue(Target_N67251) end)(allbinary_java:to_string(Time)));
                    false ->
                    case ((fun(Target_N66830) -> (get({Target_N66830, '$class'})):compareTo(Target_N66830, get({'KeyboardActionScriptInputData', 'PRESS'})) end)((get({ChildNode, '$class'})):getNodeName(ChildNode)) =:= 0) of
                    true ->
                    put({local, value}, 'DomNodeHelper':getTextNodeValue(ChildNode)),
                    (get({This, '$class'})):setPress(This, allbinary_java:to_string(get({local, value})));
                    false ->
                    case ((fun(Target_N66885) -> (get({Target_N66885, '$class'})):compareTo(Target_N66885, get({'KeyboardActionScriptInputData', 'RELEASE'})) end)((get({ChildNode, '$class'})):getNodeName(ChildNode)) =:= 0) of
                    true ->
                    put({local, value}, 'DomNodeHelper':getTextNodeValue(ChildNode)),
                    (get({This, '$class'})):setRelease(This, allbinary_java:to_string(get({local, value})));
                    false ->
                    erlang:error({'Exception', "Action Script Input Unknown Node"})
                end
                end
                end
                end
            end, lists:seq(0, (get({NodeList, '$class'})):getLength(NodeList) - 1)),
            (get({This, '$class'})):setKeyArray(This, (get({Vector, '$class'})):toArrayType(Vector, array:new((get({Vector, '$class'})):size(Vector), {default, undefined})));
            false ->
            erlang:error({'Exception', "Action Script Input Node Null"})
        end,
        (get({This, '$class'})):setAllowsChildren(This, false),
        case ((not (get({This, '$class'})):isPress(This)) andalso (not (get({This, '$class'})):isRelease(This))) of
            true ->
            (get({This, '$class'})):setNormal(This);
            false -> ok
        end,
        put({This, keyboardActionScriptInputJPanel}, 'KeyboardActionScriptInputJPanel':new(This)).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
        'BasicProfileActionScriptInput':init(This, get({'KeyboardActionScriptInput', 'NAME'})),
        init_fields(This),
        case ((not (get({This, '$class'})):isPress(This)) andalso (not (get({This, '$class'})):isRelease(This))) of
            true ->
            (get({This, '$class'})):setNormal(This);
            false -> ok
        end,
        (get({This, '$class'})):setAllowsChildren(This, false),
        (get({This, '$class'})):setTime(This, 120),
        put({This, keyboardActionScriptInputJPanel}, 'KeyboardActionScriptInputJPanel':new(This)).

getDelayBetweenKeys(This) ->
        get({This, delayBetweenKeys}).

setDelayBetweenKeys(This, DelayBetweenKeys) when is_integer(DelayBetweenKeys) ->
        put({This, delayBetweenKeys}, DelayBetweenKeys).

isPress(This) ->
        get({This, press}).

setPress(This, Press) when is_boolean(Press) ->
        put({This, press}, Press).

isRelease(This) ->
        get({This, release}).

setRelease(This, Release) when is_boolean(Release) ->
        put({This, release}, Release).

isNormal(This) ->
        ((get({This, '$class'})):isRelease(This) andalso (get({This, '$class'})):isPress(This)).

setNormal(This) ->
        (get({This, '$class'})):setPress(This, true),
        (get({This, '$class'})):setRelease(This, true).

getKeyArray(This) ->
        get({This, keyArray}).

setKeyArray(This, KeyArray) when (is_tuple(KeyArray) orelse KeyArray =:= undefined) ->
        case (KeyArray =/= undefined) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({'CommonLabels':getInstance(), 'START'}) + array:size(KeyArray)), This, "setKeyArray");
            false -> ok
        end,
        put({This, keyArray}, KeyArray).

showDialog(This) ->
        (fun(Target_N68625) -> (get({Target_N68625, '$class'})):setVisible(Target_N68625, true) end)((get({get({This, keyboardActionScriptInputJPanel}), '$class'})):getKeyActionJDialog(get({This, keyboardActionScriptInputJPanel}))).

getText(IntegerArray) when (is_tuple(IntegerArray) orelse IntegerArray =:= undefined) ->
        put({local, index}, 0),
        StringBuffer = 'StringMaker':new(),
        (fun Loop() -> case (get({local, index}) < array:size(IntegerArray)) of true ->
            NextInteger = array:get(get({local, index}), IntegerArray),
            case 'KeyUtil':isNormallyDisplayed(NextInteger) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, 'KeyEvent':getKeyText(NextInteger));
                false ->
                (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([lists:concat(["&#", NextInteger]), ";"]))
            end,
            put({local, index}, get({local, index}) + 1),
            Loop();
        false -> ok end end)(),
        (get({StringBuffer, '$class'})):toString(StringBuffer);
getText(This) ->
        (get({This, '$class'})):getText(This, (get({This, '$class'})):getKeyArray(This)).

setText(This, Text) when (is_list(Text) orelse Text =:= undefined) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([get({'CommonLabels':getInstance(), 'START'}), Text]), This, "setText"),
        IntegerArray = (get({This, '$class'})):integerArrayValue(This, Text),
        (get({This, '$class'})):setKeyArray(This, IntegerArray).


integerArrayValue(This, Text) when (is_list(Text) orelse Text =:= undefined) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([get({'CommonLabels':getInstance(), 'START'}), Text]), This, "integerArrayValue"),
        Vector = 'BasicArrayListD':new(),
        put({local, index}, 0),
        (fun Loop() -> case (get({local, index}) < string:length(Text)) of true ->
            try
            AChar = lists:nth((get({local, index})) + 1, Text),
            case (AChar =:= $&) of
                true ->
                case (lists:nth(((get({local, index}) + 1)) + 1, Text) =:= $#) of
                    true ->
                    EndIndex = (get({Text, '$class'})):indexOf(Text, $;, (get({local, index}) + 1)),
                    case (EndIndex =/= (-1)) of
                        true ->
                        NextCharString = string:slice(Text, (get({local, index}) + 2), (EndIndex) - ((get({local, index}) + 2))),
                        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([lists:concat([get({'CommonLabels':getInstance(), 'NEXT'}), " Char String: "]), NextCharString]), This, "integerArrayValue"),
                        (get({Vector, '$class'})):add(Vector, allbinary_java:to_string(string:slice(NextCharString, get({local, index}), (string:length(NextCharString)) - (get({local, index}))))),
                        put({local, index}, ((get({local, index}) + string:length(NextCharString)) + 3)),
                        throw('$continue');
                        false -> ok
                    end;
                    false -> ok
                end;
                false -> ok
            end,
            (get({Vector, '$class'})):add(Vector, (fun(Target_N70019) -> (get({Target_N70019, '$class'})):get(Target_N70019, allbinary_java:to_string(AChar)) end)('KeySingletonFactory':getHashtable())),
            put({local, index}, get({local, index}) + 1)
            catch throw:'$continue' -> ok end,
            Loop();
        false -> ok end end)(),
        IntegerArray = (get({Vector, '$class'})):toArrayType(Vector, array:new((get({Vector, '$class'})):size(Vector), {default, undefined})),
        IntegerArray.

toHashMap(This) ->
        HashMap = (fun(Target_N70306) -> (get({Target_N70306, '$class'})):createHashMap(Target_N70306) end)('StdUtil':getInstance()),
        lists:foreach(fun(Index) ->
            (get({HashMap, '$class'})):put(HashMap, (get({'KeyboardActionScriptInputData', 'KEY'}) + Index), allbinary_java:to_string(array:get(Index, (get({This, '$class'})):getKeyArray(This))))
        end, lists:seq(0, array:size((get({This, '$class'})):getKeyArray(This)) - 1)),
        (get({HashMap, '$class'})):put(HashMap, get({'KeyboardActionScriptInputData', 'DELAY_BETWEEN_KEYS'}), allbinary_java:to_string((get({This, '$class'})):getDelayBetweenKeys(This))),
        (get({HashMap, '$class'})):put(HashMap, get({'KeyboardActionScriptInputData', 'PRESS'}), allbinary_java:to_string((get({This, '$class'})):isPress(This))),
        (get({HashMap, '$class'})):put(HashMap, get({'KeyboardActionScriptInputData', 'RELEASE'}), allbinary_java:to_string((get({This, '$class'})):isRelease(This))),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["HashMap: ", (get({HashMap, '$class'})):toString(HashMap)]), This, "toHashMap()"),
        HashMap.

% throws Exception
toXmlNode(This, Document) ->
        Node = 'BasicProfileActionScriptInput':toXmlNode(This, Document),
        (get({Node, '$class'})):appendChild(Node, 'ModDomHelper':createNodeWithValueNodes(Document, get({'KeyboardActionScriptInputData', 'NAME'}), (get({This, '$class'})):toHashMap(This))),
        Node.

% throws Exception
process(This, Frame) ->
        'KeyboardInputAutomationProcessor':process(This).

log(This) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({This, '$class'})):toString(This), This, "log").

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, 'BasicProfileActionScriptInput':toString(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Text: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getText(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, " isPress: "),
        (get({StringBuffer, '$class'})):appendboolean(StringBuffer, (get({This, '$class'})):isPress(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, " isRelease: "),
        (get({StringBuffer, '$class'})):appendboolean(StringBuffer, (get({This, '$class'})):isRelease(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Between Key Delay: "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, (get({This, '$class'})):getDelayBetweenKeys(This)),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

