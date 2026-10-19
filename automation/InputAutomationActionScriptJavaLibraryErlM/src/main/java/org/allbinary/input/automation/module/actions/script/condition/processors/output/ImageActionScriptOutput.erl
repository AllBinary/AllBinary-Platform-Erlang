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
% package org.allbinary.input.automation.module.actions.script.condition.processors.output
% import java.util.HashMap
% import org.allbinary.data.tree.dom.DomNodeHelper
% import org.allbinary.data.tree.dom.DomSearchHelper
% import org.allbinary.data.tree.dom.ModDomHelper
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.w3c.dom.Document
% import org.w3c.dom.Node
% import org.w3c.dom.NodeList

-module('ImageActionScriptOutput').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements ImageActionScriptOutputInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicProfileActionScriptOutput', Function, Arguments).

static_init() ->
    put({?MODULE, 'NAME'}, "Captures"),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, saved}, false),
    put({This, display}, false),
    put({This, imageTypes}, undefined),
    put({This, actionScriptOutputJPanel}, undefined),
    ok.


new(Node) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Node),
    This.

init(This, Node) ->
        'BasicProfileActionScriptOutput':init(This, get({'ImageActionScriptOutput', 'NAME'}), Node),
        init_fields(This),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'})),
        ActionNode = 'DomSearchHelper':getNode(get({'ImageActionScriptOutputData', 'NAME'}), (get({Node, '$class'})):getChildNodes(Node)),
        case (ActionNode =/= undefined) of
            true ->
            NodeList = (get({ActionNode, '$class'})):getChildNodes(ActionNode),
            lists:foreach(fun(Index) ->
                ChildNode = (get({NodeList, '$class'})):item(NodeList, Index),
                case ((fun(Target_N66480) -> (get({Target_N66480, '$class'})):compareTo(Target_N66480, get({'ImageActionScriptOutputData', 'SAVE'})) end)((get({ChildNode, '$class'})):getNodeName(ChildNode)) =:= 0) of
                    true ->
                    put({local, booleanString}, 'DomNodeHelper':getTextNodeValue(ChildNode)),
                    (get({This, '$class'})):setSaved(This, (get({get({local, booleanString}), '$class'})):booleanValue(get({local, booleanString})));
                    false ->
                    case ((fun(Target_N66535) -> (get({Target_N66535, '$class'})):compareTo(Target_N66535, get({'ImageActionScriptOutputData', 'DISPLAY'})) end)((get({ChildNode, '$class'})):getNodeName(ChildNode)) =:= 0) of
                    true ->
                    put({local, booleanString}, 'DomNodeHelper':getTextNodeValue(ChildNode)),
                    (get({This, '$class'})):setSaved(This, (get({get({local, booleanString}), '$class'})):booleanValue(get({local, booleanString})));
                    false ->
                    case ((fun(Target_N66590) -> (get({Target_N66590, '$class'})):compareTo(Target_N66590, get({'ImageActionScriptOutputData', 'TYPES'})) end)((get({ChildNode, '$class'})):getNodeName(ChildNode)) =:= 0) of
                    true ->
                    (get({This, '$class'})):setImageTypes(This, 'ImageTypes':new(ChildNode));
                    false ->
                    erlang:error({'Exception', "Action Script Output Unknown Node"})
                end
                end
                end
            end, lists:seq(0, (get({NodeList, '$class'})):getLength(NodeList) - 1));
            false ->
            erlang:error({'Exception', "Action Script Output Node Null"})
        end,
        (get({This, '$class'})):setAllowsChildren(This, false),
        put({This, actionScriptOutputJPanel}, 'ImageActionScriptOutputJPanel':new(This)).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
        'BasicProfileActionScriptOutput':init(This, get({'ImageActionScriptOutput', 'NAME'})),
        init_fields(This),
        (get({This, '$class'})):setImageTypes(This, 'ImageTypes':new()),
        (get({This, '$class'})):setAllowsChildren(This, false),
        put({This, actionScriptOutputJPanel}, 'ImageActionScriptOutputJPanel':new(This)).

getActionScriptOutputJPanel(This) ->
        get({This, actionScriptOutputJPanel}).

toHashMap(This) ->
        HashMap = (fun(Target_N67324) -> (get({Target_N67324, '$class'})):createHashMap(Target_N67324) end)('StdUtil':getInstance()),
        (get({HashMap, '$class'})):put(HashMap, get({'ImageActionScriptOutputData', 'DISPLAY'}), allbinary_java:to_string((get({This, '$class'})):isDisplay(This))),
        (get({HashMap, '$class'})):put(HashMap, get({'ImageActionScriptOutputData', 'SAVE'}), allbinary_java:to_string((get({This, '$class'})):isSaved(This))),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["HashMap: ", (get({HashMap, '$class'})):toString(HashMap)]), This, "toHashMap()"),
        HashMap.

% throws Exception
toXmlNode(This, Document) ->
        Node = 'BasicProfileActionScriptOutput':toXmlNode(This, Document),
        NewNode = 'ModDomHelper':createNodeWithValueNodes(Document, get({'ImageActionScriptOutputData', 'NAME'}), (get({This, '$class'})):toHashMap(This)),
        (get({NewNode, '$class'})):appendChild(NewNode, (fun(Target_N67752) -> (get({Target_N67752, '$class'})):toXmlNode(Target_N67752, Document) end)((get({This, '$class'})):getImageTypes(This))),
        (get({Node, '$class'})):appendChild(Node, NewNode),
        Node.

% throws Exception
process(This, Frame) ->
        'ImageActionScriptOutputProcessor':process(This, Frame).

showDialog(This) ->
        (fun(Target_N67986) -> (get({Target_N67986, '$class'})):setVisible(Target_N67986, true) end)((get({get({This, actionScriptOutputJPanel}), '$class'})):getCapturedImageActionJDialog(get({This, actionScriptOutputJPanel}))).

isSaved(This) ->
        get({This, saved}).

setSaved(This, Saved) when is_boolean(Saved) ->
        put({This, saved}, Saved).

isDisplay(This) ->
        get({This, display}).

setDisplay(This, Display) when is_boolean(Display) ->
        put({This, display}, Display).

future_toString(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Is Save: "),
        (get({StringBuffer, '$class'})):appendboolean(StringBuffer, (get({This, '$class'})):isSaved(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Is Display: "),
        (get({StringBuffer, '$class'})):appendboolean(StringBuffer, (get({This, '$class'})):isDisplay(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, " "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N68474) -> (get({Target_N68474, '$class'})):toString(Target_N68474) end)((get({This, '$class'})):getImageTypes(This))),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

log(This) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({This, '$class'})):future_toString(This), This, "log").

getImageTypes(This) ->
        get({This, imageTypes}).

setImageTypes(This, ImageTypes) ->
        put({This, imageTypes}, ImageTypes).

