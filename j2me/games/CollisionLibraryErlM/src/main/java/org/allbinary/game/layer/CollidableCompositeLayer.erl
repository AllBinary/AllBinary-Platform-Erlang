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
% package org.allbinary.game.layer
% import org.allbinary.ai.ArtificialIntelligence
% import org.allbinary.ai.ArtificialIntelligenceInterface
% import org.allbinary.game.collision.CollidableBaseBehavior
% import org.allbinary.game.collision.CollidableBaseBehaviorFactory
% import org.allbinary.game.collision.CollidableInterfaceCompositeInterface
% import org.allbinary.game.collision.CollidableNeverCollideBehaviorFactory
% import org.allbinary.graphics.Rectangle
% import org.allbinary.graphics.RectangleFactory
% import org.allbinary.logic.communication.log.ForcedLogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.string.CommonSeps
% import org.allbinary.view.ViewPositionBase
% import org.allbinary.logic.NullUtil

-module('CollidableCompositeLayer').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements CollidableInterfaceCompositeInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('AllBinaryGameLayer', Function, Arguments).

static_init() ->
    put({?MODULE, 'NULL_COLLIDABLE_COMPOSITE_LAYER'}, get({'NullUtil':getInstance(), 'NULL_OBJECT'})),
    ok.

init_fields(This) ->
    put({This, collidableInferface}, (fun(Target_N66310) -> (get({Target_N66310, '$class'})):createBehavior(Target_N66310) end)('CollidableNeverCollideBehaviorFactory':getInstance())),
    ok.


getNullInstance() ->
        case (get({'CollidableCompositeLayer', 'NULL_COLLIDABLE_COMPOSITE_LAYER'}) =:= get({'NullUtil':getInstance(), 'NULL_OBJECT'})) of
            true ->
            put({'CollidableCompositeLayer', 'NULL_COLLIDABLE_COMPOSITE_LAYER'}, 'CollidableCompositeLayer':new(get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({'RectangleFactory', 'SINGLETON'}), get({'ViewPositionBase', 'NULL_VIEW_POSITION'}), 'CollidableNeverCollideBehaviorFactory':getInstance()));
            false -> ok
        end,
        get({'CollidableCompositeLayer', 'NULL_COLLIDABLE_COMPOSITE_LAYER'}).

new(Name, LayerInfo, ViewPosition, CollidableBaseBehaviorFactory) when (is_list(Name) orelse Name =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Name, LayerInfo, ViewPosition, CollidableBaseBehaviorFactory),
    This.

init(This, Name, LayerInfo, ViewPosition, CollidableBaseBehaviorFactory) when (is_list(Name) orelse Name =:= undefined) ->
        'AllBinaryGameLayer':init(This, Name, LayerInfo, ViewPosition),
        init_fields(This),
        case (CollidableBaseBehaviorFactory =/= 'CollidableNeverCollideBehaviorFactory':getInstance()) of
            true ->
            (get({This, '$class'})):setCollidableInferface(This, (get({CollidableBaseBehaviorFactory, '$class'})):createBehavior(CollidableBaseBehaviorFactory));
            false -> ok
        end.

getArtificialIntelligenceInterface(This) ->
        'ForcedLogUtil':log(get({get({This, commonStrings}), 'NOT_IMPLEMENTED'}), This),
        'ArtificialIntelligence':getInstance().

getCollidableInferface(This) ->
        get({This, collidableInferface}).

setCollidableInferface(This, CollidableInferface) ->
        put({This, collidableInferface}, CollidableInferface).

implmentsCollidableInterface(This) ->
        true.

toStringAppend(This, StringBuffer) ->
        CommonSeps = 'CommonSeps':getInstance(),
        'AllBinaryGameLayer':toStringAppend(This, StringBuffer),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'NEW_LINE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N66995) -> (get({Target_N66995, '$class'})):toString(Target_N66995) end)((get({This, '$class'})):getCollidableInferface(This))).

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({This, '$class'})):toStringAppend(This, StringBuffer),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

