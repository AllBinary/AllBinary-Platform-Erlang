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
% package org.allbinary.input.automation.actions.script.condition
% import java.awt.Color
% import java.awt.Point
% import java.awt.image.BufferedImage
% import java.util.HashMap
% import org.allbinary.data.tree.dom.DomNodeHelper
% import org.allbinary.data.tree.dom.DomSearchHelper
% import org.allbinary.data.tree.dom.ModDomHelper
% import org.allbinary.graphics.color.ColorCacheFactory
% import org.allbinary.graphics.color.ColorCacheable
% import org.allbinary.input.media.image.capture.CapturedBufferedImagesCacheSingleton
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.util.cache.AutomaticCacheInterface
% import org.allbinary.media.image.analysis.ColorRange
% import org.allbinary.media.image.analysis.ColorRangeInterface
% import org.allbinary.media.image.cache.BufferedImageFrameCacheable
% import org.allbinary.string.CommonSeps
% import org.w3c.dom.Document
% import org.w3c.dom.Node
% import org.w3c.dom.NodeList

-module('ColorAtActionScriptCondition').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements ColorAtActionScriptConditionInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicProfileActionScriptCondition', Function, Arguments).

static_init() ->
    put({?MODULE, 'NAME'}, "If Color At"),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, colorAtActionScriptConditionJPanel}, undefined),
    put({This, point}, undefined),
    put({This, colorRangeInterface}, 'ColorRange':new()),
    ok.


new(Node) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Node),
    This.

init(This, Node) ->
        'BasicProfileActionScriptCondition':init(This, get({'ColorAtActionScriptCondition', 'NAME'}), Node),
        init_fields(This),
        put({This, point}, 'Point':new(0, 0)),
        ActionNode = 'DomSearchHelper':getNode(get({'ColorAtActionScriptConditionData', 'NAME'}), (get({Node, '$class'})):getChildNodes(Node)),
        case (ActionNode =/= undefined) of
            true ->
            NodeList = (get({ActionNode, '$class'})):getChildNodes(ActionNode),
            lists:foreach(fun(Index) ->
                ChildNode = (get({NodeList, '$class'})):item(NodeList, Index),
                case ((fun(Target_N66773) -> (get({Target_N66773, '$class'})):compareTo(Target_N66773, get({'ColorAtActionScriptConditionData', 'LOCATION_X'})) end)((get({ChildNode, '$class'})):getNodeName(ChildNode)) =:= 0) of
                    true ->
                    LocationX = 'DomNodeHelper':getTextNodeValue(ChildNode),
                    put({get({This, point}), x}, allbinary_java:to_string(LocationX));
                    false ->
                    case ((fun(Target_N66828) -> (get({Target_N66828, '$class'})):compareTo(Target_N66828, get({'ColorAtActionScriptConditionData', 'LOCATION_Y'})) end)((get({ChildNode, '$class'})):getNodeName(ChildNode)) =:= 0) of
                    true ->
                    LocationY = 'DomNodeHelper':getTextNodeValue(ChildNode),
                    put({get({This, point}), y}, allbinary_java:to_string(LocationY));
                    false ->
                    case ((fun(Target_N66883) -> (get({Target_N66883, '$class'})):compareTo(Target_N66883, get({'ColorAtActionScriptConditionData', 'MIN_RED'})) end)((get({ChildNode, '$class'})):getNodeName(ChildNode)) =:= 0) of
                    true ->
                    put({local, string}, 'DomNodeHelper':getTextNodeValue(ChildNode)),
                    (fun(Target_N67843) -> (get({Target_N67843, '$class'})):setMinRed(Target_N67843, allbinary_java:to_string(get({local, string}))) end)((get({This, '$class'})):getColorRangeInterface(This));
                    false ->
                    case ((fun(Target_N66938) -> (get({Target_N66938, '$class'})):compareTo(Target_N66938, get({'ColorAtActionScriptConditionData', 'MAX_RED'})) end)((get({ChildNode, '$class'})):getNodeName(ChildNode)) =:= 0) of
                    true ->
                    put({local, string}, 'DomNodeHelper':getTextNodeValue(ChildNode)),
                    (fun(Target_N67728) -> (get({Target_N67728, '$class'})):setMaxRed(Target_N67728, allbinary_java:to_string(get({local, string}))) end)((get({This, '$class'})):getColorRangeInterface(This));
                    false ->
                    case ((fun(Target_N66993) -> (get({Target_N66993, '$class'})):compareTo(Target_N66993, get({'ColorAtActionScriptConditionData', 'MIN_GREEN'})) end)((get({ChildNode, '$class'})):getNodeName(ChildNode)) =:= 0) of
                    true ->
                    put({local, string}, 'DomNodeHelper':getTextNodeValue(ChildNode)),
                    (fun(Target_N67613) -> (get({Target_N67613, '$class'})):setMinGreen(Target_N67613, allbinary_java:to_string(get({local, string}))) end)((get({This, '$class'})):getColorRangeInterface(This));
                    false ->
                    case ((fun(Target_N67048) -> (get({Target_N67048, '$class'})):compareTo(Target_N67048, get({'ColorAtActionScriptConditionData', 'MAX_GREEN'})) end)((get({ChildNode, '$class'})):getNodeName(ChildNode)) =:= 0) of
                    true ->
                    put({local, string}, 'DomNodeHelper':getTextNodeValue(ChildNode)),
                    (fun(Target_N67498) -> (get({Target_N67498, '$class'})):setMaxGreen(Target_N67498, allbinary_java:to_string(get({local, string}))) end)((get({This, '$class'})):getColorRangeInterface(This));
                    false ->
                    case ((fun(Target_N67103) -> (get({Target_N67103, '$class'})):compareTo(Target_N67103, get({'ColorAtActionScriptConditionData', 'MIN_BLUE'})) end)((get({ChildNode, '$class'})):getNodeName(ChildNode)) =:= 0) of
                    true ->
                    put({local, string}, 'DomNodeHelper':getTextNodeValue(ChildNode)),
                    (fun(Target_N67383) -> (get({Target_N67383, '$class'})):setMinBlue(Target_N67383, allbinary_java:to_string(get({local, string}))) end)((get({This, '$class'})):getColorRangeInterface(This));
                    false ->
                    case ((fun(Target_N67158) -> (get({Target_N67158, '$class'})):compareTo(Target_N67158, get({'ColorAtActionScriptConditionData', 'MAX_BLUE'})) end)((get({ChildNode, '$class'})):getNodeName(ChildNode)) =:= 0) of
                    true ->
                    put({local, string}, 'DomNodeHelper':getTextNodeValue(ChildNode)),
                    (fun(Target_N67268) -> (get({Target_N67268, '$class'})):setMaxBlue(Target_N67268, allbinary_java:to_string(get({local, string}))) end)((get({This, '$class'})):getColorRangeInterface(This));
                    false -> ok
                end
                end
                end
                end
                end
                end
                end
                end
            end, lists:seq(0, (get({NodeList, '$class'})):getLength(NodeList) - 1));
            false ->
            erlang:error({'Exception', "Color At Action Script Condition Node Null"})
        end,
        (get({This, '$class'})):init(This).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
        'BasicProfileActionScriptCondition':init(This, get({'ColorAtActionScriptCondition', 'NAME'})),
        init_fields(This),
        put({This, point}, 'Point':new(0, 0)),
        (get({This, '$class'})):init(This).

