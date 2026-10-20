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
% import java.util.Calendar
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.entry.EntryData
% import org.allbinary.business.user.commerce.money.Money
% import org.allbinary.business.user.commerce.money.MoneyException
% import org.allbinary.data.generator.ProductIdGenerator
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.string.StringValidationUtil
% import org.allbinary.string.CommonPhoneStrings
% import org.allbinary.string.CommonStrings

-module('BasicItem').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ItemInterface

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, basicItemData}, 'BasicItemData':getInstance()),
    put({This, itemId}, undefined),
    put({This, number}, undefined),
    put({This, inBaskets}, undefined),
    put({This, weight}, undefined),
    put({This, enabled}, undefined),
    put({This, newOrUsed}, undefined),
    put({This, summary}, undefined),
    put({This, distributor}, undefined),
    put({This, idUsedByDistributor}, undefined),
    put({This, producedBy}, undefined),
    put({This, productionDate}, undefined),
    put({This, startProductionDate}, undefined),
    put({This, description}, undefined),
    put({This, keywords}, undefined),
    put({This, category}, undefined),
    put({This, type}, undefined),
    put({This, smallImage}, undefined),
    put({This, mediumImage}, undefined),
    put({This, largeImage}, undefined),
    put({This, price}, undefined),
    put({This, comment}, undefined),
    put({This, customs}, undefined),
    put({This, downloads}, undefined),
    put({This, groups}, undefined),
    put({This, options}, undefined),
    put({This, permissions}, undefined),
    put({This, specials}, undefined),
    put({This, downloadable}, false),
    put({This, timeEntered}, undefined),
    put({This, lastModified}, undefined),
    ok.


new(ItemHashMap) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, ItemHashMap),
    This.

