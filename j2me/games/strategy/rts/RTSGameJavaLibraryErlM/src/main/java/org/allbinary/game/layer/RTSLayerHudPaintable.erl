% 
% AllBinary Open License Version 1 
% Copyright (c) 2003 AllBinary 
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
% package org.allbinary.game.layer
% import javax.microedition.lcdui.Font
% import javax.microedition.lcdui.Graphics
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.AndroidUtil
% import org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer
% import org.allbinary.game.part.weapon.BasicWeaponPart
% import org.allbinary.graphics.font.UpdateMyFontInterface

-module('RTSLayerHudPaintable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements UpdateMyFontInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('SelectionHudPaintable', Function, Arguments).

static_init() ->
    put({?MODULE, instance}, 'RTSLayerHudPaintable':new()),
    ok.

init_fields(This) ->
    put({This, weaponProperties}, (fun(Target_N65932) -> (get({Target_N65932, '$class'})):getArrayInstance(Target_N65932) end)('StringUtil':getInstance())),
    put({This, rtsLayer}, 'CollidableDestroyableDamageableLayer':getNullInstance()),
    put({This, costY}, 0),
    put({This, costY1}, 0),
    put({This, fontHeight}, 0),
    ok.


getInstance() ->
        get({'RTSLayerHudPaintable', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'SelectionHudPaintable':init(This),
    init_fields(This),
        ok.

updateMeasurement(This, Graphics) ->
        'SelectionHudPaintable':updateMeasurement(This, Graphics),
        Font = (get({Graphics, '$class'})):getFont(Graphics),
        put({This, fontHeight}, (get({Font, '$class'})):getHeight(Font)),
        put({This, costY1}, ((get({This, y}) + ((((array:size(get({This, weaponProperties})) + 1)) * get({This, fontHeight})))))),
        case (not 'AndroidUtil':isAndroid()) of
            true ->
            put({This, costY}, get({This, costY1}));
            false ->
            put({This, costY}, ((get({This, y}) + ((((array:size(get({This, weaponProperties})) + 2)) * get({This, fontHeight}))))))
        end.

updateSelectionInfo(This) ->
        (get({This, '$class'})):setName(This, (fun(Target_N66570) -> (get({Target_N66570, '$class'})):getName(Target_N66570) end)((get({This, '$class'})):getRtsLayer(This))),
        PartInterface = array:get(0, (fun(Target_N66620) -> (get({Target_N66620, '$class'})):getPartInterfaceArray(Target_N66620) end)((get({This, '$class'})):getRtsLayer(This))),
        put({This, weaponProperties}, (fun(Target_N66683) -> (get({Target_N66683, '$class'})):toStringArray(Target_N66683) end)((get({PartInterface, '$class'})):getWeaponProperties(PartInterface))),
        put({This, myFontProcessor}, get({This, updateMyFontProcessor})).

paint(This, Graphics) ->
        'SelectionHudPaintable':paint(This, Graphics),
        Size = array:size(get({This, weaponProperties})),
        lists:foreach(fun(Index) ->
            (get({Graphics, '$class'})):drawString(Graphics, array:get(Index, get({This, weaponProperties})), get({This, textX}), (get({This, y}) + ((((Index + 1)) * get({This, fontHeight})))), 0)
        end, lists:seq(0, Size - 1)).

setRtsLayer(This, RtsLayer) ->
        put({This, rtsLayer}, RtsLayer).

getRtsLayer(This) ->
        get({This, rtsLayer}).