init(This) ->
        put({This, colorAtActionScriptConditionJPanel}, 'ColorAtActionScriptConditionJPanel':new(This)).

getPoint(This) ->
        get({This, point}).

setPoint(This, Point) ->
        put({This, point}, Point).

showDialog(This) ->
        (fun(Target_N68563) -> (get({Target_N68563, '$class'})):setVisible(Target_N68563, true) end)((get({get({This, colorAtActionScriptConditionJPanel}), '$class'})):getColorAtActionJDialog(get({This, colorAtActionScriptConditionJPanel}))).

toHashMap(This) ->
        HashMap = (fun(Target_N68634) -> (get({Target_N68634, '$class'})):createHashMap(Target_N68634) end)('StdUtil':getInstance()),
        (get({HashMap, '$class'})):put(HashMap, get({'ColorAtActionScriptConditionData', 'LOCATION_X'}), allbinary_java:to_string(get({(get({This, '$class'})):getPoint(This), x}))),
        (get({HashMap, '$class'})):put(HashMap, get({'ColorAtActionScriptConditionData', 'LOCATION_Y'}), allbinary_java:to_string(get({(get({This, '$class'})):getPoint(This), y}))),
        (get({HashMap, '$class'})):put(HashMap, get({'ColorAtActionScriptConditionData', 'MIN_RED'}), allbinary_java:to_string((fun(Target_N68881) -> (get({Target_N68881, '$class'})):getMinRed(Target_N68881) end)((get({This, '$class'})):getColorRangeInterface(This)))),
        (get({HashMap, '$class'})):put(HashMap, get({'ColorAtActionScriptConditionData', 'MAX_RED'}), allbinary_java:to_string((fun(Target_N68958) -> (get({Target_N68958, '$class'})):getMaxRed(Target_N68958) end)((get({This, '$class'})):getColorRangeInterface(This)))),
        (get({HashMap, '$class'})):put(HashMap, get({'ColorAtActionScriptConditionData', 'MIN_GREEN'}), allbinary_java:to_string((fun(Target_N69035) -> (get({Target_N69035, '$class'})):getMinGreen(Target_N69035) end)((get({This, '$class'})):getColorRangeInterface(This)))),
        (get({HashMap, '$class'})):put(HashMap, get({'ColorAtActionScriptConditionData', 'MAX_GREEN'}), allbinary_java:to_string((fun(Target_N69112) -> (get({Target_N69112, '$class'})):getMaxGreen(Target_N69112) end)((get({This, '$class'})):getColorRangeInterface(This)))),
        (get({HashMap, '$class'})):put(HashMap, get({'ColorAtActionScriptConditionData', 'MIN_BLUE'}), allbinary_java:to_string((fun(Target_N69189) -> (get({Target_N69189, '$class'})):getMinBlue(Target_N69189) end)((get({This, '$class'})):getColorRangeInterface(This)))),
        (get({HashMap, '$class'})):put(HashMap, get({'ColorAtActionScriptConditionData', 'MAX_BLUE'}), allbinary_java:to_string((fun(Target_N69266) -> (get({Target_N69266, '$class'})):getMaxBlue(Target_N69266) end)((get({This, '$class'})):getColorRangeInterface(This)))),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["HashMap: ", (get({HashMap, '$class'})):toString(HashMap)]), This, "toHashMap()"),
        HashMap.