'$init'(This, ItemHashMap) ->
    init_fields(This),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'PRODUCTSEARCHLOGGING'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "Constructor(HashMap)");
            false -> ok
        end,
        put({This, itemId}, (get({ItemHashMap, '$class'})):get(ItemHashMap, get({get({This, basicItemData}), 'ID'}))),
        put({This, number}, (get({ItemHashMap, '$class'})):get(ItemHashMap, get({get({This, basicItemData}), 'NUMBER'}))),
        put({This, inBaskets}, (get({ItemHashMap, '$class'})):get(ItemHashMap, get({get({This, basicItemData}), 'INBASKETS'}))),
        put({This, weight}, (get({ItemHashMap, '$class'})):get(ItemHashMap, get({get({This, basicItemData}), 'WEIGHT'}))),
        put({This, enabled}, (get({ItemHashMap, '$class'})):get(ItemHashMap, get({'EntryData':getInstance(), 'ENABLE'}))),
        put({This, newOrUsed}, (get({ItemHashMap, '$class'})):get(ItemHashMap, get({get({This, basicItemData}), 'NEWORUSED'}))),
        put({This, summary}, (get({ItemHashMap, '$class'})):get(ItemHashMap, get({get({This, basicItemData}), 'SUMMARY'}))),
        put({This, distributor}, (get({ItemHashMap, '$class'})):get(ItemHashMap, get({get({This, basicItemData}), 'DISTRIBUTOR'}))),
        put({This, idUsedByDistributor}, (get({ItemHashMap, '$class'})):get(ItemHashMap, get({get({This, basicItemData}), 'IDUSEDBYDISTRIBUTOR'}))),
        put({This, producedBy}, (get({ItemHashMap, '$class'})):get(ItemHashMap, get({get({This, basicItemData}), 'PRODUCEDBY'}))),
        put({This, productionDate}, (get({ItemHashMap, '$class'})):get(ItemHashMap, get({get({This, basicItemData}), 'PRODUCTIONDATE'}))),
        put({This, startProductionDate}, (get({ItemHashMap, '$class'})):get(ItemHashMap, get({get({This, basicItemData}), 'STARTPRODUCTIONDATE'}))),
        put({This, description}, (get({ItemHashMap, '$class'})):get(ItemHashMap, get({get({This, basicItemData}), 'DESCRIPTION'}))),
        put({This, keywords}, (get({ItemHashMap, '$class'})):get(ItemHashMap, get({get({This, basicItemData}), 'KEYWORDS'}))),
        put({This, category}, (get({ItemHashMap, '$class'})):get(ItemHashMap, get({get({This, basicItemData}), 'CATEGORY'}))),
        put({This, type}, (get({ItemHashMap, '$class'})):get(ItemHashMap, get({get({This, basicItemData}), 'TYPE'}))),
        put({This, smallImage}, (get({ItemHashMap, '$class'})):get(ItemHashMap, get({get({This, basicItemData}), 'SMALLIMAGE'}))),
        put({This, mediumImage}, (get({ItemHashMap, '$class'})):get(ItemHashMap, get({get({This, basicItemData}), 'MEDIUMIMAGE'}))),
        put({This, largeImage}, (get({ItemHashMap, '$class'})):get(ItemHashMap, get({get({This, basicItemData}), 'LARGEIMAGE'}))),
        put({This, timeEntered}, (get({ItemHashMap, '$class'})):get(ItemHashMap, get({'EntryData':getInstance(), 'TIMECREATED'}))),
        put({This, lastModified}, (get({ItemHashMap, '$class'})):get(ItemHashMap, get({'EntryData':getInstance(), 'LASTMODIFIED'}))),
        put({This, price}, 'Money':new((get({ItemHashMap, '$class'})):get(ItemHashMap, get({get({This, basicItemData}), 'PRICE'})))),
        put({This, comment}, (get({ItemHashMap, '$class'})):get(ItemHashMap, get({get({This, basicItemData}), 'COMMENT'}))),
        put({This, customs}, (get({ItemHashMap, '$class'})):get(ItemHashMap, get({get({This, basicItemData}), 'CUSTOMS'}))),
        (get({This, '$class'})):setDownloads(This, (get({ItemHashMap, '$class'})):get(ItemHashMap, get({get({This, basicItemData}), 'DOWNLOADS'}))),
        put({This, groups}, (get({ItemHashMap, '$class'})):get(ItemHashMap, get({get({This, basicItemData}), 'GROUPS'}))),
        put({This, options}, (get({ItemHashMap, '$class'})):get(ItemHashMap, get({get({This, basicItemData}), 'OPTIONS'}))),
        put({This, permissions}, (get({ItemHashMap, '$class'})):get(ItemHashMap, get({get({This, basicItemData}), 'PERMISSIONS'}))),
        put({This, specials}, (get({ItemHashMap, '$class'})):get(ItemHashMap, get({get({This, basicItemData}), 'SPECIALS'}))).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'PRODUCTSEARCHLOGGING'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'}));
            false -> ok
        end,
        EMPTY = get({'StringUtil':getInstance(), 'EMPTY_STRING'}),
        put({This, itemId}, (fun(Target_N69636) -> (get({Target_N69636, '$class'})):getNext(Target_N69636) end)('ProductIdGenerator':new())),
        put({This, number}, get({'CommonPhoneStrings':getInstance(), 'ZERO'})),
        put({This, inBaskets}, EMPTY),
        put({This, weight}, EMPTY),
        put({This, enabled}, EMPTY),
        put({This, newOrUsed}, EMPTY),
        put({This, summary}, EMPTY),
        put({This, distributor}, EMPTY),
        put({This, idUsedByDistributor}, EMPTY),
        put({This, producedBy}, EMPTY),
        put({This, productionDate}, EMPTY),
        put({This, startProductionDate}, EMPTY),
        put({This, description}, EMPTY),
        put({This, keywords}, EMPTY),
        put({This, category}, EMPTY),
        put({This, type}, EMPTY),
        put({This, smallImage}, EMPTY),
        put({This, mediumImage}, EMPTY),
        put({This, largeImage}, EMPTY),
        put({This, timeEntered}, EMPTY),
        put({This, lastModified}, EMPTY),
        put({This, price}, 'Money':new()),
        put({This, comment}, EMPTY),
        put({This, customs}, EMPTY),
        (get({This, '$class'})):setDownloads(This, EMPTY),
        put({This, groups}, EMPTY),
        put({This, options}, EMPTY),
        put({This, permissions}, EMPTY),
        put({This, specials}, EMPTY).

