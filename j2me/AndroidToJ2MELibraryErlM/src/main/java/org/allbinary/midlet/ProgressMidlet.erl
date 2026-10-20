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
% package org.allbinary.midlet
% import org.allbinary.TsUtil
% import org.allbinary.canvas.Processor
% import org.allbinary.globals.Globals
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.logic.system.security.licensing.ClientInformationFactory
% import org.allbinary.thread.PrimaryThreadPool
% import org.allbinary.thread.ThreadPool

-module('ProgressMidlet').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('AllBinaryMidlet', Function, Arguments).

init_fields(This) ->
    put({This, abeClientInformation}, undefined),
    ok.


new(ClientInformationFactory) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, ClientInformationFactory),
    This.

'$init'(This, ClientInformationFactory) ->
    'AllBinaryMidlet':'$init'(This),
    init_fields(This),
        (fun(Target_N65868) -> (get({Target_N65868, '$class'})):init(Target_N65868, (fun(Target_N65893) -> (get({Target_N65893, '$class'})):getClassClassLoader(Target_N65893, This) end)('TsUtil':getInstance()), get({'StringUtil':getInstance(), 'EMPTY_STRING'})) end)('Globals':getInstance()),
        (get({This, '$class'})):preInit(This),
        put({This, abeClientInformation}, (get({ClientInformationFactory, '$class'})):getInstance(ClientInformationFactory)).

preInit(This) ->
        ok.

exitProgress(This, IsProgress) when is_boolean(IsProgress) ->
        Processor = (fun(Target_N66089) -> (get({Target_N66089, '$class'})):getExitInstance(Target_N66089, This) end)('MidletExitProcessorFactory':getInstance()),
        try
            PrimaryThreadPool = 'PrimaryThreadPool':getInstance(),
            Runnable = 'ExitRunnable':new(This, Processor, IsProgress),
            (get({PrimaryThreadPool, '$class'})):runTask(PrimaryThreadPool, Runnable)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "exit", E),
            try
                (get({Processor, '$class'})):process(Processor)
            catch _:E2 when E2 =/= '$break', E2 =/= '$continue', (not is_tuple(E2) orelse element(1, E2) =/= '$return') ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "exit", E)
            end
        end.

