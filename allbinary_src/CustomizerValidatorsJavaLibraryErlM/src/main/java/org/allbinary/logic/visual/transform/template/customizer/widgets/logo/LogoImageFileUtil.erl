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
% package org.allbinary.logic.visual.transform.template.customizer.widgets.logo
% import java.io.ByteArrayInputStream
% import org.allbinary.logic.io.file.AbFile
% import org.allbinary.logic.io.file.FileUtil
% import org.allbinary.logic.io.file.directory.Directory
% import org.allbinary.logic.io.path.AbPath
% import org.apache.commons.fileupload.FileItem

-module('LogoImageFileUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, directory}, 'Directory':getInstance()),
    put({This, fileName}, undefined),
    put({This, imageFileAbPath}, undefined),
    ok.


new(ImageAbPath, ImageFile) when (is_list(ImageFile) orelse ImageFile =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, ImageAbPath, ImageFile),
    This.

'$init'(This, ImageAbPath, ImageFile) when (is_list(ImageFile) orelse ImageFile =:= undefined) ->
    init_fields(This),
        put({This, fileName}, ImageFile),
        put({This, imageFileAbPath}, ImageAbPath).

% throws Exception
saveFiles(This, FileItem) ->
        case (get({This, fileName}) =:= undefined) of
            true ->
            erlang:error({'Exception', "Image File Name Was Null"});
            false -> ok
        end,
        case (not (get({get({This, directory}), '$class'})):create(get({This, directory}), get({This, imageFileAbPath}))) of
            true ->
            erlang:error({'Exception', "Unable to save file to non creatable directory"});
            false -> ok
        end,
        OriginalImageFile = 'AbFile':createAbFile(lists:concat([(get({get({This, imageFileAbPath}), '$class'})):toString(get({This, imageFileAbPath})), get({This, fileName})])),
        (get({OriginalImageFile, '$class'})):createNewFile(OriginalImageFile),
        (fun(Target_N66298) -> (get({Target_N66298, '$class'})):write(Target_N66298, 'ByteArrayInputStream':new((get({FileItem, '$class'})):get(FileItem)), OriginalImageFile) end)('FileUtil':getInstance()).

