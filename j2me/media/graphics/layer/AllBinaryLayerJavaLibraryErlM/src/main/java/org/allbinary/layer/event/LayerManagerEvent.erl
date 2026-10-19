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
% package org.allbinary.layer.event
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.layer.LayerManager
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.util.event.AllBinaryEventObject

-module('LayerManagerEvent').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('AllBinaryEventObject', Function, Arguments).

init_fields(This) ->
    put({This, layerInterface}, get({'AllBinaryLayer', 'NULL_ALLBINARY_LAYER'})),
    put({This, crud}, undefined),
    ok.


new(LayerManager, Crud) when (is_list(Crud) orelse Crud =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, LayerManager, Crud),
    This.

init(This, LayerManager, Crud) when (is_list(Crud) orelse Crud =:= undefined) ->
        'AllBinaryEventObject':init(This, LayerManager),
        init_fields(This),
        put({This, crud}, Crud).

getLayerInterface(This) ->
        get({This, layerInterface}).

setLayerInterface(This, LayerInterface) ->
        put({This, layerInterface}, LayerInterface).

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "LayerManagerEvent: \n"),
        (get({StringBuffer, '$class'})):append(StringBuffer, "LayerInterface: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N66139) -> (get({Target_N66139, '$class'})):toString(Target_N66139) end)((get({This, '$class'})):getLayerInterface(This))),
        (get({StringBuffer, '$class'})):append(StringBuffer, "\nCRUD: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, crud})),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

