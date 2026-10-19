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
% package taghelpers
% import java.util.HashMap
% import javax.servlet.jsp.PageContext
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory
% import org.allbinary.logic.visual.transform.TransformFactory
% import org.allbinary.logic.visual.transform.TransformInterface
% import org.allbinary.logic.visual.transform.data.TransformDocumentInterface
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.allbinary.string.CommonStrings
% import org.w3c.dom.Document

-module('ViewHelper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements TransformInterface

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, abeClientInformation}, 'ServiceClientInformationInterfaceFactory':getInstance()),
    put({This, componentInterface}, undefined),
    put({This, 'NO_TYPE'}, 0),
    ok.


new(HashMap, PageContext) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, HashMap, PageContext),
    This.

init(This, HashMap, PageContext) ->
    init_fields(This),
        put({This, componentInterface}, (fun(Target_N66145) -> (get({Target_N66145, '$class'})):getInstance(Target_N66145, get({This, abeClientInformation}), HashMap, PageContext) end)('TransformFactory':getInstance())).

getTypeId(This) ->
        get({This, 'NO_TYPE'}).

% throws Exception
view(This) ->
        try
            (get({get({This, componentInterface}), '$class'})):view(get({This, componentInterface}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            put({local, error}, "Failed to View: "),
            case (get({This, componentInterface}) =/= undefined) of
                true ->
                put({local, error}, lists:concat([get({local, error}), atom_to_list(get({get({This, componentInterface}), '$class'}))]));
                false ->
                put({local, error}, lists:concat([get({local, error}), "Unknown"]))
            end,
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "view()", E);
                false -> ok
            end,
            erlang:error(E)
        end.

% throws Exception
toXmlDoc(This) ->
        try
            erlang:error({'Exception', lists:concat(["Hmm: ", (fun(Target_N66845) -> (get({Target_N66845, '$class'})):getDoc(Target_N66845) end)((get({get({This, componentInterface}), '$class'})):getTransformDocumentInterface(get({This, componentInterface})))])})
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            put({local, error}, "Failed to View: "),
            case (get({This, componentInterface}) =/= undefined) of
                true ->
                put({local, error}, lists:concat([get({local, error}), atom_to_list(get({get({This, componentInterface}), '$class'}))]));
                false ->
                put({local, error}, lists:concat([get({local, error}), "Unknown"]))
            end,
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "view()", E);
                false -> ok
            end,
            erlang:error(E)
        end.

getViewObject(This) ->
        get({This, componentInterface}).

% throws Exception
getTransformInfoInterface(This) ->
        (get({get({This, componentInterface}), '$class'})):getTransformInfoInterface(get({This, componentInterface})).

getTransformDocumentInterface(This) ->
        undefined.

setTransformDocumentInterface(This, ViewDocumentInterface) ->
        ok.

