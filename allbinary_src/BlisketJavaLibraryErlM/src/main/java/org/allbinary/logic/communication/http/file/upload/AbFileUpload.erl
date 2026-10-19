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
% package org.allbinary.logic.communication.http.file.upload
% import java.io.IOException
% import javax.servlet.http.HttpServletRequest
% import org.apache.commons.fileupload.FileItemFactory
% import org.apache.commons.fileupload.FileItemIterator
% import org.apache.commons.fileupload.FileUpload
% import org.apache.commons.fileupload.FileUploadException
% import org.apache.commons.fileupload.servlet.ServletRequestContext

-module('AbFileUpload').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('FileUpload', Function, Arguments).

init_fields(This) ->
    ok.


new(FileItemFactory) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, FileItemFactory),
    This.

init(This, FileItemFactory) ->
        'FileUpload':init(This, FileItemFactory).

% throws FileUploadException, IOException
getItemIterator(This, Request) ->
        'FileUpload':getItemIterator(This, 'ServletRequestContext':new(Request)).

