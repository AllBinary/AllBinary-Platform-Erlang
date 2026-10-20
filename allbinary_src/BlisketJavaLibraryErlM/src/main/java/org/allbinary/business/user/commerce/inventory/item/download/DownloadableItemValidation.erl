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
% package org.allbinary.business.user.commerce.inventory.item.download
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.sql.AbSqlData
% import org.allbinary.logic.control.validate.Validation
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringValidationUtil
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('DownloadableItemValidation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('Validation', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, downloadableItem}, undefined),
    ok.


new(DownloadableItem) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, DownloadableItem),
    This.

'$init'(This, DownloadableItem) ->
    'Validation':'$init'(This),
    init_fields(This),
        put({This, downloadableItem}, DownloadableItem).

isValid(This) ->
        try
        try
            case ((((get({get({This, downloadableItem}), '$class'})):getId(get({This, downloadableItem})) =:= undefined) orelse ((fun(Target_N66037) -> (get({Target_N66037, '$class'})):length(Target_N66037) end)((get({get({This, downloadableItem}), '$class'})):getId(get({This, downloadableItem}))) < 1)) orelse ((fun(Target_N66074) -> (get({Target_N66074, '$class'})):length(Target_N66074) end)((get({get({This, downloadableItem}), '$class'})):getId(get({This, downloadableItem}))) > get({'AbSqlData', 'MAXNUM'}))) of
                true ->
                throw({'$return', false});
                false -> ok
            end,
            case (((get({get({This, downloadableItem}), '$class'})):getId(get({This, downloadableItem})) =/= undefined) andalso (not (fun(Target_N66185) -> (get({Target_N66185, '$class'})):isNumber(Target_N66185, (get({get({This, downloadableItem}), '$class'})):getId(get({This, downloadableItem}))) end)('StringValidationUtil':getInstance()))) of
                true ->
                throw({'$return', false});
                false -> ok
            end,
            case ((((get({get({This, downloadableItem}), '$class'})):getSystem(get({This, downloadableItem})) =:= undefined) orelse ((fun(Target_N66303) -> (get({Target_N66303, '$class'})):length(Target_N66303) end)((get({get({This, downloadableItem}), '$class'})):getSystem(get({This, downloadableItem}))) < 1)) orelse ((fun(Target_N66340) -> (get({Target_N66340, '$class'})):length(Target_N66340) end)((get({get({This, downloadableItem}), '$class'})):getSystem(get({This, downloadableItem}))) > get({'AbSqlData', 'MAXSTRING'}))) of
                true ->
                throw({'$return', false});
                false -> ok
            end,
            case ((((get({get({This, downloadableItem}), '$class'})):getPlatform(get({This, downloadableItem})) =:= undefined) orelse ((fun(Target_N66455) -> (get({Target_N66455, '$class'})):length(Target_N66455) end)((get({get({This, downloadableItem}), '$class'})):getPlatform(get({This, downloadableItem}))) < 1)) orelse ((fun(Target_N66492) -> (get({Target_N66492, '$class'})):length(Target_N66492) end)((get({get({This, downloadableItem}), '$class'})):getPlatform(get({This, downloadableItem}))) > get({'AbSqlData', 'MAXSTRING'}))) of
                true ->
                throw({'$return', false});
                false -> ok
            end,
            case ((((get({get({This, downloadableItem}), '$class'})):getSpecialName(get({This, downloadableItem})) =:= undefined) orelse ((fun(Target_N66607) -> (get({Target_N66607, '$class'})):length(Target_N66607) end)((get({get({This, downloadableItem}), '$class'})):getSpecialName(get({This, downloadableItem}))) < 0)) orelse ((fun(Target_N66644) -> (get({Target_N66644, '$class'})):length(Target_N66644) end)((get({get({This, downloadableItem}), '$class'})):getSpecialName(get({This, downloadableItem}))) > get({'AbSqlData', 'MAXSTRING'}))) of
                true ->
                throw({'$return', false});
                false -> ok
            end,
            case ((((get({get({This, downloadableItem}), '$class'})):getVersion(get({This, downloadableItem})) =:= undefined) orelse ((fun(Target_N66759) -> (get({Target_N66759, '$class'})):length(Target_N66759) end)((get({get({This, downloadableItem}), '$class'})):getVersion(get({This, downloadableItem}))) < 1)) orelse ((fun(Target_N66796) -> (get({Target_N66796, '$class'})):length(Target_N66796) end)((get({get({This, downloadableItem}), '$class'})):getVersion(get({This, downloadableItem}))) > get({'AbSqlData', 'MAXSTRING'}))) of
                true ->
                throw({'$return', false});
                false -> ok
            end,
            case ((((get({get({This, downloadableItem}), '$class'})):getChanges(get({This, downloadableItem})) =:= undefined) orelse ((fun(Target_N66911) -> (get({Target_N66911, '$class'})):length(Target_N66911) end)((get({get({This, downloadableItem}), '$class'})):getChanges(get({This, downloadableItem}))) < 1)) orelse ((fun(Target_N66948) -> (get({Target_N66948, '$class'})):length(Target_N66948) end)((get({get({This, downloadableItem}), '$class'})):getChanges(get({This, downloadableItem}))) > get({'AbSqlData', 'MAXBLOB'}))) of
                true ->
                throw({'$return', false});
                false -> ok
            end,
            case ((get({get({This, downloadableItem}), '$class'})):getSize(get({This, downloadableItem})) =:= undefined) of
                true ->
                throw({'$return', false});
                false ->
                put({local, size}, (fun(Target_N67067) -> (get({Target_N67067, '$class'})):toString(Target_N67067) end)((get({get({This, downloadableItem}), '$class'})):getSize(get({This, downloadableItem})))),
                case ((string:length(get({local, size})) < 1) orelse (string:length(get({local, size})) > get({'AbSqlData', 'MAXNUM'}))) of
                    true ->
                    throw({'$return', false});
                    false -> ok
                end
            end,
            case ((get({get({This, downloadableItem}), '$class'})):getValidTime(get({This, downloadableItem})) =:= undefined) of
                true ->
                throw({'$return', false});
                false ->
                put({local, size}, (fun(Target_N67288) -> (get({Target_N67288, '$class'})):toString(Target_N67288) end)((get({get({This, downloadableItem}), '$class'})):getValidTime(get({This, downloadableItem})))),
                case ((string:length(get({local, size})) < 1) orelse (string:length(get({local, size})) > get({'AbSqlData', 'MAXNUM'}))) of
                    true ->
                    throw({'$return', false});
                    false -> ok
                end
            end,
            case ((get({get({This, downloadableItem}), '$class'})):getRetries(get({This, downloadableItem})) =:= undefined) of
                true ->
                throw({'$return', false});
                false ->
                put({local, size}, (fun(Target_N67505) -> (get({Target_N67505, '$class'})):toString(Target_N67505) end)((get({get({This, downloadableItem}), '$class'})):getRetries(get({This, downloadableItem})))),
                case ((string:length(get({local, size})) < 1) orelse (string:length(get({local, size})) > get({'AbSqlData', 'MAXNUM'}))) of
                    true ->
                    throw({'$return', false});
                    false -> ok
                end
            end,
            true
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Failed to validate form", This, get({get({This, commonStrings}), 'IS_VALID'}), E);
                false -> ok
            end,
            false
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

