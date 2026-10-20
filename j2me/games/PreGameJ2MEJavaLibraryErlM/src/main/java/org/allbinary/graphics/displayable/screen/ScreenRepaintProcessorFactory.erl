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
% package org.allbinary.graphics.displayable.screen
% import javax.microedition.lcdui.Displayable
% import org.allbinary.J2MEUtil
% import org.allbinary.canvas.Processor

-module('ScreenRepaintProcessorFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ScreenRepaintProcessorFactory':new()),
    ok.

init_fields(This) ->
    ok.


getInstance() ->
        get({'ScreenRepaintProcessorFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

create(This, Displayable) ->
        try
        case (not 'J2MEUtil':isJ2ME()) of
            true ->
            throw({'$return', 'ScreenRepaintProcessor':new(Displayable)});
            false ->
            throw({'$return', 'Processor':getInstance()})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

