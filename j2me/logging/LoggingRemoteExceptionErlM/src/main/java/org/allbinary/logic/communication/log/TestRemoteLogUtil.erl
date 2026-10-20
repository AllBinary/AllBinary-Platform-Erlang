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
% package org.allbinary.logic.communication.log
% import org.allbinary.globals.Globals
% import org.allbinary.string.CommonStrings

-module('TestRemoteLogUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'PATH'}, "G:\\mnt\\bc\\mydev\\work\\allbinary_src\\licensing\\data\\"),
    ok.

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        (fun(Target_N65699) -> (get({Target_N65699, '$class'})):init(Target_N65699, (get({get({This, '$class'}), '$class'})):getClassLoader(get({This, '$class'})), get({'TestRemoteLogUtil', 'PATH'})) end)('Globals':getInstance()),
        LogUtil = 'LogUtil':getInstance(),
        CommonStrings = 'CommonStrings':getInstance(),
        (get({LogUtil, '$class'})):put(LogUtil, get({CommonStrings, 'EXCEPTION'}), "Test", "TestClass", {'Exception', "Pretend Exception"}).

% throws Exception
main(Args) when (is_tuple(Args) orelse Args =:= undefined) ->
        'TestRemoteLogUtil':new().

