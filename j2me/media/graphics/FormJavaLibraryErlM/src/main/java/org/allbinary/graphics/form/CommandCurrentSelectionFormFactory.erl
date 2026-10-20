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
% import org.allbinary.game.configuration.feature.Features
% import org.allbinary.game.configuration.feature.TouchFeatureFactory
% import org.allbinary.graphics.Rectangle
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.form.item.ABCustomItem

-module('CommandCurrentSelectionFormFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


% throws Exception
getInstance(Title, Items, Rectangle, FormType, Border, MoveForSmallScreen, BackgroundBasicColor, ForegroundBasicColor) when (is_list(Title) orelse Title =:= undefined), (is_tuple(Items) orelse Items =:= undefined), is_integer(Border), is_boolean(MoveForSmallScreen) ->
        try
        case (fun(Target_N65754) -> (get({Target_N65754, '$class'})):isFeature(Target_N65754, get({'TouchFeatureFactory':getInstance(), 'TOUCH_ENABLED'})) end)('Features':getInstance()) of
            true ->
            ScrollSelectionForm = 'CommandCurrentSelectionForm':new(Title, Items, Border, MoveForSmallScreen, BackgroundBasicColor, ForegroundBasicColor),
            (get({ScrollSelectionForm, '$class'})):init(ScrollSelectionForm, Rectangle, FormType),
            throw({'$return', ScrollSelectionForm});
            false ->
            throw({'$return', 'ScrollSelectionFormNoneFactory':getInstance()})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

