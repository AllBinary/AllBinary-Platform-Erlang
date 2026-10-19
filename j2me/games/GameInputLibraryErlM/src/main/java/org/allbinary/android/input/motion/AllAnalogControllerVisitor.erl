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
% package org.allbinary.android.input.motion
% import org.allbinary.game.input.analog.AnalogLocationInput
% import org.allbinary.game.input.analog.AnalogLocationInputFactory
% import org.allbinary.layer.AllBinaryLayerManager
% import org.allbinary.util.BasicArrayList

-module('AllAnalogControllerVisitor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('AnalogControllerVisitor', Function, Arguments).

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'AnalogControllerVisitor':init(This),
    init_fields(This).


process(This, AllbinaryLayerManager, AnalogLocationInputProcessor) ->
        AnalogLocationInputList = (fun(Target_N65745) -> (get({Target_N65745, '$class'})):getList(Target_N65745) end)('AnalogLocationInputFactory':getInstance()),
        put({local, analogLocationInput}, undefined),
        lists:foreach(fun(Index) ->
            put({local, analogLocationInput}, (get({AnalogLocationInputList, '$class'})):get(AnalogLocationInputList, Index)),
            (get({AnalogLocationInputProcessor, '$class'})):process(AnalogLocationInputProcessor, AllbinaryLayerManager, get({local, analogLocationInput}))
        end, lists:seq(((get({AnalogLocationInputList, '$class'})):size(AnalogLocationInputList) - 1), 0, -1)).

