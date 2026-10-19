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
% package org.allbinary.game.ag.layer.weapon.mine
% import org.allbinary.game.layer.resources.BasicGameResources
% import org.allbinary.logic.NullUtil

-module('MineWeaponResources').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicGameResources', Function, Arguments).

static_init() ->
    put({?MODULE, instance}, get({'NullUtil':getInstance(), 'NULL_OBJECT'})),
    ok.

init_fields(This) ->
    put({This, 'DROP_TEXT_RESOURCE'}, "/mine_drop_text_20_by_20.png"),
    put({This, 'DROP_RESOURCE'}, "/mine_drop_20_by_20.png"),
    put({This, 'DROP_ICON_RESOURCE'}, "/mine_drop_icon_20_by_20.png"),
    ok.


getInstance() ->
        case (get({'MineWeaponResources', instance}) =:= get({'NullUtil':getInstance(), 'NULL_OBJECT'})) of
            true ->
            put({'MineWeaponResources', instance}, 'MineWeaponResources':new());
            false -> ok
        end,
        get({'MineWeaponResources', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'BasicGameResources':init(This),
    init_fields(This),
        ROOT = "/mine",
        SMALL = "_20_by_20.png",
        MEDIUM = SMALL,
        SIZE_FOUR = SMALL,
        SIZE_FIVE = SMALL,
        SIZE_SIX = SMALL,
        SIZE = array:from_list([SMALL, MEDIUM, SIZE_FOUR, SIZE_FIVE, SIZE_SIX]),
        'BasicGameResources':init(This, ROOT, SIZE).

