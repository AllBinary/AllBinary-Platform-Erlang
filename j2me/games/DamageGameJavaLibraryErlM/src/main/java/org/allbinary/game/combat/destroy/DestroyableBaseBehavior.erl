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
% package org.allbinary.game.combat.destroy
% import org.allbinary.string.CommonStrings

-module('DestroyableBaseBehavior').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements DestroyableInterface

static_init() ->
    put({?MODULE, instance}, 'DestroyableBaseBehavior':new()),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'DestroyableBaseBehavior', instance}).

getName(This) ->
        atom_to_list(get({This, '$class'})).

% throws Exception
isDestroyed(This) ->
        erlang:error({'Exception', get({'CommonStrings':getInstance(), 'NOT_IMPLEMENTED'})}).

setDestroyed(This, Destroyed) when is_boolean(Destroyed) ->
        ok.

