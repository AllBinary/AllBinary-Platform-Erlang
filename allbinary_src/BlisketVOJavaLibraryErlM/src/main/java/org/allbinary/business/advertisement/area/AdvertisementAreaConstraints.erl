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
% package org.allbinary.business.advertisement.area
% import org.allbinary.data.tree.dom.DomSearchHelper
% import org.allbinary.logic.control.contraints.display.browser.DisplayInBrowserContraints
% import org.allbinary.logic.control.contraints.display.browser.DisplayInBrowserContraintsInterface
% import org.allbinary.logic.control.contraints.size.TwoDimensionalConstraint
% import org.allbinary.logic.control.contraints.size.TwoDimensionalConstraintInterface
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('AdvertisementAreaConstraints').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements AdvertisementAreaConstraintsInterface

init_fields(This) ->
    put({This, displayInBrowserContraintsInterface}, undefined),
    put({This, twoDimensionConstraintsInterface}, undefined),
    ok.


new(Document) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Document),
    This.

'$init'(This, Document) ->
    init_fields(This),
        Node = 'DomSearchHelper':getNode(get({'AdvertisementAreaData':getInstance(), 'NAME'}), (get({Document, '$class'})):getChildNodes(Document)),
        put({This, displayInBrowserContraintsInterface}, 'DisplayInBrowserContraints':new(Node)),
        put({This, twoDimensionConstraintsInterface}, 'TwoDimensionalConstraint':new(Node)).

setDisplayInBrowserContraints(This, DisplayInBrowserContraintsInterface) ->
        put({This, displayInBrowserContraintsInterface}, DisplayInBrowserContraintsInterface).

getTwoDimensionContraints(This, TwoDimensionConstraintsInterface) ->
        put({This, twoDimensionConstraintsInterface}, TwoDimensionConstraintsInterface).

getDisplayInBrowserContraints(This) ->
        get({This, displayInBrowserContraintsInterface}).

getTwoDimensionContraints(This) ->
        get({This, twoDimensionConstraintsInterface}).

