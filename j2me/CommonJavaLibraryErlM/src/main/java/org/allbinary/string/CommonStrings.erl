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
% package org.allbinary.string
% import jsinterop.annotations.JsType
% import jsinterop.annotations.JsMethod
% import jsinterop.annotations.JsProperty

-module('CommonStrings').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'CommonStrings':new()),
    ok.

init_fields(This) ->
    put({This, 'EMPTY'}, "Empty"),
    put({This, 'CREATE_IMAGE'}, "createImage"),
    put({This, 'PLEASE_WAIT'}, "Please Wait"),
    put({This, 'PLEASE_WAIT_FOR_SERVER'}, "Please Wait Getting Data From Server..."),
    put({This, 'PERIODS'}, "..."),
    put({This, 'LOADING'}, "Loading..."),
    put({This, 'CONSTRUCTOR'}, "Constructor"),
    put({This, 'START'}, "Start"),
    put({This, 'END'}, "End"),
    put({This, 'EXCEPTION'}, "Exception"),
    put({This, 'EXCEPTION_LABEL'}, "Exception: "),
    put({This, 'CLEANUP'}, "cleanup"),
    put({This, 'INIT'}, "init"),
    put({This, 'CLOSE'}, "close"),
    put({This, 'UP'}, "up"),
    put({This, 'DOWN'}, "down"),
    put({This, 'LEFT'}, "left"),
    put({This, 'RIGHT'}, "right"),
    put({This, 'DIRECTION_NAME'}, array:from_list([get({This, 'DOWN'}), get({This, 'LEFT'}), get({This, 'RIGHT'}), get({This, 'UP'})])),
    put({This, 'CREATE'}, "Create"),
    put({This, 'REMOVE'}, "Remove"),
    put({This, 'UPDATE'}, "Update"),
    put({This, 'DELETE'}, "Delete"),
    put({This, delete}, "delete"),
    put({This, 'LOAD'}, "load"),
    put({This, 'SAVE'}, "save"),
    put({This, 'ADD'}, "Add"),
    put({This, 'DROP'}, "Drop"),
    put({This, 'INSERT'}, "Insert"),
    put({This, 'VISIT'}, "visit"),
    put({This, 'START_METHOD_NAME'}, get({This, 'START'})),
    put({This, 'END_METHOD_NAME'}, "end"),
    put({This, 'GET'}, "get"),
    put({This, 'PROCESS'}, "process"),
    put({This, 'GET_INSTANCE'}, "getInstance"),
    put({This, 'GET_LIST'}, "getList"),
    put({This, 'RUN'}, "run"),
    put({This, 'START_RUNNABLE'}, "Start Runnable"),
    put({This, 'RUNNING'}, "Running"),
    put({This, 'END_RUNNABLE'}, "End Runnable"),
    put({This, 'DISABLE'}, "disable"),
    put({This, 'ENABLE'}, "enable"),
    put({This, 'SUCCESS'}, "Command Success"),
    put({This, 'FAILURE'}, "Command Failed"),
    put({This, 'NOT_IMPLEMENTED'}, "Not Implemented"),
    put({This, 'UNKNOWN'}, "Unknown"),
    put({This, 'ON_EVENT'}, "onEvent"),
    put({This, 'IS_VALID'}, "isValid"),
    put({This, 'TOSTRING'}, "toString"),
    put({This, 'ADD_LISTENER'}, "addListener"),
    put({This, 'REMOVE_LISTENER'}, "removeListener"),
    put({This, 'SIZE'}, "size"),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'CommonStrings', instance}).

