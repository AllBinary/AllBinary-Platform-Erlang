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
% package org.allbinary.ai
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.layer.AllBinaryLayerManager
% import org.allbinary.layer.LayerProcessor

-module('ArtificialIntelligenceLayerProcessor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('LayerProcessor', Function, Arguments).

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
        'LayerProcessor':'$init'(This, 'ArtificialIntelligenceLayerManager':new()).

% throws Exception
processAt(This, AllBinaryLayerManager, LayerInterface, Index) when is_integer(Index) ->
        ArtificialIntelligenceCompositeInterface = LayerInterface,
        (fun(Target_N65768) -> (get({Target_N65768, '$class'})):processAI(Target_N65768, AllBinaryLayerManager) end)((get({ArtificialIntelligenceCompositeInterface, '$class'})):getArtificialIntelligenceInterface(ArtificialIntelligenceCompositeInterface)).

% throws Exception
isProcessorLayer(This, LayerInterface) ->
        try
        case (get({LayerInterface, '$class'})):implmentsArtificialIntelligenceCompositeInterface(LayerInterface) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

