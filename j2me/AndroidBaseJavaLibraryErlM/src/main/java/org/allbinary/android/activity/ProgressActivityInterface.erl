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
% package org.allbinary.android.activity

-module('ProgressActivityInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface


runOnUiThread(This, Action) ->
    erlang:error({abstract_method, runOnUiThread}).

onDismissTitleProgressBar(This) ->
    erlang:error({abstract_method, onDismissTitleProgressBar}).

onShowTitleProgressBar(This, Value, Indeterminate) when is_integer(Value), is_boolean(Indeterminate) ->
    erlang:error({abstract_method, onShowTitleProgressBar}).

onTitleProgressBarSetProgress(This, Value) when is_integer(Value) ->
    erlang:error({abstract_method, onTitleProgressBarSetProgress}).

