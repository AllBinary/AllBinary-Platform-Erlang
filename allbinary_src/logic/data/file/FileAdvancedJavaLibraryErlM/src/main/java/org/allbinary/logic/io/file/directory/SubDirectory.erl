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
% package org.allbinary.logic.io.file.directory
% import java.io.FileFilter
% import org.allbinary.logic.io.file.AbFile
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonSeps
% import org.allbinary.util.BasicArrayList

-module('SubDirectory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'SubDirectory':new()),
    ok.

init_fields(This) ->
    put({This, directory}, 'Directory':getInstance()),
    ok.


getInstance() ->
        get({'SubDirectory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

search(This, SearchValue, File) when (is_list(SearchValue) orelse SearchValue =:= undefined) ->
        (get({get({This, directory}), '$class'})):search(get({This, directory}), SearchValue, File, true);
search(This, Level, File) when is_integer(Level) ->
        (get({get({This, directory}), '$class'})):search(get({This, directory}), Level, File, true);
search(This, FileFilter, File) ->
        (get({get({This, directory}), '$class'})):search(get({This, directory}), FileFilter, File, true).

search(This, File) ->
        (get({get({This, directory}), '$class'})):search(get({This, directory}), File, true).



toString(Files) ->
        StringBuffer = 'StringMaker':new(),
        NEW_LINE = get({'CommonSeps':getInstance(), 'NEW_LINE'}),
        Size = (get({Files, '$class'})):size(Files),
        lists:foreach(fun(Index) ->
            File = (get({Files, '$class'})):get(Files, Index),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({File, '$class'})):getPath(File)),
            (get({StringBuffer, '$class'})):append(StringBuffer, NEW_LINE)
        end, lists:seq(0, Size - 1)),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

