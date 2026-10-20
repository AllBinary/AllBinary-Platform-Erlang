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
% package org.allbinary.logic.visual.transform.template.customizer.includes.style.css.template.retail
% import java.util.HashMap
% import org.allbinary.data.tree.dom.DomNodeInterface
% import org.allbinary.logic.control.validate.ValidationInterface
% import org.allbinary.logic.visual.dhtml.style.StyleData
% import org.allbinary.logic.visual.dhtml.style.StylesData
% import org.allbinary.logic.visual.dhtml.style.color.ColorsView
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('EditCssStyleValidation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ValidationInterface
% implements DomNodeInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('CssStyleValidation', Function, Arguments).

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'CssStyleValidation':'$init'(This),
    init_fields(This),
        ok.

new(Document) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Document),
    This;
new(HashMap) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, HashMap),
    This.

'$init'(This, Document) ->
        'CssStyleValidation':'$init'(This, Document);
'$init'(This, HashMap) ->
        'CssStyleValidation':'$init'(This, HashMap).


isValid(This) ->
        'CssStyleValidation':isValid(This).

validationInfo(This) ->
        'CssStyleValidation':validationInfo(This).

toValidationInfoDoc(This) ->
        undefined.

toValidationInfoNode(This, Document) ->
        undefined.

% throws Exception
toXmlNode(This, Document) ->
        Node = (get({Document, '$class'})):createElement(Document, get({'StylesData':getInstance(), 'NAME'})),
        StyleNode = (get({Document, '$class'})):createElement(Document, get({'StyleData':getInstance(), 'NAME'})),
        (get({Node, '$class'})):appendChild(Node, StyleNode),
        (get({StyleNode, '$class'})):appendChild(StyleNode, (fun(Target_N66457) -> (get({Target_N66457, '$class'})):toXmlNode(Target_N66457, Document) end)('ColorsView':new())),
        Size = (get({get({This, cssStyleElementVector}), '$class'})):size(get({This, cssStyleElementVector})),
        lists:foreach(fun(I) ->
            StyleDomNodeInterface = (get({get({This, cssStyleElementVector}), '$class'})):get(get({This, cssStyleElementVector}), I),
            (get({StyleNode, '$class'})):appendChild(StyleNode, (get({StyleDomNodeInterface, '$class'})):toXmlNode(StyleDomNodeInterface, Document))
        end, lists:seq(0, Size - 1)),
        Node.

