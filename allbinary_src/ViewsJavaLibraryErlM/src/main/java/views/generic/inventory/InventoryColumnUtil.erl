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
% package views.generic.inventory
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.user.commerce.inventory.item.BasicItemData
% import org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntity
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringValidationUtil

-module('InventoryColumnUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'InventoryColumnUtil':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, basicItemData}, 'BasicItemData':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'InventoryColumnUtil', instance}).

getColumnWhereLike(This, InventoryEntity, Category, Column) when (is_list(Category) orelse Category =:= undefined), (is_list(Column) orelse Column =:= undefined) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Start Category: ", Category]), This, "getKeywords"),
        Keywords = 'BasicArrayListD':new(),
        VectorOfHashMaps = (get({InventoryEntity, '$class'})):getAllRows(InventoryEntity),
        Size = (get({VectorOfHashMaps, '$class'})):size(VectorOfHashMaps),
        lists:foreach(fun(Index) ->
            HashMap = (get({VectorOfHashMaps, '$class'})):get(VectorOfHashMaps, Index),
            CategoryName = (get({HashMap, '$class'})):get(HashMap, get({get({This, basicItemData}), 'CATEGORY'})),
            case ((not (fun(Target_N66354) -> (get({Target_N66354, '$class'})):isEmpty(Target_N66354, CategoryName) end)('StringValidationUtil':getInstance())) andalso lists:prefix(Category, CategoryName)) of
                true ->
                (get({Keywords, '$class'})):add(Keywords, (get({HashMap, '$class'})):get(HashMap, Column));
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        Keywords.

