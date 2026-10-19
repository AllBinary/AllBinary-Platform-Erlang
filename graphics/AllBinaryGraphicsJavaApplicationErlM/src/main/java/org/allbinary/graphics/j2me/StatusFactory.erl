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
% package org.allbinary.graphics.j2me
% import org.allbinary.logic.communication.log.LogUtil

-module('StatusFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'StatusFactory':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, 'SETSTATUS'}, "setStatus"),
    put({This, 'STATUS_LABEL'}, "Status: "),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'StatusFactory', instance}).

setStatusNoLog(This, Status) when (is_list(Status) orelse Status =:= undefined) ->
        (get({get({'MyFrame', statusJLabel}), '$class'})):setText(get({'MyFrame', statusJLabel}), Status).

setStatus(This, Status) when (is_list(Status) orelse Status =:= undefined) ->
        (get({This, '$class'})):setStatusNoLog(This, Status),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([get({This, 'STATUS_LABEL'}), Status]), This, get({This, 'SETSTATUS'})).

