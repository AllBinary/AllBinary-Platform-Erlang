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
% package org.allbinary.game.paint
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.logic.system.os.GenericOperatingSystem
% import org.allbinary.logic.system.os.OperatingSystemFactory

-module('ColorFillPaintableFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ColorFillPaintableFactory':new()),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'ColorFillPaintableFactory', instance}).

getInstance(This, BasicColor, ForThreedCanvas) when is_boolean(ForThreedCanvas) ->
        try
        OperatingSystem = (fun(Target_N65813) -> (get({Target_N65813, '$class'})):getOperatingSystemInstance(Target_N65813) end)('OperatingSystemFactory':getInstance()),
        case (get({OperatingSystem, '$class'})):isOverScan(OperatingSystem) of
            true ->
            throw({'$return', 'OverScanColorFillPaintable':new(BasicColor)});
            false ->
            throw({'$return', 'ColorFillPaintable':new(BasicColor)})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

