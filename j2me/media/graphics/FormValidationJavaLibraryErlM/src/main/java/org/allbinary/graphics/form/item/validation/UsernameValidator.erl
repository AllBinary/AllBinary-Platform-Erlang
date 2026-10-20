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
% package org.allbinary.graphics.form.item.validation
% import org.allbinary.graphics.form.item.ABTextFieldItem

-module('UsernameValidator').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('TextFieldItemValidator', Function, Arguments).

init_fields(This) ->
    ok.


new(TextFieldItem, Min, Max, AllowOnEmpty) when is_integer(Min), is_integer(Max), is_boolean(AllowOnEmpty) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, TextFieldItem, Min, Max, AllowOnEmpty),
    This.

'$init'(This, TextFieldItem, Min, Max, AllowOnEmpty) when is_integer(Min), is_integer(Max), is_boolean(AllowOnEmpty) ->
        'TextFieldItemValidator':'$init'(This, TextFieldItem, Min, Max, AllowOnEmpty).

