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
% package org.allbinary.logic.communication.smtp.queue
% import javax.mail.Transport
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.smtp.EmailInterface
% import org.allbinary.logic.util.queue.BasicQueue

-module('BasicEmailQueue').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements EmailQueueInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicQueue', Function, Arguments).

static_init() ->
    put({?MODULE, instance}, 'BasicEmailQueue':new()),
    put({?MODULE, basicEmailQueue}, undefined),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'BasicQueue':'$init'(This),
    init_fields(This),
        ok.

getInstance() ->
        case (get({'BasicEmailQueue', basicEmailQueue}) =:= undefined) of
            true ->
            put({'BasicEmailQueue', basicEmailQueue}, 'BasicEmailQueue':new());
            false -> ok
        end,
        get({'BasicEmailQueue', basicEmailQueue}).

% throws Exception
offer(This, EmailInterface) ->
        (get({This, '$class'})):offer(This, EmailInterface),
        (get({This, '$class'})):post(This, EmailInterface),
        true.

remove(This, EmailInterface) ->
        (get({This, '$class'})):remove(This, EmailInterface).

remove(This) ->
        undefined.

% throws Exception
post(This, EmailInterface) ->
        case (get({This, '$class'})):send(This, EmailInterface) of
            true ->
            (get({This, '$class'})):remove(This, EmailInterface),
            (get({This, '$class'})):processAllUnsent(This);
            false -> ok
        end.

% throws Exception
processAllUnsent(This) ->
        Size = (get({get({This, queueVector}), '$class'})):size(get({This, queueVector})),
        lists:foreach(fun(Index) ->
            EmailInterface = (get({get({This, queueVector}), '$class'})):get(get({This, queueVector}), Index),
            case (get({This, '$class'})):send(This, EmailInterface) of
                true ->
                (get({This, '$class'})):remove(This, EmailInterface),
                (get({This, '$class'})):processAllUnsent(This);
                false -> ok
            end
        end, lists:seq(0, Size - 1)).

send(This, EmailInterface) ->
        try
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'EMAILLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Sending: ", (get({EmailInterface, '$class'})):log(EmailInterface)]), This, "send");
                false -> ok
            end,
            'Transport':send((get({EmailInterface, '$class'})):getMimeMessage(EmailInterface)),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'EMAILLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Email Send Debug: ", (get({EmailInterface, '$class'})):getDebugInfo(EmailInterface)]), This, "send");
                false -> ok
            end,
            true
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'EMAILLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), lists:concat(["Failed Email Send Debug: ", (get({EmailInterface, '$class'})):getDebugInfo(EmailInterface)]), This, "send", E);
                false -> ok
            end,
            false
        end.

