% 
% AllBinary Open License Version 1 
% Copyright (c) 2006 AllBinary 
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
% package org.allbinary.game.layer.waypoint
% import org.allbinary.game.layer.resources.BasicGameResources
% import org.allbinary.game.layer.resources.GameGraphicsResourceUtil
% import org.allbinary.logic.string.StringUtil

-module('FlagGameResources').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicGameResources', Function, Arguments).

static_init() ->
    put({?MODULE, 'ICON'}, "_icon"),
    put({?MODULE, 'BUILD'}, "_build"),
    put({?MODULE, 'DESTROY'}, "_destroy"),
    put({?MODULE, 'ICON_BUILD'}, lists:concat(["_icon", get({'FlagGameResources', 'BUILD'})])),
    ok.

init_fields(This) ->
    put({This, 'NAME'}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
    put({This, 'RESOURCE_ICON_ANIMATION'}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
    put({This, 'RESOURCE_ICON_BUILD'}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
    put({This, 'RESOURCE_ICON'}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
    put({This, 'ICON_SIZE'}, "_64_by_64.png"),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'BasicGameResources':init(This),
    init_fields(This),
        ok.

% throws Exception
append(This, ROOT, SizeString) when (is_list(ROOT) orelse ROOT =:= undefined), (is_list(SizeString) orelse SizeString =:= undefined) ->
        'BasicGameResources':append(This, ROOT, SizeString),
        String = (fun(Target_N66221) -> (get({Target_N66221, '$class'})):getName(Target_N66221) end)('GameGraphicsResourceUtil':getInstance()),
        (get({get({'BasicGameResources', stringBuffer}), '$class'})):delete(get({'BasicGameResources', stringBuffer}), 0, (get({get({'BasicGameResources', stringBuffer}), '$class'})):length(get({'BasicGameResources', stringBuffer}))),
        (get({get({'BasicGameResources', stringBuffer}), '$class'})):append(get({'BasicGameResources', stringBuffer}), ROOT),
        (get({get({'BasicGameResources', stringBuffer}), '$class'})):append(get({'BasicGameResources', stringBuffer}), get({'FlagGameResources', 'DESTROY'})),
        (get({get({'BasicGameResources', stringBuffer}), '$class'})):append(get({'BasicGameResources', stringBuffer}), String),
        (get({get({'BasicGameResources', stringBuffer}), '$class'})):append(get({'BasicGameResources', stringBuffer}), SizeString),
        put({This, 'RESOURCE_DESTROY'}, (get({get({'BasicGameResources', stringBuffer}), '$class'})):toString(get({'BasicGameResources', stringBuffer}))),
        (get({get({'BasicGameResources', stringBuffer}), '$class'})):delete(get({'BasicGameResources', stringBuffer}), 0, (get({get({'BasicGameResources', stringBuffer}), '$class'})):length(get({'BasicGameResources', stringBuffer}))),
        (get({get({'BasicGameResources', stringBuffer}), '$class'})):append(get({'BasicGameResources', stringBuffer}), get({'FlagGameResources', 'ICON'})),
        (get({get({'BasicGameResources', stringBuffer}), '$class'})):append(get({'BasicGameResources', stringBuffer}), ROOT),
        put({This, 'RESOURCE_ICON_ANIMATION'}, (get({get({'BasicGameResources', stringBuffer}), '$class'})):toString(get({'BasicGameResources', stringBuffer}))),
        (get({get({'BasicGameResources', stringBuffer}), '$class'})):delete(get({'BasicGameResources', stringBuffer}), 0, (get({get({'BasicGameResources', stringBuffer}), '$class'})):length(get({'BasicGameResources', stringBuffer}))),
        (get({get({'BasicGameResources', stringBuffer}), '$class'})):append(get({'BasicGameResources', stringBuffer}), ROOT),
        (get({get({'BasicGameResources', stringBuffer}), '$class'})):append(get({'BasicGameResources', stringBuffer}), get({'FlagGameResources', 'ICON'})),
        (get({get({'BasicGameResources', stringBuffer}), '$class'})):append(get({'BasicGameResources', stringBuffer}), String),
        (get({get({'BasicGameResources', stringBuffer}), '$class'})):append(get({'BasicGameResources', stringBuffer}), get({This, 'ICON_SIZE'})),
        put({This, 'RESOURCE_ICON'}, (get({get({'BasicGameResources', stringBuffer}), '$class'})):toString(get({'BasicGameResources', stringBuffer}))),
        (get({get({'BasicGameResources', stringBuffer}), '$class'})):delete(get({'BasicGameResources', stringBuffer}), 0, (get({get({'BasicGameResources', stringBuffer}), '$class'})):length(get({'BasicGameResources', stringBuffer}))),
        (get({get({'BasicGameResources', stringBuffer}), '$class'})):append(get({'BasicGameResources', stringBuffer}), ROOT),
        (get({get({'BasicGameResources', stringBuffer}), '$class'})):append(get({'BasicGameResources', stringBuffer}), get({'FlagGameResources', 'ICON_BUILD'})),
        (get({get({'BasicGameResources', stringBuffer}), '$class'})):append(get({'BasicGameResources', stringBuffer}), String),
        (get({get({'BasicGameResources', stringBuffer}), '$class'})):append(get({'BasicGameResources', stringBuffer}), get({This, 'ICON_SIZE'})),
        put({This, 'RESOURCE_ICON_BUILD'}, (get({get({'BasicGameResources', stringBuffer}), '$class'})):toString(get({'BasicGameResources', stringBuffer}))).

