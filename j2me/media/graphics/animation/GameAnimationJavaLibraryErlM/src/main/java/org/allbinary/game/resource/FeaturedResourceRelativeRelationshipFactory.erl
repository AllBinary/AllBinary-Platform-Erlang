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
% package org.allbinary.game.resource
% import org.allbinary.graphics.PointFactory
% import org.allbinary.graphics.RelativeRelationship
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.layer.relationship.RelativeLayerRelationship
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.util.BasicArrayListUtil

-module('FeaturedResourceRelativeRelationshipFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('FeaturedResourceFactory', Function, Arguments).

static_init() ->
    put({?MODULE, 'INSTANCE'}, 'FeaturedResourceRelativeRelationshipFactory':new()),
    ok.

init_fields(This) ->
    put({This, basicArrayListUtil}, 'BasicArrayListUtil':getInstance()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'FeaturedResourceFactory':init(This),
    init_fields(This),
        ok.

getInstance() ->
        get({'FeaturedResourceRelativeRelationshipFactory', 'INSTANCE'}).

% throws Exception
getRelativeRelationshipList(This, Resource, Layer) when (is_list(Resource) orelse Resource =:= undefined) ->
        try
        FeatureReleaseList = (get({This, '$class'})):getList(This),
        Size = (fun(Target_N66036) -> (get({Target_N66036, '$class'})):size(Target_N66036) end)((get({This, '$class'})):getList(This)),
        lists:foreach(fun(Index) ->
            FeatureInterface = array:get(Index, get({FeatureReleaseList, objectArray})),
            case (get({FeatureInterface, '$class'})):isFeature(FeatureInterface) of
                true ->
                List = (get({FeatureInterface, '$class'})):getResourceRelativeRelationshipList(FeatureInterface, Resource),
                case (List =/= (get({get({This, basicArrayListUtil}), '$class'})):getImmutableInstance(get({This, basicArrayListUtil}))) of
                    true ->
                    throw({'$return', (get({This, '$class'})):duplicate(This, List, Layer)});
                    false -> ok
                end;
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        erlang:error({'Exception', (fun(Target_N66382) -> (get({Target_N66382, '$class'})):toString(Target_N66382) end)((fun(Target_N66389) -> (get({Target_N66389, '$class'})):append(Target_N66389, Resource) end)((fun(Target_N66396) -> (get({Target_N66396, '$class'})):append(Target_N66396, "Not available for current feature selection or Resource: ") end)('StringMaker':new())))})
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
duplicate(This, List, Layer) ->
        PointFactory = 'PointFactory':getInstance(),
        NewList = 'BasicArrayListD':new(),
        Size = (get({List, '$class'})):size(List),
        lists:foreach(fun(Index) ->
            RelativeRelationship = array:get(Index, get({List, objectArray})),
            (get({NewList, '$class'})):add(NewList, 'RelativeLayerRelationship':new(Layer, (get({PointFactory, '$class'})):createXY(PointFactory, (get({RelativeRelationship, '$class'})):getX(RelativeRelationship), (get({RelativeRelationship, '$class'})):getY(RelativeRelationship)), (fun(Target_N66826) -> (get({Target_N66826, '$class'})):getImmutableInstance(Target_N66826) end)('BasicArrayListUtil':getInstance())))
        end, lists:seq(0, Size - 1)),
        NewList.

