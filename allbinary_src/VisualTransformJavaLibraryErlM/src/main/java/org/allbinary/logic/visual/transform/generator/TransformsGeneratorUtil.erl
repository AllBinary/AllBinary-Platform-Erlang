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
% package org.allbinary.logic.visual.transform.generator
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.logic.visual.transform.info.TransformInfoDomNode
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigInterface

-module('TransformsGeneratorUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'TransformsGeneratorUtil':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


getInstance() ->
        get({'TransformsGeneratorUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

% throws Exception
generateComponentsFromObjectConfig(This, AbeClientInformation, TransformInfoInterface, Group) when (is_list(Group) orelse Group =:= undefined) ->
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Started Group: ", Group]), This, "generateComponentsFromObjectConfig(2)");
            false -> ok
        end,
        TransformInfoObjectConfigInterface = (get({TransformInfoInterface, '$class'})):getObjectConfigInterface(TransformInfoInterface),
        Result = (get({This, '$class'})):generateComponentsFromObjectConfig(This, AbeClientInformation, TransformInfoObjectConfigInterface, TransformInfoInterface, Group),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["End Group: ", Group]), This, "generateComponentsFromObjectConfig(2)");
            false -> ok
        end,
        Result.

% throws Exception
generateComponentsFromObjectConfig(This, AbeClientInformation, TransformInfoObjectConfigInterface, TransformInfoInterface, Group) when (is_list(Group) orelse Group =:= undefined) ->
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Started Group: ", Group]), This, "generateComponentsFromObjectConfig()");
            false -> ok
        end,
        TransformInfoObjectConfigComponentVector = (get({TransformInfoObjectConfigInterface, '$class'})):getTransformsGroup(TransformInfoObjectConfigInterface, Group),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            put({local, stringBuffer}, 'StringMaker':new()),
            (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), "Processing "),
            (get({get({local, stringBuffer}), '$class'})):appendint(get({local, stringBuffer}), (get({TransformInfoObjectConfigComponentVector, '$class'})):size(TransformInfoObjectConfigComponentVector)),
            (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), " Components Group: "),
            (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), Group),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({get({local, stringBuffer}), '$class'})):toString(get({local, stringBuffer})), This, "generateComponentsFromObjectConfig()");
            false -> ok
        end,
        case ((get({TransformInfoObjectConfigComponentVector, '$class'})):size(TransformInfoObjectConfigComponentVector) < 1) of
            true ->
            erlang:error({'Exception', "No Pages Generated For Template."});
            false -> ok
        end,
        Size = (get({TransformInfoObjectConfigComponentVector, '$class'})):size(TransformInfoObjectConfigComponentVector),
        lists:foreach(fun(Index) ->
            TransformInfoObjectConfigComponent = (get({TransformInfoObjectConfigComponentVector, '$class'})):get(TransformInfoObjectConfigComponentVector, Index),
            (fun(Target_N67584) -> (get({Target_N67584, '$class'})):generate(Target_N67584, AbeClientInformation, TransformInfoObjectConfigComponent, TransformInfoInterface) end)('TransformGeneratorUtil':getInstance())
        end, lists:seq(0, Size - 1)),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Done Group: ", Group]), This, "generateComponentsFromObjectConfig()");
            false -> ok
        end,
        put({local, stringBuffer}, 'StringMaker':new()),
        (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), "<!-- Generated all template views successfully for View: "),
        (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), (get({TransformInfoInterface, '$class'})):getName(TransformInfoInterface)),
        (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), "-->"),
        (get({get({local, stringBuffer}), '$class'})):toString(get({local, stringBuffer})).

