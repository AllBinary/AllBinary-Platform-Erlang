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
% package org.allbinary.gui.swing.workers
% import javax.swing

-module('JListSwingWorker').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('SwingWorker', Function, Arguments).

init_fields(This) ->
    put({This, jList}, undefined),
    put({This, listModel}, undefined),
    ok.


new(JList, ListModel) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, JList, ListModel),
    This.

init(This, JList, ListModel) ->
    'SwingWorker':init(This),
    init_fields(This),
        (get({This, '$class'})):setJList(This, JList),
        (get({This, '$class'})):setListModel(This, ListModel).

doInBackground(This) ->
        undefined.

done(This) ->
        (fun(Target_N65833) -> (get({Target_N65833, '$class'})):setModel(Target_N65833, (get({This, '$class'})):getListModel(This)) end)((get({This, '$class'})):getJList(This)).

getJList(This) ->
        get({This, jList}).

setJList(This, JList) ->
        put({This, jList}, JList).

getListModel(This) ->
        get({This, listModel}).

setListModel(This, ListModel) ->
        put({This, listModel}, ListModel).

