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
% package org.allbinary.game.configuration.feature
% import java.util.Enumeration
% import javax.microedition.lcdui.ChoiceGroup
% import org.allbinary.TsUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonLabels
% import org.allbinary.util.ABHashtable
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.EnumerationUtil
% import org.allbinary.util.HashtableUtil

-module('GameFeatureUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'GameFeatureUtil':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, tsUtil}, 'TsUtil':getInstance()),
    put({This, enumerationUtil}, 'EnumerationUtil':getInstance()),
    put({This, 'ON_GAME_FEATURE_CHANGE'}, "onGameFeatureChange"),
    put({This, 'GAME_FEATURE_CHANGED'}, "Game Feature Changed: "),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'GameFeatureUtil', instance}).

% throws Exception
setDefault(This, ChoiceGroup) ->
        StringBuffer = 'StringMaker':new(),
        METHOD_NAME = "setDefault",
        SELECTED_ARRAY_RETURN = "selectedArray_return[",
        SELECTED_SEP = "] = ",
        SelectedArray_return = array:new((get({ChoiceGroup, '$class'})):size(ChoiceGroup), {default, false}),
        Total = (get({ChoiceGroup, '$class'})):getSelectedFlags(ChoiceGroup, SelectedArray_return),
        (get({StringBuffer, '$class'})):append(StringBuffer, "Multiple Total Choices: "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, Total),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, METHOD_NAME),
        Features = 'Features':getInstance(),
        lists:foreach(fun(Index) ->
            IsSelected = array:get(Index, SelectedArray_return),
            (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
            (get({StringBuffer, '$class'})):append(StringBuffer, SELECTED_ARRAY_RETURN),
            (get({StringBuffer, '$class'})):appendint(StringBuffer, Index),
            (get({StringBuffer, '$class'})):append(StringBuffer, SELECTED_SEP),
            (get({StringBuffer, '$class'})):appendboolean(StringBuffer, IsSelected),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, METHOD_NAME),
            SelectedChoiceLabel = (get({ChoiceGroup, '$class'})):getString(ChoiceGroup, Index),
            GameFeature = 'Feature':getInstance(SelectedChoiceLabel),
            case (get({Features, '$class'})):isDefault(Features, GameFeature) of
                true ->
                (get({Features, '$class'})):add(Features, GameFeature),
                (get({ChoiceGroup, '$class'})):setSelectedIndex(ChoiceGroup, Index, true);
                false ->
                (get({Features, '$class'})):remove(Features, GameFeature),
                (get({ChoiceGroup, '$class'})):setSelectedIndex(ChoiceGroup, Index, false)
            end
        end, lists:seq(0, array:size(SelectedArray_return) - 1)).

% throws Exception
updateMultiple(This, ChoiceGroup) ->
        StringBuffer = 'StringMaker':new(),
        METHOD_NAME = "updateMultiple",
        SELECTED_ARRAY_RETURN = "selectedArray_return[",
        SELECTED_SEP = "] = ",
        SelectedArray_return = array:new((get({ChoiceGroup, '$class'})):size(ChoiceGroup), {default, false}),
        Total = (get({ChoiceGroup, '$class'})):getSelectedFlags(ChoiceGroup, SelectedArray_return),
        (get({StringBuffer, '$class'})):append(StringBuffer, "Multiple Total Choices: "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, Total),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, METHOD_NAME),
        Features = 'Features':getInstance(),
        lists:foreach(fun(Index) ->
            IsSelected = array:get(Index, SelectedArray_return),
            (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
            (get({StringBuffer, '$class'})):append(StringBuffer, SELECTED_ARRAY_RETURN),
            (get({StringBuffer, '$class'})):appendint(StringBuffer, Index),
            (get({StringBuffer, '$class'})):append(StringBuffer, SELECTED_SEP),
            (get({StringBuffer, '$class'})):appendboolean(StringBuffer, IsSelected),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, METHOD_NAME),
            SelectedChoiceLabel = (get({ChoiceGroup, '$class'})):getString(ChoiceGroup, Index),
            GameFeature = 'Feature':getInstance(SelectedChoiceLabel),
            case ((not IsSelected) andalso (get({Features, '$class'})):isFeature(Features, GameFeature)) of
                true ->
                (get({Features, '$class'})):remove(Features, GameFeature);
                false ->
                case (IsSelected andalso (not (get({Features, '$class'})):isFeature(Features, GameFeature))) of
                true ->
                (get({Features, '$class'})):add(Features, GameFeature);
                false -> ok
            end
            end
        end, lists:seq(0, array:size(SelectedArray_return) - 1)).

