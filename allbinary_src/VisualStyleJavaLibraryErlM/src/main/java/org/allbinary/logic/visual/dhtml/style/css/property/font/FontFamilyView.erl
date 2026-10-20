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
% package org.allbinary.logic.visual.dhtml.style.css.property.font
% import org.allbinary.logic.visual.dhtml.style.css.property.CssPropertyView
% import org.w3c.dom.Node

-module('FontFamilyView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('CssPropertyView', Function, Arguments).

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
        'CssPropertyView':'$init'(This, get({'FontFamilyData':getInstance(), 'VALUE'})).

new(Node) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Node),
    This.

'$init'(This, Node) ->
        'CssPropertyView':'$init'(This, Node).

