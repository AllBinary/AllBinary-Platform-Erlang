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
% package org.allbinary.logic.java.jar
% import java.io.IOException
% import java.net.URL
% import java.net.URLConnection
% import java.util.jar.JarEntry
% import java.util.jar.JarInputStream

-module('JarUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, jarURL}, undefined),
    ok.


new(JarURL) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, JarURL),
    This.

init(This, JarURL) ->
    init_fields(This),
        put({This, jarURL}, JarURL).

show(This) ->
        put({local, cache}, array:new(1024, {default, 0})),
        try
            Conn = (get({get({This, jarURL}), '$class'})):openConnection(get({This, jarURL})),
            Jis = 'JarInputStream':new((get({Conn, '$class'})):getInputStream(Conn)),
            (fun Loop() -> case true of true ->
                Entry = (get({Jis, '$class'})):getNextJarEntry(Jis),
                case (Entry =/= undefined) of
                    true ->
                    case (not (get({Entry, '$class'})):isDirectory(Entry)) of
                        true ->
                        put({local, offset}, 0),
                        put({local, i}, 0),
                        (fun Loop() -> case ((begin put({local, i}, (get({Jis, '$class'})):read(Jis, get({local, cache}), get({local, offset}), (array:size(get({local, cache})) - get({local, offset})))), get({local, i}) end) =/= (-1)) of true ->
                            put({local, offset}, (get({local, offset}) + get({local, i}))),
                            case (get({local, offset}) >= array:size(get({local, cache}))) of
                                true ->
                                Newcache = array:new((array:size(get({local, cache})) + 1024), {default, 0}),
                                allbinary_java:array_copy(get({local, cache}), 0, Newcache, 0, array:size(get({local, cache}))),
                                put({local, cache}, Newcache);
                                false -> ok
                            end,
                            Loop();
                        false -> ok end end)(),
                        Tmp = array:new(get({local, offset}), {default, 0}),
                        allbinary_java:array_copy(get({local, cache}), 0, Tmp, 0, get({local, offset})),
                        io:format("~ts~n", [allbinary_java:to_string((get({Entry, '$class'})):getName(Entry))]);
                        false -> ok
                    end;
                    false ->
                    throw('$break')
                end,
                Loop();
            false -> ok end end)()
        catch _:Ex when Ex =/= '$break', Ex =/= '$continue', (not is_tuple(Ex) orelse element(1, Ex) =/= '$return') ->
            io:format("~ts~n", [allbinary_java:to_string(Ex)]),
            io:format("~p~n", [Ex])
        end.

% throws Exception
main(Args) when (is_tuple(Args) orelse Args =:= undefined) ->
        (fun(Target_N66755) -> (get({Target_N66755, '$class'})):show(Target_N66755) end)('JarUtil':new('URL':new("file:///G:/mnt/bc/mydev/working/j2me/MiniSpaceWars/MiniSpaceWars/dist/MiniSpaceWars.jar"))).

