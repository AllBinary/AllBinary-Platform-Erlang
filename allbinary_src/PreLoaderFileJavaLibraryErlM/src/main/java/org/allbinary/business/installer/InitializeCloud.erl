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
% import org.allbinary.globals.PATH_GLOBALS
% import org.allbinary.globals.URLGLOBALS
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.io.AbIOSystem
% import org.allbinary.logic.io.file.AbFile
% import org.allbinary.logic.io.file.FileUtil
% import org.allbinary.logic.io.file.directory.Directory
% import org.allbinary.logic.io.path.AbPath
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.util.BasicArrayList

-module('InitializeCloud').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'CLOUD'}, "cloud/"),
    put({?MODULE, 'CLOUD_UPDATE'}, "cloudupdate/"),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

initialize(This, Cloud, OverwriteNewer, OverwriteAll, Current, Total) when (is_list(Cloud) orelse Cloud =:= undefined), is_boolean(OverwriteNewer), is_boolean(OverwriteAll), is_integer(Current), is_integer(Total) ->
        try
            case (fun(Target_N66099) -> (get({Target_N66099, '$class'})):isType(Target_N66099, "com.vobject.appengine.java.io") end)('AbIOSystem':getInstance()) of
                true ->
                StringBuffer = 'StringMaker':new(),
                (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({'InitializeCloud', 'URLGLOBALS'}), '$class'})):getWebappPath(get({'InitializeCloud', 'URLGLOBALS'}))),
                (get({StringBuffer, '$class'})):append(StringBuffer, Cloud),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({(get({get({'InitializeCloud', 'PATH_GLOBALS'}), '$class'})):getInstance(get({'InitializeCloud', 'PATH_GLOBALS'})), 'DATA_PATH'})),
                Path = 'AbPath':new((get({StringBuffer, '$class'})):toString(StringBuffer), get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
                (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
                (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({'InitializeCloud', 'URLGLOBALS'}), '$class'})):getWebappPath(get({'InitializeCloud', 'URLGLOBALS'}))),
                RealPath = 'AbPath':new((get({StringBuffer, '$class'})):toString(StringBuffer), get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
                File = 'AbFile':createAbFileFromAbPath(Path),
                FileBasicArrayList = (fun(Target_N66649) -> (get({Target_N66649, '$class'})):search(Target_N66649, File, true) end)('Directory':getInstance()),
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
                    case (get({get({local, nextFile}), '$class'})):isDirectory(get({local, nextFile})) of
                        true ->
                        ok;
                        false ->
                        (fun(Target_N67416) -> (get({Target_N67416, '$class'})):copyToCloud(Target_N67416, get({local, nextFile}), Path, RealPath, Cloud, OverwriteNewer, OverwriteAll) end)('FileUtil':getInstance())
                    end
                end, lists:seq(Start, get({local, 'end'}) - 1)),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Copied Files To Cloud", This, "initialize()");
                false -> ok
            end,
            true
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Unable to copy installer files into cloud", This, "initialize()", E),
            false
        end.

