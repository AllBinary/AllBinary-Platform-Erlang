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
% package org.allbinary.business.installer
% import java.util.HashMap

-module('Portion').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, current}, undefined),
    put({This, total}, undefined),
    ok.


new(HashMap) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, HashMap),
    This.

init(This, HashMap) ->
    init_fields(This),
        put({This, current}, (get({HashMap, '$class'})):get(HashMap, "current")),
        put({This, total}, (get({HashMap, '$class'})):get(HashMap, "total")).

getCurrent(This) ->
        get({This, current}).

getTotal(This) ->
        get({This, total}).

