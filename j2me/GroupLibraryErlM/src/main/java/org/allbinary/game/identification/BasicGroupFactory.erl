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
% package org.allbinary.game.identification
% import org.allbinary.logic.NullUtil

-module('BasicGroupFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, get({'NullUtil':getInstance(), 'NULL_OBJECT'})),
    ok.

init_fields(This) ->
    put({This, 'NAME'}, "GROUP_NAME"),
    put({This, 'NO_SUCH_GROUP'}, "No Such Group: "),
    put({This, 'GOOD'}, 'Group':new("Good Guys", 0)),
    put({This, 'ENEMY'}, 'Group':new("Bad Guys", 1)),
    put({This, 'ENEMY_ON_LEVEL'}, 'Group':new("Bad Guys on Level", 2)),
    put({This, 'NONE'}, 'Group':new("Not On A Team", 3)),
    put({This, 'GOOD_ARRAY'}, array:from_list([get({This, 'GOOD'})])),
    put({This, 'ENEMY_ARRAY'}, array:from_list([get({This, 'ENEMY'})])),
    put({This, 'ENEMY_ON_LEVEL_ARRAY'}, array:from_list([get({This, 'ENEMY'}), get({This, 'ENEMY_ON_LEVEL'})])),
    put({This, 'NONE_ARRAY'}, array:from_list([get({This, 'NONE'})])),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        case (get({'BasicGroupFactory', instance}) =:= get({'NullUtil':getInstance(), 'NULL_OBJECT'})) of
            true ->
            put({'BasicGroupFactory', instance}, 'BasicGroupFactory':new());
            false -> ok
        end,
        get({'BasicGroupFactory', instance}).

