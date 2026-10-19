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
% package org.allbinary.input.automation.module.game.skill
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonSeps

-module('GameSkill').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, hashMap}, (fun(Target_N65767) -> (get({Target_N65767, '$class'})):createHashMap(Target_N65767) end)('StdUtil':getInstance())),
    ok.

init_fields(This) ->
    put({This, gameSkillType}, undefined),
    put({This, extra}, undefined),
    put({This, time}, 0),
    put({This, vector}, undefined),
    put({This, 'GAME_SKILL_LABEL'}, "GameSkill: "),
    put({This, 'EXTRA_LABEL'}, "Extra: "),
    put({This, 'TIME_LABEL'}, "Time: "),
    ok.


new(GameSkillType, Extra, Time) when (is_list(Extra) orelse Extra =:= undefined), is_integer(Time) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, GameSkillType, Extra, Time),
    This.

init(This, GameSkillType, Extra, Time) when (is_list(Extra) orelse Extra =:= undefined), is_integer(Time) ->
    init_fields(This),
        (get({This, '$class'})):setGameSkillType(This, GameSkillType),
        (get({This, '$class'})):setExtra(This, Extra),
        (get({This, '$class'})):setTime(This, Time),
        put({This, vector}, 'BasicArrayListD':new()),
        (get({get({'GameSkill', hashMap}), '$class'})):put(get({'GameSkill', hashMap}), (fun(Target_N66182) -> (get({Target_N66182, '$class'})):toString(Target_N66182) end)((fun(Target_N66189) -> (get({Target_N66189, '$class'})):append(Target_N66189, Extra) end)((fun(Target_N66196) -> (get({Target_N66196, '$class'})):append(Target_N66196, get({'CommonSeps':getInstance(), 'SPACE'})) end)((fun(Target_N66203) -> (get({Target_N66203, '$class'})):append(Target_N66203, (fun(Target_N66224) -> (get({Target_N66224, '$class'})):getName(Target_N66224) end)((get({This, '$class'})):getGameSkillType(This))) end)('StringMaker':new())))), This).

getGameSkillType(This) ->
        get({This, gameSkillType}).

setGameSkillType(This, GameSkillType) ->
        put({This, gameSkillType}, GameSkillType).

getExtra(This) ->
        get({This, extra}).

setExtra(This, Extra) when (is_list(Extra) orelse Extra =:= undefined) ->
        put({This, extra}, Extra).

getTime(This) ->
        get({This, time}).

setTime(This, Time) when is_integer(Time) ->
        put({This, time}, Time).

addProperty(This, GameSkillPropertyInterface) ->
        (get({get({This, vector}), '$class'})):add(get({This, vector}), GameSkillPropertyInterface).

getProperties(This) ->
        get({This, vector}).

getInstance(GameSkillType, Extra) when (is_list(Extra) orelse Extra =:= undefined) ->
        (get({get({'GameSkill', hashMap}), '$class'})):get(get({'GameSkill', hashMap}), (fun(Target_N66865) -> (get({Target_N66865, '$class'})):toString(Target_N66865) end)((fun(Target_N66872) -> (get({Target_N66872, '$class'})):append(Target_N66872, Extra) end)((fun(Target_N66879) -> (get({Target_N66879, '$class'})):append(Target_N66879, get({'CommonSeps':getInstance(), 'SPACE'})) end)((fun(Target_N66886) -> (get({Target_N66886, '$class'})):append(Target_N66886, (get({GameSkillType, '$class'})):getName(GameSkillType)) end)('StringMaker':new()))))).

toString(This) ->
        CommonSeps = 'CommonSeps':getInstance(),
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'GAME_SKILL_LABEL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N67199) -> (get({Target_N67199, '$class'})):toString(Target_N67199) end)((get({This, '$class'})):getGameSkillType(This))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'SPACE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'EXTRA_LABEL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getExtra(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'SPACE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'TIME_LABEL'})),
        (get({StringBuffer, '$class'})):appendlong(StringBuffer, (get({This, '$class'})):getTime(This)),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