validationInfo(This) ->
        try
            StringBuffer = 'StringMaker':new(),
            case ((((get({get({This, downloadableItem}), '$class'})):getId(get({This, downloadableItem})) =:= undefined) orelse ((fun(Target_N68103) -> (get({Target_N68103, '$class'})):length(Target_N68103) end)((get({get({This, downloadableItem}), '$class'})):getId(get({This, downloadableItem}))) < 1)) orelse ((fun(Target_N68140) -> (get({Target_N68140, '$class'})):length(Target_N68140) end)((get({get({This, downloadableItem}), '$class'})):getId(get({This, downloadableItem}))) > get({'AbSqlData', 'MAXNUM'}))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, "Id is invalid. Must be number < "),
                (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc(get({'AbSqlData', 'MAXNUM'}))),
                (get({StringBuffer, '$class'})):append(StringBuffer, " and > 0 digits.<br/>");
                false -> ok
            end,
            case (((get({get({This, downloadableItem}), '$class'})):getId(get({This, downloadableItem})) =/= undefined) andalso (not (fun(Target_N68324) -> (get({Target_N68324, '$class'})):isNumber(Target_N68324, (get({get({This, downloadableItem}), '$class'})):getId(get({This, downloadableItem}))) end)('StringValidationUtil':getInstance()))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, "Id is invalid. Must be > 0.<br/>");
                false -> ok
            end,
            case ((((get({get({This, downloadableItem}), '$class'})):getSystem(get({This, downloadableItem})) =:= undefined) orelse ((fun(Target_N68449) -> (get({Target_N68449, '$class'})):length(Target_N68449) end)((get({get({This, downloadableItem}), '$class'})):getSystem(get({This, downloadableItem}))) < 1)) orelse ((fun(Target_N68486) -> (get({Target_N68486, '$class'})):length(Target_N68486) end)((get({get({This, downloadableItem}), '$class'})):getSystem(get({This, downloadableItem}))) > get({'AbSqlData', 'MAXSTRING'}))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, "System value is invalid. Must be < "),
                (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc(get({'AbSqlData', 'MAXSTRING'}))),
                (get({StringBuffer, '$class'})):append(StringBuffer, " and > 0 characters long.<br/>");
                false -> ok
            end,
            case ((((get({get({This, downloadableItem}), '$class'})):getPlatform(get({This, downloadableItem})) =:= undefined) orelse ((fun(Target_N68674) -> (get({Target_N68674, '$class'})):length(Target_N68674) end)((get({get({This, downloadableItem}), '$class'})):getPlatform(get({This, downloadableItem}))) < 1)) orelse ((fun(Target_N68711) -> (get({Target_N68711, '$class'})):length(Target_N68711) end)((get({get({This, downloadableItem}), '$class'})):getPlatform(get({This, downloadableItem}))) > get({'AbSqlData', 'MAXSTRING'}))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, "Platform value is invalid. Must be < "),
                (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc(get({'AbSqlData', 'MAXSTRING'}))),
                (get({StringBuffer, '$class'})):append(StringBuffer, " and > 0 characters long.<br/>");
                false -> ok
            end,
            case ((((get({get({This, downloadableItem}), '$class'})):getSpecialName(get({This, downloadableItem})) =:= undefined) orelse ((fun(Target_N68899) -> (get({Target_N68899, '$class'})):length(Target_N68899) end)((get({get({This, downloadableItem}), '$class'})):getSpecialName(get({This, downloadableItem}))) < 0)) orelse ((fun(Target_N68936) -> (get({Target_N68936, '$class'})):length(Target_N68936) end)((get({get({This, downloadableItem}), '$class'})):getSpecialName(get({This, downloadableItem}))) > get({'AbSqlData', 'MAXSTRING'}))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, "Special Name value is invalid. Must be < "),
                (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc(get({'AbSqlData', 'MAXSTRING'}))),
                (get({StringBuffer, '$class'})):append(StringBuffer, " and > 0 characters long.<br/>");
                false -> ok
            end,
            case ((((get({get({This, downloadableItem}), '$class'})):getVersion(get({This, downloadableItem})) =:= undefined) orelse ((fun(Target_N69124) -> (get({Target_N69124, '$class'})):length(Target_N69124) end)((get({get({This, downloadableItem}), '$class'})):getVersion(get({This, downloadableItem}))) < 1)) orelse ((fun(Target_N69161) -> (get({Target_N69161, '$class'})):length(Target_N69161) end)((get({get({This, downloadableItem}), '$class'})):getVersion(get({This, downloadableItem}))) > get({'AbSqlData', 'MAXSTRING'}))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, "Version value is invalid. Must be < "),
                (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc(get({'AbSqlData', 'MAXSTRING'}))),
                (get({StringBuffer, '$class'})):append(StringBuffer, " and > 0 characters long.<br/>");
                false -> ok
            end,
            case ((((get({get({This, downloadableItem}), '$class'})):getChanges(get({This, downloadableItem})) =:= undefined) orelse ((fun(Target_N69349) -> (get({Target_N69349, '$class'})):length(Target_N69349) end)((get({get({This, downloadableItem}), '$class'})):getChanges(get({This, downloadableItem}))) < 0)) orelse ((fun(Target_N69386) -> (get({Target_N69386, '$class'})):length(Target_N69386) end)((get({get({This, downloadableItem}), '$class'})):getChanges(get({This, downloadableItem}))) > get({'AbSqlData', 'MAXBLOB'}))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, "Changes value is invalid. Must be < "),
                (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc(get({'AbSqlData', 'MAXBLOB'}))),
                (get({StringBuffer, '$class'})):append(StringBuffer, " and >= 0 characters long.<br/>");
                false -> ok
            end,
            case ((get({get({This, downloadableItem}), '$class'})):getSize(get({This, downloadableItem})) =:= undefined) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, "File Size is null");
                false ->
                put({local, size}, (fun(Target_N69578) -> (get({Target_N69578, '$class'})):toString(Target_N69578) end)((get({get({This, downloadableItem}), '$class'})):getSize(get({This, downloadableItem})))),
                case ((string:length(get({local, size})) < 1) orelse (string:length(get({local, size})) > get({'AbSqlData', 'MAXNUM'}))) of
                    true ->
                    (get({StringBuffer, '$class'})):append(StringBuffer, "File Size is invalid. Must be number < "),
                    (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc(get({'AbSqlData', 'MAXNUM'}))),
                    (get({StringBuffer, '$class'})):append(StringBuffer, " and > 0 digits.<br/>");
                    false -> ok
                end
            end,
            case ((get({get({This, downloadableItem}), '$class'})):getValidTime(get({This, downloadableItem})) =:= undefined) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, "Valid Time is null");
                false ->
                put({local, size}, (fun(Target_N69879) -> (get({Target_N69879, '$class'})):toString(Target_N69879) end)((get({get({This, downloadableItem}), '$class'})):getValidTime(get({This, downloadableItem})))),
                case ((string:length(get({local, size})) < 1) orelse (string:length(get({local, size})) > get({'AbSqlData', 'MAXNUM'}))) of
                    true ->
                    (get({StringBuffer, '$class'})):append(StringBuffer, "Valid Time is invalid. Must be number < "),
                    (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc(get({'AbSqlData', 'MAXNUM'}))),
                    (get({StringBuffer, '$class'})):append(StringBuffer, " and > 0 digits.<br/>");
                    false -> ok
                end
            end,
            case ((get({get({This, downloadableItem}), '$class'})):getRetries(get({This, downloadableItem})) =:= undefined) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, "Retries is null");
                false ->
                put({local, size}, (fun(Target_N70176) -> (get({Target_N70176, '$class'})):toString(Target_N70176) end)((get({get({This, downloadableItem}), '$class'})):getRetries(get({This, downloadableItem})))),
                case ((string:length(get({local, size})) < 1) orelse (string:length(get({local, size})) > get({'AbSqlData', 'MAXNUM'}))) of
                    true ->
                    (get({StringBuffer, '$class'})):append(StringBuffer, "Retries is invalid. Must be number < "),
                    (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc(get({'AbSqlData', 'MAXNUM'}))),
                    (get({StringBuffer, '$class'})):append(StringBuffer, " and > 0 digits.<br/>");
                    false -> ok
                end
            end,
            (get({StringBuffer, '$class'})):toString(StringBuffer)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
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