setId(This, ItemId) when (is_list(ItemId) orelse ItemId =:= undefined) ->
        put({This, itemId}, ItemId).

setNumber(This, Number) when (is_list(Number) orelse Number =:= undefined) ->
        put({This, number}, Number).

setInBaskets(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, inBaskets}, Value).

setWeight(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, weight}, Value).

setNewOrUsed(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, newOrUsed}, Value).

setSummary(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, summary}, Value).

setDistributor(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, distributor}, Value).

setIdUsedByDistributor(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, idUsedByDistributor}, Value).

setProducedBy(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, producedBy}, Value).

setProductionDate(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, productionDate}, Value).

setStartProductionDate(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, startProductionDate}, Value).

setDescription(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, description}, Value).

setKeywords(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, keywords}, Value).

setCategory(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, category}, Value).

setType(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, type}, Value).

setSmallImage(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, smallImage}, Value).

setMediumImage(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, mediumImage}, Value).

setLargeImage(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, largeImage}, Value).

setTimeEntered(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, timeEntered}, Value).

setLastModified(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, lastModified}, Value).

setPrice(This, Value) ->
        put({This, price}, Value).

setComment(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, comment}, Value).

setCustoms(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, customs}, Value).

setDownloads(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, downloads}, Value),
        case (not (fun(Target_N72207) -> (get({Target_N72207, '$class'})):isEmpty(Target_N72207, get({This, downloads})) end)('StringValidationUtil':getInstance())) of
            true ->
            DownloadInteger = allbinary_java:to_string(get({This, downloads})),
            case ((get({DownloadInteger, '$class'})):intValue(DownloadInteger) =/= 0) of
                true ->
                (get({This, '$class'})):setDownloadable(This, true);
                false -> ok
            end;
            false -> ok
        end.

setGroups(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, groups}, Value).

setOptions(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, options}, Value).

setPermissions(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, permissions}, Value).

setSpecials(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, specials}, Value).

setEnabled(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, enabled}, Value).

getId(This) ->
        get({This, itemId}).

getNumber(This) ->
        get({This, number}).

getInBaskets(This) ->
        get({This, inBaskets}).

getWeight(This) ->
        get({This, weight}).

getNewOrUsed(This) ->
        get({This, newOrUsed}).

getSummary(This) ->
        get({This, summary}).

getDistributor(This) ->
        get({This, distributor}).

getIdUsedByDistributor(This) ->
        get({This, idUsedByDistributor}).

getProducedBy(This) ->
        get({This, producedBy}).

getProductionDate(This) ->
        get({This, productionDate}).

getStartProductionDate(This) ->
        get({This, startProductionDate}).

getDescription(This) ->
        get({This, description}).

getKeywords(This) ->
        get({This, keywords}).

getCategory(This) ->
        get({This, category}).

getType(This) ->
        get({This, type}).

getSmallImage(This) ->
        get({This, smallImage}).

getMediumImage(This) ->
        get({This, mediumImage}).

getLargeImage(This) ->
        get({This, largeImage}).

getTimeEntered(This) ->
        get({This, timeEntered}).

getLastModified(This) ->
        get({This, lastModified}).

getPrice(This) ->
        get({This, price}).

getComment(This) ->
        get({This, comment}).

getCustoms(This) ->
        get({This, customs}).

getDownloads(This) ->
        get({This, downloads}).

getGroups(This) ->
        get({This, groups}).

getOptions(This) ->
        get({This, options}).

getPermissions(This) ->
        get({This, permissions}).

