% Generated Code Do Not Modify
% package org.allbinary.graphics.form
% import javax.microedition.lcdui.Graphics
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.form.item.ABCustomItem
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.string.CommonStrings

-module('ABCustomForm').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('CustomScreen', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    ok.


new(Title, Items, BackgroundBasicColor, ForegroundBasicColor) when (is_list(Title) orelse Title =:= undefined), (is_tuple(Items) orelse Items =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Title, Items, BackgroundBasicColor, ForegroundBasicColor),
    This.

'$init'(This, Title, Items, BackgroundBasicColor, ForegroundBasicColor) when (is_list(Title) orelse Title =:= undefined), (is_tuple(Items) orelse Items =:= undefined) ->
    'CustomScreen':'$init'(This),
    init_fields(This),
        ok.

getAllitems(This) ->
        array:new(0, {default, undefined}).

size(This) ->
        0.

setSelectedIndex(This, Index) when is_integer(Index) ->
        ok.

getSelectedIndex(This) ->
        0.

deleteAll(This) ->
        ok.

delete(This, ItemNum) when is_integer(ItemNum) ->
        ok.

append(This, Item) ->
        (-1).

insert(This, ItemNum, Item) when is_integer(ItemNum) ->
        ok.

set(This, ItemNum, Item) when is_integer(ItemNum) ->
        ok.

get(This, ItemNum) when is_integer(ItemNum) ->
        'ABCustomItem':getNullInstance().

getWidth(This) ->
        erlang:error({'RuntimeException'}).

paint(This, Graphics) ->
        ok.

getTitle(This) ->
        get({'StringUtil':getInstance(), 'EMPTY_STRING'}).

