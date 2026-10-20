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
% package org.allbinary.logic.system.loader
% import java.lang.reflect.Constructor
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.java.anyType.ConstructorUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.system.security.AbKeys
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.logic.system.security.licensing.LicensingException
% import org.allbinary.string.CommonSeps

-module('AbeFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'AbeFactory':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, useCustomLoader}, false),
    ok.


getInstance() ->
        get({'AbeFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

% throws LicensingException
getInstance(This, AbeClientInformation, ClassName) when (is_list(ClassName) orelse ClassName =:= undefined) ->
        try
            (fun(Target_N66074) -> (get({Target_N66074, '$class'})):newInstance(Target_N66074) end)((get({This, '$class'})):getClass(This, AbeClientInformation, ClassName))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'LOADERERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), lists:concat(["Failure for: ", ClassName]), This, "getInstance(classname)", E);
                false -> ok
            end,
            erlang:error(E)
        end.

% throws LicensingException
getInstance(This, AbeClientInformation, ClassName, Classes, Params) when (is_list(ClassName) orelse ClassName =:= undefined), (is_tuple(Classes) orelse Classes =:= undefined), (is_tuple(Params) orelse Params =:= undefined) ->
        try
        put({local, constructor}, undefined),
        try
            Parent = 'WebappClassLoaderInfo':getLoader(),
            case get({This, useCustomLoader}) of
                true ->
                Loader = 'AbeClassLoader':new(Parent, (fun(Target_N67030) -> (get({Target_N67030, '$class'})):getKey(Target_N67030, AbeClientInformation, ClassName) end)('AbKeys':getInstance())),
                put({local, myClass}, (get({Loader, '$class'})):loadClass(Loader, ClassName)),
                put({local, constructor}, (get({get({local, myClass}), '$class'})):getConstructor(get({local, myClass}), Classes)),
                throw({'$return', (get({get({local, constructor}), '$class'})):newInstance(get({local, constructor}), Params)});
                false ->
                put({local, myClass}, (get({Parent, '$class'})):loadClass(Parent, ClassName)),
                put({local, constructor}, (get({get({local, myClass}), '$class'})):getConstructor(get({local, myClass}), Classes)),
                throw({'$return', (get({get({local, constructor}), '$class'})):newInstance(get({local, constructor}), Params)})
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'LOADERERROR'})) of
                true ->
                put({local, stringBuffer}, 'StringMaker':new()),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), "Failure for: "),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), ClassName),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), get({'CommonSeps':getInstance(), 'SPACE'})),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), 'ConstructorUtil':view(get({local, constructor}), get({'CommonSeps':getInstance(), 'NEW_LINE'}))),
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), (get({get({local, stringBuffer}), '$class'})):toString(get({local, stringBuffer})), This, "getInstance(className,params)", E);
                false -> ok
            end,
            erlang:error(E)
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws LicensingException
getClass(This, AbeClientInformation, ClassName) when (is_list(ClassName) orelse ClassName =:= undefined) ->
        try
        try
            Parent = 'WebappClassLoaderInfo':getLoader(),
            case get({This, useCustomLoader}) of
                true ->
                Loader = 'AbeClassLoader':new(Parent, (fun(Target_N68514) -> (get({Target_N68514, '$class'})):getKey(Target_N68514, AbeClientInformation, ClassName) end)('AbKeys':getInstance())),
                put({local, c}, (get({Loader, '$class'})):loadClass(Loader, ClassName)),
                throw({'$return', get({local, c})});
                false ->
                put({local, c}, (get({Parent, '$class'})):loadClass(Parent, ClassName)),
                throw({'$return', get({local, c})})
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'LOADERERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), lists:concat(["Failure for: ", ClassName]), This, "getClass(className)", E);
                false -> ok
            end,
            erlang:error(E)
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

