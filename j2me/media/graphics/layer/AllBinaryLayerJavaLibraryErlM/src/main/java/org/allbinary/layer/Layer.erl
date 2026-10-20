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
% package org.allbinary.layer
% import javax.microedition.lcdui.Graphics
% import org.allbinary.graphics.displayable.CanvasStrings
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.math.SmallIntegerSingletonFactory
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonStrings

-module('Layer').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'ID'}, (fun(Target_N65830) -> (get({Target_N65830, '$class'})):getAt(Target_N65830, 0) end)('SmallIntegerSingletonFactory':getInstance())),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, x}, 0),
    put({This, y}, 0),
    put({This, z}, 3),
    put({This, width}, 0),
    put({This, height}, 0),
    put({This, visible}, true),
    ok.


new(Width, Height) when is_integer(Width), is_integer(Height) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Width, Height),
    This.

'$init'(This, Width, Height) when is_integer(Width), is_integer(Height) ->
    init_fields(This),
        (get({This, '$class'})):setLayerWidth(This, Width),
        (get({This, '$class'})):setLayerHeight(This, Height).

setPosition(This, X, Y, Z) when is_integer(X), is_integer(Y), is_integer(Z) ->
        put({This, x}, X),
        put({This, y}, Y),
        put({This, z}, Z).

moveDXY(This, Dx, Dy) when is_integer(Dx), is_integer(Dy) ->
        put({This, x}, (get({This, x}) + Dx)),
        put({This, y}, (get({This, y}) + Dy)).

moveDXYZ(This, Dx, Dy, Dz) when is_integer(Dx), is_integer(Dy), is_integer(Dz) ->
        put({This, x}, (get({This, x}) + Dx)),
        put({This, y}, (get({This, y}) + Dy)),
        put({This, z}, (get({This, z}) + Dz)).

getXP(This) ->
        get({This, x}).

getYP(This) ->
        get({This, y}).

getZP(This) ->
        get({This, z}).

getWidth(This) ->
        get({This, width}).

getHeight(This) ->
        get({This, height}).

getDepth(This) ->
        0.

setVisible(This, Visible) when is_boolean(Visible) ->
        put({This, visible}, Visible).

isVisible(This) ->
        get({This, visible}).

paint(This, Graphics) ->
        CommonStrings = 'CommonStrings':getInstance(),
        CanvasStrings = 'CanvasStrings':getInstance(),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({CommonStrings, 'NOT_IMPLEMENTED'}), This, get({CanvasStrings, 'PAINT'})).

setLayerWidth(This, Width) when is_integer(Width) ->
        case (Width < 0) of
            true ->
            erlang:error({'IllegalArgumentException'});
            false -> ok
        end,
        put({This, width}, Width).

setLayerHeight(This, Height) when is_integer(Height) ->
        case (Height < 0) of
            true ->
            erlang:error({'IllegalArgumentException'});
            false -> ok
        end,
        put({This, height}, Height).

toStringAppend(This, StringBuffer) ->
        ok.

