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
% import java.io.BufferedReader
% import java.io.FileReader
% import org.allbinary.logic.io.file.AbFile
% import org.allbinary.logic.io.file.AbFileNativeUtil

-module('BufferedLineReader').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, tmpIn}, undefined),
    ok.


new(File) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, File),
    This.

'$init'(This, File) ->
    init_fields(This),
        put({This, tmpIn}, 'BufferedReader':new('FileReader':new('AbFileNativeUtil':get(File)))).

readUpToLines(This, ReadAheadIndex) when is_integer(ReadAheadIndex) ->
        ok.

% throws Exception
readLine(This) ->
        (get({get({This, tmpIn}), '$class'})):readLine(get({This, tmpIn})).

getSize(This) ->
        0.

getCurrent(This) ->
        0.