% throws Exception
toXmlNode(This, Document) ->
        Node = 'BasicProfileActionScriptCondition':toXmlNode(This, Document),
        (get({Node, '$class'})):appendChild(Node, 'ModDomHelper':createNodeWithValueNodes(Document, get({'ColorAtActionScriptConditionData', 'NAME'}), (get({This, '$class'})):toHashMap(This))),
        Node.

% throws Exception
shouldProcess(This, Frame) when is_integer(Frame) ->
        try
        CapturedBufferedImageCacheable = (fun(Target_N69603) -> (get({Target_N69603, '$class'})):get(Target_N69603, allbinary_java:to_string(Frame)) end)(('CapturedBufferedImagesCacheSingleton':getInstance())),
        BufferedImage = (get({CapturedBufferedImageCacheable, '$class'})):getBufferedImage(CapturedBufferedImageCacheable),
        AutomaticCacheInterface = 'ColorCacheFactory':getInstance(),
        ColorInteger = allbinary_java:to_string((get({BufferedImage, '$class'})):getRGB(BufferedImage, get({(get({This, '$class'})):getPoint(This), x}), get({(get({This, '$class'})):getPoint(This), y}))),
        ColorCacheable = (get({AutomaticCacheInterface, '$class'})):get(AutomaticCacheInterface, ColorInteger),
        Color = (get({ColorCacheable, '$class'})):getColor(ColorCacheable),
        case (get({get({This, colorRangeInterface}), '$class'})):isInRange(get({This, colorRangeInterface}), Color) of
            true ->
            throw({'$return', 'BasicProfileActionScriptCondition':shouldProcess(This, Frame)});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

log(This) ->
        Message = (fun(Target_N70146) -> (get({Target_N70146, '$class'})):toString(Target_N70146) end)((fun(Target_N70153) -> (get({Target_N70153, '$class'})):append(Target_N70153, (fun(Target_N70254) -> (get({Target_N70254, '$class'})):toString(Target_N70254) end)((get({This, '$class'})):getColorRangeInterface(This))) end)((fun(Target_N70160) -> (get({Target_N70160, '$class'})):append(Target_N70160, get({'CommonSeps':getInstance(), 'NEW_LINE'})) end)((fun(Target_N70167) -> (get({Target_N70167, '$class'})):append(Target_N70167, (fun(Target_N70203) -> (get({Target_N70203, '$class'})):toString(Target_N70203) end)((get({This, '$class'})):getPoint(This))) end)((fun(Target_N70174) -> (get({Target_N70174, '$class'})):append(Target_N70174, "getPoint(): ") end)('StringMaker':new()))))),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), Message, This, "log").

getColorRangeInterface(This) ->
        get({This, colorRangeInterface}).

setColorRangeInterface(This, ColorRangeInterface) ->
        put({This, colorRangeInterface}, ColorRangeInterface).

