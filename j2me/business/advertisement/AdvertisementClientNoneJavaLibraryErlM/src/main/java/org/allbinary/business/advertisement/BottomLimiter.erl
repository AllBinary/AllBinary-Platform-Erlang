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
% package org.allbinary.business.advertisement
% import org.allbinary.game.GameAdState
% import org.allbinary.graphics.displayable.DisplayInfoSingleton

-module('BottomLimiter').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'BottomLimiter':new()),
    ok.

init_fields(This) ->
    put({This, bottom}, 0),
    put({This, deltaY}, 0),
    put({This, lower}, 0),
    put({This, higher}, 0),
    ok.


getInstance() ->
        get({'BottomLimiter', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

init(This, Lower, Higher) when is_integer(Lower), is_integer(Higher) ->
        put({This, lower}, Lower),
        put({This, higher}, Higher).

update(This) ->
        DisplayInfo = 'DisplayInfoSingleton':getInstance(),
        GameAdState = (fun(Target_N66040) -> (get({Target_N66040, '$class'})):getCurrentInstance(Target_N66040) end)('GameAdStateFactory':getInstance()),
        case (get({GameAdState, '$class'})):isShowingAt(GameAdState) of
            true ->
            put({This, deltaY}, get({This, higher}));
            false ->
            put({This, deltaY}, get({This, lower}))
        end,
        put({This, bottom}, ((get({DisplayInfo, '$class'})):getLastHeight(DisplayInfo) - get({This, deltaY}))).

getDeltaY(This) ->
        get({This, deltaY}).

getBottom(This) ->
        get({This, bottom}).

