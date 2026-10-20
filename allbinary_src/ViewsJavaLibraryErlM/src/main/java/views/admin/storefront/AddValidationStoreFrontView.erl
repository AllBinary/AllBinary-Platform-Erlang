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
% package views.admin.storefront
% import javax.servlet.http.HttpServletRequest
% import org.allbinary.business.context.modules.storefront.StoreFront
% import org.allbinary.business.context.modules.storefront.StoreFrontFactory
% import org.allbinary.business.context.modules.storefront.StoreFrontInterface
% import org.allbinary.globals.FREEBLISKET_PATH_GLOBALS
% import org.allbinary.globals.URLGLOBALS
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.control.validate.ValidationComponentInterface
% import org.allbinary.logic.io.file.AbFile
% import org.allbinary.logic.io.path.AbPath
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.w3c.dom.Document
% import org.w3c.dom.Node
% import views.business.context.HttpContextView

-module('AddValidationStoreFrontView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ValidationComponentInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('HttpContextView', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, newStoreFrontInterface}, undefined),
    ok.


new(TransformInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, TransformInfoInterface),
    This.

'$init'(This, TransformInfoInterface) ->
        'HttpContextView':'$init'(This, TransformInfoInterface),
        init_fields(This),
        put({This, newStoreFrontInterface}, 'StoreFront':new((fun(Target_N66251) -> (get({Target_N66251, '$class'})):getRequest(Target_N66251) end)((get({This, '$class'})):getPageContext(This)))),
        case ((get({get({This, newStoreFrontInterface}), '$class'})):getName(get({This, newStoreFrontInterface})) =:= undefined) of
            true ->
            (get({get({This, newStoreFrontInterface}), '$class'})):setName(get({This, newStoreFrontInterface}), (fun(Target_N66345) -> (get({Target_N66345, '$class'})):getStoreName(Target_N66345) end)((get({This, '$class'})):getWeblisketSession(This)));
            false -> ok
        end.

isValid(This) ->
        try
            put({local, valid}, true),
            case ((get({get({This, newStoreFrontInterface}), '$class'})):isValid(get({This, newStoreFrontInterface})) =:= false) of
                true ->
                put({local, valid}, false);
                false -> ok
            end,
            case ('StoreFrontFactory':getInstance((get({get({This, newStoreFrontInterface}), '$class'})):getName(get({This, newStoreFrontInterface}))) =/= undefined) of
                true ->
                put({local, valid}, false);
                false -> ok
            end,
            case (fun(Target_N66653) -> (get({Target_N66653, '$class'})):isFile(Target_N66653) end)('AbFile':createAbFileFromAbPath('AbPath':new((get({This, '$class'})):getStoreViewsPath(This), get({'StringUtil':getInstance(), 'EMPTY_STRING'})))) of
                true ->
                put({local, valid}, false);
                false -> ok
            end,
            get({local, valid})
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEWERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Failed to validate form", This, get({get({This, commonStrings}), 'IS_VALID'}), E);
                false -> ok
            end,
            false
        end.

% throws Exception
getStoreViewsPath(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({'AddValidationStoreFrontView', 'URLGLOBALS'}), '$class'})):getMainPath(get({'AddValidationStoreFrontView', 'URLGLOBALS'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({(get({get({'AddValidationStoreFrontView', 'FREEBLISKET_PATH_GLOBALS'}), '$class'})):getInstance(get({'AddValidationStoreFrontView', 'FREEBLISKET_PATH_GLOBALS'})), 'XSLPATH'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, newStoreFrontInterface}), '$class'})):getName(get({This, newStoreFrontInterface}))),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

validationInfo(This) ->
        try
            StringBuffer = 'StringMaker':new(),
            case ((get({get({This, newStoreFrontInterface}), '$class'})):isValid(get({This, newStoreFrontInterface})) =:= false) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, newStoreFrontInterface}), '$class'})):validationInfo(get({This, newStoreFrontInterface})));
                false -> ok
            end,
            case ('StoreFrontFactory':getInstance((get({get({This, newStoreFrontInterface}), '$class'})):getName(get({This, newStoreFrontInterface}))) =/= undefined) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, "Store name already used<br/>");
                false -> ok
            end,
            case (fun(Target_N67556) -> (get({Target_N67556, '$class'})):isFile(Target_N67556) end)('AbFile':createAbFileFromAbPath('AbPath':new((get({This, '$class'})):getStoreViewsPath(This), get({'StringUtil':getInstance(), 'EMPTY_STRING'})))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, "Store name clashes with template name<br/>");
                false -> ok
            end,
            (get({StringBuffer, '$class'})):toString(StringBuffer)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEWERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Failed to generate validation error info", This, "validationInfo()", E);
                false -> ok
            end,
            "Error Validating Form"
        end.

toValidationInfoDoc(This) ->
        undefined.

toValidationInfoNode(This, Document) ->
        undefined.

% throws Exception
view(This) ->
        (fun(Target_N68076) -> (get({Target_N68076, '$class'})):view(Target_N68076, This) end)((get({get({get({This, views}), 'ValidationOnlyTempUtil'}), '$class'})):getInstance(get({get({This, views}), 'ValidationOnlyTempUtil'}))).

