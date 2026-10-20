% Generated Code Do Not Modify
% package org.allbinary.logic.control.crypt.file
% import org.allbinary.logic.io.path.AbPath
% import org.w3c.dom.Document

-module('CryptFileWriter').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.


new(DecryptedExtension, EncryptedExtension) when (is_list(DecryptedExtension) orelse DecryptedExtension =:= undefined), (is_list(EncryptedExtension) orelse EncryptedExtension =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, DecryptedExtension, EncryptedExtension),
    This.

'$init'(This, DecryptedExtension, EncryptedExtension) when (is_list(DecryptedExtension) orelse DecryptedExtension =:= undefined), (is_list(EncryptedExtension) orelse EncryptedExtension =:= undefined) ->
    init_fields(This),
        ok.

% throws Exception
write(This, FileAbPath, Document) ->
        ok.

