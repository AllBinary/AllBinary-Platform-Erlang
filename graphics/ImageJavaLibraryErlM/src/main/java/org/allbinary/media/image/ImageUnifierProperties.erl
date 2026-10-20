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
% package org.allbinary.media.image

-module('ImageUnifierProperties').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, rows}, undefined),
    put({This, columns}, undefined),
    put({This, imageUnifierCell}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

getWidth(This) ->
        ((fun(Target_N65703) -> (get({Target_N65703, '$class'})):intValue(Target_N65703) end)((get({This, '$class'})):getColumns(This)) * (fun(Target_N65722) -> (get({Target_N65722, '$class'})):intValue(Target_N65722) end)((fun(Target_N65729) -> (get({Target_N65729, '$class'})):getWidth(Target_N65729) end)((get({This, '$class'})):getImageUnifierCell(This)))).

getHeight(This) ->
        ((fun(Target_N65784) -> (get({Target_N65784, '$class'})):intValue(Target_N65784) end)((get({This, '$class'})):getRows(This)) * (fun(Target_N65803) -> (get({Target_N65803, '$class'})):intValue(Target_N65803) end)((fun(Target_N65810) -> (get({Target_N65810, '$class'})):getHeight(Target_N65810) end)((get({This, '$class'})):getImageUnifierCell(This)))).

getRows(This) ->
        get({This, rows}).

setRows(This, Rows) ->
        put({This, rows}, Rows).

getColumns(This) ->
        get({This, columns}).

setColumns(This, Columns) ->
        put({This, columns}, Columns).

getImageUnifierCell(This) ->
        get({This, imageUnifierCell}).

setImageUnifierCell(This, ImageUnifierCell) ->
        put({This, imageUnifierCell}, ImageUnifierCell).

