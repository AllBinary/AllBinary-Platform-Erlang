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

-module('GameSkillType').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'MANA'}, 'GameSkillType':new("Mana")),
    put({?MODULE, 'REPLENISH'}, 'GameSkillType':new("Replenish")),
    put({?MODULE, 'TIMED'}, 'GameSkillType':new("Timed")),
    put({?MODULE, 'ATTACK'}, 'GameSkillType':new("Attack")),
    put({?MODULE, 'TRANSPORT'}, 'GameSkillType':new("Transport")),
    ok.

init_fields(This) ->
    put({This, 'SPELL_GAME_SKILL_TYPE'}, "SpellGameSkillType: "),
    put({This, name}, undefined),
    ok.


new(Name) when (is_list(Name) orelse Name =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Name),
    This.

init(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
    init_fields(This),
        (get({This, '$class'})):setName(This, Name).

getName(This) ->
        get({This, name}).

setName(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
        put({This, name}, Name).

toString(This) ->
        lists:concat([get({This, 'SPELL_GAME_SKILL_TYPE'}), (get({This, '$class'})):getName(This)]).

