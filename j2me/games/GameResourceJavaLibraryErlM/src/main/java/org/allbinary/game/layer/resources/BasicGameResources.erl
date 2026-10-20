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
% package org.allbinary.game.layer.resources
% import org.allbinary.game.configuration.GameConfigurationCentral
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.string.CommonStrings

-module('BasicGameResources').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, stringBuffer}, 'StringMaker':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, 'RESOURCE'}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
    put({This, 'RESOURCE_DESTROY'}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

init(This, ROOT, SIZE) when (is_list(ROOT) orelse ROOT =:= undefined), (is_tuple(SIZE) orelse SIZE =:= undefined) ->
        try
            Scale = (fun(Target_N65991) -> (get({Target_N65991, '$class'})):intValue(Target_N65991) end)((fun(Target_N65998) -> (get({Target_N65998, '$class'})):getValue(Target_N65998) end)(get({'GameConfigurationCentral':getInstance(), 'SCALE'}))),
            case ((Scale > 1) andalso ((Scale - 1) < array:size(SIZE))) of
                true ->
                (get({This, '$class'})):append(This, ROOT, array:get((Scale - 1), SIZE));
                false ->
                erlang:error({'Exception', (fun(Target_N66127) -> (get({Target_N66127, '$class'})):toString(Target_N66127) end)((fun(Target_N66134) -> (get({Target_N66134, '$class'})):appendint(Target_N66134, Scale) end)((fun(Target_N66141) -> (get({Target_N66141, '$class'})):append(Target_N66141, "Invalid Value: ") end)('StringMaker':new())))})
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, get({CommonStrings, 'INIT'}), E)
        end.

% throws Exception
append(This, ROOT, SizeString) when (is_list(ROOT) orelse ROOT =:= undefined), (is_list(SizeString) orelse SizeString =:= undefined) ->
        DESTROY = "_destroy",
        String = (get({This, '$class'})):getString(This),
        (get({get({'BasicGameResources', stringBuffer}), '$class'})):delete(get({'BasicGameResources', stringBuffer}), 0, (get({get({'BasicGameResources', stringBuffer}), '$class'})):length(get({'BasicGameResources', stringBuffer}))),
        (get({get({'BasicGameResources', stringBuffer}), '$class'})):append(get({'BasicGameResources', stringBuffer}), ROOT),
        (get({get({'BasicGameResources', stringBuffer}), '$class'})):append(get({'BasicGameResources', stringBuffer}), String),
        (get({get({'BasicGameResources', stringBuffer}), '$class'})):append(get({'BasicGameResources', stringBuffer}), SizeString),
        put({This, 'RESOURCE'}, (get({get({'BasicGameResources', stringBuffer}), '$class'})):toString(get({'BasicGameResources', stringBuffer}))),
        (get({get({'BasicGameResources', stringBuffer}), '$class'})):delete(get({'BasicGameResources', stringBuffer}), 0, (get({get({'BasicGameResources', stringBuffer}), '$class'})):length(get({'BasicGameResources', stringBuffer}))),
        (get({get({'BasicGameResources', stringBuffer}), '$class'})):append(get({'BasicGameResources', stringBuffer}), ROOT),
        (get({get({'BasicGameResources', stringBuffer}), '$class'})):append(get({'BasicGameResources', stringBuffer}), DESTROY),
        (get({get({'BasicGameResources', stringBuffer}), '$class'})):append(get({'BasicGameResources', stringBuffer}), String),
        (get({get({'BasicGameResources', stringBuffer}), '$class'})):append(get({'BasicGameResources', stringBuffer}), SizeString),
        put({This, 'RESOURCE_DESTROY'}, (get({get({'BasicGameResources', stringBuffer}), '$class'})):toString(get({'BasicGameResources', stringBuffer}))).

% throws Exception
getString(This) ->
        (fun(Target_N67107) -> (get({Target_N67107, '$class'})):getName(Target_N67107) end)('GameGraphicsResourceUtil':getInstance()).

