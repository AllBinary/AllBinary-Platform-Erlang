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
% package org.allbinary.android.view
% import android.view.View

-module('ViewWrapper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BaseViewWrapper', Function, Arguments).

init_fields(This) ->
    put({This, view}, undefined),
    ok.


new(View) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, View),
    This.

'$init'(This, View) ->
    'BaseViewWrapper':'$init'(This),
    init_fields(This),
        put({This, view}, View).

invalidate(This) ->
        (get({get({This, view}), '$class'})):invalidate(get({This, view})).

postInvalidate(This) ->
        (get({get({This, view}), '$class'})):postInvalidate(get({This, view})).

