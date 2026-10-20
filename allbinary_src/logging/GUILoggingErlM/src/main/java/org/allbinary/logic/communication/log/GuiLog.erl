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
% package org.allbinary.logic.communication.log
% import java.awt
% import javax.swing
% import org.allbinary.string.CommonStrings

-module('GuiLog').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'GuiLog':new()),
    ok.

init_fields(This) ->
    put({This, logFormatUtil}, 'LogFormatUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    ok.


getInstance() ->
        get({'GuiLog', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

showDialog(This, Msg) when (is_list(Msg) orelse Msg =:= undefined) ->
        Error = 'JDialog':new(),
        Size = (string:length(Msg) * 9),
        put({local, x}, Size),
        case (get({local, x}) > 550) of
            true ->
            put({local, x}, 550);
            false -> ok
        end,
        (fun(Target_N66044) -> (get({Target_N66044, '$class'})):setLayout(Target_N66044, 'GridLayout':new(1, 1)) end)((get({Error, '$class'})):getContentPane(Error)),
        case (Size > 255) of
            true ->
            put({local, y}, 550),
            (get({Error, '$class'})):setSize(Error, get({local, x}), get({local, y})),
            (fun(Target_N66384) -> (get({Target_N66384, '$class'})):add(Target_N66384, 'JScrollPane':new('JTextArea':new(Msg))) end)((get({Error, '$class'})):getContentPane(Error));
            false ->
            case (Size > 0) of
            true ->
            put({local, y}, 50),
            (get({Error, '$class'})):setSize(Error, get({local, x}), get({local, y})),
            (fun(Target_N66209) -> (get({Target_N66209, '$class'})):add(Target_N66209, 'JScrollPane':new('JLabel':new(Msg))) end)((get({Error, '$class'})):getContentPane(Error));
            false -> ok
        end
        end,
        (get({Error, '$class'})):show(Error).

put(This, SpecialMessage, ClassName, FunctionName) when (is_list(SpecialMessage) orelse SpecialMessage =:= undefined), (is_list(ClassName) orelse ClassName =:= undefined), (is_list(FunctionName) orelse FunctionName =:= undefined) ->
        (get({This, '$class'})):put(This, SpecialMessage, ClassName, FunctionName, undefined);
put(This, SpecialMessage, AnyType, FunctionName) when (is_list(SpecialMessage) orelse SpecialMessage =:= undefined), (is_list(FunctionName) orelse FunctionName =:= undefined) ->
        (get({This, '$class'})):put(This, SpecialMessage, AnyType, FunctionName, undefined).

put(This, SpecialMessage, ClassName, FunctionName, Exception) when (is_list(SpecialMessage) orelse SpecialMessage =:= undefined), (is_list(ClassName) orelse ClassName =:= undefined), (is_list(FunctionName) orelse FunctionName =:= undefined) ->
        try
            Data = (get({get({This, logFormatUtil}), '$class'})):get(get({This, logFormatUtil}), SpecialMessage, ClassName, FunctionName, Exception),
            (get({This, '$class'})):showDialog(This, Data),
            io:format("~ts~n", [allbinary_java:to_string(Data)]),
            Data
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            'PreLogUtil':putOE(get({get({This, commonStrings}), 'EXCEPTION'}), This, "put", E),
            "Logging Error"
        end;
put(This, SpecialMessage, AnyType, FunctionName, Exception) when (is_list(SpecialMessage) orelse SpecialMessage =:= undefined), (is_list(FunctionName) orelse FunctionName =:= undefined) ->
        try
            Data = (get({get({This, logFormatUtil}), '$class'})):get(get({This, logFormatUtil}), SpecialMessage, atom_to_list(get({AnyType, '$class'})), FunctionName, Exception),
            (get({This, '$class'})):showDialog(This, Data),
            io:format("~ts~n", [allbinary_java:to_string(Data)]),
            Data
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            'PreLogUtil':putOE(get({get({This, commonStrings}), 'EXCEPTION'}), This, "put", E),
            "Logging Error"
        end.



