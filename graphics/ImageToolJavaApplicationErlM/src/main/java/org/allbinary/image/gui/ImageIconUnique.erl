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
% package org.allbinary.image.gui
% import java.awt.image.BufferedImage
% import javax.swing

-module('ImageIconUnique').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ImageIcon', Function, Arguments).

init_fields(This) ->
    put({This, id}, 0),
    ok.


new(BufferedImage, Index) when is_integer(Index) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, BufferedImage, Index),
    This.

init(This, BufferedImage, Index) when is_integer(Index) ->
        'ImageIcon':init(This, BufferedImage),
        init_fields(This),
        (get({This, '$class'})):setId(This, Index).

getId(This) ->
        get({This, id}).

setId(This, Id) when is_integer(Id) ->
        put({This, id}, Id).

