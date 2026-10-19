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
% package org.allbinary.input.automation.module.configuration

-module('BlankModuleConfigurationJPanel').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('JPanel', Function, Arguments).

init_fields(This) ->
    put({This, jLabel1}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'JPanel':init(This),
    init_fields(This),
        (get({This, '$class'})):initComponents(This).

initComponents(This) ->
        put({This, jLabel1}, 'JLabel':new()),
        (get({get({This, jLabel1}), '$class'})):setText(get({This, jLabel1}), "No Configuration Available"),
        Layout = 'GroupLayout':new(This),
        (get({This, '$class'})):setLayout(This, Layout),
        (get({Layout, '$class'})):setHorizontalGroup(Layout, (fun(Target_N65863) -> (get({Target_N65863, '$class'})):addGroup(Target_N65863, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'TRAILING'}), (fun(Target_N65971) -> (get({Target_N65971, '$class'})):addGap(Target_N65971, 225, 225, 225) end)((fun(Target_N65978) -> (get({Target_N65978, '$class'})):addComponent(Target_N65978, get({This, jLabel1})) end)((fun(Target_N65985) -> (get({Target_N65985, '$class'})):addContainerGap(Target_N65985, 231, get({'Short', 'MAX_VALUE'})) end)((get({Layout, '$class'})):createSequentialGroup(Layout))))) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        (get({Layout, '$class'})):setVerticalGroup(Layout, (fun(Target_N66085) -> (get({Target_N66085, '$class'})):addGroup(Target_N66085, (fun(Target_N66153) -> (get({Target_N66153, '$class'})):addContainerGap(Target_N66153, 362, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N66160) -> (get({Target_N66160, '$class'})):addComponent(Target_N66160, get({This, jLabel1})) end)((fun(Target_N66167) -> (get({Target_N66167, '$class'})):addContainerGap(Target_N66167) end)((get({Layout, '$class'})):createSequentialGroup(Layout))))) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))).

