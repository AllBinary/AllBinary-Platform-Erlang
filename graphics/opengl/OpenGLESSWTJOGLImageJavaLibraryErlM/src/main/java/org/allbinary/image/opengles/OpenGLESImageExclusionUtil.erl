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
% package org.allbinary.image.opengles
% import javax.microedition.lcdui.Image
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('OpenGLESImageExclusionUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'OpenGLESImageExclusionUtil':new()),
    ok.

init_fields(This) ->
    put({This, 'EXCLUSION'}, "font"),
    put({This, list}, 'BasicArrayListD':new()),
    ok.


getInstance() ->
        get({'OpenGLESImageExclusionUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

isCustomScaling(This, Image) ->
        try
        ImageName = (get({Image, '$class'})):getName(Image),
        put({local, isNormalScaling}, (((get({get({This, list}), '$class'})):size(get({This, list})) =:= 0) orelse lists:prefix(get({This, 'EXCLUSION'}), ImageName))),
        case get({local, isNormalScaling}) of
            true ->
            throw({'$return', false});
            false ->
            Size = (get({get({This, list}), '$class'})):size(get({This, list})),
            put({local, name}, undefined),
            lists:foreach(fun(Index) ->
                put({local, name}, (get({get({This, list}), '$class'})):get(get({This, list}), Index)),
                case lists:prefix(get({local, name}), ImageName) of
                    true ->
                    put({local, isNormalScaling}, true);
                    false -> ok
                end
            end, lists:seq(0, Size - 1))
        end,
        case get({local, isNormalScaling}) of
            true ->
            throw({'$return', false});
            false ->
            throw({'$return', true})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

