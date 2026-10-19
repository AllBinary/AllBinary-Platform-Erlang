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
% package org.allbinary.game
% import org.allbinary.time.TimeDelayHelper

-module('Intermission').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements IntermissionInterface

init_fields(This) ->
    put({This, enabled}, false),
    put({This, timeElapsedHelper}, 'TimeDelayHelper':new(0)),
    put({This, intermissionEnableListener}, 'NullIntermissionEnableListener':getInstance()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

setListener(This, EnableListener) ->
        put({This, intermissionEnableListener}, EnableListener).

getTimeDelayHelper(This) ->
        get({This, timeElapsedHelper}).

setEnabled(This, Enabled) when is_boolean(Enabled) ->
        put({This, enabled}, Enabled),
        case (get({This, '$class'})):isEnabled(This) of
            true ->
            (fun(Target_N65955) -> (get({Target_N65955, '$class'})):setStartTimeTNT(Target_N65955) end)((get({This, '$class'})):getTimeDelayHelper(This));
            false -> ok
        end,
        (get({get({This, intermissionEnableListener}), '$class'})):notifyIntermission(get({This, intermissionEnableListener}), Enabled).

isEnabled(This) ->
        get({This, enabled}).

