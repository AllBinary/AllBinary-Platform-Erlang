% 
% AllBinary Open License Version 1 
% Copyright (c) 2026 AllBinary 
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
% package org.allbinary.util
% import java.util.Vector
% import jsinterop.annotations.JsType

-module('ABVector').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('Vector', Function, Arguments).

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'Vector':init(This),
    init_fields(This).


ensureCapacity(This, MinCapacity) when is_integer(MinCapacity) ->
        'Vector':ensureCapacity(This, MinCapacity).

capacity(This) ->
        'Vector':capacity(This).

size(This) ->
        'Vector':size(This).

isEmpty(This) ->
        'Vector':isEmpty(This).

contains(This, Obj) ->
        'Vector':contains(This, Obj).

indexOf(This, Obj) ->
        'Vector':indexOf(This, Obj).

lastIndexOf(This, Obj) ->
        'Vector':lastIndexOf(This, Obj).

elementAt(This, Index) when is_integer(Index) ->
        'Vector':elementAt(This, Index).

firstElement(This) ->
        'Vector':firstElement(This).

lastElement(This) ->
        'Vector':lastElement(This).

setElementAt(This, Obj, Index) when is_integer(Index) ->
        'Vector':setElementAt(This, Obj, Index).

removeElementAt(This, Index) when is_integer(Index) ->
        'Vector':removeElementAt(This, Index).

addElement(This, Obj) ->
        'Vector':addElement(This, Obj).

insertElementAt(This, Obj, Index) when is_integer(Index) ->
        'Vector':insertElementAt(This, Obj, Index).

removeElement(This, Obj) ->
        'Vector':removeElement(This, Obj).

removeAllElements(This) ->
        'Vector':removeAllElements(This).

clone(This) ->
        'Vector':clone(This).

toArray(This) ->
        'Vector':toArray(This).

set(This, Index, Element) when is_integer(Index) ->
        'Vector':set(This, Index, Element).

add(This, Element) ->
        'Vector':add(This, Element).

remove(This, Index) when is_integer(Index) ->
        'Vector':remove(This, Index);
remove(This, Obj) ->
        'Vector':remove(This, Obj).

add(This, Index, Element) when is_integer(Index) ->
        'Vector':add(This, Index, Element).


clear(This) ->
        'Vector':clear(This).

equals(This, Obj) ->
        'Vector':equals(This, Obj).

hashCode(This) ->
        'Vector':hashCode(This).

toString(This) ->
        'Vector':toString(This).

removeRange(This, FromIndex, ToIndex) when is_integer(FromIndex), is_integer(ToIndex) ->
        'Vector':removeRange(This, FromIndex, ToIndex).

