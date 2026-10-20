%
% AllBinary Open License Version 1
% Copyright (c) 2022 AllBinary
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
% package org.allbinary.data.tree.dom
% import java.io.ByteArrayOutputStream
% import javax.xml.transform.stream.StreamResult
% import javax.xml.transform.stream.StreamSource
% import org.allbinary.logic.io.file.AbFile
% import org.allbinary.logic.io.path.AbPath

-module('AbXslHelper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'AbXslHelper':new()),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'AbXslHelper', instance}).

% throws Exception
translate(This, XsltFilePath, XmlFilePath) when (is_list(XsltFilePath) orelse XsltFilePath =:= undefined), (is_list(XmlFilePath) orelse XmlFilePath =:= undefined) ->
        try
            OutputStream = 'ByteArrayOutputStream':new(),
            (fun(Target_N66199) -> (get({Target_N66199, '$class'})):toString(Target_N66199) end)((fun(Target_N66206) -> (get({Target_N66206, '$class'})):translate(Target_N66206, 'StreamSource':new(XsltFilePath), 'StreamSource':new(XmlFilePath), 'StreamResult':new(OutputStream)) end)('XslHelper':getInstance()))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        end;
% throws Exception
translate(This, XslFile, XmlFile) ->
        (get({This, '$class'})):translate(This, (get({XslFile, '$class'})):getAbsolutePath(XslFile), (get({XmlFile, '$class'})):getAbsolutePath(XmlFile));
% throws Exception
translate(This, XslPath, XmlPath) ->
        (get({This, '$class'})):translate(This, (get({XslPath, '$class'})):getPath(XslPath), (get({XmlPath, '$class'})):getPath(XmlPath)).



