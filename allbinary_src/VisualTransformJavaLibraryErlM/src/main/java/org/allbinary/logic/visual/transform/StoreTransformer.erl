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
% package org.allbinary.logic.visual.transform
% import javax.xml.transform.URIResolver
% import org.allbinary.data.tree.dom.BasicUriResolver
% import org.allbinary.data.tree.dom.StoreUriResolver
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface

-module('StoreTransformer').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicTransformer', Function, Arguments).

init_fields(This) ->
    ok.


new(AbeClientInformation, TransformInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, AbeClientInformation, TransformInfoInterface),
    This.

init(This, AbeClientInformation, TransformInfoInterface) ->
        'BasicTransformer':init(This, AbeClientInformation, TransformInfoInterface),
        (get({This, '$class'})):setURIResolver(This, 'StoreUriResolver':new((get({This, '$class'})):getTransformInfoInterface(This), (get({This, '$class'})):getURIResolver(This))).

