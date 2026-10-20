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
% package org.allbinary.business.installer
% import org.allbinary.globals.URLGLOBALS
% import org.allbinary.logic.communication.http.file.upload.FileUploadData
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.io.AbIOSystem
% import org.allbinary.logic.io.file.AbFile
% import org.allbinary.logic.io.file.directory.Directory
% import org.allbinary.logic.io.path.AbPath
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.util.BasicArrayList

-module('DeleteCloud').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

delete(This, PrePath, Current, Total) when (is_list(PrePath) orelse PrePath =:= undefined), is_integer(Current), is_integer(Total) ->
        try
            case (fun(Target_N66000) -> (get({Target_N66000, '$class'})):isType(Target_N66000, "com.vobject.appengine.java.io") end)('AbIOSystem':getInstance()) of
                true ->
                StringBuffer = 'StringMaker':new(),
                (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({'DeleteCloud', 'URLGLOBALS'}), '$class'})):getWebappPath(get({'DeleteCloud', 'URLGLOBALS'}))),
                (get({StringBuffer, '$class'})):append(StringBuffer, PrePath),
                Path = 'AbPath':new((get({StringBuffer, '$class'})):toString(StringBuffer), get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
                File = 'AbFile':createAbFileFromAbPath(Path),
                FileBasicArrayList = (fun(Target_N66324) -> (get({Target_N66324, '$class'})):search(Target_N66324, File, true) end)('Directory':getInstance()),
                Size = (get({FileBasicArrayList, '$class'})):size(FileBasicArrayList),
                (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
                (get({StringBuffer, '$class'})):append(StringBuffer, "Searched: "),
                (get({StringBuffer, '$class'})):append(StringBuffer, (get({Path, '$class'})):toFileSystemString(Path)),
                (get({StringBuffer, '$class'})):append(StringBuffer, " BasicArrayList: "),
                (get({StringBuffer, '$class'})):appendint(StringBuffer, Size),
                Portion = ((Size div Total) + 1),
                Start = (Portion * Current),
                put({local, 'end'}, (Start + Portion)),
                case (get({local, 'end'}) > Size) of
                    true ->
                    put({local, 'end'}, Size);
                    false -> ok
                end,
                (get({StringBuffer, '$class'})):append(StringBuffer, " Section: "),
                (get({StringBuffer, '$class'})):appendint(StringBuffer, Start),
                (get({StringBuffer, '$class'})):append(StringBuffer, " - "),
                (get({StringBuffer, '$class'})):appendint(StringBuffer, get({local, 'end'})),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "initialize()"),
                put({local, nextFile}, undefined),
                lists:foreach(fun(Index) ->
                    put({local, nextFile}, (get({FileBasicArrayList, '$class'})):get(FileBasicArrayList, Index)),
                    try
                        case ((fun(Target_N67054) -> (get({Target_N67054, '$class'})):indexOf(Target_N67054, get({'FileUploadData':getInstance(), 'FILE'})) end)((get({get({local, nextFile}), '$class'})):getPath(get({local, nextFile}))) < 0) of
                            true ->
                            (get({get({local, nextFile}), '$class'})):delete(get({local, nextFile}));
                            false -> ok
                        end
                    catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
                        ok
                    end
                end, lists:seq(Start, get({local, 'end'}) - 1)),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Deleted Files From Cloud", This, "initialize()");
                false -> ok
            end,
            true
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Unable to copy installer files into cloud", This, "initialize()", E),
            false
        end.

