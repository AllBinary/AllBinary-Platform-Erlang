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
% package org.allbinary.logic.system.security.licensing
% import java.io.IOException
% import java.util.Calendar
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.system.security.licensing.client.AbeLicenseClient
% import org.allbinary.string.CommonStrings

-module('AbeLicenseInterfaceFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'SINGLETON'}, 'AbeLicenseInterfaceFactory':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, time}, 0),
    put({This, check}, false),
    put({This, checkPeriod}, 36000000),
    put({This, abeLicenseInterface}, undefined),
    ok.


getInstance() ->
        get({'AbeLicenseInterfaceFactory', 'SINGLETON'}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

% throws LicensingException
getLicenseInstance(This, AbeClientInformation) ->
        try
        case (get({This, '$class'})):isTimeToGetKey(This) of
            true ->
            throw({'$return', (get({This, '$class'})):get(This, AbeClientInformation)});
            false ->
            throw({'$return', get({This, abeLicenseInterface})})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws LicensingException
get(This, AbeClientInformation) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Getting Keys", This, get({get({This, commonStrings}), 'GET'})),
            put({This, abeLicenseInterface}, 'AbeNoLicense':getInstance()),
            LicenseClient = 'AbeLicenseClient':new(),
            put({This, abeLicenseInterface}, (get({LicenseClient, '$class'})):get(LicenseClient, AbeClientInformation)),
            case (get({This, abeLicenseInterface}) =/= undefined) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Default Key: ", (get({get({This, abeLicenseInterface}), '$class'})):getKey(get({This, abeLicenseInterface}), get({'AbeClientInformationData':getInstance(), 'KEY'}))]), This, get({get({This, commonStrings}), 'GET'}));
                false -> ok
            end,
            get({This, abeLicenseInterface})
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Licensing IO Error", This, get({get({This, commonStrings}), 'GET'}), E),
            erlang:error({'LicensingException', "License Server Connection Error"})
        end.

isTimeToGetKey(This) ->
        try
        Calendar = 'Calendar':getInstance(),
        CurrentTime = (get({Calendar, '$class'})):getTimeInMillis(Calendar),
        case (((((get({This, abeLicenseInterface}) =:= undefined) orelse (get({This, abeLicenseInterface}) =:= 'AbeNoLicense':getInstance())) orelse (not (get({get({This, abeLicenseInterface}), '$class'})):hasKey(get({This, abeLicenseInterface})))) orelse (get({This, '$class'})):isCheck(This)) orelse ((CurrentTime - get({This, checkPeriod})) > get({This, time}))) of
            true ->
            put({This, abeLicenseInterface}, undefined),
            put({This, time}, CurrentTime),
            throw({'$return', true});
            false ->
            false
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

setCheck(This, Check) when is_boolean(Check) ->
        put({This, check}, Check).

isCheck(This) ->
        get({This, check}).

