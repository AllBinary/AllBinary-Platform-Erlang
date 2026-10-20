% 
% AllBinary Open License Version 1 
% Copyright (c) 2025 AllBinary 
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
% package org.allbinary.game.configuration.persistance
% import javax.microedition.rms.RecordComparator

-module('NullRecordComparator').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements RecordComparator

static_init() ->
    put({?MODULE, 'NULL_RECORD_COMPARATOR'}, 'NullRecordComparator':new()),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


compare(This, Rec1, Rec2) when (is_tuple(Rec1) orelse Rec1 =:= undefined), (is_tuple(Rec2) orelse Rec2 =:= undefined) ->
        0.

