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
% package org.allbinary.logic.io
% import java.io.DataOutputStream
% import java.io.FileOutputStream
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.io.file.AbFileSystem
% import org.allbinary.string.CommonStrings

-module('SmallInsert').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, fileName}, undefined),
    put({This, string}, undefined),
    ok.


new(FileName) when (is_list(FileName) orelse FileName =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, FileName),
    This.

'$init'(This, FileName) when (is_list(FileName) orelse FileName =:= undefined) ->
    init_fields(This),
        put({This, fileName}, FileName),
        put({This, string}, (fun(Target_N65932) -> (get({Target_N65932, '$class'})):readAsString(Target_N65932, FileName) end)('AbFileSystem':getInstance())).

atBeginning(This, Text) when (is_list(Text) orelse Text =:= undefined) ->
        try
            IdFile = 'FileOutputStream':new(get({This, fileName})),
            IdOutData = 'DataOutputStream':new(IdFile),
            (get({IdOutData, '$class'})):writeBytes(IdOutData, lists:concat([Text, get({This, string})])),
            true
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'IDLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "insertAtBeginning", E);
                false -> ok
            end,
            false
        end.

'after'(This, Text, After) when (is_list(Text) orelse Text =:= undefined), (is_list(After) orelse After =:= undefined) ->
        try
        try
            put({local, index}, allbinary_java:index_of(get({This, string}), After)),
            case (get({local, index}) < 0) of
                true ->
                io:format("~ts~n", [allbinary_java:to_string(lists:concat([lists:concat([lists:concat(["No such start: ", After]), " in: "]), get({This, string})]))]),
                throw({'$return', false});
                false -> ok
            end,
            put({local, index}, (get({local, index}) + string:length(After))),
            Start = string:slice(get({This, string}), 0, (get({local, index})) - (0)),
            End = string:slice(get({This, string}), (get({local, index}) + 1), (string:length(get({This, string}))) - ((get({local, index}) + 1))),
            IdFile = 'FileOutputStream':new(get({This, fileName})),
            IdOutData = 'DataOutputStream':new(IdFile),
            (get({IdOutData, '$class'})):writeBytes(IdOutData, lists:concat([lists:concat([Start, Text]), End])),
            (get({IdOutData, '$class'})):close(IdOutData),
            (get({IdFile, '$class'})):close(IdFile),
            true
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'IDLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "after", E);
                false -> ok
            end,
            false
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

atEnd(This, Text) when (is_list(Text) orelse Text =:= undefined) ->
        try
            IdFile = 'FileOutputStream':new(get({This, fileName})),
            IdOutData = 'DataOutputStream':new(IdFile),
            (get({IdOutData, '$class'})):writeBytes(IdOutData, lists:concat([get({This, string}), Text])),
            true
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'IDLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "insertAtEnd", E);
                false -> ok
            end,
            false
        end.

