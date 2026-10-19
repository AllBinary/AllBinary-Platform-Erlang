% Generated Code Do Not Modify
% package org.allbinary.business.advertisement
% import org.allbinary.game.GameAdState
% import org.allbinary.logic.system.SoftwareInformation

-module('GameAdStateFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements GameAdStateFactoryInterface

static_init() ->
    put({?MODULE, instance}, 'GameAdStateFactory':new()),
    ok.

init_fields(This) ->
    put({This, gameAdStateArray}, array:from_list(['GameAdState':new('AppNameLicensingAdConfiguration':new())])),
    put({This, gameAdState}, array:get(0, get({This, gameAdStateArray}))),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'GameAdStateFactory', instance}).

getCurrentInstance(This) ->
        get({This, gameAdState}).

% throws Exception
getInstanceForApp(This, SoftwareInformation) ->
        put({This, gameAdState}, array:get(0, get({This, gameAdStateArray}))),
        array:get(0, get({This, gameAdStateArray})).

isEnabled(This) ->
        false.

