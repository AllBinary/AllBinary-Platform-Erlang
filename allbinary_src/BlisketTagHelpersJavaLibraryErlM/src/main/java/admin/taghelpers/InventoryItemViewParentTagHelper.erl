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
% package admin.taghelpers
% import org.allbinary.logic.communication.http.request.RequestMapInterface
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.visual.transform.TransformInterface
% import taghelpers.ValidationViewHelper
% import tags.HelperTag
% import views.admin.inventory.InventoryItemView
% import views.admin.inventory.download.DownloadableInventoryItemView

-module('InventoryItemViewParentTagHelper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'InventoryItemViewParentTagHelper':new()),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'InventoryItemViewParentTagHelper', instance}).

% throws Exception
getInventoryItemView(This, InventoryTag) ->
        try
        case (InventoryTag =/= undefined) of
            true ->
            (get({This, '$class'})):checkForValidationViewHelper(This, (get({InventoryTag, '$class'})):getHelper(InventoryTag)),
            ValidationViewHelper = (get({InventoryTag, '$class'})):getHelper(InventoryTag),
            ViewObject = (get({ValidationViewHelper, '$class'})):getViewObject(ValidationViewHelper),
            case ((get({ViewObject, '$class'})):getTypeId(ViewObject) =/= get({'InventoryItemView', 'TYPE_ID'})) of
                true ->
                StringBuffer = 'StringMaker':new(),
                (get({StringBuffer, '$class'})):append(StringBuffer, "Must have "),
                (get({StringBuffer, '$class'})):append(StringBuffer, "InventoryItemView and not: "),
                (get({StringBuffer, '$class'})):append(StringBuffer, atom_to_list(get({(get({InventoryTag, '$class'})):getHelper(InventoryTag), '$class'}))),
                erlang:error({'Exception', (get({StringBuffer, '$class'})):toString(StringBuffer)});
                false -> ok
            end,
            throw({'$return', ViewObject});
            false ->
            erlang:error({'Exception', "Must have parent tag."})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
getDownloadableInventoryItemView(This, InventoryTag) ->
        try
        case (InventoryTag =/= undefined) of
            true ->
            (get({This, '$class'})):checkForValidationViewHelper(This, (get({InventoryTag, '$class'})):getHelper(InventoryTag)),
            ValidationViewHelper = (get({InventoryTag, '$class'})):getHelper(InventoryTag),
            ViewObject = (get({ValidationViewHelper, '$class'})):getViewObject(ValidationViewHelper),
            case ((get({ViewObject, '$class'})):getTypeId(ViewObject) =/= get({'DownloadableInventoryItemView', 'TYPE_ID'})) of
                true ->
                StringBuffer = 'StringMaker':new(),
                (get({StringBuffer, '$class'})):append(StringBuffer, "Must have "),
                (get({StringBuffer, '$class'})):append(StringBuffer, "DownloadableInventoryItemView and not: "),
                (get({StringBuffer, '$class'})):append(StringBuffer, atom_to_list(get({(get({InventoryTag, '$class'})):getHelper(InventoryTag), '$class'}))),
                erlang:error({'Exception', (get({StringBuffer, '$class'})):toString(StringBuffer)});
                false -> ok
            end,
            throw({'$return', ViewObject});
            false ->
            erlang:error({'Exception', "Must have parent tag."})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
getRequestMapInterface(This, InventoryTag) ->
        try
        case (InventoryTag =/= undefined) of
            true ->
            (get({This, '$class'})):checkForValidationViewHelper(This, (get({InventoryTag, '$class'})):getHelper(InventoryTag)),
            ValidationViewHelper = (get({InventoryTag, '$class'})):getHelper(InventoryTag),
            ViewObject = (get({ValidationViewHelper, '$class'})):getViewObject(ValidationViewHelper),
            case (((get({ViewObject, '$class'})):getTypeId(ViewObject) =/= get({'InventoryItemView', 'TYPE_ID'})) andalso ((get({ViewObject, '$class'})):getTypeId(ViewObject) =/= get({'DownloadableInventoryItemView', 'TYPE_ID'}))) of
                true ->
                StringBuffer = 'StringMaker':new(),
                (get({StringBuffer, '$class'})):append(StringBuffer, "Must have "),
                (get({StringBuffer, '$class'})):append(StringBuffer, "specific TYPE_ID and not: "),
                (get({StringBuffer, '$class'})):append(StringBuffer, atom_to_list(get({(get({InventoryTag, '$class'})):getHelper(InventoryTag), '$class'}))),
                erlang:error({'Exception', (get({StringBuffer, '$class'})):toString(StringBuffer)});
                false -> ok
            end,
            throw({'$return', ViewObject});
            false ->
            erlang:error({'Exception', "Must have parent tag."})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
checkForValidationViewHelper(This, HelperObject) ->
        case (not (allbinary_java:instance_of(HelperObject, 'ValidationViewHelper'))) of
            true ->
            StringBuffer = 'StringMaker':new(),
            (get({StringBuffer, '$class'})):append(StringBuffer, "Must have "),
            (get({StringBuffer, '$class'})):append(StringBuffer, "ValidationViewHelper"),
            (get({StringBuffer, '$class'})):append(StringBuffer, "and not: "),
            (get({StringBuffer, '$class'})):append(StringBuffer, atom_to_list(get({HelperObject, '$class'}))),
            erlang:error({'Exception', (get({StringBuffer, '$class'})):toString(StringBuffer)});
            false -> ok
        end.

