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
% package org.allbinary.logic.visual.transform
% import java.io.ByteArrayInputStream
% import java.io.ByteArrayOutputStream
% import java.io.InputStream
% import javax.xml.transform.URIResolver
% import org.allbinary.data.tree.dom.BasicUriResolver
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.control.crypt.jcehelper.AbCrypt
% import org.allbinary.logic.control.crypt.jcehelper.KeySpecFactory
% import org.allbinary.logic.io.AbFileInputStream
% import org.allbinary.logic.io.StreamUtil
% import org.allbinary.logic.io.file.AbFile
% import org.allbinary.logic.io.path.AbPathData
% import org.allbinary.logic.io.path.PathUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.system.security.AbKeys
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.allbinary.logic.visual.transform.info.template.TransformInfoTemplateData

-module('BasicTransformer').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('AbTransformer', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, streamUtil}, 'StreamUtil':getInstance()),
    put({This, abeClientInformation}, undefined),
    ok.


new(AbeClientInformation, TransformInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, AbeClientInformation, TransformInfoInterface),
    This.

'$init'(This, AbeClientInformation, TransformInfoInterface) ->
        'AbTransformer':'$init'(This, TransformInfoInterface),
        init_fields(This),
        put({This, abeClientInformation}, AbeClientInformation),
        (get({This, '$class'})):setTemplateAsInputStream(This).

% throws Exception
setEncryptedTemplateFileAsInputStream(This, File) ->
        put({local, outputStream}, undefined),
        put({local, inputStream}, undefined),
        try
            put({local, outputStream}, 'ByteArrayOutputStream':new()),
            put({local, inputStream}, 'AbFileInputStream':new(File)),
            put({local, outputStream}, (get({get({This, streamUtil}), '$class'})):get(get({This, streamUtil}), get({local, inputStream}), get({local, outputStream}), array:new(16384, {default, 0}))),
            AbCrypt = 'AbCrypt':new(get({'KeySpecFactory', 'DESEDE'}), (fun(Target_N66823) -> (get({Target_N66823, '$class'})):getKey(Target_N66823, get({This, abeClientInformation}), (get({File, '$class'})):getAbsolutePath(File)) end)('AbKeys':getInstance())),
            Decrypted = (get({AbCrypt, '$class'})):decrypt(AbCrypt, (get({get({local, outputStream}), '$class'})):toByteArray(get({local, outputStream}))),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPERFACTORY'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Decrypted Template: \n", allbinary_java:to_string(Decrypted)]), This, "setEncryptedTemplateFileAsInputStream(file)");
                false -> ok
            end,
            (get({This, '$class'})):setInputStream(This, 'ByteArrayInputStream':new(Decrypted)),
            (get({This, '$class'})):setURIResolver(This, 'BasicUriResolver':new(get({'TransformInfoTemplateData':getInstance(), 'ENCRYPTED_EXTENSION'})))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPERFACTORYERROR'})) of
                true ->
                StringBuffer = 'StringMaker':new(),
                (get({StringBuffer, '$class'})):append(StringBuffer, "Failed to get Encrypted File: "),
                (get({StringBuffer, '$class'})):append(StringBuffer, (get({File, '$class'})):getPath(File)),
                (get({StringBuffer, '$class'})):append(StringBuffer, " \nName:"),
                (get({StringBuffer, '$class'})):append(StringBuffer, (get({File, '$class'})):getName(File)),
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "setEncryptedTemplateFileAsInputStream()", E);
                false -> ok
            end,
            erlang:error(E)
        after
            (get({get({This, streamUtil}), '$class'})):close(get({This, streamUtil}), get({local, outputStream})),
            (get({get({This, streamUtil}), '$class'})):close(get({This, streamUtil}), get({local, inputStream}))
        end.

