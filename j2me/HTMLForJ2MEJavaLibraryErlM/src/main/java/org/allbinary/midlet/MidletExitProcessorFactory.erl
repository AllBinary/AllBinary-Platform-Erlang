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
% import javax.microedition.midlet.MIDlet
% import org.allbinary.AppletUtil
% import org.allbinary.J2MEUtil
% import org.allbinary.canvas.Processor

-module('MidletExitProcessorFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'MidletExitProcessorFactory':new()),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'MidletExitProcessorFactory', instance}).

getExitInstance(This, Midlet) ->
        try
        case ('AppletUtil':isAppletLoader(Midlet) orelse 'J2MEUtil':isJ2ME()) of
            true ->
            throw({'$return', 'Processor':getInstance()});
            false ->
            throw({'$return', 'MidletExitProcessor':new(Midlet)})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