% throws Exception
updateExclusiveForChoiceGroup(This, ChoiceGroup) ->
        StringBuffer = 'StringMaker':new(),
        METHOD_NAME = "updateExclusive",
        SELECTED_ARRAY_RETURN = "selectedArray_return[",
        SELECTED_SEP = "] = ",
        SelectedArray_return = array:new((get({ChoiceGroup, '$class'})):size(ChoiceGroup), {default, false}),
        Total = (get({ChoiceGroup, '$class'})):getSelectedFlags(ChoiceGroup, SelectedArray_return),
        (get({StringBuffer, '$class'})):append(StringBuffer, "Exclusive Total Choices: 1=="),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, Total),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, METHOD_NAME),
        lists:foreach(fun(Index) ->
            IsSelected = array:get(Index, SelectedArray_return),
            (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
            (get({StringBuffer, '$class'})):append(StringBuffer, SELECTED_ARRAY_RETURN),
            (get({StringBuffer, '$class'})):appendint(StringBuffer, Index),
            (get({StringBuffer, '$class'})):append(StringBuffer, SELECTED_SEP),
            (get({StringBuffer, '$class'})):appendboolean(StringBuffer, IsSelected),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, METHOD_NAME),
            case IsSelected of
                true ->
                SelectedChoiceLabel = (get({ChoiceGroup, '$class'})):getString(ChoiceGroup, Index),
                (get({This, '$class'})):updateExclusive(This, SelectedChoiceLabel);
                false -> ok
            end
        end, lists:seq(0, array:size(SelectedArray_return) - 1)).

isExclusive(This, ItemLabel) when (is_list(ItemLabel) orelse ItemLabel =:= undefined) ->
        try
        Enumeration = (fun(Target_N69273) -> (get({Target_N69273, '$class'})):keys(Target_N69273) end)((fun(Target_N69280) -> (get({Target_N69280, '$class'})):get(Target_N69280) end)('GameFeatureChoiceGroups':getExclusiveInstance())),
        put({local, name}, undefined),
        (fun Loop() -> case (get({get({This, enumerationUtil}), '$class'})):hasMoreElements(get({This, enumerationUtil}), Enumeration) of true ->
            put({local, name}, (get({get({This, enumerationUtil}), '$class'})):nextElement(get({This, enumerationUtil}), Enumeration)),
            case ((get({get({This, tsUtil}), '$class'})):compareTo(get({This, tsUtil}), ItemLabel, get({local, name})) =:= 0) of
                true ->
                throw({'$return', true});
                false -> ok
            end,
            Loop();
        false -> ok end end)(),
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
updateExclusive(This, SelectedChoiceLabel) when (is_list(SelectedChoiceLabel) orelse SelectedChoiceLabel =:= undefined) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N69591) -> (get({Target_N69591, '$class'})):toString(Target_N69591) end)((fun(Target_N69598) -> (get({Target_N69598, '$class'})):append(Target_N69598, SelectedChoiceLabel) end)((fun(Target_N69605) -> (get({Target_N69605, '$class'})):append(Target_N69605, get({'CommonLabels':getInstance(), 'ITEM_LABEL'})) end)('StringMaker':new()))), This, "updateExclusive"),
        GameFeature = 'Feature':getInstance(SelectedChoiceLabel),
        Hashtable = (fun(Target_N69754) -> (get({Target_N69754, '$class'})):get(Target_N69754) end)('GameFeatureChoiceGroups':getExclusiveInstance()),
        ObjectArray = (fun(Target_N69831) -> (get({Target_N69831, '$class'})):getKeysAsArray(Target_N69831, Hashtable) end)('HashtableUtil':getInstance()),
        put({local, basicArrayList}, undefined),
        put({local, anyType}, undefined),
        Size = array:size(ObjectArray),
        lists:foreach(fun(Index) ->
            put({local, anyType}, array:get(Index, ObjectArray)),
            put({local, basicArrayList}, (get({Hashtable, '$class'})):get(Hashtable, get({local, anyType}))),
            (get({This, '$class'})):updateExclusiveList(This, GameFeature, get({local, basicArrayList}))
        end, lists:seq(0, Size - 1)).

% throws Exception
updateExclusiveList(This, GameFeature, List) ->
        case (get({List, '$class'})):contains(List, GameFeature) of
            true ->
            Features = 'Features':getInstance(),
            AddIndex = (get({List, '$class'})):indexOf(List, GameFeature),
            Size = (get({List, '$class'})):size(List),
            lists:foreach(fun(Index) ->
                case (AddIndex =/= Index) of
                    true ->
                    (get({Features, '$class'})):remove(Features, array:get(Index, get({List, objectArray})));
                    false ->
                    (get({Features, '$class'})):add(Features, array:get(Index, get({List, objectArray})))
                end
            end, lists:seq(0, Size - 1));
            false -> ok
        end.