getSpecials(This) ->
        get({This, specials}).

setDownloadable(This, Downloadable) when is_boolean(Downloadable) ->
        put({This, downloadable}, Downloadable).

isDownloadable(This) ->
        get({This, downloadable}).

getEnabled(This) ->
        get({This, enabled}).

getTotal(This) ->
        ItemTotal = 'Money':new(get({This, price})),
        (get({ItemTotal, '$class'})):multiply(ItemTotal, (get({get({This, number}), '$class'})):intValue(get({This, number}))),
        ItemTotal.

toHashMap(This) ->
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'PRODUCTSEARCHLOGGING'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "toHashMap");
            false -> ok
        end,
        HashMap = (fun(Target_N74587) -> (get({Target_N74587, '$class'})):createHashMap(Target_N74587) end)('StdUtil':getInstance()),
        (get({HashMap, '$class'})):put(HashMap, get({get({This, basicItemData}), 'ID'}), get({This, itemId})),
        (get({HashMap, '$class'})):put(HashMap, get({get({This, basicItemData}), 'NUMBER'}), get({This, number})),
        (get({HashMap, '$class'})):put(HashMap, get({get({This, basicItemData}), 'INBASKETS'}), get({This, inBaskets})),
        (get({HashMap, '$class'})):put(HashMap, get({get({This, basicItemData}), 'WEIGHT'}), get({This, weight})),
        (get({HashMap, '$class'})):put(HashMap, get({'EntryData':getInstance(), 'ENABLE'}), get({This, enabled})),
        (get({HashMap, '$class'})):put(HashMap, get({get({This, basicItemData}), 'NEWORUSED'}), get({This, newOrUsed})),
        (get({HashMap, '$class'})):put(HashMap, get({get({This, basicItemData}), 'SUMMARY'}), get({This, summary})),
        (get({HashMap, '$class'})):put(HashMap, get({get({This, basicItemData}), 'DISTRIBUTOR'}), get({This, distributor})),
        (get({HashMap, '$class'})):put(HashMap, get({get({This, basicItemData}), 'IDUSEDBYDISTRIBUTOR'}), get({This, idUsedByDistributor})),
        (get({HashMap, '$class'})):put(HashMap, get({get({This, basicItemData}), 'PRODUCEDBY'}), get({This, producedBy})),
        (get({HashMap, '$class'})):put(HashMap, get({get({This, basicItemData}), 'PRODUCTIONDATE'}), get({This, productionDate})),
        (get({HashMap, '$class'})):put(HashMap, get({get({This, basicItemData}), 'STARTPRODUCTIONDATE'}), get({This, startProductionDate})),
        (get({HashMap, '$class'})):put(HashMap, get({get({This, basicItemData}), 'DESCRIPTION'}), get({This, description})),
        (get({HashMap, '$class'})):put(HashMap, get({get({This, basicItemData}), 'KEYWORDS'}), get({This, keywords})),
        (get({HashMap, '$class'})):put(HashMap, get({get({This, basicItemData}), 'CATEGORY'}), get({This, category})),
        (get({HashMap, '$class'})):put(HashMap, get({get({This, basicItemData}), 'TYPE'}), get({This, type})),
        (get({HashMap, '$class'})):put(HashMap, get({get({This, basicItemData}), 'SMALLIMAGE'}), get({This, smallImage})),
        (get({HashMap, '$class'})):put(HashMap, get({get({This, basicItemData}), 'MEDIUMIMAGE'}), get({This, mediumImage})),
        (get({HashMap, '$class'})):put(HashMap, get({get({This, basicItemData}), 'LARGEIMAGE'}), get({This, largeImage})),
        Calendar = 'Calendar':getInstance(),
        Time = (fun(Target_N75647) -> (get({Target_N75647, '$class'})):toString(Target_N75647) end)((get({Calendar, '$class'})):getTimeInMillis(Calendar)),
        (get({HashMap, '$class'})):put(HashMap, get({'EntryData':getInstance(), 'LASTMODIFIED'}), Time),
        (get({HashMap, '$class'})):put(HashMap, get({get({This, basicItemData}), 'PRICE'}), (get({get({This, price}), '$class'})):toString(get({This, price}))),
        (get({HashMap, '$class'})):put(HashMap, get({get({This, basicItemData}), 'COMMENT'}), get({This, comment})),
        (get({HashMap, '$class'})):put(HashMap, get({get({This, basicItemData}), 'CUSTOMS'}), get({This, customs})),
        (get({HashMap, '$class'})):put(HashMap, get({get({This, basicItemData}), 'DOWNLOADS'}), (get({This, '$class'})):getDownloads(This)),
        (get({HashMap, '$class'})):put(HashMap, get({get({This, basicItemData}), 'GROUPS'}), get({This, groups})),
        (get({HashMap, '$class'})):put(HashMap, get({get({This, basicItemData}), 'OPTIONS'}), get({This, options})),
        (get({HashMap, '$class'})):put(HashMap, get({get({This, basicItemData}), 'PERMISSIONS'}), get({This, permissions})),
        (get({HashMap, '$class'})):put(HashMap, get({get({This, basicItemData}), 'SPECIALS'}), get({This, specials})),
        HashMap.

