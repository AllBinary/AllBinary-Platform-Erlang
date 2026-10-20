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
% package org.allbinary.graphics.j2me.workarea.tools
% import org.allbinary.graphics.j2me.StatusFactory
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings

-module('ToolFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ToolFactory':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, selectedTool}, undefined),
    put({This, tool}, undefined),
    put({This, 'SELECTED_LABEL'}, "Selected: "),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'ToolFactory', instance}).

setSelectedTool(This, Tool) when (is_list(Tool) orelse Tool =:= undefined) ->
        try
            (fun(Target_N66018) -> (get({Target_N66018, '$class'})):setStatus(Target_N66018, lists:concat([get({This, 'SELECTED_LABEL'}), Tool])) end)('StatusFactory':getInstance()),
            put({This, tool}, Tool)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "setSelectionTool", E)
        end.

getSelectedToolFactory(This) ->
        try
        (fun(Target_N66240) -> (get({Target_N66240, '$class'})):setStatus(Target_N66240, lists:concat(["Tool In Use: ", get({This, tool})])) end)('StatusFactory':getInstance()),
        case (get({This, tool}) =/= undefined) of
            true ->
            put({This, selectedTool}, (fun(Target_N66347) -> (get({Target_N66347, '$class'})):getInstance(Target_N66347, get({This, tool})) end)('GraphicItemFactory':getInstance())),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["New Tool: ", get({This, selectedTool})]), This, "getSelectedToolFactory"),
            throw({'$return', get({This, selectedTool})});
            false ->
            throw({'$return', undefined})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

