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
% package org.allbinary.graphics.form
% import javax.microedition.lcdui.Graphics
% import org.allbinary.graphics.paint.Paintable

-module('FormPaintable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('Paintable', Function, Arguments).

init_fields(This) ->
    put({This, form}, undefined),
    ok.


new(Form) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Form),
    This.

init(This, Form) ->
    'Paintable':init(This),
    init_fields(This),
        put({This, form}, Form).

paint(This, Graphics) ->
        (get({get({This, form}), '$class'})):paint(get({This, form}), Graphics).

getForm(This) ->
        get({This, form}).

