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
% package org.allbinary.media.image.filter
% import java.io.File
% import javax.swing.filechooser.FileFilter

-module('ImageFileFilter').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('FileFilter', Function, Arguments).

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'FileFilter':init(This),
    init_fields(This).


accept(This, F) ->
        try
        case (get({F, '$class'})):isDirectory(F) of
            true ->
            throw({'$return', true});
            false -> ok
        end,
        S = (get({F, '$class'})):getName(F),
        I = (get({S, '$class'})):lastIndexOf(S, $.),
        case ((I > 0) andalso (I < (string:length(S) - 1))) of
            true ->
            Ext = string:lowercase(string:slice(S, (I + 1))),
            case ((Ext =:= "jpg") orelse (Ext =:= "jpeg")) of
                true ->
                throw({'$return', true});
                false -> ok
            end;
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getDescription(This) ->
        "Accepts .jpg and .jpeg files".

