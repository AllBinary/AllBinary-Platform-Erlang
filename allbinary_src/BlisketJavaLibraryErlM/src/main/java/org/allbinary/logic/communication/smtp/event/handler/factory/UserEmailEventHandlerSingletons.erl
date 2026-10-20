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
% package org.allbinary.logic.communication.smtp.event.handler.factory
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.user.UserInterface
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.smtp.event.UserEmailEventNameData
% import org.allbinary.logic.communication.smtp.event.handler.EmailEventHandlerUtil
% import org.allbinary.logic.communication.smtp.event.handler.UserEmailEventHandler
% import org.allbinary.logic.communication.smtp.event.modules.log.LogUserEmailEventListenerModule
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.string.CommonStrings

-module('UserEmailEventHandlerSingletons').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'UserEmailEventHandlerSingletons':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, userEmailEventHandlerHashMap}, (fun(Target_N66235) -> (get({Target_N66235, '$class'})):createHashMap(Target_N66235) end)('StdUtil':getInstance())),
    ok.


getInstance() ->
        get({'UserEmailEventHandlerSingletons', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'EMAILLOGGING'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'}));
            false -> ok
        end.

% throws Exception
getInstance(This, AbeClientInformation, UserEmailEventNameData, UserInterface) ->
        try
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'EMAILLOGGING'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'GET_INSTANCE'}));
            false -> ok
        end,
        UserEmailEventHandler = (get({get({This, userEmailEventHandlerHashMap}), '$class'})):get(get({This, userEmailEventHandlerHashMap}), UserEmailEventNameData),
        case (UserEmailEventHandler =:= undefined) of
            true ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'EMAILLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Creating New Named UserEmailEventHandler", This, get({get({This, commonStrings}), 'GET_INSTANCE'}));
                false -> ok
            end,
            NewUserEmailEventHandler = 'UserEmailEventHandler':new(),
            Vector = 'EmailEventHandlerUtil':getUserEmailEventListenerVector(AbeClientInformation, UserEmailEventNameData, UserInterface),
            (get({NewUserEmailEventHandler, '$class'})):addListener(NewUserEmailEventHandler, Vector),
            (get({NewUserEmailEventHandler, '$class'})):addListener(NewUserEmailEventHandler, 'LogUserEmailEventListenerModule':new()),
            (get({get({This, userEmailEventHandlerHashMap}), '$class'})):put(get({This, userEmailEventHandlerHashMap}), UserEmailEventNameData, NewUserEmailEventHandler),
            throw({'$return', NewUserEmailEventHandler});
            false ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'EMAILLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Returning existing UserEmailEventHandler", This, get({get({This, commonStrings}), 'GET_INSTANCE'}));
                false -> ok
            end,
            throw({'$return', UserEmailEventHandler})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

