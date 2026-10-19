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

-module('LockableFormPaintableFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ItemPaintableFactory', Function, Arguments).

init_fields(This) ->
    put({This, lockedIndex}, 0),
    ok.


new(LockedIndex) when is_integer(LockedIndex) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, LockedIndex),
    This.

init(This, LockedIndex) when is_integer(LockedIndex) ->
    'ItemPaintableFactory':init(This),
    init_fields(This),
        put({This, lockedIndex}, LockedIndex).

% throws Exception
getInstanceItemPaintable(This, PaintableForm) ->
        'LockablePaintable':new(get({This, lockedIndex})).

