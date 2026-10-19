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
% package org.allbinary.logic.system.hardware
% import org.allbinary.TsUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.system.hardware.android.AndroidHardware
% import org.allbinary.logic.system.os.GenericOperatingSystem
% import org.allbinary.logic.system.os.OperatingSystems
% import org.allbinary.string.CommonStrings

-module('HardwareFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'HardwareFactory':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, tsUtil}, 'TsUtil':getInstance()),
    ok.


getInstance() ->
        get({'HardwareFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

% throws Exception
getInstance(This, Os) ->
        try
        try
            OperatingSystems = 'OperatingSystems':getInstance(),
            case ((get({get({This, tsUtil}), '$class'})):compareTo(get({This, tsUtil}), (get({Os, '$class'})):getName(Os), get({OperatingSystems, 'ANDROID'})) =:= 0) of
                true ->
                throw({'$return', 'AndroidHardware':new()});
                false ->
                case ((get({get({This, tsUtil}), '$class'})):compareTo(get({This, tsUtil}), (get({Os, '$class'})):getName(Os), get({OperatingSystems, 'HARMONY'})) =:= 0) of
                true ->
                throw({'$return', 'AndroidHardware':new()});
                false -> ok
            end
            end,
            erlang:error({'Exception', lists:concat(["No Hardware Imp for: ", (get({Os, '$class'})):getName(Os)])})
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Ignoring Exception Returning NoHardware", This, get({CommonStrings, 'GET_INSTANCE'}), E),
            'NoHardware':new()
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

