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
% package org.allbinary.logic.visual.transform.info
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.system.loader.AbeFactory
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.logic.system.security.licensing.LicensingException
% import org.allbinary.logic.visual.transform.TransformInterface
% import org.allbinary.string.CommonStrings

-module('TransformInfoObjectFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'TransformInfoObjectFactory':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


getInstance() ->
        get({'TransformInfoObjectFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

% throws Exception
getInstance(This, AbeClientInformation, TransformInfoInterface) ->
        try
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPERFACTORY'})) of
                true ->
                put({local, commonStrings}, 'CommonStrings':getInstance()),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Creating View: ", (get({TransformInfoInterface, '$class'})):getName(TransformInfoInterface)]), This, get({get({local, commonStrings}), 'GET_INSTANCE'}));
                false -> ok
            end,
            Params = array:new(1, {default, undefined}),
            Classes = array:new(1, {default, undefined}),
            array:set(0, 'TransformInfoInterface', Classes),
            array:set(0, TransformInfoInterface, Params),
            AnyType = (fun(Target_N66540) -> (get({Target_N66540, '$class'})):getInstance(Target_N66540, AbeClientInformation, (get({TransformInfoInterface, '$class'})):getObjectFile(TransformInfoInterface), Classes, Params) end)('AbeFactory':getInstance()),
            case (AnyType =:= undefined) of
                true ->
                case (TransformInfoInterface =/= undefined) of
                    true ->
                    StringBuffer = 'StringMaker':new(),
                    (get({StringBuffer, '$class'})):append(StringBuffer, "\nNo Such View Name: "),
                    (get({StringBuffer, '$class'})):append(StringBuffer, (get({TransformInfoInterface, '$class'})):getName(TransformInfoInterface)),
                    (get({StringBuffer, '$class'})):append(StringBuffer, "\nNo Such View Object: "),
                    (get({StringBuffer, '$class'})):append(StringBuffer, (get({TransformInfoInterface, '$class'})):getObjectFile(TransformInfoInterface)),
                    erlang:error({'Exception', (get({StringBuffer, '$class'})):toString(StringBuffer)});
                    false ->
                    erlang:error({'Exception', "No Such View Object since transformInfo is null"})
                end;
                false -> ok
            end,
            AnyType
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            put({local, error}, "Failed To Get Instance: "),
            case (TransformInfoInterface =/= undefined) of
                true ->
                put({local, error}, lists:concat([get({local, error}), (get({TransformInfoInterface, '$class'})):getName(TransformInfoInterface)]));
                false -> ok
            end,
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPERFACTORYERROR'})) of
                true ->
                put({local, commonStrings}, 'CommonStrings':getInstance()),
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({local, error}), This, get({get({local, commonStrings}), 'GET_INSTANCE'}), E);
                false -> ok
            end,
            erlang:error(E)
        end.