% throws Exception
setEncryptedTemplateAsInputStream(This) ->
        put({local, outputStream}, undefined),
        put({local, inputStream}, undefined),
        try
            put({local, outputStream}, 'ByteArrayOutputStream':new()),
            put({local, inputStream}, 'ByteArrayInputStream':new((fun(Target_N68041) -> (get({Target_N68041, '$class'})):getBytes(Target_N68041) end)((fun(Target_N68048) -> (get({Target_N68048, '$class'})):getTemplate(Target_N68048) end)((get({This, '$class'})):getTransformInfoInterface(This))))),
            put({local, outputStream}, (get({get({This, streamUtil}), '$class'})):get(get({This, streamUtil}), get({local, inputStream}), get({local, outputStream}), array:new(16384, {default, 0}))),
            AbCrypt = 'AbCrypt':new(get({'KeySpecFactory', 'DESEDE'}), (fun(Target_N68205) -> (get({Target_N68205, '$class'})):getKey(Target_N68205, get({This, abeClientInformation}), (fun(Target_N68241) -> (get({Target_N68241, '$class'})):getName(Target_N68241) end)((get({This, '$class'})):getTransformInfoInterface(This))) end)('AbKeys':getInstance())),
            Decrypted = (get({AbCrypt, '$class'})):decrypt(AbCrypt, (get({get({local, outputStream}), '$class'})):toByteArray(get({local, outputStream}))),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPERFACTORY'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Decrypted Template: \n", (get({Decrypted, '$class'})):toString(Decrypted)]), This, "setEncryptedTemplateAsInputStream()");
                false -> ok
            end,
            (get({This, '$class'})):setInputStream(This, 'ByteArrayInputStream':new(Decrypted)),
            (get({This, '$class'})):setURIResolver(This, 'BasicUriResolver':new(get({'TransformInfoTemplateData':getInstance(), 'ENCRYPTED_EXTENSION'})))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPERFACTORYERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), lists:concat(["Failed to set with template: ", (fun(Target_N68918) -> (get({Target_N68918, '$class'})):getTemplateFilePath(Target_N68918) end)((get({This, '$class'})):getTransformInfoInterface(This))]), This, "setEncryptedTemplateFileAsInputStream()", E);
                false -> ok
            end,
            erlang:error(E)
        after
            (get({get({This, streamUtil}), '$class'})):close(get({This, streamUtil}), get({local, outputStream})),
            (get({get({This, streamUtil}), '$class'})):close(get({This, streamUtil}), get({local, inputStream}))
        end.

