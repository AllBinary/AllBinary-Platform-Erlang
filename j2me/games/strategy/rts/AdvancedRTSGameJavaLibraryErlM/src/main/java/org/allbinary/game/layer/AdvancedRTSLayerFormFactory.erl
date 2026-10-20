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
% package org.allbinary.game.layer
% import org.allbinary.game.input.RTSLayerFormFactory
% import org.allbinary.graphics.form.item.ABCustomItem
% import org.allbinary.string.CommonStrings
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.graphics.form.ScrollSelectionForm
% import org.allbinary.graphics.form.item.ItemArraySingletonFactoryInterface

-module('AdvancedRTSLayerFormFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('RTSLayerFormFactory', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, scrollSelectionForm}, undefined),
    ok.


new(Label, ItemArrayFactoryInterface) when (is_list(Label) orelse Label =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Label, ItemArrayFactoryInterface),
    This.

'$init'(This, Label, ItemArrayFactoryInterface) when (is_list(Label) orelse Label =:= undefined) ->
    'RTSLayerFormFactory':'$init'(This),
    init_fields(This),
        put({local, scrollSelectionForm}, 'ScrollSelectionForm':getNullScrollSelectionForm()),
        try
            Items = (get({ItemArrayFactoryInterface, '$class'})):getItems(ItemArrayFactoryInterface),
            put({local, scrollSelectionForm}, 'RTSScrollSelectionFormFactory':getInstance(Label, Items))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, get({CommonStrings, 'CONSTRUCTOR'}), E)
        end,
        put({This, scrollSelectionForm}, get({local, scrollSelectionForm})).

getInstance(This, RtsLayer) ->
        get({This, scrollSelectionForm}).

