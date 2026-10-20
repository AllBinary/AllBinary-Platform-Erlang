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
% package org.allbinary.input.automation.module.game
% import java.awt
% import java.awt.image.BufferedImage
% import org.allbinary.graphics.color.ColorCacheFactory
% import org.allbinary.graphics.color.ColorCacheable
% import org.allbinary.logic.util.cache.AutomaticCacheInterface

-module('GraphicsAnalysisUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'MAX'}, 122),
    ok.

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

% throws Exception
getNominator(BufferedImage, Min_x, Max_x, Y) ->
        try
        lists:foreach(fun(Index) ->
            ColorInteger = allbinary_java:to_string((get({BufferedImage, '$class'})):getRGB(BufferedImage, Index, (get({Y, '$class'})):intValue(Y))),
            AutomaticCacheInterface = 'ColorCacheFactory':getInstance(),
            ColorCacheable = (get({AutomaticCacheInterface, '$class'})):get(AutomaticCacheInterface, ColorInteger),
            Color = (get({ColorCacheable, '$class'})):getColor(ColorCacheable),
            case ((((get({Color, '$class'})):getRed(Color) < get({'GraphicsAnalysisUtil', 'MAX'})) andalso ((get({Color, '$class'})):getGreen(Color) < get({'GraphicsAnalysisUtil', 'MAX'}))) andalso ((get({Color, '$class'})):getBlue(Color) < get({'GraphicsAnalysisUtil', 'MAX'}))) of
                true ->
                ok;
                false ->
                throw({'$return', (Index - (get({Min_x, '$class'})):intValue(Min_x))})
            end
        end, lists:seq((get({Max_x, '$class'})):intValue(Max_x), (get({Min_x, '$class'})):intValue(Min_x) + 1, -1)),
        0.0
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