toVector(This) ->
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'PRODUCTSEARCHLOGGING'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "toVector");
            false -> ok
        end,
        Values = 'BasicArrayListD':new(),
        (get({Values, '$class'})):add(Values, get({This, itemId})),
        (get({Values, '$class'})):add(Values, get({This, number})),
        (get({Values, '$class'})):add(Values, get({This, inBaskets})),
        (get({Values, '$class'})):add(Values, get({This, weight})),
        (get({Values, '$class'})):add(Values, get({This, enabled})),
        (get({Values, '$class'})):add(Values, get({This, newOrUsed})),
        (get({Values, '$class'})):add(Values, get({This, summary})),
        (get({Values, '$class'})):add(Values, get({This, distributor})),
        (get({Values, '$class'})):add(Values, get({This, idUsedByDistributor})),
        (get({Values, '$class'})):add(Values, get({This, producedBy})),
        (get({Values, '$class'})):add(Values, get({This, productionDate})),
        (get({Values, '$class'})):add(Values, get({This, startProductionDate})),
        (get({Values, '$class'})):add(Values, get({This, description})),
        (get({Values, '$class'})):add(Values, get({This, keywords})),
        (get({Values, '$class'})):add(Values, get({This, category})),
        (get({Values, '$class'})):add(Values, get({This, type})),
        (get({Values, '$class'})):add(Values, (get({This, '$class'})):getSmallImage(This)),
        (get({Values, '$class'})):add(Values, (get({This, '$class'})):getMediumImage(This)),
        (get({Values, '$class'})):add(Values, (get({This, '$class'})):getLargeImage(This)),
        Calendar = 'Calendar':getInstance(),
        Time = (fun(Target_N77176) -> (get({Target_N77176, '$class'})):toString(Target_N77176) end)((get({Calendar, '$class'})):getTimeInMillis(Calendar)),
        (get({Values, '$class'})):add(Values, Time),
        (get({Values, '$class'})):add(Values, Time),
        (get({Values, '$class'})):add(Values, (get({get({This, price}), '$class'})):toString(get({This, price}))),
        (get({Values, '$class'})):add(Values, get({This, comment})),
        (get({Values, '$class'})):add(Values, get({This, customs})),
        (get({Values, '$class'})):add(Values, (get({This, '$class'})):getDownloads(This)),
        (get({Values, '$class'})):add(Values, get({This, groups})),
        (get({Values, '$class'})):add(Values, get({This, options})),
        (get({Values, '$class'})):add(Values, get({This, permissions})),
        (get({Values, '$class'})):add(Values, get({This, specials})),
        Values.

% throws Exception
getKey(This) ->
        (get({This, '$class'})):getId(This).

