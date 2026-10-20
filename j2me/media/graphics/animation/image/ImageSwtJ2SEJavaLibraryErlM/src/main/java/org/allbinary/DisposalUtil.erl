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
% package org.allbinary
% import javax.microedition.lcdui.Image
% import org.allbinary.string.CommonStrings
% import org.eclipse.swt.graphics.Resource
% import org.microemu.device.swt.SwtMutableImage

-module('DisposalUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'DisposalUtil':new()),
    ok.

init_fields(This) ->
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'DisposalUtil', instance}).

disposeImage(This, Image) ->
        try
        case (Image =:= undefined) of
            true ->
            throw({'$return', ok});
            false -> ok
        end,
        case (get({Image, '$class'})):isMutable(Image) of
            true ->
            MutableImage = Image,
            (get({This, '$class'})):disposeResource(This, (get({MutableImage, '$class'})):getImage(MutableImage));
            false ->
            ok
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

disposeResource(This, Resource) ->
        case (not (get({Resource, '$class'})):isDisposed(Resource)) of
            true ->
            io:format("~ts~n", [allbinary_java:to_string(get({get({This, commonStrings}), 'CLOSE'}))]),
            (get({Resource, '$class'})):dispose(Resource);
            false -> ok
        end.

