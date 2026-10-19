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
% package org.allbinary.logic.visual.dhtml.style.color
% import org.allbinary.data.tree.dom.DomNodeInterface
% import org.allbinary.data.tree.dom.ModDomHelper
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonPhoneStrings
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('ColorsView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements DomNodeInterface

init_fields(This) ->
    put({This, commonPhoneStrings}, 'CommonPhoneStrings':getInstance()),
    put({This, 'HEXRADIX'}, 16),
    put({This, 'MAX'}, 255),
    put({This, delta}, 20),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

% throws Exception
getColorNode(This, Document, RedIndex, GreenIndex, BlueIndex) when is_integer(RedIndex), is_integer(GreenIndex), is_integer(BlueIndex) ->
        HexColorStringBuffer = 'StringMaker':new(),
        case (RedIndex < get({This, 'HEXRADIX'})) of
            true ->
            (get({HexColorStringBuffer, '$class'})):append(HexColorStringBuffer, get({get({This, commonPhoneStrings}), 'ZERO'}));
            false -> ok
        end,
        (get({HexColorStringBuffer, '$class'})):append(HexColorStringBuffer, 'Integer':toString(RedIndex, get({This, 'HEXRADIX'}))),
        case (GreenIndex < get({This, 'HEXRADIX'})) of
            true ->
            (get({HexColorStringBuffer, '$class'})):append(HexColorStringBuffer, get({get({This, commonPhoneStrings}), 'ZERO'}));
            false -> ok
        end,
        (get({HexColorStringBuffer, '$class'})):append(HexColorStringBuffer, 'Integer':toString(GreenIndex, get({This, 'HEXRADIX'}))),
        case (BlueIndex < get({This, 'HEXRADIX'})) of
            true ->
            (get({HexColorStringBuffer, '$class'})):append(HexColorStringBuffer, get({get({This, commonPhoneStrings}), 'ZERO'}));
            false -> ok
        end,
        (get({HexColorStringBuffer, '$class'})):append(HexColorStringBuffer, 'Integer':toString(BlueIndex, get({This, 'HEXRADIX'}))),
        ColorNode = 'ModDomHelper':createNameValueNodes(Document, get({'ColorData':getInstance(), 'NAME'}), (get({HexColorStringBuffer, '$class'})):toString(HexColorStringBuffer)),
        ColorNode.

% throws Exception
toXmlNode(This, Document) ->
        Node = 'ModDomHelper':createNameValueNodes(Document, get({'ColorsData':getInstance(), 'NAME'}), "RGB Colors In Hex"),
        BlackNode = 'ModDomHelper':createNameValueNodes(Document, get({'ColorData':getInstance(), 'NAME'}), "000000"),
        (get({Node, '$class'})):appendChild(Node, BlackNode),
        lists:foreach(fun(Index) ->
            HexColorStringBuffer = 'StringMaker':new(),
            case (Index < get({This, 'HEXRADIX'})) of
                true ->
                (get({HexColorStringBuffer, '$class'})):append(HexColorStringBuffer, get({get({This, commonPhoneStrings}), 'ZERO'}));
                false -> ok
            end,
            (get({HexColorStringBuffer, '$class'})):append(HexColorStringBuffer, 'Integer':toString(Index, get({This, 'HEXRADIX'}))),
            case (Index < get({This, 'HEXRADIX'})) of
                true ->
                (get({HexColorStringBuffer, '$class'})):append(HexColorStringBuffer, get({get({This, commonPhoneStrings}), 'ZERO'}));
                false -> ok
            end,
            (get({HexColorStringBuffer, '$class'})):append(HexColorStringBuffer, 'Integer':toString(Index, get({This, 'HEXRADIX'}))),
            case (Index < get({This, 'HEXRADIX'})) of
                true ->
                (get({HexColorStringBuffer, '$class'})):append(HexColorStringBuffer, get({get({This, commonPhoneStrings}), 'ZERO'}));
                false -> ok
            end,
            (get({HexColorStringBuffer, '$class'})):append(HexColorStringBuffer, 'Integer':toString(Index, get({This, 'HEXRADIX'}))),
            ColorNode = 'ModDomHelper':createNameValueNodes(Document, get({'ColorData':getInstance(), 'NAME'}), (get({HexColorStringBuffer, '$class'})):toString(HexColorStringBuffer)),
            (get({Node, '$class'})):appendChild(Node, ColorNode)
        end, lists:seq(0, get({This, 'MAX'}) - 1, get({This, delta}))),
        WhiteNode = 'ModDomHelper':createNameValueNodes(Document, get({'ColorData':getInstance(), 'NAME'}), "FFFFFF"),
        (get({Node, '$class'})):appendChild(Node, WhiteNode),
        lists:foreach(fun(BlueIndex) ->
            lists:foreach(fun(GreenIndex) ->
                lists:foreach(fun(RedIndex) ->
                    (get({Node, '$class'})):appendChild(Node, (get({This, '$class'})):getColorNode(This, Document, RedIndex, GreenIndex, BlueIndex))
                end, lists:seq(0, (get({This, 'MAX'}) div 2) - 1, get({This, delta})))
            end, lists:seq(0, (get({This, 'MAX'}) div 2) - 1, get({This, delta})))
        end, lists:seq((get({This, 'MAX'}) div 2), get({This, 'MAX'}) - 1, get({This, delta}))),
        lists:foreach(fun(RedIndex) ->
            lists:foreach(fun(GreenIndex) ->
                lists:foreach(fun(BlueIndex) ->
                    (get({Node, '$class'})):appendChild(Node, (get({This, '$class'})):getColorNode(This, Document, RedIndex, GreenIndex, BlueIndex))
                end, lists:seq(0, (get({This, 'MAX'}) div 2) - 1, get({This, delta})))
            end, lists:seq(0, (get({This, 'MAX'}) div 2) - 1, get({This, delta})))
        end, lists:seq((get({This, 'MAX'}) div 2), get({This, 'MAX'}) - 1, get({This, delta}))),
        lists:foreach(fun(GreenIndex) ->
            lists:foreach(fun(RedIndex) ->
                lists:foreach(fun(BlueIndex) ->
                    (get({Node, '$class'})):appendChild(Node, (get({This, '$class'})):getColorNode(This, Document, RedIndex, GreenIndex, BlueIndex))
                end, lists:seq(0, (get({This, 'MAX'}) div 2) - 1, get({This, delta})))
            end, lists:seq(0, (get({This, 'MAX'}) div 2) - 1, get({This, delta})))
        end, lists:seq((get({This, 'MAX'}) div 2), get({This, 'MAX'}) - 1, get({This, delta}))),
        lists:foreach(fun(GreenIndex) ->
            lists:foreach(fun(RedIndex) ->
                lists:foreach(fun(BlueIndex) ->
                    (get({Node, '$class'})):appendChild(Node, (get({This, '$class'})):getColorNode(This, Document, RedIndex, GreenIndex, BlueIndex))
                end, lists:seq(0, get({This, 'MAX'}) - 1, (2 * get({This, delta}))))
            end, lists:seq(0, get({This, 'MAX'}) - 1, (2 * get({This, delta}))))
        end, lists:seq(0, get({This, 'MAX'}) - 1, (2 * get({This, delta})))),
        Node.

