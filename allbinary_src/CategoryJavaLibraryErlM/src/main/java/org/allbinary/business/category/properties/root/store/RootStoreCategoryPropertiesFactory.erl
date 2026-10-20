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
% package org.allbinary.business.category.properties.root.store
% import java.util.HashMap
% import org.allbinary.business.category.properties.CategoryPropertiesFactoryInterface
% import org.allbinary.business.category.properties.CategoryPropertiesInterface
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.io.path.AbPath
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.allbinary.string.CommonStrings
% import org.w3c.dom.Node

-module('RootStoreCategoryPropertiesFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements CategoryPropertiesFactoryInterface

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, categoryPropertiesInterface}, undefined),
    ok.


new(TransformInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, TransformInfoInterface),
    This.

'$init'(This, TransformInfoInterface) ->
    init_fields(This),
        put({This, categoryPropertiesInterface}, 'RootStoreCategoryProperties':new(TransformInfoInterface)).

new(TransformInfoInterface, AbPath) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, TransformInfoInterface, AbPath),
    This;
new(TransformInfoInterface, Node) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, TransformInfoInterface, Node),
    This;
new(TransformInfoInterface, CategoryPropertiesHashMap) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, TransformInfoInterface, CategoryPropertiesHashMap),
    This.

'$init'(This, TransformInfoInterface, AbPath) ->
    init_fields(This),
        put({This, categoryPropertiesInterface}, 'RootStoreCategoryProperties':new(TransformInfoInterface, AbPath));
'$init'(This, TransformInfoInterface, Node) ->
    init_fields(This),
        put({This, categoryPropertiesInterface}, 'RootStoreCategoryProperties':new(TransformInfoInterface, Node));
'$init'(This, TransformInfoInterface, CategoryPropertiesHashMap) ->
    init_fields(This),
        put({This, categoryPropertiesInterface}, 'RootStoreCategoryProperties':new(TransformInfoInterface, CategoryPropertiesHashMap)).



getInstance(This) ->
        try
            get({This, categoryPropertiesInterface})
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'ENTITYFACTORYERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, get({CommonStrings, 'GET_INSTANCE'}), E);
                false -> ok
            end,
            undefined
        end.

