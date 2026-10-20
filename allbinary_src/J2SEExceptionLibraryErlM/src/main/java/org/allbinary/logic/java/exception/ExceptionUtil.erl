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
% package org.allbinary.logic.java.exception
% import java.io.ByteArrayOutputStream
% import java.io.PrintStream

-module('ExceptionUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, {'ExceptionUtil'}),
    put({?MODULE, 'PRETEND_EXCEPTION'}, {'Exception', "Not Really An Exception"}),
    ok.

init_fields(This) ->
    put({This, 'NONE'}, "No Stack Trace"),
    ok.


getInstance() ->
        get({'ExceptionUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

getStackTrace(This, E) ->
        try
        case (E =/= undefined) of
            true ->
            ByteArrayOutputStream = 'ByteArrayOutputStream':new(),
            PrintStream = 'PrintStream':new(ByteArrayOutputStream),
            (get({E, '$class'})):printStackTrace(E, PrintStream),
            Output = (get({ByteArrayOutputStream, '$class'})):toString(ByteArrayOutputStream),
            case (Output =/= undefined) of
                true ->
                throw({'$return', allbinary_java:to_string(Output)});
                false -> ok
            end;
            false -> ok
        end,
        get({This, 'NONE'})
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

