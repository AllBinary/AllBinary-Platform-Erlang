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
% package org.allbinary.graphics.j2me.workarea.color

-module('ColorChooser').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('JPanel', Function, Arguments).

init_fields(This) ->
    put({This, jColorChooser1}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'JPanel':init(This),
    init_fields(This),
        (get({This, '$class'})):initComponents(This).

initComponents(This) ->
        put({This, jColorChooser1}, 'JColorChooser':new()),
        (get({This, '$class'})):setLayout(This, 'BorderLayout':new()),
        (get({This, '$class'})):add(This, get({This, jColorChooser1}), get({get({get({'java', awt}), 'BorderLayout'}), 'CENTER'})).

