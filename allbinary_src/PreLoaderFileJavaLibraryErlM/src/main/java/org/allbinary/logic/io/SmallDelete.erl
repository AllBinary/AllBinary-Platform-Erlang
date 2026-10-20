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

-module('SmallDelete').
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

deleteAtStart(This, Start, End) when (is_list(Start) orelse Start =:= undefined), (is_list(End) orelse End =:= undefined) ->
        try
        try
            put({local, beginIndex}, 0),
            put({local, endIndex}, 0),
            put({local, beginIndex}, allbinary_java:index_of(get({This, string}), Start)),
            put({local, endIndex}, allbinary_java:index_of(get({This, string}), End)),
            case (((((get({local, endIndex}) > get({local, beginIndex})) andalso (get({local, beginIndex}) >= 0)) andalso (get({local, endIndex}) >= 0)) andalso (get({local, beginIndex}) < 10)) andalso (get({local, endIndex}) < 525)) of
                true ->
                Text = string:slice(get({This, string}), get({local, endIndex}), (string:length(get({This, string}))) - (get({local, endIndex}))),
                IdFile = 'FileOutputStream':new(get({This, fileName})),
                IdOutData = 'DataOutputStream':new(IdFile),
                (get({IdOutData, '$class'})):writeBytes(IdOutData, Text),
                throw({'$return', true});
                false -> ok
            end,
            false
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'IDLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "deleteAtStart", E);
                false -> ok
            end,
            false
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

deleteBetween(This, Start, End, NewText) when (is_list(Start) orelse Start =:= undefined), (is_list(End) orelse End =:= undefined), (is_list(NewText) orelse NewText =:= undefined) ->
        try
        try
            put({local, beginIndex}, 0),
            put({local, endIndex}, 0),
            put({local, beginIndex}, allbinary_java:index_of(get({This, string}), Start)),
            put({local, endIndex}, allbinary_java:index_of(get({This, string}), End)),
            case (((((get({local, endIndex}) > get({local, beginIndex})) andalso (get({local, beginIndex}) >= 0)) andalso (get({local, endIndex}) >= 0)) andalso (get({local, beginIndex}) < 50)) andalso (get({local, endIndex}) < 425)) of
                true ->
                NewStart = string:slice(get({This, string}), 0, (get({local, beginIndex})) - (0)),
                Text = string:slice(get({This, string}), (get({local, endIndex}) + string:length(End)), (string:length(get({This, string}))) - ((get({local, endIndex}) + string:length(End)))),
                IdFile = 'FileOutputStream':new(get({This, fileName})),
                IdOutData = 'DataOutputStream':new(IdFile),
                (get({IdOutData, '$class'})):writeBytes(IdOutData, lists:concat([lists:concat([NewStart, NewText]), Text])),
                throw({'$return', true});
                false -> ok
            end,
            false
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'IDLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "deleteAtStart", E);
                false -> ok
            end,
            false
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

