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
% package org.allbinary.game.layer.pickup
% import org.allbinary.animation.Animation
% import org.allbinary.animation.NullAnimationFactory
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.ABHashtable
% import org.allbinary.util.BasicArrayList

-module('CountedPickedUpLayerInterfaceFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements CountedPickedUpLayerInterfaceFactoryInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('PickedUpLayerInterfaceFactory', Function, Arguments).

static_init() ->
    put({?MODULE, 'NULL_COUNTED_PICKUP_LAYER_FACTORY'}, 'CountedPickedUpLayerInterfaceFactory':new(get({'PickedUpLayerTypeFactory':getInstance(), 'NONE'}), get({'IconLayer', 'NULL_ICON_LAYER'}), (fun(Target_N65836) -> (get({Target_N65836, '$class'})):getInstance(Target_N65836, 0) end)('NullAnimationFactory':getFactoryInstance()))),
    ok.

init_fields(This) ->
    put({This, id}, 0),
    ok.


new(PickeUpLayerType, IconLayer, AnimationInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, PickeUpLayerType, IconLayer, AnimationInterface),
    This.

init(This, PickeUpLayerType, IconLayer, AnimationInterface) ->
        'PickedUpLayerInterfaceFactory':init(This, PickeUpLayerType, IconLayer, AnimationInterface),
        init_fields(This),
        List = (fun(Target_N65965) -> (get({Target_N65965, '$class'})):getList(Target_N65965) end)('CountedPickedUpLayerInterfaceFactoryPool':getInstance()),
        put({This, id}, (get({List, '$class'})):size(List)),
        (get({List, '$class'})):add(List, This).

% throws Exception
getNextInstance(This, Hashtable, X, Y, Z) when is_integer(X), is_integer(Y), is_integer(Z) ->
        erlang:error({'Exception', get({'CommonStrings':getInstance(), 'NOT_IMPLEMENTED'})}).

getTotal(This) ->
        (-1).

getId(This) ->
        get({This, id}).

