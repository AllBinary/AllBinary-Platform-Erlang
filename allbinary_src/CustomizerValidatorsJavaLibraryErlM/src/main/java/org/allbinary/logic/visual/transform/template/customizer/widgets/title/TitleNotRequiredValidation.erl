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
% package org.allbinary.logic.visual.transform.template.customizer.widgets.title
% import java.util.HashMap
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.control.validate.ValidationInterface
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringValidationUtil
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('TitleNotRequiredValidation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ValidationInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('TitleView', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
        'TitleView':'$init'(This),
        init_fields(This).

new(Node) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Node),
    This;
new(HashMap) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, HashMap),
    This.

'$init'(This, Node) ->
        'TitleView':'$init'(This, Node),
        init_fields(This);
'$init'(This, HashMap) ->
        'TitleView':'$init'(This, HashMap),
        init_fields(This).


isValid(This) ->
        try
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'IS_VALID'}));
                false -> ok
            end,
            put({local, valid}, true),
            case (not (fun(Target_N66340) -> (get({Target_N66340, '$class'})):isValidNotRequired(Target_N66340, (get({This, '$class'})):getTitle(This), 0, get({'TitleData':getInstance(), 'MAXLEN'})) end)('StringValidationUtil':getInstance())) of
                true ->
                put({local, valid}, false);
                false -> ok
            end,
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                true ->
                StringBuffer = 'StringMaker':new(),
                (get({StringBuffer, '$class'})):append(StringBuffer, "Title: "),
                (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getTitle(This)),
                (get({StringBuffer, '$class'})):append(StringBuffer, "End: "),
                (get({StringBuffer, '$class'})):appendboolean(StringBuffer, get({local, valid})),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, get({get({This, commonStrings}), 'IS_VALID'}));
                false -> ok
            end,
            get({local, valid})
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEWERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Failed to validate form", This, get({get({This, commonStrings}), 'IS_VALID'}), E);
                false -> ok
            end,
            false
        end.

validationInfo(This) ->
        try
            StringBuffer = 'StringMaker':new(),
            (get({StringBuffer, '$class'})):append(StringBuffer, "Title is not valid."),
            (get({StringBuffer, '$class'})):toString(StringBuffer)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEWERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Failed to generate validation error info", This, "validationInfo()", E);
                false -> ok
            end,
            "Error Validating Form"
        end.

toValidationInfoDoc(This) ->
        undefined.

toValidationInfoNode(This, Document) ->
        undefined.

