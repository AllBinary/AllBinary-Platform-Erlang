% 
% AllBinary Open License Version 1 
% Copyright (c) 2006 AllBinary 
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
% package org.allbinary.game.layer.building
% import javax.microedition.lcdui.Font
% import javax.microedition.lcdui.Graphics
% import org.allbinary.game.ag.layer.hud.basic.NumberStringHud
% import org.allbinary.game.ag.layer.hud.basic.NumberStringHudFactory
% import org.allbinary.game.layer.SelectionHudPaintable
% import org.allbinary.string.CommonStrings
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.game.graphics.hud.BasicHudFactory
% import org.allbinary.game.layer.NullPathFindingLayer
% import org.allbinary.game.layer.PathFindingLayerInterface
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.font.MyFontProcessor
% import org.allbinary.logic.math.MathUtil

-module('BuildingInfoHudPaintable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('SelectionHudPaintable', Function, Arguments).

static_init() ->
    put({?MODULE, instance}, 'BuildingInfoHudPaintable':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, 'HEALTH'}, "Health:"),
    put({This, productivityHud}, undefined),
    put({This, efficiencyHud}, undefined),
    put({This, healthHud}, undefined),
    put({This, maxHealthHud}, undefined),
    put({This, rtsLayer}, get({'NullPathFindingLayer', 'NULL_PATH_FINDING_LAYER'})),
    put({This, currentHealth}, 0),
    ok.


getInstance() ->
        get({'BuildingInfoHudPaintable', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'SelectionHudPaintable':'$init'(This),
    init_fields(This),
        NumberStringHudFactory = 'NumberStringHudFactory':getInstance(),
        put({local, productivityHud}, get({NumberStringHudFactory, 'NULL_NUMBER_STRING_HUD'})),
        put({local, efficiencyHud}, get({NumberStringHudFactory, 'NULL_NUMBER_STRING_HUD'})),
        put({local, healthHud}, get({NumberStringHudFactory, 'NULL_NUMBER_STRING_HUD'})),
        put({local, maxHealthHud}, get({NumberStringHudFactory, 'NULL_NUMBER_STRING_HUD'})),
        try
            put({local, index}, 0),
            BasicHudFactory = 'BasicHudFactory':getInstance(),
            BasicColor = (get({This, '$class'})):getBasicColorP(This),
            TextX = get({This, textX}),
            Y = get({This, y}),
            FirstIndex = get({local, index}),
            ok % Java nested type ProductivityNumberStringHud: move it to its own module
,
            put({local, productivityHud}, 'ProductivityNumberStringHud':new()),
            put({local, index}, get({local, index}) + 1),
            SecondIndex = get({local, index}),
            ok % Java nested type EfficiencyNumberStringHud: move it to its own module
,
            put({local, efficiencyHud}, 'EfficiencyNumberStringHud':new()),
            put({local, index}, get({local, index}) + 1),
            HEALTH = get({This, 'HEALTH'}),
            ThirdIndex = get({local, index}),
            ok % Java nested type HealthNumberStringHud: move it to its own module
,
            TotalLength = (string:length(HEALTH) + 1),
            put({local, healthHud}, 'HealthNumberStringHud':new()),
            FourthIndex = get({local, index}),
            ok % Java nested type MaxHealthNumberStringHud: move it to its own module
,
            put({local, maxHealthHud}, 'MaxHealthNumberStringHud':new())
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, get({CommonStrings, 'CONSTRUCTOR'}), E)
        end,
        put({This, productivityHud}, get({local, productivityHud})),
        put({This, efficiencyHud}, get({local, efficiencyHud})),
        put({This, healthHud}, get({local, healthHud})),
        put({This, maxHealthHud}, get({local, maxHealthHud})).

updateMeasurement(This, Graphics) ->
        Font = (get({Graphics, '$class'})):getFont(Graphics),
        TotalLength = (string:length(get({This, 'HEALTH'})) + (fun(Target_N69094) -> (get({Target_N69094, '$class'})):getTotalDigits(Target_N69094, get({This, currentHealth})) end)('MathUtil':getInstance())),
        (get({get({This, maxHealthHud}), '$class'})):setX(get({This, maxHealthHud}), (get({This, textX}) + 'MyFontProcessor':defaultStringWidth(Font, TotalLength))),
        put({This, myFontProcessor}, 'MyFontProcessor':getInstance()).

setBasicColorP(This, BasicColor) ->
        'SelectionHudPaintable':setBasicColorP(This, BasicColor),
        (get({get({This, productivityHud}), '$class'})):setBasicColorP(get({This, productivityHud}), BasicColor),
        (get({get({This, efficiencyHud}), '$class'})):setBasicColorP(get({This, efficiencyHud}), BasicColor),
        (get({get({This, healthHud}), '$class'})):setBasicColorP(get({This, healthHud}), BasicColor),
        (get({get({This, maxHealthHud}), '$class'})):setBasicColorP(get({This, maxHealthHud}), BasicColor).

paint(This, Graphics) ->
        'SelectionHudPaintable':paint(This, Graphics),
        (get({get({This, myFontProcessor}), '$class'})):process(get({This, myFontProcessor}), Graphics),
        (get({get({This, productivityHud}), '$class'})):paint(get({This, productivityHud}), Graphics),
        (get({get({This, efficiencyHud}), '$class'})):paint(get({This, efficiencyHud}), Graphics),
        (get({get({This, healthHud}), '$class'})):paint(get({This, healthHud}), Graphics),
        (get({get({This, maxHealthHud}), '$class'})):paint(get({This, maxHealthHud}), Graphics),
        (fun(Target_N69738) -> (get({Target_N69738, '$class'})):paintXY(Target_N69738, Graphics, get({This, imageX}), get({This, y})) end)((get({This, '$class'})):getAnimationInterface(This)).

updateSelectionInfo(This) ->
        BuildingLayer = get({This, rtsLayer}),
        (get({This, '$class'})):setName(This, (get({BuildingLayer, '$class'})):getName(BuildingLayer)),
        (get({This, '$class'})):setAnimationInterface(This, (get({BuildingLayer, '$class'})):getVerticleBuildAnimationInterface(BuildingLayer)),
        (get({get({This, productivityHud}), '$class'})):set(get({This, productivityHud}), (get({BuildingLayer, '$class'})):getProductivity(BuildingLayer)),
        (get({get({This, efficiencyHud}), '$class'})):set(get({This, efficiencyHud}), ((get({BuildingLayer, '$class'})):getEfficiency(BuildingLayer) / 100)),
        put({This, currentHealth}, (fun(Target_N70083) -> (get({Target_N70083, '$class'})):getHealth(Target_N70083) end)((get({BuildingLayer, '$class'})):getHealthInterface(BuildingLayer))),
        (get({get({This, healthHud}), '$class'})):set(get({This, healthHud}), get({This, currentHealth})),
        put({This, myFontProcessor}, get({This, updateMyFontProcessor})),
        (get({get({This, maxHealthHud}), '$class'})):set(get({This, maxHealthHud}), (fun(Target_N70200) -> (get({Target_N70200, '$class'})):getMaxHealth(Target_N70200) end)((get({BuildingLayer, '$class'})):getHealthInterface(BuildingLayer))).

setRtsLayer(This, RtsLayer) ->
        put({This, rtsLayer}, RtsLayer).

