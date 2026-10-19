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
% package org.allbinary.business.category.properties
% import java.util.HashMap
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings
% import org.w3c.dom.Node

-module('CategoryPropertiesFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements CategoryPropertiesFactoryInterface

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, categoryPropertiesInterface}, undefined),
    ok.


new(Name) when (is_list(Name) orelse Name =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Name),
    This;
new(Node) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Node),
    This;
new(CategoryPropertiesHashMap) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, CategoryPropertiesHashMap),
    This.

init(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
    init_fields(This),
        put({This, categoryPropertiesInterface}, 'CategoryProperties':new(Name));
init(This, Node) ->
    init_fields(This),
        put({This, categoryPropertiesInterface}, 'CategoryProperties':new(Node));
init(This, CategoryPropertiesHashMap) ->
    init_fields(This),
        put({This, categoryPropertiesInterface}, 'CategoryProperties':new(CategoryPropertiesHashMap)).



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

