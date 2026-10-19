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
% package org.allbinary.log
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.logic.StdUtil

-module('LOGGING').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, logging}, 'BasicArrayListD':new()),
    put({?MODULE, 'GRAPHICSPAINT'}, 'LOGGING':new("Graphics Paint")),
    put({?MODULE, 'GRAPHICSCREATION'}, 'LOGGING':new("Graphics Creation")),
    put({?MODULE, 'GRAPHICSDELETION'}, 'LOGGING':new("Graphics Deletion")),
    put({?MODULE, 'LOADINGERROR'}, 'LOGGING':new("Loading Error")),
    put({?MODULE, 'MENUEVENT'}, 'LOGGING':new("Menu Action Event")),
    put({?MODULE, 'MOUSEEVENT'}, 'LOGGING':new("Mouse Action Event")),
    put({?MODULE, 'KEYEVENT'}, 'LOGGING':new("Keyboard Action Event")),
    put({?MODULE, 'ACTIONEVENT'}, 'LOGGING':new("Action Event")),
    put({?MODULE, 'ADJUSTMENTEVENT'}, 'LOGGING':new("Adjustment Action Event")),
    put({?MODULE, 'COMPONENTEVENT'}, 'LOGGING':new("Component Action Event")),
    put({?MODULE, 'CONTAINEREVENT'}, 'LOGGING':new("Container Action Event")),
    put({?MODULE, 'FOCUSEVENT'}, 'LOGGING':new("Focus Action Event")),
    put({?MODULE, 'HIERARCHYEVENT'}, 'LOGGING':new("Hierarchy Action Event")),
    put({?MODULE, 'INPUTEVENT'}, 'LOGGING':new("Input Action Event")),
    put({?MODULE, 'INVOCATIONEVENT'}, 'LOGGING':new("Invocation Action Event")),
    put({?MODULE, 'ITEMEVENT'}, 'LOGGING':new("Item Action Event")),
    put({?MODULE, 'PAINTEVENT'}, 'LOGGING':new("Paint Action Event")),
    put({?MODULE, 'TEXTEVENT'}, 'LOGGING':new("Text Action Event")),
    put({?MODULE, 'WINDOWEVENT'}, 'LOGGING':new("Window Action Event")),
    ok.

init_fields(This) ->
    put({This, name}, undefined),
    ok.


new(Value) when (is_list(Value) orelse Value =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Value),
    This.

init(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    init_fields(This),
        put({This, name}, Value),
        (get({get({get({'LOGGING', 'LOGGING'}), logging}), '$class'})):add(get({get({'LOGGING', 'LOGGING'}), logging}), Value).

contains(LogType) ->
        (get({get({get({'LOGGING', 'LOGGING'}), logging}), '$class'})):contains(get({get({'LOGGING', 'LOGGING'}), logging}), (get({LogType, '$class'})):toString(LogType)).

toString(This) ->
        get({This, name}).

