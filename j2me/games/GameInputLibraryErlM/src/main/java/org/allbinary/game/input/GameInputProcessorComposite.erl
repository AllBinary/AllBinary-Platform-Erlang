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
% package org.allbinary.game.input
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('GameInputProcessorComposite').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('PlayerGameInput', Function, Arguments).

init_fields(This) ->
    put({This, name}, undefined),
    put({This, gameInputProcessorInterface}, undefined),
    put({This, 'NAME_LABEL'}, " GameInputProcessorInterface: "),
    ok.


new(Name, GameInputProcessorInterface) when (is_list(Name) orelse Name =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Name, GameInputProcessorInterface),
    This.

init(This, Name, GameInputProcessorInterface) when (is_list(Name) orelse Name =:= undefined) ->
        'PlayerGameInput':init(This, 'BasicArrayListD':new(), 'BasicArrayListD':new(), (-1)),
        init_fields(This),
        put({This, name}, Name),
        put({This, gameInputProcessorInterface}, GameInputProcessorInterface).

update(This) ->
        try
            List = (get({This, '$class'})):getGameKeyEventList(This),
            (get({get({This, gameInputProcessorInterface}), '$class'})):onInput(get({This, gameInputProcessorInterface}), List)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'UPDATE'}), E)
        end.

toString(This) ->
        (fun(Target_N66211) -> (get({Target_N66211, '$class'})):toString(Target_N66211) end)((fun(Target_N66218) -> (get({Target_N66218, '$class'})):append(Target_N66218, get({This, name})) end)((fun(Target_N66225) -> (get({Target_N66225, '$class'})):append(Target_N66225, get({This, 'NAME_LABEL'})) end)((fun(Target_N66232) -> (get({Target_N66232, '$class'})):append(Target_N66232, 'PlayerGameInput':toString(This)) end)('StringMaker':new())))).

