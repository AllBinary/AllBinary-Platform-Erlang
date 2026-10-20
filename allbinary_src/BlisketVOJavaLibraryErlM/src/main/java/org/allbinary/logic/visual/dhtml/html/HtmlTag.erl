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
% package org.allbinary.logic.visual.dhtml.html
% import java.util.HashMap
% import org.allbinary.logic.StdUtil

-module('HtmlTag').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, otherAttributes}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        put({This, otherAttributes}, (fun(Target_N65694) -> (get({Target_N65694, '$class'})):createHashMap(Target_N65694) end)('StdUtil':getInstance())).

addAttribute(This, Key, Value) when (is_list(Key) orelse Key =:= undefined), (is_list(Value) orelse Value =:= undefined) ->
        (get({get({This, otherAttributes}), '$class'})):put(get({This, otherAttributes}), Key, Value).