% throws Exception
setTemplateAsInputStream(This) ->
        try
        put({local, inputStream}, undefined),
        put({local, outputStream}, undefined),
        try
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPERFACTORY'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N69366) -> (get({Target_N69366, '$class'})):log(Target_N69366) end)((get({This, '$class'})):getTransformInfoInterface(This)), This, "setTemplateAsInputStream()");
                false -> ok
            end,
            TransformInfoTemplateData = 'TransformInfoTemplateData':getInstance(),
            PathUtil = 'PathUtil':getInstance(),
            case ((fun(Target_N69505) -> (get({Target_N69505, '$class'})):getTemplateFilePath(Target_N69505) end)((get({This, '$class'})):getTransformInfoInterface(This)) =/= undefined) of
                true ->
                Extension = (get({PathUtil, '$class'})):getExtensionWithAbPath(PathUtil, (fun(Target_N69590) -> (get({Target_N69590, '$class'})):getTemplateFilePath(Target_N69590) end)((get({This, '$class'})):getTransformInfoInterface(This))),
                FilePath = (get({PathUtil, '$class'})):getWithoutExtensionWithAbPath(PathUtil, (fun(Target_N69662) -> (get({Target_N69662, '$class'})):getTemplateFilePath(Target_N69662) end)((get({This, '$class'})):getTransformInfoInterface(This))),
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPERFACTORY'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N69893) -> (get({Target_N69893, '$class'})):log(Target_N69893) end)((get({This, '$class'})):getTransformInfoInterface(This)), This, "setTemplateAsInputStream()");
                    false -> ok
                end,
                case ((get({Extension, '$class'})):compareTo(Extension, get({TransformInfoTemplateData, 'UNCRYPTED_EXTENSION'})) =:= 0) of
                    true ->
                    put({local, stringBuffer}, 'StringMaker':new()),
                    (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), FilePath),
                    (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), get({'AbPathData':getInstance(), 'EXTENSION_SEP'})),
                    (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), get({TransformInfoTemplateData, 'ENCRYPTED_EXTENSION'})),
                    EncFile = 'AbFile':createAbFile((get({get({local, stringBuffer}), '$class'})):toString(get({local, stringBuffer}))),
                    case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPERFACTORY'})) of
                        true ->
                        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N70794) -> (get({Target_N70794, '$class'})):log(Target_N70794) end)((get({This, '$class'})):getTransformInfoInterface(This)), This, "setTemplateAsInputStream()");
                        false -> ok
                    end,
                    case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPERFACTORY'})) of
                        true ->
                        put({local, stringBuffer}, 'StringMaker':new()),
                        (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), "Encrypted Template File isFile="),
                        (get({get({local, stringBuffer}), '$class'})):appendboolean(get({local, stringBuffer}), (get({EncFile, '$class'})):isFile(EncFile)),
                        (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), "\nEncTemplateFilePath: "),
                        (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), (get({EncFile, '$class'})):getPath(EncFile)),
                        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({get({local, stringBuffer}), '$class'})):toString(get({local, stringBuffer})), This, "setTemplateAsInputStream()");
                        false -> ok
                    end,
                    case (get({EncFile, '$class'})):isFile(EncFile) of
                        true ->
                        (get({This, '$class'})):setEncryptedTemplateFileAsInputStream(This, EncFile),
                        throw({'$return', ok});
                        false ->
                        put({local, file}, 'AbFile':createAbFileFromAbPath((fun(Target_N71273) -> (get({Target_N71273, '$class'})):getTemplateFilePath(Target_N71273) end)((get({This, '$class'})):getTransformInfoInterface(This)))),
                        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPERFACTORY'})) of
                            true ->
                            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N71504) -> (get({Target_N71504, '$class'})):log(Target_N71504) end)((get({This, '$class'})):getTransformInfoInterface(This)), This, "setTemplateAsInputStream()");
                            false -> ok
                        end,
                        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPERFACTORY'})) of
                            true ->
                            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Template File isFile=", (get({get({local, file}), '$class'})):isFile(get({local, file}))]), This, "setTemplateAsInputStream()");
                            false -> ok
                        end,
                        case (get({get({local, file}), '$class'})):isFile(get({local, file})) of
                            true ->
                            put({local, inputStream}, 'AbFileInputStream':new(get({local, file}))),
                            put({local, outputStream}, 'ByteArrayOutputStream':new()),
                            put({local, outputStream}, (get({get({This, streamUtil}), '$class'})):get(get({This, streamUtil}), get({local, inputStream}), get({local, outputStream}), array:new(16384, {default, 0}))),
                            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPERFACTORY'})) of
                                true ->
                                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Template: ", (get({get({local, outputStream}), '$class'})):toString(get({local, outputStream}))]), This, "getTemplateAsInputStream()");
                                false -> ok
                            end,
                            (get({This, '$class'})):setInputStream(This, 'ByteArrayInputStream':new((get({get({local, outputStream}), '$class'})):toByteArray(get({local, outputStream})))),
                            (get({This, '$class'})):setURIResolver(This, 'BasicUriResolver':new(get({TransformInfoTemplateData, 'UNCRYPTED_EXTENSION'}))),
                            throw({'$return', ok});
                            false -> ok
                        end
                    end;
                    false ->
                    case ((get({Extension, '$class'})):compareTo(Extension, get({TransformInfoTemplateData, 'ENCRYPTED_EXTENSION'})) =:= 0) of
                    true ->
                    put({local, stringBuffer}, 'StringMaker':new()),
                    (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), FilePath),
                    (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), get({'AbPathData':getInstance(), 'EXTENSION_SEP'})),
                    (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), get({TransformInfoTemplateData, 'ENCRYPTED_EXTENSION'})),
                    put({local, file}, 'AbFile':createAbFile((get({get({local, stringBuffer}), '$class'})):toString(get({local, stringBuffer})))),
                    case (get({get({local, file}), '$class'})):isFile(get({local, file})) of
                        true ->
                        (get({This, '$class'})):setEncryptedTemplateFileAsInputStream(This, get({local, file}));
                        false -> ok
                    end;
                    false ->
                    erlang:error({'Exception', lists:concat(["View Template File Type Is Not Recognized: ", (fun(Target_N70048) -> (get({Target_N70048, '$class'})):getTemplateFilePath(Target_N70048) end)((get({This, '$class'})):getTransformInfoInterface(This))])})
                end
                end;
                false ->
                (get({This, '$class'})):setEncryptedTemplateAsInputStream(This)
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPERFACTORYERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Failed to get Template Data", This, "setTemplateAsInputStream()", E);
                false -> ok
            end,
            erlang:error(E)
        after
            (get({get({This, streamUtil}), '$class'})):close(get({This, streamUtil}), get({local, outputStream})),
            (get({get({This, streamUtil}), '$class'})):close(get({This, streamUtil}), get({local, inputStream}))
        end,
        erlang:error({'Exception', "Error setTemplateAsInputStream()"})
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

