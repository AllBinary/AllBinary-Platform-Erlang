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
% package org.allbinary.game.part
% import javax.microedition.lcdui.Font
% import javax.microedition.lcdui.Graphics
% import org.allbinary.animation.Animation
% import org.allbinary.animation.NullAnimationFactory
% import org.allbinary.game.layer.pickup.CountedPickedUpLayerInterfaceFactory
% import org.allbinary.graphics.font.MyFontProcessor
% import org.allbinary.graphics.font.UpdateMyFontInterface
% import org.allbinary.graphics.font.UpdateMyFontProcessor
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.math.PrimitiveLongUtil
% import org.allbinary.util.ABHashtable

-module('CountedLayerInterfaceFactoryPart').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements PartInterface
% implements UpdateMyFontInterface

static_init() ->
    put({?MODULE, 'NULL_COUNTED_LAYER_INTERFACE_FACTORY'}, 'CountedLayerInterfaceFactoryPart':new(0, get({'CountedPickedUpLayerInterfaceFactory', 'NULL_COUNTED_PICKUP_LAYER_FACTORY'}))),
    ok.

init_fields(This) ->
    put({This, updateMyFontProcessor}, 'UpdateMyFontProcessor':new(This)),
    put({This, myFontProcessor}, get({This, updateMyFontProcessor})),
    put({This, animationInterface}, (fun(Target_N66113) -> (get({Target_N66113, '$class'})):getInstance(Target_N66113, 0) end)('NullAnimationFactory':getFactoryInstance())),
    put({This, total}, 0),
    put({This, totalString}, get({'NullUtil':getInstance(), 'NULL_CHAR_ARRAY'})),
    put({This, xOffset}, 0),
    put({This, countedPickedUpLayerInterfaceFactory}, get({'CountedPickedUpLayerInterfaceFactory', 'NULL_COUNTED_PICKUP_LAYER_FACTORY'})),
    put({This, primitiveLongUtil}, undefined),
    ok.


new(Total, CountedPickedUpLayerInterfaceFactory) when is_integer(Total) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Total, CountedPickedUpLayerInterfaceFactory),
    This.

init(This, Total, CountedPickedUpLayerInterfaceFactory) when is_integer(Total) ->
    init_fields(This),
        put({This, primitiveLongUtil}, 'PrimitiveLongUtil':createPowerOfTen(1000)),
        (get({This, '$class'})):init(This, Total, CountedPickedUpLayerInterfaceFactory).

updateMeasurement(This, Graphics) ->
        Font = (get({Graphics, '$class'})):getFont(Graphics),
        (get({This, '$class'})):setXOffset(This, ((get({Font, '$class'})):charsWidth(Font, get({This, totalString}), 0, (get({get({This, primitiveLongUtil}), '$class'})):getCurrentTotalDigits(get({This, primitiveLongUtil}))) + (((get({Font, '$class'})):getSize(Font) bsr 1)))),
        put({This, myFontProcessor}, 'MyFontProcessor':getInstance()).

init(This, Total, CountedPickedUpLayerInterfaceFactory) when is_integer(Total) ->
        (get({This, '$class'})):setCountedPickedUpLayerInterfaceFactory(This, CountedPickedUpLayerInterfaceFactory),
        put({This, total}, Total).

% throws Exception
getInstance(This, Hashtable, X, Y, Z) when is_integer(X), is_integer(Y), is_integer(Z) ->
        try
        case (get({This, total}) > 0) of
            true ->
            (get({This, '$class'})):setTotal(This, (get({This, total}) - 1)),
            throw({'$return', (fun(Target_N66983) -> (get({Target_N66983, '$class'})):getNextInstance(Target_N66983, Hashtable, X, Y, Z) end)((get({This, '$class'})):getCountedPickedUpLayerInterfaceFactory(This))});
            false ->
            erlang:error({'Exception', "No more left. Could use a listener to automatically remove"})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getTotal(This) ->
        get({This, total}).

setTotal(This, Total) when is_integer(Total) ->
        put({This, total}, Total),
        put({This, totalString}, (get({get({This, primitiveLongUtil}), '$class'})):getCharArray(get({This, primitiveLongUtil}), Total)),
        put({This, myFontProcessor}, get({This, updateMyFontProcessor})).

paint(This, Graphics) ->
        (get({get({This, myFontProcessor}), '$class'})):process(get({This, myFontProcessor}), Graphics).

paintThreed(This, Graphics) ->
        ok.

getAnimationInterface(This) ->
        get({This, animationInterface}).

setAnimationInterface(This, AnimationInterface) ->
        put({This, animationInterface}, AnimationInterface).

getXOffset(This) ->
        get({This, xOffset}).

setXOffset(This, TotalStringWidth) when is_integer(TotalStringWidth) ->
        put({This, xOffset}, TotalStringWidth).

getTotalString(This) ->
        get({This, totalString}).

getCountedPickedUpLayerInterfaceFactory(This) ->
        get({This, countedPickedUpLayerInterfaceFactory}).

setCountedPickedUpLayerInterfaceFactory(This, CountedPickedUpLayerInterfaceFactory) ->
        put({This, countedPickedUpLayerInterfaceFactory}, CountedPickedUpLayerInterfaceFactory).

