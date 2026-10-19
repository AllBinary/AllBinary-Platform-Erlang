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
% package org.allbinary.logic.communication.smtp.info
% import org.allbinary.business.context.configuration.ContextConfigurationInterface
% import org.allbinary.business.context.modules.storefront.StoreFrontInterface
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.smtp.configuration.server.EmailServerConfigurationInterface
% import org.allbinary.string.CommonStrings

-module('StoreEmailInfo').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicEmailInfo', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, storeFrontInterface}, undefined),
    ok.


new(StoreFrontInterface, Subject, TextBody) when (is_list(Subject) orelse Subject =:= undefined), (is_list(TextBody) orelse TextBody =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, StoreFrontInterface, Subject, TextBody),
    This.

init(This, StoreFrontInterface, Subject, TextBody) when (is_list(Subject) orelse Subject =:= undefined), (is_list(TextBody) orelse TextBody =:= undefined) ->
        'BasicEmailInfo':init(This, Subject, TextBody),
        init_fields(This),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'EMAILLOGGING'})) of
            true ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({CommonStrings, 'START'}), This, get({CommonStrings, 'CONSTRUCTOR'}));
            false -> ok
        end,
        put({This, storeFrontInterface}, StoreFrontInterface),
        (get({This, '$class'})):init(This).

% throws Exception
init(This) ->
        ContextConfigurationInterface = (get({get({This, storeFrontInterface}), '$class'})):getContextConfigurationInterface(get({This, storeFrontInterface})),
        EmailServerConfigurationInterface = (get({ContextConfigurationInterface, '$class'})):getEmailServerConfigurationInterface(ContextConfigurationInterface),
        (get({This, '$class'})):setEmailServerConfigurationInterface(This, EmailServerConfigurationInterface).

