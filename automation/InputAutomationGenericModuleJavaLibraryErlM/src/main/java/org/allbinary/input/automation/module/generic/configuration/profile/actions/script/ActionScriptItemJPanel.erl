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
% package org.allbinary.input.automation.module.generic.configuration.profile.actions.script

-module('ActionScriptItemJPanel').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('JPanel', Function, Arguments).

init_fields(This) ->
    put({This, childActionScriptConditionJPanel}, undefined),
    put({This, newActionScriptConditionJPanel}, undefined),
    put({This, newActionScriptInputJPanel}, undefined),
    put({This, removeJPanel}, undefined),
    put({This, scriptItemJPanel}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'JPanel':'$init'(This),
    init_fields(This),
        (get({This, '$class'})):initComponents(This).

getNewActionScriptInputJPanel(This) ->
        get({This, newActionScriptInputJPanel}).

setNewActionScriptInputJPanel(This, NewActionScriptInputJPanel) ->
        put({This, newActionScriptInputJPanel}, NewActionScriptInputJPanel).

getRemoveJPanel(This) ->
        get({This, removeJPanel}).

setRemoveJPanel(This, RemoveJPanel) ->
        put({This, removeJPanel}, RemoveJPanel).

getScriptItemJPanel(This) ->
        get({This, scriptItemJPanel}).

setScriptItemJPanel(This, ScriptItemJPanel) ->
        put({This, scriptItemJPanel}, ScriptItemJPanel).

getNewActionScriptConditionJPanel(This) ->
        get({This, newActionScriptConditionJPanel}).

setNewActionScriptConditionJPanel(This, NewActionScriptConditionJPanel) ->
        put({This, newActionScriptConditionJPanel}, NewActionScriptConditionJPanel).

getChildActionScriptConditionJPanel(This) ->
        get({This, childActionScriptConditionJPanel}).

setChildActionScriptConditionJPanel(This, ChildActionScriptConditionJPanel) ->
        put({This, childActionScriptConditionJPanel}, ChildActionScriptConditionJPanel).

initComponents(This) ->
        put({This, newActionScriptInputJPanel}, 'JPanel':new()),
        put({This, childActionScriptConditionJPanel}, 'JPanel':new()),
        put({This, newActionScriptConditionJPanel}, 'JPanel':new()),
        put({This, scriptItemJPanel}, 'JPanel':new()),
        put({This, removeJPanel}, 'JPanel':new()),
        (get({get({This, newActionScriptInputJPanel}), '$class'})):setLayout(get({This, newActionScriptInputJPanel}), 'GridLayout':new(1, 0)),
        ChildActionScriptConditionJPanelLayout = 'GroupLayout':new(get({This, childActionScriptConditionJPanel})),
        (get({get({This, childActionScriptConditionJPanel}), '$class'})):setLayout(get({This, childActionScriptConditionJPanel}), ChildActionScriptConditionJPanelLayout),
        (get({ChildActionScriptConditionJPanelLayout, '$class'})):setHorizontalGroup(ChildActionScriptConditionJPanelLayout, (fun(Target_N66884) -> (get({Target_N66884, '$class'})):addGap(Target_N66884, 0, 229, get({'Short', 'MAX_VALUE'})) end)((get({ChildActionScriptConditionJPanelLayout, '$class'})):createParallelGroup(ChildActionScriptConditionJPanelLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        (get({ChildActionScriptConditionJPanelLayout, '$class'})):setVerticalGroup(ChildActionScriptConditionJPanelLayout, (fun(Target_N67001) -> (get({Target_N67001, '$class'})):addGap(Target_N67001, 0, 8, get({'Short', 'MAX_VALUE'})) end)((get({ChildActionScriptConditionJPanelLayout, '$class'})):createParallelGroup(ChildActionScriptConditionJPanelLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        (get({get({This, newActionScriptConditionJPanel}), '$class'})):setLayout(get({This, newActionScriptConditionJPanel}), 'GridLayout':new(1, 0)),
        (get({get({This, scriptItemJPanel}), '$class'})):setLayout(get({This, scriptItemJPanel}), 'GridLayout':new(1, 1)),
        (get({get({This, removeJPanel}), '$class'})):setLayout(get({This, removeJPanel}), 'GridLayout':new(1, 1)),
        (get({get({This, removeJPanel}), '$class'})):setMinimumSize(get({This, removeJPanel}), 'Dimension':new(30, 20)),
        Layout = 'GroupLayout':new(This),
        (get({This, '$class'})):setLayout(This, Layout),
        (get({Layout, '$class'})):setHorizontalGroup(Layout, (fun(Target_N67481) -> (get({Target_N67481, '$class'})):addComponent(Target_N67481, get({This, childActionScriptConditionJPanel}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({'Short', 'MAX_VALUE'})) end)((fun(Target_N67488) -> (get({Target_N67488, '$class'})):addComponent(Target_N67488, get({This, newActionScriptConditionJPanel}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), 229, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N67495) -> (get({Target_N67495, '$class'})):addComponent(Target_N67495, get({This, newActionScriptInputJPanel}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), 229, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N67502) -> (get({Target_N67502, '$class'})):addGroup(Target_N67502, (fun(Target_N67570) -> (get({Target_N67570, '$class'})):addComponent(Target_N67570, get({This, removeJPanel}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), 56, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N67577) -> (get({Target_N67577, '$class'})):addPreferredGap(Target_N67577, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N67584) -> (get({Target_N67584, '$class'})):addComponent(Target_N67584, get({This, scriptItemJPanel}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), 167, get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((get({Layout, '$class'})):createSequentialGroup(Layout))))) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}))))))),
        (get({Layout, '$class'})):setVerticalGroup(Layout, (fun(Target_N68040) -> (get({Target_N68040, '$class'})):addGroup(Target_N68040, (fun(Target_N68108) -> (get({Target_N68108, '$class'})):addComponent(Target_N68108, get({This, newActionScriptInputJPanel}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), 30, get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N68115) -> (get({Target_N68115, '$class'})):addPreferredGap(Target_N68115, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N68122) -> (get({Target_N68122, '$class'})):addComponent(Target_N68122, get({This, newActionScriptConditionJPanel}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), 28, get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N68129) -> (get({Target_N68129, '$class'})):addPreferredGap(Target_N68129, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N68136) -> (get({Target_N68136, '$class'})):addComponent(Target_N68136, get({This, childActionScriptConditionJPanel}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N68143) -> (get({Target_N68143, '$class'})):addPreferredGap(Target_N68143, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N68150) -> (get({Target_N68150, '$class'})):addGroup(Target_N68150, (fun(Target_N68175) -> (get({Target_N68175, '$class'})):addComponent(Target_N68175, get({This, removeJPanel}), get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'TRAILING'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), 31, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N68182) -> (get({Target_N68182, '$class'})):addComponent(Target_N68182, get({This, scriptItemJPanel}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), 31, get({'Short', 'MAX_VALUE'})) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}))))) end)((get({Layout, '$class'})):createSequentialGroup(Layout))))))))) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))).

