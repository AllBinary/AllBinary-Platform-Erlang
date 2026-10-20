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
% package org.allbinary.logic.visual.dhtml.style.css.property
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.control.validate.ValidationInterface
% import org.w3c.dom.Node
% import org.w3c.dom.NodeList

-module('CssPropertiesValidationFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

% throws Exception
getInstance(NodeList) ->
        PropertiesVector = 'BasicArrayListD':new(),
        lists:foreach(fun(Index) ->
            Node = (get({NodeList, '$class'})):item(NodeList, Index),
            case ((fun(Target_N65917) -> (get({Target_N65917, '$class'})):compareTo(Target_N65917, get({'CssPropertyData':getInstance(), 'NAME'})) end)((get({Node, '$class'})):getNodeName(Node)) =:= 0) of
                true ->
                CssPropertyValidationInterface = 'CssPropertyValidationFactory':getInstance(Node),
                (get({PropertiesVector, '$class'})):add(PropertiesVector, CssPropertyValidationInterface);
                false -> ok
            end
        end, lists:seq(0, (get({NodeList, '$class'})):getLength(NodeList) - 1)),
        PropertiesVector;
getInstance(HashMap) ->
        Styles = 'BasicArrayListD':new(),
        Styles.


