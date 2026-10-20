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
% package org.allbinary.business.init.db

-module('HistoryDbInitInfo').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('DbInitInfo', Function, Arguments).

static_init() ->
    put({?MODULE, 'INITFILE'}, "historydbinitdata.dat"),
    ok.

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
        'DbInitInfo':'$init'(This, get({'HistoryDbInitInfo', 'INITFILE'}), true).

new(Read) when is_boolean(Read) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Read),
    This.

'$init'(This, Read) when is_boolean(Read) ->
        'DbInitInfo':'$init'(This, get({'HistoryDbInitInfo', 'INITFILE'}), Read).

