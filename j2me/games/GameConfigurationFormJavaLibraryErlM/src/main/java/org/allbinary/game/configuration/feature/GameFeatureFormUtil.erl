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
% import javax.microedition.lcdui.ChoiceGroup
% import javax.microedition.lcdui.Item
% import javax.microedition.lcdui.NullImage
% import org.allbinary.game.configuration.GameConfigurationGauge
% import org.allbinary.game.configuration.GameConfigurationUtil
% import org.allbinary.graphics.displayable.screen.CommandForm
% import org.allbinary.logic.MEUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.util.ABHashtable
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.HashtableUtil

-module('GameFeatureFormUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'GameFeatureFormUtil':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, meUtil}, 'MEUtil':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'GameFeatureFormUtil', instance}).

getChoiceGroup(This, Hashtable, Name, Option) when (is_list(Name) orelse Name =:= undefined), is_integer(Option) ->
        StringMaker = 'StringMaker':new(),
        ChoiceGroup = 'ChoiceGroup':new(Name, Option, (fun(Target_N66258) -> (get({Target_N66258, '$class'})):getArrayInstance(Target_N66258) end)('StringUtil':getInstance()), get({'NullImage', 'NULL_IMAGE_ARRAY'})),
        List = (get({Hashtable, '$class'})):get(Hashtable, Name),
        Features = 'Features':getInstance(),
        ADD_CHOICE = ": Adding Choice: ",
        GET_CHOICE_GROUP = "getChoiceGroup",
        Size = (get({List, '$class'})):size(List),
        lists:foreach(fun(Index) ->
            GameFeature = array:get(Index, get({List, objectArray})),
            (get({StringMaker, '$class'})):delete(StringMaker, 0, (get({StringMaker, '$class'})):length(StringMaker)),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N66721) -> (get({Target_N66721, '$class'})):toString(Target_N66721) end)((fun(Target_N66728) -> (get({Target_N66728, '$class'})):append(Target_N66728, (get({GameFeature, '$class'})):toString(GameFeature)) end)((fun(Target_N66735) -> (get({Target_N66735, '$class'})):append(Target_N66735, ADD_CHOICE) end)((get({StringMaker, '$class'})):append(StringMaker, Name)))), This, GET_CHOICE_GROUP),
            (get({ChoiceGroup, '$class'})):append(ChoiceGroup, (get({GameFeature, '$class'})):toString(GameFeature), get({'NullImage', 'NULL_IMAGE'})),
            case (get({Features, '$class'})):isFeature(Features, GameFeature) of
                true ->
                (get({ChoiceGroup, '$class'})):setSelectedIndex(ChoiceGroup, Index, true);
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        ChoiceGroup.

addChoiceGroup(This, Form, Hashtable, Option) when is_integer(Option) ->
        StringMaker = 'StringMaker':new(),
        ADDING_CHOICE_GROUP = "Adding Choice Group: ",
        ADD_CHOICE_GROUP = "addChoiceGroup",
        Size = (get({Hashtable, '$class'})):size(Hashtable),
        ObjectArray = (fun(Target_N67307) -> (get({Target_N67307, '$class'})):getKeysAsArray(Target_N67307, Hashtable) end)('HashtableUtil':getInstance()),
        put({local, name}, undefined),
        lists:foreach(fun(Index) ->
            put({local, name}, array:get(Index, ObjectArray)),
            (get({StringMaker, '$class'})):delete(StringMaker, 0, (get({StringMaker, '$class'})):length(StringMaker)),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N67513) -> (get({Target_N67513, '$class'})):toString(Target_N67513) end)((fun(Target_N67520) -> (get({Target_N67520, '$class'})):append(Target_N67520, get({local, name})) end)((get({StringMaker, '$class'})):append(StringMaker, ADDING_CHOICE_GROUP))), This, ADD_CHOICE_GROUP),
            (get({get({This, meUtil}), '$class'})):appendItem(get({This, meUtil}), Form, (get({This, '$class'})):getChoiceGroup(This, Hashtable, get({local, name}), Option))
        end, lists:seq(0, Size - 1)).

% throws Exception
setDefault(This, Form) ->
        Size = (get({Form, '$class'})):size(Form),
        lists:foreach(fun(Index) ->
            Item = (get({Form, '$class'})):get(Form, Index),
            case allbinary_java:instance_of(Item, 'GameConfigurationGauge') of
                true ->
                (fun(Target_N68055) -> (get({Target_N68055, '$class'})):setDefault(Target_N68055, Item) end)('GameConfigurationUtil':getInstance());
                false ->
                case allbinary_java:instance_of(Item, 'ChoiceGroup') of
                true ->
                (fun(Target_N67996) -> (get({Target_N67996, '$class'})):setDefault(Target_N67996, Item) end)('GameFeatureUtil':getInstance());
                false -> ok
            end
            end
        end, lists:seq(0, Size - 1)).

