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
% package org.allbinary.logic.visual.theme
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.data.tree.dom.DomNodeInterface
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.control.validate.Validation
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('ThemesValidation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements DomNodeInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('Validation', Function, Arguments).

init_fields(This) ->
    put({This, themeVector}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'Validation':init(This),
    init_fields(This),
        put({This, themeVector}, 'BasicArrayListD':new()).

new(Node) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Node),
    This;
new(HashMap) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, HashMap),
    This.

init(This, Node) ->
    'Validation':init(This),
    init_fields(This),
        ok;
init(This, HashMap) ->
    'Validation':init(This),
    init_fields(This),
        ok.


isValid(This) ->
        true.

validationInfo(This) ->
        undefined.

toValidationInfoDoc(This) ->
        undefined.

toValidationInfoNode(This, Document) ->
        undefined.

% throws Exception
toXmlNode(This, Document) ->
        Node = (get({Document, '$class'})):createElement(Document, get({'ThemesData':getInstance(), 'NAME'})),
        Size = (get({get({This, themeVector}), '$class'})):size(get({This, themeVector})),
        lists:foreach(fun(I) ->
            ThemeDomNodeInterface = (get({get({This, themeVector}), '$class'})):get(get({This, themeVector}), I),
            (get({Node, '$class'})):appendChild(Node, (get({ThemeDomNodeInterface, '$class'})):toXmlNode(ThemeDomNodeInterface, Document))
        end, lists:seq(0, Size - 1)),
        Node.

