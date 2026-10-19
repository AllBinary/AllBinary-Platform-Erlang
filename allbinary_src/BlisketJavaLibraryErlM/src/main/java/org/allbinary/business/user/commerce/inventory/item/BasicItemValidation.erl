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
% package org.allbinary.business.user.commerce.inventory.item
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.sql.AbSqlData
% import org.allbinary.logic.control.validate.Validation
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringValidationUtil
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('BasicItemValidation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('Validation', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, 'MAXWEIGHT'}, 14),
    put({This, 'MAXPRICE'}, 14),
    put({This, itemInterface}, undefined),
    ok.


new(ItemInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, ItemInterface),
    This.

init(This, ItemInterface) ->
    'Validation':init(This),
    init_fields(This),
        put({This, itemInterface}, ItemInterface).

isValid(This) ->
        try
        try
            case ((((get({get({This, itemInterface}), '$class'})):getId(get({This, itemInterface})) =:= undefined) orelse ((fun(Target_N66100) -> (get({Target_N66100, '$class'})):length(Target_N66100) end)((get({get({This, itemInterface}), '$class'})):getId(get({This, itemInterface}))) < 1)) orelse ((fun(Target_N66137) -> (get({Target_N66137, '$class'})):length(Target_N66137) end)((get({get({This, itemInterface}), '$class'})):getId(get({This, itemInterface}))) > get({'AbSqlData', 'MAXNUM'}))) of
                true ->
                throw({'$return', false});
                false -> ok
            end,
            StringValidationUtil = 'StringValidationUtil':getInstance(),
            case (((get({get({This, itemInterface}), '$class'})):getId(get({This, itemInterface})) =/= undefined) andalso (not (get({StringValidationUtil, '$class'})):isNumber(StringValidationUtil, (get({get({This, itemInterface}), '$class'})):getId(get({This, itemInterface}))))) of
                true ->
                throw({'$return', false});
                false -> ok
            end,
            case ((((get({get({This, itemInterface}), '$class'})):getNumber(get({This, itemInterface})) =:= undefined) orelse ((fun(Target_N66401) -> (get({Target_N66401, '$class'})):length(Target_N66401) end)((get({get({This, itemInterface}), '$class'})):getNumber(get({This, itemInterface}))) < 1)) orelse ((fun(Target_N66438) -> (get({Target_N66438, '$class'})):length(Target_N66438) end)((get({get({This, itemInterface}), '$class'})):getNumber(get({This, itemInterface}))) > get({'AbSqlData', 'MAXNUM'}))) of
                true ->
                throw({'$return', false});
                false -> ok
            end,
            case (((get({get({This, itemInterface}), '$class'})):getNumber(get({This, itemInterface})) =/= undefined) andalso (not (get({StringValidationUtil, '$class'})):isNumber(StringValidationUtil, (get({get({This, itemInterface}), '$class'})):getNumber(get({This, itemInterface}))))) of
                true ->
                throw({'$return', false});
                false -> ok
            end,
            case ((((get({get({This, itemInterface}), '$class'})):getInBaskets(get({This, itemInterface})) =:= undefined) orelse ((fun(Target_N66659) -> (get({Target_N66659, '$class'})):length(Target_N66659) end)((get({get({This, itemInterface}), '$class'})):getInBaskets(get({This, itemInterface}))) < 1)) orelse ((fun(Target_N66696) -> (get({Target_N66696, '$class'})):length(Target_N66696) end)((get({get({This, itemInterface}), '$class'})):getInBaskets(get({This, itemInterface}))) > get({'AbSqlData', 'MAXNUM'}))) of
                true ->
                throw({'$return', false});
                false -> ok
            end,
            case (((get({get({This, itemInterface}), '$class'})):getInBaskets(get({This, itemInterface})) =/= undefined) andalso (not (get({StringValidationUtil, '$class'})):isNumber(StringValidationUtil, (get({get({This, itemInterface}), '$class'})):getInBaskets(get({This, itemInterface}))))) of
                true ->
                throw({'$return', false});
                false -> ok
            end,
            case ((((get({get({This, itemInterface}), '$class'})):getWeight(get({This, itemInterface})) =:= undefined) orelse ((fun(Target_N66917) -> (get({Target_N66917, '$class'})):length(Target_N66917) end)((get({get({This, itemInterface}), '$class'})):getWeight(get({This, itemInterface}))) < 1)) orelse ((fun(Target_N66954) -> (get({Target_N66954, '$class'})):length(Target_N66954) end)((get({get({This, itemInterface}), '$class'})):getWeight(get({This, itemInterface}))) > get({This, 'MAXWEIGHT'}))) of
                true ->
                throw({'$return', false});
                false -> ok
            end,
            case (((get({get({This, itemInterface}), '$class'})):getWeight(get({This, itemInterface})) =/= undefined) andalso (not (get({StringValidationUtil, '$class'})):isNumber(StringValidationUtil, (get({get({This, itemInterface}), '$class'})):getWeight(get({This, itemInterface}))))) of
                true ->
                throw({'$return', false});
                false -> ok
            end,
            case ((((get({get({This, itemInterface}), '$class'})):getEnabled(get({This, itemInterface})) =:= undefined) orelse ((fun(Target_N67170) -> (get({Target_N67170, '$class'})):length(Target_N67170) end)((get({get({This, itemInterface}), '$class'})):getEnabled(get({This, itemInterface}))) < 1)) orelse ((fun(Target_N67207) -> (get({Target_N67207, '$class'})):length(Target_N67207) end)((get({get({This, itemInterface}), '$class'})):getEnabled(get({This, itemInterface}))) > get({'AbSqlData', 'MAXSTRING'}))) of
                true ->
                throw({'$return', false});
                false -> ok
            end,
            case ((((get({get({This, itemInterface}), '$class'})):getNewOrUsed(get({This, itemInterface})) =:= undefined) orelse ((fun(Target_N67322) -> (get({Target_N67322, '$class'})):length(Target_N67322) end)((get({get({This, itemInterface}), '$class'})):getNewOrUsed(get({This, itemInterface}))) < 1)) orelse ((fun(Target_N67359) -> (get({Target_N67359, '$class'})):length(Target_N67359) end)((get({get({This, itemInterface}), '$class'})):getNewOrUsed(get({This, itemInterface}))) > get({'AbSqlData', 'MAXSTRING'}))) of
                true ->
                throw({'$return', false});
                false -> ok
            end,
            case ((((get({get({This, itemInterface}), '$class'})):getSummary(get({This, itemInterface})) =:= undefined) orelse ((fun(Target_N67474) -> (get({Target_N67474, '$class'})):length(Target_N67474) end)((get({get({This, itemInterface}), '$class'})):getSummary(get({This, itemInterface}))) < 1)) orelse ((fun(Target_N67511) -> (get({Target_N67511, '$class'})):length(Target_N67511) end)((get({get({This, itemInterface}), '$class'})):getSummary(get({This, itemInterface}))) > get({'AbSqlData', 'MAXSTRING'}))) of
                true ->
                throw({'$return', false});
                false -> ok
            end,
            case ((((get({get({This, itemInterface}), '$class'})):getDescription(get({This, itemInterface})) =:= undefined) orelse ((fun(Target_N67626) -> (get({Target_N67626, '$class'})):length(Target_N67626) end)((get({get({This, itemInterface}), '$class'})):getDescription(get({This, itemInterface}))) < 1)) orelse ((fun(Target_N67663) -> (get({Target_N67663, '$class'})):length(Target_N67663) end)((get({get({This, itemInterface}), '$class'})):getDescription(get({This, itemInterface}))) > get({'AbSqlData', 'MAXBLOB'}))) of
                true ->
                throw({'$return', false});
                false -> ok
            end,
            case ((((get({get({This, itemInterface}), '$class'})):getKeywords(get({This, itemInterface})) =:= undefined) orelse ((fun(Target_N67782) -> (get({Target_N67782, '$class'})):length(Target_N67782) end)((get({get({This, itemInterface}), '$class'})):getKeywords(get({This, itemInterface}))) < 1)) orelse ((fun(Target_N67819) -> (get({Target_N67819, '$class'})):length(Target_N67819) end)((get({get({This, itemInterface}), '$class'})):getKeywords(get({This, itemInterface}))) > get({'AbSqlData', 'MAXSTRING'}))) of
                true ->
                throw({'$return', false});
                false -> ok
            end,
            case ((((get({get({This, itemInterface}), '$class'})):getCategory(get({This, itemInterface})) =:= undefined) orelse ((fun(Target_N67934) -> (get({Target_N67934, '$class'})):length(Target_N67934) end)((get({get({This, itemInterface}), '$class'})):getCategory(get({This, itemInterface}))) < 1)) orelse ((fun(Target_N67971) -> (get({Target_N67971, '$class'})):length(Target_N67971) end)((get({get({This, itemInterface}), '$class'})):getCategory(get({This, itemInterface}))) > get({'AbSqlData', 'MAXSTRING'}))) of
                true ->
                throw({'$return', false});
                false -> ok
            end,
            case ((((get({get({This, itemInterface}), '$class'})):getType(get({This, itemInterface})) =:= undefined) orelse ((fun(Target_N68086) -> (get({Target_N68086, '$class'})):length(Target_N68086) end)((get({get({This, itemInterface}), '$class'})):getType(get({This, itemInterface}))) < 1)) orelse ((fun(Target_N68123) -> (get({Target_N68123, '$class'})):length(Target_N68123) end)((get({get({This, itemInterface}), '$class'})):getType(get({This, itemInterface}))) > get({'AbSqlData', 'MAXSTRING'}))) of
                true ->
                throw({'$return', false});
                false -> ok
            end,
            case (((get({get({This, itemInterface}), '$class'})):getPrice(get({This, itemInterface})) =:= undefined) orelse (not (fun(Target_N68234) -> (get({Target_N68234, '$class'})):isValid(Target_N68234) end)((get({get({This, itemInterface}), '$class'})):getPrice(get({This, itemInterface}))))) of
                true ->
                throw({'$return', false});
                false -> ok
            end,
            case ((((get({get({This, itemInterface}), '$class'})):getCustoms(get({This, itemInterface})) =:= undefined) orelse ((fun(Target_N68337) -> (get({Target_N68337, '$class'})):length(Target_N68337) end)((get({get({This, itemInterface}), '$class'})):getCustoms(get({This, itemInterface}))) < 1)) orelse ((fun(Target_N68374) -> (get({Target_N68374, '$class'})):length(Target_N68374) end)((get({get({This, itemInterface}), '$class'})):getCustoms(get({This, itemInterface}))) > get({'AbSqlData', 'MAXNUM'}))) of
                true ->
                throw({'$return', false});
                false -> ok
            end,
            case ((((get({get({This, itemInterface}), '$class'})):getDownloads(get({This, itemInterface})) =:= undefined) orelse ((fun(Target_N68493) -> (get({Target_N68493, '$class'})):length(Target_N68493) end)((get({get({This, itemInterface}), '$class'})):getDownloads(get({This, itemInterface}))) < 1)) orelse ((fun(Target_N68530) -> (get({Target_N68530, '$class'})):length(Target_N68530) end)((get({get({This, itemInterface}), '$class'})):getDownloads(get({This, itemInterface}))) > get({'AbSqlData', 'MAXNUM'}))) of
                true ->
                throw({'$return', false});
                false -> ok
            end,
            case ((((get({get({This, itemInterface}), '$class'})):getGroups(get({This, itemInterface})) =:= undefined) orelse ((fun(Target_N68645) -> (get({Target_N68645, '$class'})):length(Target_N68645) end)((get({get({This, itemInterface}), '$class'})):getGroups(get({This, itemInterface}))) < 1)) orelse ((fun(Target_N68682) -> (get({Target_N68682, '$class'})):length(Target_N68682) end)((get({get({This, itemInterface}), '$class'})):getGroups(get({This, itemInterface}))) > get({'AbSqlData', 'MAXNUM'}))) of
                true ->
                throw({'$return', false});
                false -> ok
            end,
            case ((((get({get({This, itemInterface}), '$class'})):getOptions(get({This, itemInterface})) =:= undefined) orelse ((fun(Target_N68797) -> (get({Target_N68797, '$class'})):length(Target_N68797) end)((get({get({This, itemInterface}), '$class'})):getOptions(get({This, itemInterface}))) < 1)) orelse ((fun(Target_N68834) -> (get({Target_N68834, '$class'})):length(Target_N68834) end)((get({get({This, itemInterface}), '$class'})):getOptions(get({This, itemInterface}))) > get({'AbSqlData', 'MAXNUM'}))) of
                true ->
                throw({'$return', false});
                false -> ok
            end,
            case ((((get({get({This, itemInterface}), '$class'})):getPermissions(get({This, itemInterface})) =:= undefined) orelse ((fun(Target_N68949) -> (get({Target_N68949, '$class'})):length(Target_N68949) end)((get({get({This, itemInterface}), '$class'})):getPermissions(get({This, itemInterface}))) < 1)) orelse ((fun(Target_N68986) -> (get({Target_N68986, '$class'})):length(Target_N68986) end)((get({get({This, itemInterface}), '$class'})):getPermissions(get({This, itemInterface}))) > get({'AbSqlData', 'MAXNUM'}))) of
                true ->
                throw({'$return', false});
                false -> ok
            end,
            case ((((get({get({This, itemInterface}), '$class'})):getSpecials(get({This, itemInterface})) =:= undefined) orelse ((fun(Target_N69101) -> (get({Target_N69101, '$class'})):length(Target_N69101) end)((get({get({This, itemInterface}), '$class'})):getSpecials(get({This, itemInterface}))) < 1)) orelse ((fun(Target_N69138) -> (get({Target_N69138, '$class'})):length(Target_N69138) end)((get({get({This, itemInterface}), '$class'})):getSpecials(get({This, itemInterface}))) > get({'AbSqlData', 'MAXNUM'}))) of
                true ->
                throw({'$return', false});
                false -> ok
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
            case ((((get({get({This, itemInterface}), '$class'})):getId(get({This, itemInterface})) =:= undefined) orelse ((fun(Target_N69638) -> (get({Target_N69638, '$class'})):length(Target_N69638) end)((get({get({This, itemInterface}), '$class'})):getId(get({This, itemInterface}))) < 1)) orelse ((fun(Target_N69675) -> (get({Target_N69675, '$class'})):length(Target_N69675) end)((get({get({This, itemInterface}), '$class'})):getId(get({This, itemInterface}))) > get({'AbSqlData', 'MAXNUM'}))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([lists:concat(["Id is invalid. Must be number < ", get({'AbSqlData', 'MAXNUM'})]), " and > 0 digits.<br />"]));
                false -> ok
            end,
            StringValidationUtil = 'StringValidationUtil':getInstance(),
            case (((get({get({This, itemInterface}), '$class'})):getId(get({This, itemInterface})) =/= undefined) andalso (not (get({StringValidationUtil, '$class'})):isNumber(StringValidationUtil, (get({get({This, itemInterface}), '$class'})):getId(get({This, itemInterface}))))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, "Id is invalid. Must be > 0.<br />");
                false -> ok
            end,
            case ((((get({get({This, itemInterface}), '$class'})):getNumber(get({This, itemInterface})) =:= undefined) orelse ((fun(Target_N69983) -> (get({Target_N69983, '$class'})):length(Target_N69983) end)((get({get({This, itemInterface}), '$class'})):getNumber(get({This, itemInterface}))) < 1)) orelse ((fun(Target_N70020) -> (get({Target_N70020, '$class'})):length(Target_N70020) end)((get({get({This, itemInterface}), '$class'})):getNumber(get({This, itemInterface}))) > get({'AbSqlData', 'MAXNUM'}))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([lists:concat(["Number of items is invalid. Must be number < ", get({'AbSqlData', 'MAXNUM'})]), " and > 0 digits.<br />"]));
                false -> ok
            end,
            case (((get({get({This, itemInterface}), '$class'})):getNumber(get({This, itemInterface})) =/= undefined) andalso (not (get({StringValidationUtil, '$class'})):isNumber(StringValidationUtil, (get({get({This, itemInterface}), '$class'})):getNumber(get({This, itemInterface}))))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, "Number of items value is not a valid number.<br />");
                false -> ok
            end,
            case ((((get({get({This, itemInterface}), '$class'})):getInBaskets(get({This, itemInterface})) =:= undefined) orelse ((fun(Target_N70285) -> (get({Target_N70285, '$class'})):length(Target_N70285) end)((get({get({This, itemInterface}), '$class'})):getInBaskets(get({This, itemInterface}))) < 1)) orelse ((fun(Target_N70322) -> (get({Target_N70322, '$class'})):length(Target_N70322) end)((get({get({This, itemInterface}), '$class'})):getInBaskets(get({This, itemInterface}))) > get({'AbSqlData', 'MAXNUM'}))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([lists:concat(["Number in baskets is invalid. Must be < ", get({'AbSqlData', 'MAXNUM'})]), " and > 0 digits.<br />"]));
                false -> ok
            end,
            case (((get({get({This, itemInterface}), '$class'})):getInBaskets(get({This, itemInterface})) =/= undefined) andalso (not (get({StringValidationUtil, '$class'})):isNumber(StringValidationUtil, (get({get({This, itemInterface}), '$class'})):getInBaskets(get({This, itemInterface}))))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, "In Baskets value is not a valid number.<br />");
                false -> ok
            end,
            case ((((get({get({This, itemInterface}), '$class'})):getWeight(get({This, itemInterface})) =:= undefined) orelse ((fun(Target_N70587) -> (get({Target_N70587, '$class'})):length(Target_N70587) end)((get({get({This, itemInterface}), '$class'})):getWeight(get({This, itemInterface}))) < 1)) orelse ((fun(Target_N70624) -> (get({Target_N70624, '$class'})):length(Target_N70624) end)((get({get({This, itemInterface}), '$class'})):getWeight(get({This, itemInterface}))) > get({This, 'MAXWEIGHT'}))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([lists:concat(["Weight value is invalid. Must be < ", get({This, 'MAXWEIGHT'})]), " and > 0 digits.<br />"]));
                false -> ok
            end,
            case (((get({get({This, itemInterface}), '$class'})):getWeight(get({This, itemInterface})) =/= undefined) andalso (not (get({StringValidationUtil, '$class'})):isNumber(StringValidationUtil, (get({get({This, itemInterface}), '$class'})):getWeight(get({This, itemInterface}))))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, "Weight value is not a valid number.<br />");
                false -> ok
            end,
            case ((((get({get({This, itemInterface}), '$class'})):getEnabled(get({This, itemInterface})) =:= undefined) orelse ((fun(Target_N70879) -> (get({Target_N70879, '$class'})):length(Target_N70879) end)((get({get({This, itemInterface}), '$class'})):getEnabled(get({This, itemInterface}))) < 1)) orelse ((fun(Target_N70916) -> (get({Target_N70916, '$class'})):length(Target_N70916) end)((get({get({This, itemInterface}), '$class'})):getEnabled(get({This, itemInterface}))) > get({'AbSqlData', 'MAXSTRING'}))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([lists:concat(["For Sale value is invalid. Must be < ", get({'AbSqlData', 'MAXSTRING'})]), " and > 0 characters long.<br />"]));
                false -> ok
            end,
            case ((((get({get({This, itemInterface}), '$class'})):getNewOrUsed(get({This, itemInterface})) =:= undefined) orelse ((fun(Target_N71068) -> (get({Target_N71068, '$class'})):length(Target_N71068) end)((get({get({This, itemInterface}), '$class'})):getNewOrUsed(get({This, itemInterface}))) < 1)) orelse ((fun(Target_N71105) -> (get({Target_N71105, '$class'})):length(Target_N71105) end)((get({get({This, itemInterface}), '$class'})):getNewOrUsed(get({This, itemInterface}))) > get({'AbSqlData', 'MAXSTRING'}))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([lists:concat(["New Or Used value is invalid. Must be < ", get({'AbSqlData', 'MAXSTRING'})]), " and > 0 characters long.<br />"]));
                false -> ok
            end,
            case ((((get({get({This, itemInterface}), '$class'})):getSummary(get({This, itemInterface})) =:= undefined) orelse ((fun(Target_N71257) -> (get({Target_N71257, '$class'})):length(Target_N71257) end)((get({get({This, itemInterface}), '$class'})):getSummary(get({This, itemInterface}))) < 1)) orelse ((fun(Target_N71294) -> (get({Target_N71294, '$class'})):length(Target_N71294) end)((get({get({This, itemInterface}), '$class'})):getSummary(get({This, itemInterface}))) > get({'AbSqlData', 'MAXSTRING'}))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([lists:concat(["Summary value is invalid. Must be < ", get({'AbSqlData', 'MAXSTRING'})]), " and > 0 characters long.<br />"]));
                false -> ok
            end,
            case ((((get({get({This, itemInterface}), '$class'})):getDescription(get({This, itemInterface})) =:= undefined) orelse ((fun(Target_N71446) -> (get({Target_N71446, '$class'})):length(Target_N71446) end)((get({get({This, itemInterface}), '$class'})):getDescription(get({This, itemInterface}))) < 1)) orelse ((fun(Target_N71483) -> (get({Target_N71483, '$class'})):length(Target_N71483) end)((get({get({This, itemInterface}), '$class'})):getDescription(get({This, itemInterface}))) > get({'AbSqlData', 'MAXBLOB'}))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([lists:concat(["Description value is invalid. Must be < ", get({'AbSqlData', 'MAXBLOB'})]), " and > 0 characters long.<br />"]));
                false -> ok
            end,
            case ((((get({get({This, itemInterface}), '$class'})):getKeywords(get({This, itemInterface})) =:= undefined) orelse ((fun(Target_N71639) -> (get({Target_N71639, '$class'})):length(Target_N71639) end)((get({get({This, itemInterface}), '$class'})):getKeywords(get({This, itemInterface}))) < 1)) orelse ((fun(Target_N71676) -> (get({Target_N71676, '$class'})):length(Target_N71676) end)((get({get({This, itemInterface}), '$class'})):getKeywords(get({This, itemInterface}))) > get({'AbSqlData', 'MAXSTRING'}))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([lists:concat(["Keywords value is invalid. Must be < ", get({'AbSqlData', 'MAXSTRING'})]), " and > 0 characters long.<br />"]));
                false -> ok
            end,
            case ((((get({get({This, itemInterface}), '$class'})):getCategory(get({This, itemInterface})) =:= undefined) orelse ((fun(Target_N71828) -> (get({Target_N71828, '$class'})):length(Target_N71828) end)((get({get({This, itemInterface}), '$class'})):getCategory(get({This, itemInterface}))) < 1)) orelse ((fun(Target_N71865) -> (get({Target_N71865, '$class'})):length(Target_N71865) end)((get({get({This, itemInterface}), '$class'})):getCategory(get({This, itemInterface}))) > get({'AbSqlData', 'MAXSTRING'}))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([lists:concat(["Category value is invalid. Must be < ", get({'AbSqlData', 'MAXSTRING'})]), " and > 0 characters long.<br />"]));
                false -> ok
            end,
            case ((((get({get({This, itemInterface}), '$class'})):getType(get({This, itemInterface})) =:= undefined) orelse ((fun(Target_N72021) -> (get({Target_N72021, '$class'})):length(Target_N72021) end)((get({get({This, itemInterface}), '$class'})):getType(get({This, itemInterface}))) < 1)) orelse ((fun(Target_N72058) -> (get({Target_N72058, '$class'})):length(Target_N72058) end)((get({get({This, itemInterface}), '$class'})):getType(get({This, itemInterface}))) > get({'AbSqlData', 'MAXSTRING'}))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([lists:concat(["Type value is invalid. Must be < ", get({'AbSqlData', 'MAXSTRING'})]), " and > 0 characters long.<br />"]));
                false -> ok
            end,
            case (((get({get({This, itemInterface}), '$class'})):getPrice(get({This, itemInterface})) =:= undefined) orelse (not (fun(Target_N72206) -> (get({Target_N72206, '$class'})):isValid(Target_N72206) end)((get({get({This, itemInterface}), '$class'})):getPrice(get({This, itemInterface}))))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([lists:concat(["Price value is invalid. Must be < ", get({This, 'MAXPRICE'})]), " and > 0 in length.<br />"]));
                false -> ok
            end,
            case ((((get({get({This, itemInterface}), '$class'})):getCustoms(get({This, itemInterface})) =:= undefined) orelse ((fun(Target_N72341) -> (get({Target_N72341, '$class'})):length(Target_N72341) end)((get({get({This, itemInterface}), '$class'})):getCustoms(get({This, itemInterface}))) < 1)) orelse ((fun(Target_N72378) -> (get({Target_N72378, '$class'})):length(Target_N72378) end)((get({get({This, itemInterface}), '$class'})):getCustoms(get({This, itemInterface}))) > get({'AbSqlData', 'MAXNUM'}))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([lists:concat(["Custom items value is invalid. Must be number < ", get({'AbSqlData', 'MAXNUM'})]), " and > 0 digits.<br />"]));
                false -> ok
            end,
            case ((((get({get({This, itemInterface}), '$class'})):getDownloads(get({This, itemInterface})) =:= undefined) orelse ((fun(Target_N72534) -> (get({Target_N72534, '$class'})):length(Target_N72534) end)((get({get({This, itemInterface}), '$class'})):getDownloads(get({This, itemInterface}))) < 1)) orelse ((fun(Target_N72571) -> (get({Target_N72571, '$class'})):length(Target_N72571) end)((get({get({This, itemInterface}), '$class'})):getDownloads(get({This, itemInterface}))) > get({'AbSqlData', 'MAXNUM'}))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([lists:concat(["Downloadable item value is invalid. Must be number < ", get({'AbSqlData', 'MAXNUM'})]), " and > 0 digits.<br />"]));
                false -> ok
            end,
            case ((((get({get({This, itemInterface}), '$class'})):getGroups(get({This, itemInterface})) =:= undefined) orelse ((fun(Target_N72723) -> (get({Target_N72723, '$class'})):length(Target_N72723) end)((get({get({This, itemInterface}), '$class'})):getGroups(get({This, itemInterface}))) < 1)) orelse ((fun(Target_N72760) -> (get({Target_N72760, '$class'})):length(Target_N72760) end)((get({get({This, itemInterface}), '$class'})):getGroups(get({This, itemInterface}))) > get({'AbSqlData', 'MAXNUM'}))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([lists:concat(["Group item value is invalid. Must be number < ", get({'AbSqlData', 'MAXNUM'})]), " and > 0 digits.<br />"]));
                false -> ok
            end,
            case ((((get({get({This, itemInterface}), '$class'})):getOptions(get({This, itemInterface})) =:= undefined) orelse ((fun(Target_N72912) -> (get({Target_N72912, '$class'})):length(Target_N72912) end)((get({get({This, itemInterface}), '$class'})):getOptions(get({This, itemInterface}))) < 1)) orelse ((fun(Target_N72949) -> (get({Target_N72949, '$class'})):length(Target_N72949) end)((get({get({This, itemInterface}), '$class'})):getOptions(get({This, itemInterface}))) > get({'AbSqlData', 'MAXNUM'}))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([lists:concat(["Option item value is invalid. Must be number < ", get({'AbSqlData', 'MAXNUM'})]), " and > 0 digits.<br />"]));
                false -> ok
            end,
            case ((((get({get({This, itemInterface}), '$class'})):getPermissions(get({This, itemInterface})) =:= undefined) orelse ((fun(Target_N73101) -> (get({Target_N73101, '$class'})):length(Target_N73101) end)((get({get({This, itemInterface}), '$class'})):getPermissions(get({This, itemInterface}))) < 1)) orelse ((fun(Target_N73138) -> (get({Target_N73138, '$class'})):length(Target_N73138) end)((get({get({This, itemInterface}), '$class'})):getPermissions(get({This, itemInterface}))) > get({'AbSqlData', 'MAXNUM'}))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([lists:concat(["Permission item value is invalid. Must be number < ", get({'AbSqlData', 'MAXNUM'})]), " and > 0 digits.<br />"]));
                false -> ok
            end,
            case ((((get({get({This, itemInterface}), '$class'})):getSpecials(get({This, itemInterface})) =:= undefined) orelse ((fun(Target_N73290) -> (get({Target_N73290, '$class'})):length(Target_N73290) end)((get({get({This, itemInterface}), '$class'})):getSpecials(get({This, itemInterface}))) < 1)) orelse ((fun(Target_N73327) -> (get({Target_N73327, '$class'})):length(Target_N73327) end)((get({get({This, itemInterface}), '$class'})):getSpecials(get({This, itemInterface}))) > get({'AbSqlData', 'MAXNUM'}))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([lists:concat(["Special item value is invalid. Must be number < ", get({'AbSqlData', 'MAXNUM'})]), " and > 0 digits.<br />"]));
                false -> ok
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

