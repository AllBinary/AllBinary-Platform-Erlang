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
% package org.allbinary.logic.visual.transform.info.objectConfig
% import org.allbinary.data.tree.dom.document.DomDocumentHelper
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.control.crypt.file.CryptFileReader
% import org.allbinary.logic.io.path.AbPath
% import org.allbinary.logic.string.StringValidationUtil
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.w3c.dom.Document

-module('TransformInfoObjectConfigAndManipulatorFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('TransformInfoObjectConfigAndManipulatorFactoryBase', Function, Arguments).

static_init() ->
    put({?MODULE, instance}, 'TransformInfoObjectConfigAndManipulatorFactory':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


getInstance() ->
        get({'TransformInfoObjectConfigAndManipulatorFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'TransformInfoObjectConfigAndManipulatorFactoryBase':'$init'(This),
    init_fields(This),
        ok.

% throws Exception
getInstance(This, AbeClientInformation, TransformInfoInterface, ObjectConfigFileAbPath) ->
        try
            Data = (fun(Target_N66097) -> (get({Target_N66097, '$class'})):get(Target_N66097, ObjectConfigFileAbPath) end)('CryptFileReader':new(get({'TransformInfoObjectConfigData':getInstance(), 'UNCRYPTED_EXTENSION'}), get({'TransformInfoObjectConfigData':getInstance(), 'ENCRYPTED_EXTENSION'}))),
            (get({This, '$class'})):getInstance(This, AbeClientInformation, TransformInfoInterface, 'DomDocumentHelper':create(Data))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEWERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Could Not Load Object Config", getInstance(), get({get({This, commonStrings}), 'GET_INSTANCE'}), E);
                false -> ok
            end,
            erlang:error(E)
        end;
% throws Exception
getInstance(This, AbeClientInformation, TransformInfoInterface, Document) ->
        try
        try
            StringValidationUtil = 'StringValidationUtil':getInstance(),
            case ((TransformInfoInterface =/= undefined) andalso (not (get({StringValidationUtil, '$class'})):isEmpty(StringValidationUtil, (get({TransformInfoInterface, '$class'})):getStoreName(TransformInfoInterface)))) of
                true ->
                throw({'$return', 'GenericStoreTransformInfoObjectConfig':new(AbeClientInformation, TransformInfoInterface, Document)});
                false ->
                throw({'$return', 'TransformInfoObjectConfig':new(TransformInfoInterface, Document)})
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            put({local, error}, "Failed To Get Instance: "),
            case (TransformInfoInterface =/= undefined) of
                true ->
                put({local, error}, lists:concat([get({local, error}), (get({TransformInfoInterface, '$class'})):getName(TransformInfoInterface)]));
                false -> ok
            end,
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPERFACTORYERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), getInstance(), "getInstance(document)", E);
                false -> ok
            end,
            erlang:error(E)
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
getInstance(This, AbeClientInformation, TransformInfoInterface) ->
        try
        try
            StringValidationUtil = 'StringValidationUtil':getInstance(),
            case ((TransformInfoInterface =/= undefined) andalso (not (get({StringValidationUtil, '$class'})):isEmpty(StringValidationUtil, (get({TransformInfoInterface, '$class'})):getStoreName(TransformInfoInterface)))) of
                true ->
                throw({'$return', 'GenericStoreTransformInfoObjectConfig':new(AbeClientInformation, TransformInfoInterface)});
                false ->
                throw({'$return', 'TransformInfoObjectConfig':new(TransformInfoInterface)})
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            put({local, error}, "Failed To Get Instance: "),
            case (TransformInfoInterface =/= undefined) of
                true ->
                put({local, error}, lists:concat([get({local, error}), (get({TransformInfoInterface, '$class'})):getName(TransformInfoInterface)]));
                false -> ok
            end,
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPERFACTORYERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), getInstance(), get({get({This, commonStrings}), 'GET_INSTANCE'}), E);
                false -> ok
            end,
            erlang:error(E)
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.


