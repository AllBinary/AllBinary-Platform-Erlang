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
% package org.allbinary.input
% import org.allbinary.logic.communication.log.ForcedLogUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings

-module('AllBinarySensor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements AllBinarySensorListener

static_init() ->
    put({?MODULE, 'NULL_ALLBINARY_SENSOR'}, 'AllBinarySensor':new()),
    put({?MODULE, max}, 100),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

init(This) ->
        ok.

% throws Exception
update(This) ->
        ok.

setMax(Max) when is_integer(Max) ->
        put({'AllBinarySensor', max}, Max).

getMax() ->
        get({'AllBinarySensor', max}).

getId(This) ->
        'AllBinarySensor':getMax().

shutdown(This) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "shutdown").

onSensorChange(This) ->
        'ForcedLogUtil':log(get({get({This, commonStrings}), 'NOT_IMPLEMENTED'}), This).

