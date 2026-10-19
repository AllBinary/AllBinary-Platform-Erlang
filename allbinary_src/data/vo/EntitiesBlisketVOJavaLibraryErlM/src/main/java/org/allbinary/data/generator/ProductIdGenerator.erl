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
% package org.allbinary.data.generator
% import org.allbinary.globals.PATH_GLOBALS
% import org.allbinary.globals.URLGLOBALS
% import org.allbinary.logic.string.StringMaker

-module('ProductIdGenerator').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('UniqueIdGenerator', Function, Arguments).

init_fields(This) ->
    put({This, 'IDFILE'}, "productId"),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'UniqueIdGenerator':init(This),
    init_fields(This),
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({'ProductIdGenerator', 'URLGLOBALS'}), '$class'})):getMainPath(get({'ProductIdGenerator', 'URLGLOBALS'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({(get({get({'ProductIdGenerator', 'PATH_GLOBALS'}), '$class'})):getInstance(get({'ProductIdGenerator', 'PATH_GLOBALS'})), 'INIT_PATH'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'IDFILE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'UniqueIdGenerator', 'EXT'})),
        'UniqueIdGenerator':setFile(This, (get({StringBuffer, '$class'})):toString(StringBuffer), get({This, 'IDFILE'})).

